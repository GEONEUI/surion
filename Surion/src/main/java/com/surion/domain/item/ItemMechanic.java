package com.surion.domain.item;

import com.surion.domain.member.Mechanic;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter@Setter
@Table(name = "tsuri_itemmechanic")
public class ItemMechanic {
    @Id
    @GeneratedValue
    @Column(name = "itemmechanic_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private Item item;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mechanic_id")
    private Mechanic mechanic;
}
