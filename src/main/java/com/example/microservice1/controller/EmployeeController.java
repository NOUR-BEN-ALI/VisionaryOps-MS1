package com.example.microservice1.controller;

import com.example.microservice1.entity.Employee;
import com.example.microservice1.services.EmployeeService;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/Employee")
public class EmployeeController {
    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @PostMapping("/create")
    public Employee createEmployee(@RequestBody Employee employee) {
        return employeeService.createEmployee(employee);
    }

    @GetMapping("/alll")
    public List<Employee> getAllEmployee() {
        return employeeService.getAllEmployees();
    }

    @GetMapping("/{numEmpl}")
    public Optional<Employee> getEmployeeById(@PathVariable Long numEmpl) {
        return employeeService.getEmployeeById(numEmpl);
    }

    @PutMapping("/update")
    public Employee updateEmployee( @RequestBody Employee employee) {
        return employeeService.updateEmployee(employee);
    }



    @DeleteMapping("/{numEmpl}")
    public void deleteEmployee(@PathVariable Long numEmpl) {
        employeeService.deleteEmployee(numEmpl);
    }
}
