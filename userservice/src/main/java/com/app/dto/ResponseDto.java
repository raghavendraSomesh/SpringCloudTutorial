package com.app.dto;

public class ResponseDto {
	
	
	private DepartmentDto departmentDto;
	private UserDto userDto;
	public ResponseDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ResponseDto(DepartmentDto departmentDto, UserDto userDto) {
		super();
		this.departmentDto = departmentDto;
		this.userDto = userDto;
	}
	public DepartmentDto getDepartmentDto() {
		return departmentDto;
	}
	public void setDepartmentDto(DepartmentDto departmentDto) {
		this.departmentDto = departmentDto;
	}
	public UserDto getUserDto() {
		return userDto;
	}
	public void setUserDto(UserDto userDto) {
		this.userDto = userDto;
	}
	
	
	

}
