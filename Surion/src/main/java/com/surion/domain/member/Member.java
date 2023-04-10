package com.surion.domain.member;

import com.surion.domain.order.Order;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "suri_member")
public class Member {

    @Id
//    @Column(name = "member_id")
    private String id;

    private String password;

    private String email;

    @Embedded
    private Address address;

    private String phone;

    @Enumerated (EnumType.STRING)
    private Grade grade;


    @OneToMany(mappedBy = "member")
    private List<Order> orders = new ArrayList<>();

}