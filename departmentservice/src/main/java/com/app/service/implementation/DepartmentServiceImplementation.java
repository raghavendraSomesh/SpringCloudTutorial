package com.app.service.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Department;
import com.app.repository.DepartmentRepository;
import com.app.service.DepartmentService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
@AllArgsConstructor
public class DepartmentServiceImplementation  implements DepartmentService{
	
	
	@Autowired
	private DepartmentRepository departmentRepository;
	
	
	

	public DepartmentServiceImplementation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DepartmentServiceImplementation(DepartmentRepository departmentRepository) {
		super();
		this.departmentRepository = departmentRepository;
	}

	@Override
	public Department saveDepartment(Department department) {
		// TODO Auto-generated method stub
		return departmentRepository.save(department);
	}

	@Override
	public Department getDepartmentById(long departmentId) {
		// TODO Auto-generated method stub
		return departmentRepository.findById(departmentId).get();
	}

}
