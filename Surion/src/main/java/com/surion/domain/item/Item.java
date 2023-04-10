package com.surion.domain.item;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Getter@Setter
@Table(name = "suri_item")
public abstract class Item {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
//        @Column(name = "item_id")
        private Long id;

        private int price;

        private String name;

        @OneToMany(mappedBy = "item")
        private List<ItemCategory> itemCategories = new ArrayList<>();

    }

