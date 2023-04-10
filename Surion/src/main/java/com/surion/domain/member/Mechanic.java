package com.surion.domain.member;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Getter
@Setter
@Table(name="suri_mechanic")
public class Mechanic {

    @Id
//    @Column(name = "member_id")
    private String id;

    private String shopName;

    private String intro;

    private String img;

    private String imgPath;

    private int quantityPerday;
    private String reachTime;
    private int mechanicPoint;

}
