package com.surion.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter@Setter
@Entity@Table(name = "suri_delivery")
public class Delivery {
    @Id
    @GeneratedValue
//    @Column(name = "delivery_id")
    private Long id;

    @Enumerated(EnumType.STRING)
    private DeliveryStatus deliveryStatus;
}
