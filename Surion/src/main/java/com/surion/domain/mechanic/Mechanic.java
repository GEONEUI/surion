package com.surion.domain.mechanic;

//import com.surion.domain.item.Item;
import com.surion.domain.item.Item;
import com.surion.domain.item.ItemMechanic;
import com.surion.domain.order.Order;
import com.surion.domain.repair.RepairItem;
import com.surion.domain.review.Review;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name="Tsuri_mechanic")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Mechanic {

    @Id
    @Column(name = "mechanic_id")
    private String id;
    private String shopName;
    private String intro;
    private String img;
    private String imgPath;
    private int quantityPerday;
    private String startTime;
    private String endTime;
    private int mechanicPoint;
    private int experience;
    private String category;


    @OneToMany(mappedBy = "mechanic", cascade = CascadeType.ALL)
    private List<Review> reviews = new ArrayList<>();

    @OneToMany (mappedBy = "mechanic", cascade = CascadeType.ALL)
    private List<RepairItem> repairItems = new ArrayList<>();

    @OneToMany (mappedBy = "mechanic", cascade = CascadeType.ALL)
    private List<Order> orders = new ArrayList<>();

    @OneToMany(mappedBy = "mechanic", cascade = CascadeType.ALL)
    private List<ItemMechanic> mechanics = new ArrayList<>();
}
