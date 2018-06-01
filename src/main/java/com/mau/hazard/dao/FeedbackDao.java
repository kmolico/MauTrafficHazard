package com.mau.hazard.dao;

import java.util.List;

import com.mau.hazard.model.QuestionAnswer;

public interface FeedbackDao {

	void saveFeedback(List<QuestionAnswer> feedbackList);

}
