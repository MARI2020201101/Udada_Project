package org.ourapp.udada.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.ourapp.udada.calendar.CalendarDTO;
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
public class CalendarMapperTest {
	
	@Autowired
	private CalendarMapper calendarMapper;
	
	@Test
	public void selectTest1() {
		List<CalendarDTO> list = calendarMapper.select(null);
		log.info(list.toString());
	}
	
	@Test
	public void selectTest2() {
		List<CalendarDTO> list = calendarMapper.select("user10@gmail.com");
		log.info(list.toString());
	}
	
	@Test
	public void selectByMonth() {
		List<CalendarDTO> list = calendarMapper.selectByMonth("2021-07-01", "user10@gmail.com");
		log.info(list.toString());
	}

}
