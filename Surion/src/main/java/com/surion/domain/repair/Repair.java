package com.surion.domain.repair;

import com.surion.domain.Delivery;
import com.surion.domain.DeliveryStatus;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "suri_repair")
public class Repair {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "repair_id")
    private Long id;

    private String item;
    private String img;
    private String imgPath;
    private String registerTime;

    @Enumerated(EnumType.STRING)
    private RepairStatus repairStatusstatus;

    @Enumerated(EnumType.STRING)
    private RepairMethod method;

    @Enumerated(EnumType.STRING)
    private DeliveryStatus deliveryStatus;


}
