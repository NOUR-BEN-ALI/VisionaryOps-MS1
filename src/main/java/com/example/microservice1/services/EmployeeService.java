package com.example.microservice1.services;

import java.util.List;
import java.util.Optional;

import com.example.microservice1.entity.Employee;
import com.example.microservice1.Repository.EmployeeRepository;

import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
    private final EmployeeRepository employeeRepository;

    public EmployeeService(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public Employee createEmployee(Employee employee) {
        return employeeRepository.save(employee);
    }

    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    public Optional<Employee> getEmployeeById(Long numEmpl) {
        return employeeRepository.findById(numEmpl);
    }

    public Employee updateEmployee( Employee employee) {
       return employeeRepository.save(employee);

    }



    public void deleteEmployee(Long numEmpl) {
        employeeRepository.deleteById(numEmpl);
    }

}
