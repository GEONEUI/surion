package com.surion.service;

import com.surion.domain.member.Mechanic;
import com.surion.repository.MechanicRepository;
import com.surion.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service
@Transactional
public class MechanicService {
    @Autowired
    MechanicRepository mechanicRepository;


//  메카닉 전환
    public String join(Mechanic mechanic){
        validateDuplicateMechanic(mechanic); //중복회원 검증
        mechanicRepository.save(mechanic);
        return mechanic.getId();
    }

//  메카닉 중복 검증
    private void validateDuplicateMechanic(Mechanic mechanic) {
        List<Mechanic> findMechanics = mechanicRepository.findByName(mechanic.getShopName());
        if(!findMechanics.isEmpty()){
            throw new IllegalStateException("이미 존재하는 상점이름입니다");
        }
    }

//  전체 메카닉 조회
    private List<Mechanic> findMechanics(){
        return mechanicRepository.findAll();
    }
//  메카닉 조회
    public Mechanic findOne(String mechanicId){
        return mechanicRepository.findOne(mechanicId);
    }
}
