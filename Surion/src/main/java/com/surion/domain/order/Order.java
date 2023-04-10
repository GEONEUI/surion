package com.surion.domain.order;

import com.surion.domain.member.Member;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter @Setter
@Table(name = "suri_order")
public class Order {

    @Id @GeneratedValue
//    @Column(name="order_id")
    private Long id;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="member_id")
    private Member member;


}
