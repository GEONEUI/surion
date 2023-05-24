package com.surion.entity;

import com.surion.domain.order.Order;
import com.surion.domain.repair.RepairItem;
import com.surion.domain.review.Review;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Table(name = "tsuri_member")
@Entity
@NoArgsConstructor
@Builder
@AllArgsConstructor

public class Member {

	@Id
	@Column(name = "member_id")
	private String id;
	private int idx;
	private String password;
	private String name;
	private String email;
	private String address;
	private String phone;
	private String grade;
	private String imgurl;
	private String roll;
	private int point;
	private String shopName;
	private String office;
	@Column(name = "retrieved_id")
	private Integer retrievedId;
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;

	@OneToMany(mappedBy = "member",cascade = CascadeType.ALL)
	private List<Order> orders = new ArrayList<>();

	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Review> reviews = new ArrayList<>();

	@OneToMany (mappedBy = "member", cascade = CascadeType.ALL)
	private List<RepairItem> repairItems = new ArrayList<>();



}


