package com.mau.hazard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mau.hazard.dao.FeedbackDao;
import com.mau.hazard.model.Feedback;
import com.mau.hazard.model.QuestionAnswer;

@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService{
	
	FeedbackDao feedbackDao;
	
	@Autowired
	public void setFeedbackDao(FeedbackDao feedbackDao) {
		this.feedbackDao = feedbackDao;
	}

	@Override
	public void saveFeedback(Feedback feedback) {
		
		
		List<QuestionAnswer> feedbackList = new ArrayList<>();
		feedbackList.add(new QuestionAnswer("111", feedback.getQ111()));
		feedbackList.add(new QuestionAnswer("112", feedback.getQ112()));
		feedbackList.add(new QuestionAnswer("113", feedback.getQ113()));
		feedbackList.add(new QuestionAnswer("114", feedback.getQ114()));
		feedbackList.add(new QuestionAnswer("115", feedback.getQ115()));
		feedbackList.add(new QuestionAnswer("116", feedback.getQ116()));
		feedbackList.add(new QuestionAnswer("117", feedback.getQ117()));
		feedbackList.add(new QuestionAnswer("118", feedback.getQ118()));
		
		feedbackList.add(new QuestionAnswer("121", feedback.getQ121()));
		feedbackList.add(new QuestionAnswer("122", feedback.getQ122()));
		
		feedbackList.add(new QuestionAnswer("131", feedback.getQ131()));
		feedbackList.add(new QuestionAnswer("132", feedback.getQ132()));
		feedbackList.add(new QuestionAnswer("133", feedback.getQ133()));
		feedbackList.add(new QuestionAnswer("134", feedback.getQ134()));
		feedbackList.add(new QuestionAnswer("135", feedback.getQ135()));
		feedbackList.add(new QuestionAnswer("136", feedback.getQ136()));
		feedbackList.add(new QuestionAnswer("137", feedback.getQ137()));
		feedbackList.add(new QuestionAnswer("138", feedback.getQ138()));
		
		feedbackList.add(new QuestionAnswer("141", feedback.getQ141()));
		feedbackList.add(new QuestionAnswer("142", feedback.getQ142()));
		feedbackList.add(new QuestionAnswer("143", feedback.getQ143()));
		feedbackList.add(new QuestionAnswer("144", feedback.getQ144()));
		
		
		
		for (String ans : feedback.getQ21()) {
			feedbackList.add(new QuestionAnswer("21", ans));
		}
		for (String ans : feedback.getQ22()) {
			feedbackList.add(new QuestionAnswer("22", ans));
		}
		for (String ans : feedback.getQ23()) {
			feedbackList.add(new QuestionAnswer("23", ans));
		}
		
		feedbackDao.saveFeedback(feedbackList);
	}

}
