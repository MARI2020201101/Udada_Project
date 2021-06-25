package org.ourapp.udada.member;


import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private String mEmail;	
	private String mName;
	private String mPw;
	private Date mBirth;
	private String mGender;
	private String mGrade;

}
