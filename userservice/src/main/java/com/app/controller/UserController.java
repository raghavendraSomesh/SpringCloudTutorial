package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.ResponseDto;
import com.app.entity.User;
import com.app.service.UserService;


@RestController
@RequestMapping("api/users")
public class UserController {
	
	 @Autowired
	 private UserService userService;
	 
	 

	    public UserController(UserService userService) {
		super();
		this.userService = userService;
	}

		@PostMapping
	    public ResponseEntity<User> saveUser(@RequestBody User user){
	        User savedUser = userService.saveUser(user);
	        return new ResponseEntity<>(savedUser, HttpStatus.CREATED);
	    }

	    @GetMapping("{id}")
	    public ResponseEntity<ResponseDto> getUser(@PathVariable("id") Long userId){
	        ResponseDto responseDto = userService.getUser(userId);
	        return ResponseEntity.ok(responseDto);
	    }

}
