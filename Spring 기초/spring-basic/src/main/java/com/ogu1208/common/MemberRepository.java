package com.ogu1208.common;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class MemberRepository {

    private final Map<Long, Member> memberMap = new HashMap<>();

    public void save(Member member) {
        memberMap.put(member.getId(), member);
    }

    public Member getMember(Long memberId) {
        return memberMap.get(memberId);
    }
}
