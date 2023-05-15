package com.surion.domain.order;

import com.surion.domain.Delivery;
import com.surion.domain.mechanic.Mechanic;
import com.surion.domain.member.Member;
import com.surion.domain.review.Review;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter @Setter
@Table(name = "Tsuri_order")
public class Order {

    @Id @GeneratedValue
    @Column(name="order_id")
    private Long id;

    private int price;
    private int quantity;

    @Enumerated(EnumType.STRING)
    private OrderStatus orderStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="member_id")
    private Member member;

    @ManyToOne (fetch = FetchType.LAZY)
    @JoinColumn(name = "mechanic_id")
    private Mechanic mechanic;

    @OneToOne (fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Review review;

    @OneToOne (fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Delivery delivery;

}
