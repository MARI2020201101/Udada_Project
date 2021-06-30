package org.ourapp.udada.calendar;


import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
public class CalendarController {
	
	private final CalendarService calendarService;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/member/calendar")
	@ResponseBody
	public ResponseEntity<List<CalendarDTO>> getList(Authentication auth) throws Exception{
			
		log.info("auth.getName() : " + auth.getName());
		
		List<CalendarDTO> list = calendarService.listSevenDays(auth.getName());

		return new ResponseEntity<>(list,HttpStatus.OK);
		
	}

	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/member/calendar")
	public void getCalendarPage() {
		
	}
	
}
