package org.ourapp.udada.mapper;

import java.util.List;

import org.ourapp.udada.calendar.CalendarDTO;

public interface CalendarMapper {
	
	List<CalendarDTO> select(String mEmail);

}
