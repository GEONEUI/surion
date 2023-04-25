package com.surion.service;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class MechanicService {
    @PersistenceContext
    EntityManager entityManager;
}
