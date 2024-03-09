package com.app.service.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.app.dto.DepartmentDto;
import com.app.dto.ResponseDto;
import com.app.dto.UserDto;
import com.app.entity.User;
import com.app.repository.UserRepository;
import com.app.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RestTemplate restTemplate;
	
	

	public UserServiceImpl() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public UserServiceImpl(UserRepository userRepository, RestTemplate restTemplate) {
		super();
		this.userRepository = userRepository;
		this.restTemplate = restTemplate;
	}



	@Override
	public User saveUser(User user) {
		// TODO Auto-generated method stub
		return userRepository.save(user);
	}

	@Override
	public ResponseDto getUser(long userId) {
		ResponseDto responseDto = new ResponseDto();
        User user = userRepository.findById(userId).get();
        UserDto userDto = mapToUser(user);

        ResponseEntity<DepartmentDto> responseEntity = restTemplate.getForEntity("http://localhost:8080/api/departments/" + user.getDepartmentId(),DepartmentDto.class);

        DepartmentDto departmentDto = responseEntity.getBody();

        System.out.println(responseEntity.getStatusCode());

        responseDto.setUserDto(userDto);
        responseDto.setDepartmentDto(departmentDto);

        return responseDto;
    }

    private UserDto mapToUser(User user){
        UserDto userDto = new UserDto();
        userDto.setId(user.getId());
        userDto.setFirstName(user.getFirstName());
        userDto.setLastName(user.getLastName());
        userDto.setEmail(user.getEmail());
        return userDto;
    }

}
