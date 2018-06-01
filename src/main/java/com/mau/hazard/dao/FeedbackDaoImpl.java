package com.mau.hazard.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mau.hazard.model.QuestionAnswer;

@Repository
public class FeedbackDaoImpl implements FeedbackDao{
	
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}
	
	private static final String createResultEntry= "INSERT INTO FEEDBACK VALUES(:FEEDBACKID, :QUESTION, :ANSWER)";

	@Override
	public void saveFeedback(List<QuestionAnswer> feedbackList) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		namedParameterJdbcTemplate.update(createResultEntry, getSqlParameterByModel(), keyHolder);
		int feedbackId = keyHolder.getKey().intValue();
		for (QuestionAnswer entry : feedbackList) {
			paramSource.addValue("FEEDBACKID", feedbackId);
			paramSource.addValue("QUESTION", entry.getQuestion());
			paramSource.addValue("ANSWER", entry.getAnswer());
			
			namedParameterJdbcTemplate.update(createResultEntry, paramSource);
		}
		
		
	}
	
	private SqlParameterSource getSqlParameterByModel() {

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("FEEDBACKID", 0);
		paramSource.addValue("QUESTION","");
		paramSource.addValue("ANSWER", "");

		return paramSource;
	}

}
