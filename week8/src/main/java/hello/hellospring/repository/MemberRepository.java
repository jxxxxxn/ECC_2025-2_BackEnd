package hello.hellospring.repository;

import hello.hellospring.domain.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {
    Member save(Member member);
    Optional<Member> findById(Long id);
    Optional<Member> findByName(String name);
    //Optional : null 처리할 때 optional로 감싸서 반환
    List<Member> findAll(); //지금까지 저장된 모든 회원 리스트 반환
}
