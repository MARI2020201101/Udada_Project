package org.ourapp.udada.calendar;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CalendarDTO {
	
	private String mEmail;
	private String calendarDate; //2021-06-25 (yyyy-MM-dd)형식
	private String totalKcal;
	private String totalProtein;
	private String totalFat;
	private String totalCarbo;

}
