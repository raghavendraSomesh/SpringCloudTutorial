package com.app;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.entity.Department;
import com.app.service.DepartmentService;

@RestController
@RequestMapping("api/departments")
public class DepartmentController {
	
	private DepartmentService departmentService;

	
	
	
	public DepartmentController() {
		super();
		// TODO Auto-generated constructor stub
	}


	public DepartmentController(DepartmentService departmentService) {
		super();
		this.departmentService = departmentService;
	}
	
	
	public ResponseEntity<Department> saveDepartment(@RequestBody Department department)
		{
		
				Department savedDepartment= departmentService.saveDepartment(department);
		
				return new ResponseEntity<>(savedDepartment,HttpStatus.CREATED);
		}
	
	
	public ResponseEntity<Department> getDepartmentById(@PathVariable("id") long departmentId)
		{
				Department department=departmentService.getDepartmentById(departmentId);
				return ResponseEntity.ok(department);
		}
	
	

}
