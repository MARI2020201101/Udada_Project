package org.ourapp.udada.foodmy;

import org.ourapp.udada.member.MemberDTO;
import org.ourapp.udada.member.MemberSpecDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodMyMemberSpecDTO {
	
	private MemberDTO memberDTO;
	private MemberSpecDTO memberSpecDTO;

	

}
