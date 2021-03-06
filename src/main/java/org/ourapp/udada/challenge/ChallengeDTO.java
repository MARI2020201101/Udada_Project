package org.ourapp.udada.challenge;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChallengeDTO {
	
	private Long cNo;
	private String mEmail;
	private String cTitle;
	private String cContent;
	private Date cStart;
	private Date cFinish;
	private Long cTotal;
	private Date cDate;		


}
