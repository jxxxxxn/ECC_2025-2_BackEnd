package com.example.firstproject.controller;

//컨트롤러 선언과 동시에 자동으로 임포트
import org.springframework.stereotype.Controller;
//Model 클래스 패키지 자동 임포트
import org.springframework.ui.Model;
//URL 연결 요청(@GetMapping())과 동시에 자동으로 임포트
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FirstController {

    @GetMapping("/hi") //URL 요청 접수
    public String niceToMeetYou(Model model){
        model.addAttribute("username","개구리");
        return "greetings"; //greetings.mustache 파일 반환
    }

    @GetMapping("/bye") //URL 요청 접수
    public String seeYouNext(Model model){ //Model 객체 받아서
        model.addAttribute("nickname","케로로"); //모델 변수 등록하기
        return "goodbye"; //goodbye.mustache 파일 반환
    }


}
