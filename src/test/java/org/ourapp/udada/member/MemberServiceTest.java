package org.ourapp.udada.member;

import java.util.Date;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"		
		,"file:src/main/webapp/WEB-INF/spring/security-context.xml"
		,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class MemberServiceTest {
	
	@Autowired
	private MemberService memberService;

	
	@Test
	public void insertTest() {
		Date day = new Date();
		
		IntStream.rangeClosed(10, 40).forEach(
			i-> {
				MemberDTO memberDTO = MemberDTO.builder()
				.mEmail("user"+i+"@gmail.com").mGender("F").mBirth(day).mName("user"+i).mPw("1111")
				.build();
				
			if(i<=20) {
				memberDTO.setMGrade("USER");
			}
			else if(i<=30) {
				memberDTO.setMGrade("ADMIN");
			}else {
				memberDTO.setMGrade("CLOSE");
			}
		
				memberService.join(memberDTO);});
		
	}

}
