package com.surion.domain.item;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Getter@Setter
@Table(name = "Tsuri_item")
public abstract class Item {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "item_id")
        private Long id;

        private int price;

        private String name;

        private int count;

        @OneToMany(mappedBy = "item", cascade = CascadeType.ALL)
        private List<ItemCategory> itemCategories = new ArrayList<>();

        @OneToMany(mappedBy = "item", cascade = CascadeType.ALL)
        private List<ItemMechanic> ItemMechanics = new ArrayList<>();


    }

