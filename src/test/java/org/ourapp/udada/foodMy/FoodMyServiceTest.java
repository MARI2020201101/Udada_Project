package org.ourapp.udada.foodMy;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.ourapp.udada.foodmy.FoodMyDTO;
import org.ourapp.udada.foodmy.FoodMyService;
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
public class FoodMyServiceTest {
	
	@Autowired
	private FoodMyService foodMyService;
	
	@Test
	public void updateTest() throws Exception{
		FoodMyDTO foodMyDTO = FoodMyDTO.builder().fmAmount(1).fmNo(58L).build();
		foodMyService.modify(foodMyDTO);
		
	}

}
