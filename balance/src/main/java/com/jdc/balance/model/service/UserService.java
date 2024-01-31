package com.jdc.balance.model.service;

import com.jdc.balance.model.domain.Employee;

public interface UserService {

	 void changePass(String code, String oldPass,String newPass, String confirmPass);

	 Employee login(String code, String pass);
	
	 Employee saveProfileImages(String code, String imageFileName);
}