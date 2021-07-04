package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.calendar.CalendarDTO;

public interface CalendarMapper {
	
	List<CalendarDTO> select(String mEmail);
	List<CalendarDTO> selectByMonth(@Param("calendarDate")String calendarDate, @Param("mEmail")String mEmail);

}
