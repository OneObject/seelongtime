/**
* <p>Title: </p>
* <p>ProjectName: lt.2008.12.learningExpress</p>
* <p>Description: ƴ��sql����</p>
* <p>Copyright: Copyright (c) 2009</p>
* <p>Company: �Ϻ���̩��Ϣ����</p>
* @author ����
* @version 1.1
* ƴ��sql���ࣺ(Ŀǰû�з�ҳ��group by)
* 
*/
package org.adl.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author congwang
 *
 */
public class SqlUtil {
	
	String condition[][]=new String[1][5];
	
	public Log log=LogFactory.getLog(this.getClass());
	
	private List<String[][]> list=new ArrayList<String[][]>();
	
	private List orList=new ArrayList();	//ÿ����or�������б� ���� where id=1 and ( tyep=1 or type =2 or type =3)
	
	private List orderList=new ArrayList();
	
	private List groupList=new ArrayList();//copy from  365 by fumingzhou 2009-11-18
	
	private List<String[][]> setList=new ArrayList<String[][]>(); //update set �б�
	
	private List<String[][]> optionwhereList=new ArrayList<String[][]>();//��or and ������ѯ��Ĭ��Ϊand����
	
	private String sqlType;
	
	private String tableName;
	
	private String sql;
	
	private String select;
	
	public static final String ORDERASC=" asc ";
	public static final String ORDERDESC=" desc ";
	
	public static final String SQLType_select="select";
	public static final String SQLType_insert="insert";
	public static final String SQLType_update="update";
	public static final String SQLType_delete="delete";
	
	public static final String dataType_String="String";
	public static final String dataType_int="int";
	public static final String dataType_date="date";
	public static final String dataType_timeStamp="timeStamp";
	public static final String dataType_long="long";
	public static final String dataType_Decimal="Decimal";
	public static final String dataType_float="float";
	public static final String dataType_boolean="boolean";
	
	public static final String whereType_And="and";
	public static final String whereType_Or="or";
	
	
	/**
	 * ����:like ���ˣ��������ַ�
	 */
	public final static String FILTER_LIKE = " like "; // ģ����� id like '%12%'

	/**
	 * ����: ���� ����
	 */
	public final static String FILTER_EQUALS = " = "; // =��ȷ���� id='1'

	/**
	 * ����: ���� ����
	 */
	public final static String FILTER_GREATETHAN = " > ";  // ����(>) id>1

	/**
	 * ����: ���ڵ��� ����
	 */
	public final static String FILTER_GREATEEQUAL = " >= "; // >= ���ڵ��� id>=1

	/**
	 * ����: С�� ����
	 */
	public final static String FILTER_LESSTHAN = " < "; // < С��  id<1

	/**
	 * ����: С�ڵ��� ����
	 */
	public final static String FILTER_LESSEQUAL = " <= "; // <= С�ڵ��� id<=1

	/**
	 * ����: ������ ����
	 */
	public final static String FILTER_NOTEQUAL = " <> "; // <> ������ id <> 1

	/**
	 * ����: ��
	 */
	public final static String FILTER_IN = " in "; // id in('1','2')
	
	/**
	 * ����: ��Ϊ��
	 */
	public final static String FILTER_ISNOTNULL = "  is not  "; // id in('1','2')
	
	//��ݿⷽ�ԣ�Ĭ��sqlserver
	
	public static final String SQLSERVER_DIALECT="sqlserver";
	public static final String ORACLE_DIALECT="oracle";
	
	public  SqlUtil(String sqlType){
		this.sqlType=sqlType;
	}
	
	public String getSelect() {
		return select;
	}

	public void setselect(String select){
		this.select=select;
//		selectList.add(col);
	}
	public void setselect(String[] selects){
		for(String selectCol:selects){
			this.select=this.select+selectCol+",";
		}
		this.select=this.select.substring(0, this.select.lastIndexOf(","));
	}
	
	/**
	 * ��������
	 * @param col
	 * @param orderType
	 */
	public void setOrder(String col,String orderType){
		String condition_temp[][]=new String[1][2];
		condition_temp[0][0]=col;
		condition_temp[0][1]=orderType;
		orderList.add(condition_temp);
	}

	/**
	 * ���÷���
	 * @param col
	 * @param orderType
	 * copy from 365 2009-11-18
	 */
	public void setGroup(String col,String orderType){
		String condition_temp[][]=new String[1][2];
		condition_temp[0][0]=col;
		condition_temp[0][1]=orderType;
		groupList.add(condition_temp);
	}
	/**
	 * ��and or����
	 * @param col
	 * @param value
	 * @param dateType
	 * @param whereType
	 */
	public void setWhereCondition(String col,String value ,String dateType,String whereType){
		String condition_temp[][]=new String[1][5];
		condition_temp[0][0]=col;
		condition_temp[0][1]=value;
		condition_temp[0][2]=dateType;
		if((whereType==null)||("".equals(whereType))){
			condition_temp[0][3]=whereType_And;
		}else{
			condition_temp[0][3]=whereType;
		}
		condition_temp[0][4]=FILTER_EQUALS;
		orList.add(null);
		optionwhereList.add(condition_temp);
	}

	/**
	 * ��and or������ͬʱ�� >,< ,<>,>=,<= �������ж�
	 * @param col
	 * @param value
	 * @param dateType
	 * @param whereType
	 * @param fliterType
	 */
	public void setWhereCondition(String col,String value ,String dateType,String whereType,String fliterType){
		String condition_temp[][]=new String[1][5];
		condition_temp[0][0]=col;
		condition_temp[0][1]=value;
		condition_temp[0][2]=dateType;
		if((whereType==null)||("".equals(whereType))){
			condition_temp[0][3]=whereType_And;
		}else{
			condition_temp[0][3]=whereType;
		}
		if((whereType==null)||("".equals(whereType))){
			condition_temp[0][4]=FILTER_EQUALS;
		}else{
			condition_temp[0][4]=fliterType;
		}
		orList.add(null);
		optionwhereList.add(condition_temp);
	}
	
	//Ĭ��Ϊand��= ����
	public void setWhereCondition(String col,String value ,String dateType){
		String condition_temp[][]=new String[1][5];
		condition_temp[0][0]=col;
		condition_temp[0][1]=value;
		condition_temp[0][2]=dateType;
		condition_temp[0][3]=whereType_And;
		condition_temp[0][4]=FILTER_EQUALS;
		orList.add(null);
		optionwhereList.add(condition_temp);
	}
	
	/**
	 * ��filter������Ϊinʱ ���磺id in("1","2","3")
	 * @param col  ���磺id
	 * @param valueList ���磺 "1","2","3"
	 * @param dateType ���磺 String
	 * @param whereType 
	 * @param fliterType  һ��Ϊ��FILTER_IN
	 */
	public void setWhereInCondition(String col,List valueList,String dateType,String whereType,String fliterType){
		String condition_temp[][]=new String[1][5];
		condition_temp[0][0]=col;
		//condition_temp[0][1]=value;
		String values="";
		for(int i=0;i<valueList.size();i++){
			if(!isString(dateType)){
				values=values+String.valueOf(valueList.get(i))+",";
			}else{
				values=values+" '"+String.valueOf(valueList.get(i))+"' "+" ,";
			}
		}
		condition_temp[0][1]=values.substring(0, values.lastIndexOf(","));
		condition_temp[0][2]=dateType;
		if((whereType==null)||("".equals(whereType))){
			condition_temp[0][3]=whereType_And;
		}else{
			condition_temp[0][3]=whereType;
		}
		if((whereType==null)||("".equals(whereType))){
			condition_temp[0][4]=FILTER_EQUALS;
		}else{
			condition_temp[0][4]=fliterType;
		}
		orList.add(null);
		optionwhereList.add(condition_temp);
	}
	
	/**
	 * ���� where id=1 and ( tyep=1 or type =2 or type =3)
	 * @param col
	 * @param valueList
	 * @param dateType
	 * @param whereType:һ��Ϊor
	 * @param fliterType
	 */
	public void setOrCondition(String col,List valueList,String dateType,String whereType,String fliterType){
		String condition_temp[][]=new String[1][5];
		condition_temp[0][0]=col;
		//condition_temp[0][1]=value;
		String values="";
		for(int i=0;i<valueList.size();i++){
			if(!isString(dateType)){
				if("".equals(values)){
					values=values+col+fliterType+String.valueOf(valueList.get(i))+",";
				}else{
					values=values+" or "+col+fliterType+String.valueOf(valueList.get(i))+",";
				}
				
			}else{
				if("".equals(values)){
					values=values+col+fliterType+"'"+String.valueOf(valueList.get(i))+"'"+",";
				}else{
					values=values+" or "+col+fliterType+"'"+String.valueOf(valueList.get(i))+"'"+",";
				}
				
			}
		}
		condition_temp[0][1]=values.substring(values.indexOf("or"), values.lastIndexOf(","));
		
		condition_temp[0][2]=dateType;
		if((whereType==null)||("".equals(whereType))){
			condition_temp[0][3]=whereType_And;
		}else{
			condition_temp[0][3]=whereType;
		}
		if((whereType==null)||("".equals(whereType))){
			condition_temp[0][4]=FILTER_EQUALS;
		}else{
			condition_temp[0][4]=fliterType;
		}
	
		orList.addAll(valueList);		
		optionwhereList.add(condition_temp);
		
	}
	public boolean isString(String dateType){
		if(dataType_String.equals(dateType)){
			return true;
		}
		if(dataType_date.equals(dateType)){
			return true;
		}
		if(dataType_timeStamp.equals(dateType)){
			return true;
		}
		return false;
	}
	//for update set
	public void setSetCondition(String col,String value ,String dateType){
		String condition_temp[][]=new String[1][3];
		condition_temp[0][0]=col;
		condition_temp[0][1]=value;
		condition_temp[0][2]=dateType;
		setList.add(condition_temp);
	}
	
	//for insert 
	public void setColAndValue(String col,String value ,String dateType){
		String condition_temp[][]=new String[1][3];
		condition_temp[0][0]=col;
		condition_temp[0][1]=value;
		condition_temp[0][2]=dateType;
		list.add(condition_temp);
	}
	
	/*
	 * @return the tableName
	 */
	public String getTableName() {
		return tableName;
	}



	/*
	 * @param tableName the tableName to set
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}



	/*
	 * @return the sqlType
	 */
	public String getSqlType() {
		return sqlType;
	}



	/*
	 * @param sqlType the sqlType to set
	 */
	public void setSqlType(String sqlType) {
		this.sqlType = sqlType;
	}



	public String getSQLString(){
		if(SQLType_insert.equals(sqlType)){
			
			sql=" insert into "+this.getTableName();
			//"INSERT INTO UserCourseInfo (UserID, CourseID) VALUES(?,?)"
			String cols="";
			String values="";
			for(int i=0;i<list.size();i++){
				condition=list.get(i);
				cols=cols+condition[0][0]+",";
				if(dataType_String.equals(condition[0][2])){
					values=values+"'"+condition[0][1]+"'"+",";
				}
				if(dataType_int.equals(condition[0][2])){
					values=values+condition[0][1]+",";
				}
				if(dataType_date.equals(condition[0][2])){
					//��ݿⲻͬ������ʱ��Ĵ���Ҳ�ǲ�ͬ��
					if(this.getDialect().equalsIgnoreCase(this.SQLSERVER_DIALECT)){
						values=values+"'"+condition[0][1]+"'"+",";
					}
					if(this.getDialect().equalsIgnoreCase(this.ORACLE_DIALECT)){
						values=values+"to_date('"+condition[0][1]+"','yyyy-mm-dd hh24:mi:ss')"+",";
					}
				}
				if(dataType_timeStamp.equals(condition[0][2])){
					//values=values+"to_date('"+condition[0][1]+"','yyyy-mm-dd hh24:mi:ss')"+",";
					
					if(this.getDialect().equalsIgnoreCase(this.SQLSERVER_DIALECT)){
						values=values+"'"+condition[0][1]+"'"+",";
					}
					if(this.getDialect().equalsIgnoreCase(this.ORACLE_DIALECT)){
						values=values+"to_date('"+condition[0][1]+"','yyyy-mm-dd hh24:mi:ss')"+",";
					}
					
				}
				
				if(dataType_long.equals(condition[0][2])){
					values=values+condition[0][1]+",";
				}
				if("Decimal".equals(condition[0][2])){
					values=values+condition[0][1]+",";
				}
				if(dataType_float.equals(condition[0][2])){
					values=values+condition[0][1]+",";
				}
				if(dataType_boolean.equals(condition[0][2])){
					values=values+condition[0][1]+",";
				}
				
			}
			
			sql=sql+"("+cols.substring(0, cols.lastIndexOf(","))+")"+"  values  "+"("+values.substring(0, values.lastIndexOf(","))+")";
			
			log.debug("----insert ---sql ="+sql);
			
		}else if(SQLType_update.equals(sqlType)){
			
			sql=" update "+this.getTableName() +" set ";
			
			
			//set value
			String setcols="";
			String setvalues="";
			for(int i=0;i<setList.size();i++){
				condition=setList.get(i);
				setcols=setcols+condition[0][0]+",";
				if(dataType_String.equals(condition[0][2])){
					setvalues=setvalues+condition[0][0]+"="+"'"+condition[0][1]+"'"+",";
				}
				if(dataType_int.equals(condition[0][2])){
					setvalues=setvalues+condition[0][0]+"="+condition[0][1]+",";
				}
				if(dataType_date.equals(condition[0][2])){
					//setvalues=setvalues+condition[0][0]+"="+"'"+condition[0][1]+"'"+",";
					if(this.getDialect().equalsIgnoreCase(this.SQLSERVER_DIALECT)){
						setvalues=setvalues+condition[0][0]+"="+"'"+condition[0][1]+"'"+",";
					}
					if(this.getDialect().equalsIgnoreCase(this.ORACLE_DIALECT)){
						setvalues=setvalues+condition[0][0]+"="+"to_date('"+condition[0][1]+"','yyyy-mm-dd hh24:mi:ss')"+",";
					}
				}
				if(dataType_timeStamp.equals(condition[0][2])){
					//setvalues=setvalues+condition[0][0]+"="+"to_date('"+condition[0][1]+"','yyyy-mm-dd hh24:mi:ss')"+",";
					
					if(this.getDialect().equalsIgnoreCase(this.SQLSERVER_DIALECT)){
						setvalues=setvalues+condition[0][0]+"="+"'"+condition[0][1]+"'"+",";
					}
					if(this.getDialect().equalsIgnoreCase(this.ORACLE_DIALECT)){
						setvalues=setvalues+condition[0][0]+"="+"to_date('"+condition[0][1]+"','yyyy-mm-dd hh24:mi:ss')"+",";
					}
					
				}
				
				if(dataType_long.equals(condition[0][2])){
					setvalues=setvalues+condition[0][0]+"="+condition[0][1]+",";
				}
				if("Decimal".equals(condition[0][2])){
					setvalues=setvalues+condition[0][0]+"="+condition[0][1]+",";
				}
				if(dataType_float.equals(condition[0][2])){
					setvalues=setvalues+condition[0][0]+"="+condition[0][1]+",";
				}
				if(dataType_boolean.equals(condition[0][2])){
					setvalues=setvalues+condition[0][0]+"="+condition[0][1]+",";
				}
				
			}
			
			sql=sql+setvalues.substring(0, setvalues.lastIndexOf(","));
			
			//set where
				String wherecols="";
				String wherevalues="";
				wherevalues=setWhere(wherecols,wherevalues);
				if(("".equals(wherevalues))==false){
					sql=sql+" where "+wherevalues;
				}
				
				log.debug("----update ---sql---- ="+sql);
		}else if(this.SQLType_select.equals(sqlType)){
			
			sql=" select "+this.select +" from "+this.getTableName();
			//set where
				String wherecols="";
				String wherevalues="";
				wherevalues=setWhere(wherecols,wherevalues);
				if(("".equals(wherevalues))==false){
					sql=sql+" where "+wherevalues;
				}
				if(orderList.size()>0)
					sql=sql+getOrder();
				log.debug("----select ---sql ="+sql);
		}
		else if(this.SQLType_delete.equals(sqlType)){
			sql=" delete  from "+this.getTableName();
			
			String wherecols="";
			String wherevalues="";
			
			wherevalues=setWhere(wherecols,wherevalues);			
			if(("".equals(wherevalues))==false){
				sql=sql+" where "+wherevalues;
			}
			log.debug("------sql------"+sql);
		}
		
		return sql;
		
	}
	
	private String getOrder(){
		String  returnString=" order by ";
		for(int i=0;i<orderList.size();i++){
			String condition_temp[][]=(String [][])orderList.get(i);
			if(condition_temp[0][1].equals(ORDERASC)){
				returnString=returnString+condition_temp[0][0]+ORDERASC+" , ";
			}else{
				returnString=returnString+condition_temp[0][0]+ORDERDESC+" , ";
			}
		}
		return returnString.substring(0,returnString.lastIndexOf(","));
	}

	private String setFirstWhere(String col,String value,String filterType,Boolean isString){
		String wherevalues="";
		if(isString==true){
			if(filterType.equals(FILTER_LIKE)){
				wherevalues=col+filterType+"'%"+value+"%'";
			}
			if(filterType.equals(FILTER_EQUALS)){
				wherevalues=col+filterType+"'"+value+"'";
			}
			if(filterType.equals(FILTER_GREATETHAN)){
				wherevalues=col+filterType+"'"+value+"'";
			}
			if(filterType.equals(FILTER_GREATEEQUAL)){
				wherevalues=col+filterType+"'"+value+"'";
			}
			if(filterType.equals(FILTER_LESSTHAN)){
				wherevalues=col+filterType+"'"+value+"'";
			}
			if(filterType.equals(FILTER_LESSEQUAL)){
				wherevalues=col+filterType+"'"+value+"'";
			}
			if(filterType.equals(FILTER_NOTEQUAL)){
				wherevalues=col+filterType+"'"+value+"'";
			}
			if(filterType.equals(FILTER_IN)){
				wherevalues=col+filterType+"("+value+")";
			}
			if(filterType.equals(FILTER_ISNOTNULL)){
				wherevalues="( "+col+filterType+value+" )";
			}
			
		}else{
			
			if(filterType.equals(FILTER_EQUALS)){
				wherevalues=col+filterType+value;
			}
			if(filterType.equals(FILTER_GREATETHAN)){
				wherevalues=col+filterType+value;
			}
			if(filterType.equals(FILTER_GREATEEQUAL)){
				wherevalues=col+filterType+value;
			}
			if(filterType.equals(FILTER_LESSTHAN)){
				wherevalues=col+filterType+value;
			}
			if(filterType.equals(FILTER_LESSEQUAL)){
				wherevalues=col+filterType+value;
			}
			if(filterType.equals(FILTER_NOTEQUAL)){
				wherevalues=col+filterType+value;
			}
			if(filterType.equals(FILTER_IN)){
				wherevalues=col+filterType+"("+value+")";
			}
			if(filterType.equals(FILTER_ISNOTNULL)){
				wherevalues="( "+col+filterType+value+" )";
			}
		}
		return wherevalues;
	}
	
	
	public String setWhere(String wherecols,String wherevalues){
		for(int i=0;i<optionwhereList.size();i++){
			condition=optionwhereList.get(i);
			wherecols=wherecols+condition[0][0]+",";
			if(dataType_String.equals(condition[0][2])){
				if("".equals(wherevalues)){
					wherevalues=wherevalues+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],true);
				}else{
					if(this.whereType_And.equals(condition[0][3])){
						wherevalues=wherevalues+" and "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],true);
					}else if(this.whereType_Or.equals(condition[0][3])){
						if(orList.get(i)!=null){
							wherevalues=wherevalues+condition[0][1];
						}else{
							wherevalues=wherevalues+" or "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],true);
						}
						
					}
				}
			}
			if(dataType_int.equals(condition[0][2])){
				if("".equals(wherevalues)){
					wherevalues=wherevalues+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
				}else{
					if(this.whereType_And.equals(condition[0][3])){
						wherevalues=wherevalues+" and "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
					}else if(this.whereType_Or.equals(condition[0][3])){
						if(orList.get(i)!=null){
							wherevalues=wherevalues+condition[0][1];
						}else{
							wherevalues=wherevalues+" or "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
						}
						
					}
					
				}
				
			}
			if(dataType_date.equals(condition[0][2])){
				if("".equals(wherevalues)){
					wherevalues=wherevalues+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],true);
				}else{
					if(this.whereType_And.equals(condition[0][3])){
						wherevalues=wherevalues+" and "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],true);
					}else if(this.whereType_Or.equals(condition[0][3])){
						if(orList.get(i)!=null){
							wherevalues=wherevalues+condition[0][1];
						}else{
							wherevalues=wherevalues+" or "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],true);
						}
						
					}
				}
			}
			if(dataType_timeStamp.equals(condition[0][2])){
				if("".equals(wherevalues)){
					wherevalues=wherevalues+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],true);
				}else{
					if(this.whereType_And.equals(condition[0][3])){
						wherevalues=wherevalues+" and "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],true);
					}else if(this.whereType_Or.equals(condition[0][3])){
						if(orList.get(i)!=null){
							wherevalues=wherevalues+condition[0][1];
						}else{
							wherevalues=wherevalues+" or "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],true);
						}
						
					}
				}
				
			}
			
			if(dataType_long.equals(condition[0][2])){
				if("".equals(wherevalues)){
					wherevalues=wherevalues+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
				}else{
					if(this.whereType_And.equals(condition[0][3])){
						wherevalues=wherevalues+" and "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
					}else if(this.whereType_Or.equals(condition[0][3])){
						if(orList.get(i)!=null){
							wherevalues=wherevalues+condition[0][1];
						}else{
							wherevalues=wherevalues+" or "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
						}
						
					}
					
				}
				
			}
			if("Decimal".equals(condition[0][2])){
				if("".equals(wherevalues)){
					wherevalues=wherevalues+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
				}else{
					if(this.whereType_And.equals(condition[0][3])){
						wherevalues=wherevalues+" and "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
					}else if(this.whereType_Or.equals(condition[0][3])){
						if(orList.get(i)!=null){
							wherevalues=wherevalues+condition[0][1];
						}else{
							wherevalues=wherevalues+" or "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
						}
						
					}
					
				}
				
			}
			if(dataType_float.equals(condition[0][2])){
				if("".equals(wherevalues)){
					wherevalues=wherevalues+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
				}else{
					if(this.whereType_And.equals(condition[0][3])){
						wherevalues=wherevalues+" and "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
					}else if(this.whereType_Or.equals(condition[0][3])){
						if(orList.get(i)!=null){
							wherevalues=wherevalues+condition[0][1];
						}else{
							wherevalues=wherevalues+" or "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
						}
						
					}
					
				}
				
			}
			if(dataType_boolean.equals(condition[0][2])){
				if("".equals(wherevalues)){
					wherevalues=wherevalues+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
				}else{
					if(this.whereType_And.equals(condition[0][3])){
						wherevalues=wherevalues+" and "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
					}else if(this.whereType_Or.equals(condition[0][3])){
						if(orList.get(i)!=null){
							wherevalues=wherevalues+condition[0][1];
						}else{
							wherevalues=wherevalues+" or "+setFirstWhere(condition[0][0],condition[0][1],condition[0][4],false);
						}
					}
				}
			}

		}//end for
		
		return wherevalues;
	}
	
	public static String getDialect() {
		String returnString = "sqlserver";
		try {
			returnString = ConfigFile.getString("dbms.dialect");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "sqlserver";
		}
		if("".equals(returnString)||(returnString==null)){
			returnString="sqlserver";
		}
		return returnString;
	}
	
}
