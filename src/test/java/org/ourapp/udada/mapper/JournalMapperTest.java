package org.ourapp.udada.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.ourapp.udada.calendar.CalendarDTO;
import org.ourapp.udada.recipe.PageRequestDTO;
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
public class JournalMapperTest {
	
	@Autowired
	private JournalMapper journalMapper;
	
	@Test
	public void selectWithImageAndPagingAndSearchTest() {
		journalMapper.selectWithImageAndPagingAndSearch(PageRequestDTO.builder().pageNum(1).pageSize(5).build());
		
	}
	
	@Test
	public void selectWithIngreAndFoodAndImageTest() {
		journalMapper.selectWithIngreAndFoodAndImage(26L);
		
	}
	
	@Test
	public void myselectWithImageAndPagingAndSearchTest() {
		journalMapper.myselectWithImageAndPagingAndSearch(PageRequestDTO.builder().pageNum(1).pageSize(5).loginUser("user13@gmail.com").build());
		
	}
	
	

}
