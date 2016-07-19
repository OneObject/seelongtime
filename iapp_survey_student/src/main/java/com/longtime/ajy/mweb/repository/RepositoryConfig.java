package com.longtime.ajy.mweb.repository;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.longtime.ajy.common.track.model.UserTrackEntity;
import com.longtime.ajy.model.Course;
import com.longtime.ajy.model.LabelEntity;
import com.longtime.ajy.model.LabelRelationEntity;
import com.longtime.ajy.model.Template;
import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.model.TokenInfo;
import com.longtime.ajy.mweb.model.UserVoteEntity;
import com.longtime.ajy.mweb.model.VoteActionDetailEntity;
import com.longtime.ajy.mweb.model.VoteActivityEntity;
import com.longtime.ajy.mweb.model.VoteEntity;
import com.longtime.ajy.mweb.model.VoteOptionEntity;
import com.longtime.ajy.mweb.model.VoteQuestionEntity;
import com.longtime.ajy.mweb.model.VoteStatisticsOptionEntity;
import com.longtime.ajy.mweb.model.VoteStatisticsQuestionEntity;
import com.longtime.common.dao.Repository;
import com.longtime.common.dao.mysql.SpringJdbcRepositoryImpl;

@Configuration("mwebRepositoryConfig")
public class RepositoryConfig {

    @Resource(name = "app.ajy.student.dataSource")
    private DataSource dataSource;

    @Bean(name = "userTrackRepository")
    public Repository<UserTrackEntity, String> getUserTrackRepository() {
    	SpringJdbcRepositoryImpl<UserTrackEntity, String> userTrackRepository = new SpringJdbcRepositoryImpl<UserTrackEntity, String>(
    			UserTrackEntity.class,
    			dataSource,
    			"user_track");
    	return userTrackRepository;
    }
    
    @Bean(name = "templateRepository")
    public Repository<Template, String> getTemplateRepository() {
    	SpringJdbcRepositoryImpl<Template, String> templateRepository = new SpringJdbcRepositoryImpl<Template, String>(
    			Template.class,
    			dataSource,
    			"base_template");
    	return templateRepository;
    }
    
    @Bean(name = "specialRepository")
    public SpecialRepository getSpecialRepository() {
    	SpecialRepository seriesCourseRepository = new SpecialRepository(
    			Course.class,
                                                                                                                 dataSource,
                                                                                                                 "study_course");
        return seriesCourseRepository;
    }
    
    @Bean(name = "nSpecialRepository")
    public NSpecialRepository getNSpecialRepository() {
    	NSpecialRepository nSpecialRepository = new NSpecialRepository(
    			Course.class,
                                                                                                                 dataSource,
                                                                                                                 "study_course");
        return nSpecialRepository;
    }
    
    @Bean(name = "voteActivityRepository")
    public Repository<VoteActivityEntity, String> getVoteActivityRepository() {
        SpringJdbcRepositoryImpl<VoteActivityEntity, String> voteActivityRepository = new SpringJdbcRepositoryImpl<VoteActivityEntity, String>(
        																										   VoteActivityEntity.class,
                                                                                                                 dataSource,
                                                                                                                 "ixin_vote_activity");
        return voteActivityRepository;
    }
   
    @Bean(name = "voteRepository")
    public Repository<VoteEntity, String> getVoteRepository() {
        SpringJdbcRepositoryImpl<VoteEntity, String> voteRepository = new SpringJdbcRepositoryImpl<VoteEntity, String>(
                                                                                                               VoteEntity.class,
                                                                                                                 dataSource,
                                                                                                                 "ixin_vote");
        return voteRepository;
    }
    
    @Bean(name = "voteQuestionRepository")
    public Repository<VoteQuestionEntity, String> getVoteQuestionRepository() {
    	SpringJdbcRepositoryImpl<VoteQuestionEntity, String> questionRepository = new SpringJdbcRepositoryImpl<VoteQuestionEntity,String>(
    			VoteQuestionEntity.class,
    			dataSource,
    			"ixin_vote_question");
    		return questionRepository;
    }
    
    @Bean(name = "voteOptionRepository")
    public Repository<VoteOptionEntity, String> getVoteOptionRepository() {
    	SpringJdbcRepositoryImpl<VoteOptionEntity,String> optionRepository = new SpringJdbcRepositoryImpl<VoteOptionEntity,String>(
    			VoteOptionEntity.class,
    			dataSource,
    			"ixin_vote_option");
		return optionRepository;
    }
    
    @Bean(name = "voteStatisticsQuestionRepository")
    public Repository<VoteStatisticsQuestionEntity, String> getVoteStatisticsRepository() {
        SpringJdbcRepositoryImpl<VoteStatisticsQuestionEntity, String> voteStatisticsQuestionRepository = new SpringJdbcRepositoryImpl<VoteStatisticsQuestionEntity, String>(
        																										   VoteStatisticsQuestionEntity.class,
                                                                                                                 dataSource,
                                                                                                                 "ixin_vote_statistics_question");
        return voteStatisticsQuestionRepository;
    }
    
    @Bean(name = "voteStatisticsOptionRepository")
    public Repository<VoteStatisticsOptionEntity, String> getVoteStatisticsOptionRepository() {
        SpringJdbcRepositoryImpl<VoteStatisticsOptionEntity, String> voteStatisticsOptionRepository = new SpringJdbcRepositoryImpl<VoteStatisticsOptionEntity, String>(
        																										   VoteStatisticsOptionEntity.class,
                                                                                                                 dataSource,
                                                                                                                 "ixin_vote_statistics_option");
        return voteStatisticsOptionRepository;
    }
    
    @Bean(name = "userVoteRepository")
    public Repository<UserVoteEntity, String> getUserVoteRepository() {
        SpringJdbcRepositoryImpl<UserVoteEntity, String> userVoteRepository = new SpringJdbcRepositoryImpl<UserVoteEntity, String>(
        																										   UserVoteEntity.class,
                                                                                                                 dataSource,
                                                                                                                 "ixin_user_vote");
        return userVoteRepository;
    }
    
    @Bean(name = "voteActionDetailRepository")
    public Repository<VoteActionDetailEntity, String> getVoteActionDetailRepository() {
        SpringJdbcRepositoryImpl<VoteActionDetailEntity, String> voteActionDetailRepository = new SpringJdbcRepositoryImpl<VoteActionDetailEntity, String>(
        																										   VoteActionDetailEntity.class,
                                                                                                                 dataSource,
                                                                                                                 "ixin_vote_action_detail");
        return voteActionDetailRepository;
    }
    
    @Bean(name = "labelRepository")
    public Repository<LabelEntity, String> getLabelRepository() {
        SpringJdbcRepositoryImpl<LabelEntity, String> labelRepository = new SpringJdbcRepositoryImpl<LabelEntity, String>(
        																										   LabelEntity.class,
                                                                                                                 dataSource,
                                                                                                                 "base_label");
        return labelRepository;
    }
    
    @Bean(name = "labelRelationRepository")
    public Repository<LabelRelationEntity, String> getLabelRelationRepository() {
        SpringJdbcRepositoryImpl<LabelRelationEntity, String> labelRelationRepository = new SpringJdbcRepositoryImpl<LabelRelationEntity, String>(
        																										   LabelRelationEntity.class,
                                                                                                                 dataSource,
                                                                                                                 "base_label_relation");
        return labelRelationRepository;
    }
    
    public static final String TABLE_NAME_USER = "iapp_base_user";
    
    @Bean(name = "userRepository")
    public Repository<User, String> getUserRepository() {
    	SpringJdbcRepositoryImpl<User,String> UserRepository = new SpringJdbcRepositoryImpl<User,String>(
    			User.class,
    			dataSource,
    			TABLE_NAME_USER);
    	return UserRepository;
    }
    
    @Bean(name = "tokenInfoRepository")
    public Repository<TokenInfo, String> getTokenInfoRepository() {
    	SpringJdbcRepositoryImpl<TokenInfo,String> tokenInfoRepository = new SpringJdbcRepositoryImpl<TokenInfo,String>(
    			TokenInfo.class,
    			dataSource,
    			"ixin_token");
    	return tokenInfoRepository;
    }
    
}
