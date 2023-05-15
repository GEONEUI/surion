package com.surion.domain.mechanic;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Getter
@Setter
public class OrderForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idx;

    private String member_id;

    private String shopName;

    private String intro;

    private String img;

    private String startTime;

    private String endTime;

    private String experience;

    private String category;

    private String address;

    private String mechanic_id;
}
