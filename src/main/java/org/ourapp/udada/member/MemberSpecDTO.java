package org.ourapp.udada.member;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberSpecDTO {
	private long msNo;
	private String mEmail;
	private Date msDate;
	private double msHeight;
	private double msWeight;
	private double msGoal;
}
