package com.mau.hazard.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.mau.hazard.model.User;
import com.mau.hazard.service.UserService;

@Component
public class RegistrationFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	@Qualifier("numericValidator")
	NumericValidator numericValidator;

	@Autowired
	UserService userService;

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		User user = (User) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.userForm.name");
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fname", "NotEmpty.userForm.fname");
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lname", "NotEmpty.userForm.lname");
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty.userForm.email");
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty.userForm.address");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.userForm.password");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword","NotEmpty.userForm.confirmPassword");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sex", "NotEmpty.userForm.sex");

		if(!user.getEmail().isEmpty() && !emailValidator.valid(user.getEmail())){
			errors.rejectValue("email", "Pattern.userForm.email");
		}

		if(user.getLicense()==null || user.getLicense() == ""){
			errors.rejectValue("license", "NotEmpty.userForm.license");
		}
		
		/*if(!numericValidator.isNumeric(user.getLicense())) {
			errors.rejectValue("license", "NotNumeric.userForm.license");
		}*/


		if (!user.getPassword().equals(user.getConfirmPassword())) {
			errors.rejectValue("confirmPassword", "Diff.userform.confirmPassword");
		}


	}

}
