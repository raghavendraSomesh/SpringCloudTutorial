package com.app.service;

import com.app.entity.Department;

public interface DepartmentService {
	
	Department saveDepartment(Department department);
	
	Department getDepartmentById(long departmentId);

}
