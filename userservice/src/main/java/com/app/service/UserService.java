package com.app.service;

import com.app.dto.ResponseDto;
import com.app.entity.User;

public interface UserService {
	
	User saveUser(User user);
	ResponseDto getUser(long userId);

}
