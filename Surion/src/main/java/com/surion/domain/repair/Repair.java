package com.surion.domain.repair;

import com.surion.domain.Delivery;
import com.surion.domain.DeliveryStatus;
import com.surion.domain.review.Review;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "Tsuri_repair")
public class Repair {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "repair_id")
    private Long id;

    private String item;
    private String content;
    private String img;
    private String imgPath;
    private String registerTime;

    @Enumerated(EnumType.STRING)
    private RepairStatus repairStatus;

    @Enumerated(EnumType.STRING)
    private RepairMethod repairMethod;



    @OneToOne (cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name="delivery_id")
    private Delivery delivery;

    @OneToOne (cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "id")
    private Review review;


}
