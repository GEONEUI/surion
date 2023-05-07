package com.surion.repository;

import com.surion.domain.mechanic.Mechanic;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class MechanicRepository {
    @PersistenceContext
    EntityManager em;

    public void save (Mechanic mechanic){
        em.persist(mechanic);
    }

    public Mechanic findOne(String id){
        return em.find(Mechanic.class, id);
    }

    public List<Mechanic> findAll(){
        return em.createQuery("select m from Mechanic m", Mechanic.class)
                .getResultList();
    }

    public List<Mechanic> findByName (String shopName) {
        return em.createQuery("select m from Mechanic m where m.shopName =:shopName", Mechanic.class)
                .setParameter("shopName", shopName)
                .getResultList();
    }
}