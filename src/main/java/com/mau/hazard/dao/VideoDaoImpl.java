package com.mau.hazard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.mau.hazard.delegate.ListVideoExtractor;
import com.mau.hazard.delegate.ResultMapper;
import com.mau.hazard.delegate.TestExtractor;
import com.mau.hazard.delegate.VideoDetailsExtractor;
import com.mau.hazard.model.Result;
import com.mau.hazard.model.Test;
import com.mau.hazard.model.Video;

@Repository
public class VideoDaoImpl implements VideoDao{
	
	
    private JdbcTemplate jdbcTemplate;
 
    @Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}
	
    private static final String getListTutorialVideoDetails = "SELECT VIDEO.VIDEOID AS VIDEOID, HAZARDCATID, HAZARDSUBCATID, VIDEOTYPE, VIDEOURL, THUMBNAILURL, HAZARDSTART, HAZARDEND FROM VIDEO INNER JOIN HAZARD ON VIDEO.VIDEOID = HAZARD.VIDEOID WHERE VIDEOTYPE='TUTORIAL' AND STATUS='A'";
	private static final String getVideoDetails = "SELECT VIDEO.VIDEOID AS VIDEOID, HAZARDID, HAZARDDESC, HAZARDCATID, HAZARDSUBCATID, VIDEOTYPE, VIDEODIFFICULTY, VIDEOURL, THUMBNAILURL, HAZARDSTART, HAZARDEND FROM VIDEO INNER JOIN HAZARD ON VIDEO.VIDEOID = HAZARD.VIDEOID WHERE VIDEO.VIDEOID=:aVideoId";
	private static final String getTutorialVideoList = "SELECT VIDEO.VIDEOID AS VIDEOID, HAZARDCATID, HAZARDSUBCATID, VIDEOTYPE, VIDEODIFFICULTY, VIDEOURL, THUMBNAILURL FROM VIDEO INNER JOIN HAZARD ON VIDEO.VIDEOID = HAZARD.VIDEOID WHERE VIDEOTYPE='TUTORIAL' AND STATUS='A' ORDER BY VIDEODIFFICULTY";
	private static final String getTestVideoList = "SELECT VIDEO.VIDEOID AS VIDEOID, VIDEODIFFICULTY, VIDEOURL, THUMBNAILURL FROM VIDEO INNER JOIN TEST ON VIDEO.VIDEOID = TEST.VIDEOID WHERE TESTSTATUS = 'A'";
	
	private static final String getActiveTestContent = "SELECT TEST.TESTID, TEST_VIDEO.VIDEOID, VIDEOTYPE, THUMBNAILURL, VIDEOURL, HAZARDID, HAZARDSTART, HAZARDEND, HAZARDCATID, HAZARDSUBCATID, HAZARDDESC FROM TEST \r\n" + 
			"INNER JOIN TEST_VIDEO ON TEST.TESTID = TEST_VIDEO.TESTID \r\n" + 
			"INNER JOIN HAZARD ON TEST_VIDEO.VIDEOID = HAZARD.VIDEOID\r\n" + 
			"INNER JOIN VIDEO ON TEST_VIDEO.VIDEOID = VIDEO.VIDEOID\r\n" +
			"WHERE TESTSTATUS = 'A'";
	private static final String createResultEntry= "INSERT INTO RESULT VALUES(:USERID, :TESTID, :ATTEMPTNUMBER, :VIDEOID, :HAZARDID, :SCORE, :DATETIME)";
	private static final String updateResultScore = "UPDATE RESULT SET SCORE = :SCORE, DATETIME = :DATETIME WHERE USERID = :USERID AND ATTEMPTNUMBER = :ATTEMPTNUMBER AND HAZARDID = :HAZARDID";
	private static final String getListOfUnattemptedVideos = "SELECT VIDEOID FROM RESULT WHERE USERID = :USERID AND SCORE < 0 AND ATTEMPTNUMBER = :ATTEMPT";
	private static final String getCurrentUserAttempt = "SELECT IFNULL(MAX(ATTEMPTNUMBER), 0) FROM RESULT WHERE USERID = :USERID";
	private static final String getCountIncompleteVideos = "SELECT COUNT(*) FROM RESULT WHERE USERID = :USERID AND ATTEMPTNUMBER = :ATTEMPTNUMBER AND SCORE < 0";
	private static final String getResult = "SELECT USERID, ATTEMPTNUMBER, VIDEOID, HAZARDID, SCORE, DATETIME FROM RESULT WHERE USERID = :USERID AND ATTEMPTNUMBER = :ATTEMPT ORDER BY DATETIME";
	
	@Override
	public Video getVideoDetails(String videoId) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("aVideoId", videoId);
		return namedParameterJdbcTemplate.query(getVideoDetails, params, new VideoDetailsExtractor());
	}

	@Override
	public List<Video> getTutorialVideoList() {
		return jdbcTemplate.query(getTutorialVideoList, new ListVideoExtractor());
	}
	
	@Override
	public List<Video> getTestVideoList(){
		return jdbcTemplate.query(getTestVideoList, new ListVideoExtractor());
	}
	
	@Override
	public Test getTestContents() {
		return jdbcTemplate.query(getActiveTestContent, new TestExtractor());
	}
	
	@Override
	public void createResultEntry(Result result) {
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("USERID", result.getUserId());
		paramSource.addValue("TESTID", result.getTestId());
		paramSource.addValue("ATTEMPTNUMBER", result.getAttemptNumber());
		paramSource.addValue("VIDEOID", result.getVideoId());
		paramSource.addValue("HAZARDID", result.getHazardId());
		paramSource.addValue("SCORE", result.getScore());
		paramSource.addValue("DATETIME", result.getDateTime());
		namedParameterJdbcTemplate.update(createResultEntry, paramSource);
	}
	
	@Override
	public void updateResultScore(Result result) {
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("USERID", result.getUserId());
		paramSource.addValue("ATTEMPTNUMBER", result.getAttemptNumber());
		paramSource.addValue("HAZARDID", result.getHazardId());
		paramSource.addValue("SCORE", result.getScore());
		paramSource.addValue("DATETIME", result.getDateTime());
		namedParameterJdbcTemplate.update(updateResultScore, paramSource);
	}

	@Override
	public List<String> getUattemptedVideoId(String principal, int attempt) {
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("USERID", principal);
		paramSource.addValue("ATTEMPT", attempt);
		return namedParameterJdbcTemplate.queryForList(getListOfUnattemptedVideos, paramSource, String.class);
	}

	@Override
	public int getCurrentAttempt(String principal) {
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("USERID", principal);
		try {
			return namedParameterJdbcTemplate.queryForObject(getCurrentUserAttempt, paramSource, Integer.class);
		} catch (EmptyResultDataAccessException e) {
			return 0;
		}
	}
	
	@Override
	public int getCountIncompleteVideo(String principal, int attempt) {
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("USERID", principal);
		paramSource.addValue("ATTEMPTNUMBER", attempt);
		try {
			return namedParameterJdbcTemplate.queryForObject(getCountIncompleteVideos, paramSource, Integer.class);
		} catch (EmptyResultDataAccessException e) {
			return 0;
		}
	}

	@Override
	public List<Result> getResult(String principal, int attempt) {
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("USERID", principal);
		paramSource.addValue("ATTEMPT", attempt);
		return namedParameterJdbcTemplate.query(getResult, paramSource, new ResultMapper());
	}

}
