package com.surion.domain.member;

import com.surion.domain.order.Order;
import com.surion.domain.repair.RepairItem;
import com.surion.domain.review.Review;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Getter
@Setter
@Table(name = "Tsuri_member")
@Entity
public class Member {

    @Id
    @Column(name = "member_id")
    private String id;

    private String password;

    private String name;

    private String email;

    @Embedded
    private Address address;

    private String phone;

    private String imgurl;

    @Enumerated (EnumType.STRING)
    private Grade grade;


    @OneToMany(mappedBy = "member")
    private List<Order> orders = new ArrayList<>();

    @OneToMany(mappedBy = "member")
    private List<Review> reviews = new ArrayList<>();

    @OneToMany (mappedBy = "member", cascade = CascadeType.ALL)
    private List<RepairItem> repairItems = new ArrayList<>();

}