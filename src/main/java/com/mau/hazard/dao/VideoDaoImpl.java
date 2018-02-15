package com.mau.hazard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.mau.hazard.delegate.ListTutorialVideoExtractor;
import com.mau.hazard.delegate.VideoDetailsExtractor;
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
	
    private static final String getListTutorialVideoDetails = "SELECT VIDEO.VIDEOID AS VIDEOID, CATID, SUBCATID, VIDEOTYPE, VIDEOURL, THUMBNAILURL, START, END FROM VIDEO INNER JOIN HAZARD_TIME_FRAME ON VIDEO.VIDEOID = HAZARD_TIME_FRAME.VIDEOID WHERE VIDEOTYPE='TUTORIAL' AND STATUS='A'";
	private static final String getTutorialVideoDetails = "SELECT VIDEO.VIDEOID AS VIDEOID, CATID, SUBCATID, VIDEOTYPE, VIDEODIFFICULTY, VIDEOURL, THUMBNAILURL, START, END FROM VIDEO INNER JOIN HAZARD_TIME_FRAME ON VIDEO.VIDEOID = HAZARD_TIME_FRAME.VIDEOID WHERE VIDEO.VIDEOID=:aVideoId";
	private static final String getTutorialVideoList = "SELECT VIDEO.VIDEOID AS VIDEOID, CATID, SUBCATID, VIDEOTYPE, VIDEODIFFICULTY, VIDEOURL, THUMBNAILURL FROM VIDEO WHERE VIDEOTYPE='TUTORIAL' AND STATUS='A'";
	
	@Override
	public Video getVideoDetails(String videoId) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("aVideoId", videoId);
		return namedParameterJdbcTemplate.query(getTutorialVideoDetails, params, new VideoDetailsExtractor());
	}

	@Override
	public List<Video> getTutorialVideoList() {
		return jdbcTemplate.query(getTutorialVideoList, new ListTutorialVideoExtractor());
	}

}
