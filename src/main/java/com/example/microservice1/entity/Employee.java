package com.example.microservice1.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity

public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long numEmpl;

    private String nomEmpl;
    private String emailEmpl;
    @Temporal(TemporalType.DATE)
    private Date dateDebut ;
    @Temporal(TemporalType.DATE)
    private Date dateFin ;


}