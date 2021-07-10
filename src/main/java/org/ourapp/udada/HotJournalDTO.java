package org.ourapp.udada;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HotJournalDTO {
	
	private Long jNo;
	private String mName;
	private String jDate;
	private String lCnt;
	private String jContent;
	


}