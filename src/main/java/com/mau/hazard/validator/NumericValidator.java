package com.mau.hazard.validator;

import org.springframework.stereotype.Component;

@Component("numericValidator")
public class NumericValidator {
	
	public boolean isNumeric(String value) {
		try {
			Integer.parseInt(value);
			return true;
		} catch (NumberFormatException e) {
		    return false;
		}
	}

}
