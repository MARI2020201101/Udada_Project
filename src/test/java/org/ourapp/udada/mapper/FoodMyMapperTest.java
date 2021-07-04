package org.ourapp.udada.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.ourapp.udada.foodmy.FoodMyDTO;
import org.ourapp.udada.foodmy.FoodMyDayTotalDTO;
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
public class FoodMyMapperTest {
	
	@Autowired
	private FoodMyMapper foodMyMapper;
	
	@Test
	public void selectTest() {
		
		foodMyMapper.select("2021-06-30", "user10@gmail.com");
	}
	
	@Test
	public void updateTest() {
		
		foodMyMapper.update(FoodMyDTO.builder().fmAmount(3).fmNo(58L).build());
	}
	
	@Test
	public void deleteTest() {
		
		foodMyMapper.delete(56L);
	}

	@Test
	public void selectDayTotalTest() {
		
		foodMyMapper.selectDayTotal("2021-06-30", "user10@gmail.com");
	}
	
	@Test
	public void selectMemberInfoTest() {
		
		foodMyMapper.selectMemberInfo("user41@gmail.com");
	}
	
	@Test
	public void selectDayTotalWithDayTest() {
		
		FoodMyDayTotalDTO dto = foodMyMapper.selectDayTotal("2021-06-30", "user20@gmail.com");
		log.info("FoodMyDayTotalDTO: "+ dto);
	}
}
