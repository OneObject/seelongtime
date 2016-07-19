package com.longtime.app.ixin.mgr.pull.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.mgr.model.OptionEntity;
import com.longtime.app.ixin.mgr.model.QuestionEntity;
import com.longtime.app.ixin.mgr.pull.dao.PollDao;
import com.longtime.app.ixin.model.vote.VoteEntity;
import com.longtime.app.ixin.protal.poll.vo.OptionVO;
import com.longtime.app.ixin.protal.poll.vo.QuestionVO;
import com.longtime.app.ixin.protal.poll.vo.VoteVO;
import com.longtime.app.ixin.protocol.ItemArticle;

@Repository("pollDao")
public class PollDaoImpl implements PollDao {
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	@Override
	public void saveVoteEntity(VoteEntity entity) {
		String sql = "insert into ixin_vote values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,
				entity.getId(),
				entity.getFilePath(),
				entity.getTitle(),
				entity.getDomain(),
				entity.getCreateUid(),
				entity.getCreateUname(),
				entity.getModifyUid(),
				entity.getModifyUname(),
				entity.getCreateTime(),
				entity.getModifyTime(),
				entity.getRelease(),
				entity.getDesc(),
				entity.getStartTime(),
				entity.getEndTime(),
				entity.getVoteNum(),
				entity.getKeywords()
				);
	}

	@Override
	public void saveQuestionEntity(QuestionEntity question) {
		String sql = "insert into ixin_question values(?,?,?,?,?,?)";
		jdbcTemplate.update(sql,
				question.getId(),
				question.getType(),
				question.getTitle(),
				question.getVoteOrSurveyId(),
				question.getSortNum(),
				question.getMaxOption()
				);
	}

	@Override
	public void saveOptionEntity(OptionEntity option) {
		String sql = "insert into ixin_option values (?,?,?,?,?,?)";
		jdbcTemplate.update(sql,
				option.getId(),
				option.getQid(),
				option.getFilePath(),
				option.getTitle(),
				option.getSortNum(),
				option.getUserVoteNum()
				);
		
	}

	@Override
	public VoteVO getVoteVO(String voteId) {
		String sql = "select * from ixin_vote  where id=?";
		List<VoteVO> list= jdbcTemplate.query(sql,new Object[]{voteId}, new RowMapper<VoteVO>(){
			public VoteVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				VoteVO vo = new VoteVO();
				vo.setCover(rs.getString("file_path"));
				vo.setEndTime(rs.getLong("end_time"));
				vo.setStartTime(rs.getLong("start_time"));
				vo.setTitle(rs.getString("title"));
				vo.setVoteId(rs.getString("id"));
				vo.setVoteNum(rs.getInt("vote_num"));
				return vo;
			}
			
		});
		
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<QuestionVO> getQuestionVO(String voteId) {
		String sql = "select * from ixin_question where vote_or_survey_id=?";
		List<QuestionVO> list = jdbcTemplate.query(sql, new Object[]{voteId},new RowMapper<QuestionVO>(){
			@Override
			public QuestionVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				QuestionVO q = new QuestionVO();
				q.setMaxOptionNum(rs.getInt("max_option"));
				q.setQid(rs.getString("id"));
				q.setQtitle(rs.getString("title"));
				q.setType(rs.getInt("type"));
				
				return q;
			}
			
		});
		return list;
	}

	@Override
	public List<OptionVO> getOptionVO(String qid) {
		String sql = "select * from ixin_option where qid=?";
		
		return jdbcTemplate.query(sql, new Object[]{qid},new RowMapper<OptionVO>(){
			@Override
			public OptionVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				OptionVO vo = new OptionVO();
				vo.setFilePath(rs.getString("file_path"));
				vo.setOid(rs.getString("id"));
				vo.setOtitle(rs.getString("title"));
				vo.setSortNum(rs.getInt("sort_num"));
				return vo;
			}
			
		});
	}

	@Override
	public void updateOptionVoteNum(String selectOptId) {
		String sql = "update ixin_option set user_vote_num=user_vote_num+1 where id=?";
		jdbcTemplate.update(sql,selectOptId);
	}

	@Override
	public void updateVoteUserNum(String voteId) {
		String sql = "update ixin_vote set vote_num = vote_num+1 where id=?";
		jdbcTemplate.update(sql,voteId);
	}

	@Override
	public void addToUserVote(String voteId, String openId) {
		String sql = "insert into ixin_user_vote values (?,?)";
		jdbcTemplate.update(sql,openId,voteId);
	}

	@Override
	public boolean checkExits(String openId, String voteId) {
		String sql = "select voteId from ixin_user_vote where userId=? and voteId=?";
		List<String> list = jdbcTemplate.query(sql, new Object[]{openId,voteId},new RowMapper<String>(){
			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				return rs.getString("voteId");
			}
			
		});
		if(list == null || list.size()<=0){
			return false;
		}
		return true;
	}

	@Override
	public VoteVO getVoteVOByVoteId(String voteId) {
		String sql = "select * from ixin_vote where id=?";
		List<VoteVO> list = jdbcTemplate.query(sql, new Object[]{voteId},new RowMapper<VoteVO>(){
			@Override
			public VoteVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				VoteVO vo = new VoteVO();
				vo.setVoteId(rs.getString("id"));
				vo.setCover(rs.getString("file_path"));
				vo.setStartTime(rs.getLong("start_time"));
				vo.setEndTime(rs.getLong("end_time"));
				vo.setTitle(rs.getString("title"));
				vo.setVoteNum(rs.getInt("vote_num"));
				return vo;
			}
			
		});
		
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		
		return null;
	}

	@Override
	public List<QuestionVO> getQuestionVos(String voteId) {
		String sql = "select * from ixin_question where vote_or_survey_id=?";
		
		return jdbcTemplate.query(sql, new Object[]{voteId},new RowMapper<QuestionVO>(){
			@Override
			public QuestionVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				QuestionVO vo = new QuestionVO();
				vo.setMaxOptionNum(100);
				vo.setQid(rs.getString("id"));
				vo.setQtitle(rs.getString("title"));
				vo.setType(rs.getInt("type"));
				return vo;
			}
			
		});
	}

	@Override
	public List<OptionVO> getOptionVOs(String qid) {
		String sql = "select * from ixin_option where qid=?";
		
		return jdbcTemplate.query(sql, new Object[]{qid},new RowMapper<OptionVO>(){
			@Override
			public OptionVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				OptionVO vo = new OptionVO();
				vo.setFilePath(rs.getString("file_path"));
				vo.setOid(rs.getString("id"));
				vo.setOtitle(rs.getString("title"));
				vo.setUserVoteNum(rs.getInt("user_vote_num"));
				vo.setSortNum(100);
				return vo;
			}
		});
	}

	@Override
	public int getTotalSize(String currentDomain) {
		String sql = "select count(*) c from ixin_vote where del=0 and domain=?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{currentDomain},new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("c");
			}
			
		});
		if(list != null && list.size()>0){
			return list.get(0);
		}
		
		return 0;
	}

	@Override
	public List<VoteVO> queryVoteVOByPage(int currpage, int pageSize,
			String domain) {
		String sql = "select * from ixin_vote where domain=? and `release`=1 and del=0 order by start_time desc limit ?,?";
		
		return jdbcTemplate.query(sql, new Object[]{domain,(currpage-1)*pageSize,pageSize},new RowMapper<VoteVO>(){
			@Override
			public VoteVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				VoteVO vo = new VoteVO();
				vo.setCover(rs.getString("file_path"));
				vo.setEndTime(rs.getLong("end_time"));
				vo.setStartTime(rs.getLong("start_time"));
				vo.setTitle(rs.getString("title"));
				vo.setVoteId(rs.getString("id"));
				vo.setVoteNum(rs.getInt("vote_num"));
				return vo;
			}
			
		});
	}

	@Override
	public List<ItemArticle> queryItemArticle(int itemNum,final String coverBasePath,final String suffix,final String voteBasePath,final String openId) {
		String sql = "select * from ixin_vote where del=0 order by start_time desc limit 0,?";
		return jdbcTemplate.query(sql, new Object[]{itemNum},new RowMapper<ItemArticle>(){

			@Override
			public ItemArticle mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				ItemArticle itemArticle = new ItemArticle();
				
				itemArticle.setId(rs.getString("id"));
				itemArticle.setTitle(rs.getString("title"));
				itemArticle.setDescription(rs.getString("o_desc"));
				itemArticle.setPicUrl(String.format("%s%s%s", coverBasePath,rs.getString("file_path"),suffix));
				itemArticle.setUrl(String.format("%svoteId=%s&openId=%s&domain=%s",voteBasePath,rs.getString("id"),openId,rs.getString("domain")));
				
				return itemArticle;
			}
		});
	}

	@Override
	public ItemArticle queryItemArticleByKewWords(String kewwords,
			final String coverBasePath,final String suffix, final String voteBasePath,
			final String openId) {
		String sql = "select * from ixin_vote where keywords=?";
		List<ItemArticle> list = jdbcTemplate.query(sql, new Object[]{kewwords},new RowMapper<ItemArticle>(){

			@Override
			public ItemArticle mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				ItemArticle itemArticle = new ItemArticle();
				
				itemArticle.setId(rs.getString("id"));
				itemArticle.setTitle(rs.getString("title"));
				itemArticle.setDescription(rs.getString("o_desc"));
				itemArticle.setPicUrl(String.format("%s%s%s", coverBasePath,rs.getString("file_path"),suffix));
				itemArticle.setUrl(String.format("%svoteId=%s&openId=%s&domain=%s",voteBasePath,rs.getString("id"),openId,rs.getString("domain")));
				
				return itemArticle;
			}
		});
		if(list == null || list.size()<=0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public void delVoteById(String voteId) {
		String sql = "update ixin_vote set `release`=0 where id=?";
		jdbcTemplate.update(sql,voteId);
	}
}
