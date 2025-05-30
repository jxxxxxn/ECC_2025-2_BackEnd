package com.example.firstproject.controller;

import com.example.firstproject.dto.ArticleForm;
import com.example.firstproject.entity.Article;
import com.example.firstproject.repository.ArticleRepository;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@Slf4j //로깅 기능을 위한 어노테이션 추가
@Controller //1. 컨트롤러 선언
public class ArticleController {
    private static final Logger log = LoggerFactory.getLogger(ArticleController.class);
    @Autowired
    private ArticleRepository articleRepository; //articleRepository 객체 선언
    @GetMapping("/articles/new")
    public String newArticleForm(){ //3. URL 요청 접수
        return "articles/new";  //2. 메서드 생성 및 반환값 작성
    }

    @PostMapping("/articles/create")
    public String createArticle(ArticleForm form){ //폼 데이터를 DTO로 받기
        log.info(form.toString());
        // System.out.println(form.toString()); //DTO에 폼 데이터가 잘 담겼는지 확인
        //1. DTO를 엔티티로 변환
        Article article=form.toEntity();
        log.info(article.toString());
        // System.out.println(article.toString()); //DTO가 엔티티로 잘 변환되는지 확인 출력
        //2. 리파지터리로 엔티티를 DB에 저장
        Article saved=articleRepository.save(article); //article 엔티티를 저장해 saved 객체에 반환
        log.info(saved.toString());
        // System.out.println(saved.toString()); //article이 DB에 잘 저장되는지 확인 출력
        return "";
    }

    @GetMapping("/articles/{id}") //데이터 조회 요청 접수
    public String show(@PathVariable Long id, Model model){ //매개변수로 id 받아오기
        log.info("id="+id); //id 잘 받앗는지 확인하는 로그
        // 1. id를 조회해 데이터 가져오기
        Article articleEntity=articleRepository.findById(id).orElse(null);
        // 2. 모델에 데이터 등록하기
        model.addAttribute("article",articleEntity);
        // 3. 뷰 페이지 반환하기
        return "articles/show";
    }
    @GetMapping("/articles")
    public String index(Model model){
        //1. 모든 데이터 가져오기
        ArrayList<Article> articleEntityList=articleRepository.findAll();
        //2. 모델에 데이터 등록하기
        model.addAttribute("articleList", articleEntityList);
        //3. 뷰 페이지 설정하기
        return "articles/index";
    }
}
