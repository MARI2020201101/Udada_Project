package org.ourapp.udada.calendar;

import java.util.List;

public interface CalendarService {

	List<CalendarDTO> listSevenDays(String mEmail) throws Exception;
}
