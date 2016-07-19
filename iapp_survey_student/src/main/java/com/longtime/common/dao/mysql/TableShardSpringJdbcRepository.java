package com.longtime.common.dao.mysql;

import java.io.Serializable;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;

import com.google.common.base.Joiner;
import com.google.common.collect.Maps;
import com.longtime.common.dao.Repository;
import com.longtime.common.dao.ShardTableIndexGenerator;
import com.longtime.common.model.Entity;

public class TableShardSpringJdbcRepository<T extends Entity<ID>, ID extends Serializable> {

    public static final String             TABLE_SEPARATE           = "_";                            // 分表 分隔符

    protected DataSource                   dataSource;

    protected Class<T>                     clazz;

    private String                         defaultTableName;

    private boolean                        autoIncId                = false;

    private ShardTableIndexGenerator       shardTableIndexGenerator = defaultShardTableIndexGenerator;

    private Map<String, Repository<T, ID>> map                      = Maps.newConcurrentMap();

    public TableShardSpringJdbcRepository(Class<T> clazz, DataSource dataSource){
        this(clazz, dataSource, null);
    }

    public TableShardSpringJdbcRepository(Class<T> clazz, DataSource dataSource, String defaultTableName){
        this.dataSource = dataSource;
        this.clazz = clazz;
        this.defaultTableName = StringUtils.isBlank(defaultTableName) ? clazz.getSimpleName().toLowerCase() : defaultTableName;
    }

    public void isAutoIncId(boolean bool) {
        this.autoIncId = bool;
    }

    public Repository<T, ID> lookup(String code) {
        return getAndCreate(code);
    }

    private Repository<T, ID> getAndCreate(String code) {
        String table = this.createTableName(code);
        Repository<T, ID> repos = map.get(table);
        if (null == repos) {
            synchronized (this) {
                repos = map.get(table);
                if (null == repos) {
                    repos = createRepository(table);
                    Validate.notNull(repos, "create repository is null. talbe=[%s]", table);
                    map.put(table, repos);
                }
            }
        }
        return repos;
    }
    
    protected String createTableName(String code){
        String shardTableName = shardTableIndexGenerator.generate(code);
        String table = Joiner.on(TABLE_SEPARATE).skipNulls().join(this.defaultTableName, shardTableName);

        return table;
        
    }

    @SuppressWarnings({ "unchecked", "rawtypes" })
    private Repository<T, ID> createRepository(String tableName) {
        Repository<T, ID> repos = null;
        if (this.autoIncId) {
            repos = new SpringJdbcAutoIncIdRepositoryImpl(this.clazz, this.dataSource, tableName);
        } else {
            repos = new SpringJdbcRepositoryImpl<T, ID>(this.clazz, this.dataSource, tableName);
        }

        return repos;
    }

    public ShardTableIndexGenerator getShardTableIndexGenerator() {
        return shardTableIndexGenerator;
    }

    public void setShardTableIndexGenerator(ShardTableIndexGenerator shardTableIndexGenerator) {
        this.shardTableIndexGenerator = shardTableIndexGenerator;
    }

    private static ShardTableIndexGenerator defaultShardTableIndexGenerator = new HashShardTableIndexGenerator();

    public static class HashShardTableIndexGenerator implements ShardTableIndexGenerator {

        private int factor = 2;

        public HashShardTableIndexGenerator(){
        }
        public HashShardTableIndexGenerator(int factor){
            this.factor = factor;
        }

        @Override
        public String generate(String arg) {
            if(StringUtils.isBlank(arg)){
                return null;  //must reutrn null 
            }
            return String.valueOf(arg.hashCode() % factor);
        }

    }
    
    public static void main(String[] args) {
        System.out.println(Joiner.on("_").skipNulls().join("1", null, "2"));//1_2
        System.out.println(Joiner.on("_").skipNulls().join("1", "", "2"));//1__2
    }

}
