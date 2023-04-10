package com.surion.domain.repair;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "suri_repairitem")
public class RepairItem {

    @Id
    @GeneratedValue
//    @Column(name = "repairitem_id")
    private Long id;

    private int orderPrice;
    private int count;
}
