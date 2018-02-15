package com.mau.hazard.delegate;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.mau.hazard.constant.Constants;
import com.mau.hazard.model.HazardTimeFrame;
import com.mau.hazard.model.Video;

public class ListTutorialVideoExtractor implements ResultSetExtractor<List<Video>> {

	@Override
	public List<Video> extractData(ResultSet rs) throws SQLException {
		List<Video> videoList = new ArrayList<>();
		while (rs.next()) {
			Video newVideo = new Video();
			newVideo.setVideoId(rs.getString("videoId"));
			newVideo.setCatId(rs.getString("catId"));
			newVideo.setSubCatId(rs.getString("subCatId"));
			newVideo.setVideoType(rs.getString("videoType"));
			newVideo.setThumbnailUrl(rs.getString("thumbnailUrl"));
			newVideo.setVideoUrl(rs.getString("videoUrl"));
			newVideo.setDifficulty(rs.getInt("videoDifficulty"));
			if(newVideo.getDifficulty() == 1) {
				newVideo.setDifficultyDesc(Constants.BEGINNER);
			}
			else if(newVideo.getDifficulty() == 2) {
				newVideo.setDifficultyDesc(Constants.INTERMEDIATE);
			}
			else {
				newVideo.setDifficultyDesc(Constants.ADVANCE);
			}
			
			videoList.add(newVideo);
		}
		return videoList;
	}
}
