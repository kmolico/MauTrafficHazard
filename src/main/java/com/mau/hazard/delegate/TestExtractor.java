package com.mau.hazard.delegate;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.mau.hazard.model.Hazard;
import com.mau.hazard.model.Test;
import com.mau.hazard.model.Video;

public class TestExtractor implements ResultSetExtractor<Test> {

	@Override
	public Test extractData(ResultSet rs) throws SQLException, DataAccessException {
		Test newTest = new Test();
		List<Video> videoList = new ArrayList<>();
		while (rs.next()) {
			Video newVideo = new Video();
			newVideo.setVideoId(rs.getString("videoId"));
			newVideo.setVideoType(rs.getString("videoType"));
			newVideo.setThumbnailUrl(rs.getString("thumbnailUrl"));
			newVideo.setVideoUrl(rs.getString("videoUrl"));
			
			Hazard timeFrame = new Hazard(rs.getString("hazardId"), rs.getDouble("hazardStart"), rs.getDouble("hazardEnd"), rs.getString("hazardCatId"), rs.getString("hazardSubCatId"), rs.getString("hazardDesc"));
			
			if(videoList.size() > 0){
				boolean videoExist = false;
				for (Video video : videoList) {
					if(video.getVideoId().equals(newVideo.getVideoId())){
						video.getListTimeFrame().add(timeFrame);
						videoExist = true;
					}
				}
				if(!videoExist) {
					newVideo.getListTimeFrame().add(timeFrame);
					videoList.add(newVideo);
				}
			}
			else {
				newVideo.getListTimeFrame().add(timeFrame);
				videoList.add(newVideo);
			}
			newTest.setTestId(rs.getString("testId"));
		}
		
		newTest.setVideos(videoList);
		return newTest;
	}

}
