package org.ourapp.udada.member;


import java.io.Serializable;
import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class MemberDTO implements Serializable{
	
	
	private String mEmail;	
	private String mName;
	private String mPw;
	private Date mBirth;
	private String mGender;
	private String mGrade;

}
