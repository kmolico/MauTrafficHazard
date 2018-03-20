package com.mau.hazard.delegate;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.mau.hazard.model.Result;

public class ResultMapper implements RowMapper<Result> {

	public Result mapRow(ResultSet rs, int rowNum) throws SQLException {
		Result result = new Result();
		result.setAttemptNumber(rs.getInt("ATTEMPTNUMBER"));
		result.setDateTime(rs.getString("datetime"));
		result.setHazardId(rs.getString("hazardId"));
		result.setScore(rs.getInt("score"));
		result.setUserId(rs.getString("userId"));
		result.setVideoId(rs.getString("videoId"));
		return result;
	}
}