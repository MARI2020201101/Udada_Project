package org.ourapp.udada.calendar;

import java.util.List;

import org.ourapp.udada.mapper.CalendarMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class CalendarServiceImpl implements CalendarService{

	private final CalendarMapper calendarMapper;

	@Override
	public List<CalendarDTO> listSevenDays(String mEmail) throws Exception{
		return calendarMapper.select(mEmail);
	}

	@Override
	public List<CalendarDTO> listMonth(String calendarDate, String mEmail) throws Exception {
		return calendarMapper.selectByMonth(calendarDate, mEmail);
	}
}
