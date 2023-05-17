package com.surion.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.surion.domain.Image.Photo;
import com.surion.domain.mechanic.Mechanic;
import com.surion.domain.review.Review;
import com.surion.service.MechanicService;
import com.surion.service.MemberService;
import com.surion.service.PhotoService;
import com.surion.service.ReviewRegisterService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMultipartHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;


import java.util.List;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@Transactional
public class ReviewRegisterControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private MemberService memberService;

    @Autowired
    private MechanicService mechanicService;

    @Autowired
    private ReviewRegisterService reviewRegisterService;

    @Autowired
    private PhotoService photoService;

    @Test
    @Transactional
    public void testCreateReviewWithPhotos() throws Exception {
        // Given
        Member1 member = Member1.builder()
                .id("member1")
                .name("John")
                .email("john@example.com")
                .password("password")
                .build();
        memberService.save(member);

        Mechanic mechanic = Mechanic.builder()
                .id("mechanic1")
                .build();
        mechanicService.join(mechanic);

        MockMultipartFile file1 = new MockMultipartFile(
                "files", "photo1.jpg", "image/jpeg", "test data".getBytes());
        MockMultipartFile file2 = new MockMultipartFile(
                "files", "photo2.jpg", "image/jpeg", "test data".getBytes());

        MockMultipartHttpServletRequestBuilder builder = (MockMultipartHttpServletRequestBuilder) MockMvcRequestBuilders.multipart("/upload")
                .file(file1)
                .file(file2)
                .param("memberId", member.getId())
                .param("mechanicId", mechanic.getId())
                .param("content", "Great service!")
                .param("score", "5");

        // When
        mockMvc.perform(builder)

                // Then
                .andExpect(status().isOk());

        Review review = reviewRegisterService.findByMemberIdAndMechanicId(member.getId(), mechanic.getId());
        assertThat(review).isNotNull();
        assertThat(review.getContent()).isEqualTo("Great service!");
        assertThat(review.getScore()).isEqualTo(5);
        assertThat(review.getMember().getId()).isEqualTo(member.getId());
        assertThat(review.getMechanic().getId()).isEqualTo(mechanic.getId());

        List<Photo> photos = photoService.findByReviewId(review.getId());
        assertThat(photos.size()).isEqualTo(2);
    }

}
