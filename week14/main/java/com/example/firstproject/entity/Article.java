package com.example.firstproject.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor //Article() 생성자 대체
@NoArgsConstructor
@ToString //toString() 메서드 대체
@Entity //1. 엔티티 선언
@Getter
public class Article {
    @Id //3. 엔티티의 대푯값 지정
    @GeneratedValue //3. 자동 생성 기능 추가 (숫자가 자동으로 매겨짐)
    private Long id;
    @Column //2. title 필드 선언, DB 테이블의 title 열과 연결됨
    private String title;
    @Column //2. content 필드 선언, DB 테이블의 content 열과 연결됨
    private String content;
    
    
}
