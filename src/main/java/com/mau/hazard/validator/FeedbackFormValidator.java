package com.mau.hazard.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.mau.hazard.model.Feedback;

@Component
public class FeedbackFormValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		return Feedback.class.equals(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Feedback feedback = (Feedback) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q111", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q112", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q113", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q114", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q115", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q116", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q117", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q118", "feedback.answer.required");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q121", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q122", "feedback.answer.required");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q131", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q132", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q133", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q134", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q135", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q136", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q137", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q138", "feedback.answer.required");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q141", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q142", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q143", "feedback.answer.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "q144", "feedback.answer.required");
		
		
		if(feedback.getQ21()==null || feedback.getQ21().length == 0){
			errors.rejectValue("q21", "feedback.answer.required");
		}
		
		if(feedback.getQ22()==null || feedback.getQ22().length == 0){
			errors.rejectValue("q22", "feedback.answer.required");
		}
		
		if(feedback.getQ23()==null || feedback.getQ23().length == 0){
			errors.rejectValue("q23", "feedback.answer.required");
		}
		
	}

}
