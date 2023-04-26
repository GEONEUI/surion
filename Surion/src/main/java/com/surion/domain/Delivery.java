package com.surion.domain;

import com.surion.domain.order.Order;
import com.surion.domain.repair.Repair;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter@Setter
@Entity@Table(name = "Tsuri_delivery")
public class Delivery {
    @Id
    @GeneratedValue
    @Column(name = "delivery_id")
    private Long id;

    @Enumerated(EnumType.STRING)
    private DeliveryStatus deliveryStatus;

    @OneToOne(mappedBy = "delivery", fetch=FetchType.LAZY)
    private Repair repair;

    @OneToOne(mappedBy = "delivery", fetch = FetchType.LAZY)
    private Order order;

}
