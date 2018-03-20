package com.mau.hazard.delegate;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.mau.hazard.constant.Constants;
import com.mau.hazard.model.Hazard;
import com.mau.hazard.model.Video;

public class VideoDetailsExtractor implements ResultSetExtractor<Video> {
	

	@Override
	public Video extractData(ResultSet rs) throws SQLException {
		Video newVideo = new Video();
		while (rs.next()) {
			newVideo.setVideoId(rs.getString("videoId"));
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
			
			Hazard hazard = new Hazard(rs.getString("hazardId"), rs.getDouble("hazardStart"), rs.getDouble("hazardEnd"), rs.getString("hazardCatId"), rs.getString("hazardSubCatId"), rs.getString("hazardDesc"));
			newVideo.getListTimeFrame().add(hazard);
		}
		
		return newVideo;
	}

}
