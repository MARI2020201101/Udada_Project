package org.ourapp.udada.mapper;

import java.util.List;

import org.ourapp.udada.member.MemberDTO;
import org.ourapp.udada.member.MemberSpecDTO;

public interface MemberMapper {
	
	void join(MemberDTO memberDTO);
	
	int duplecateEmail(String mEmail);
	
	void joinStep2(MemberSpecDTO memberSpecDTO);
	
	MemberDTO myProfile(String mEmail);
	
	int pwdCheck(MemberDTO memberDTO);
	
	void leave(MemberDTO memberDTO);

	void updateMyProfile(MemberDTO memberDTO);
	
	List<MemberSpecDTO> selectMyWeight(String mEmail);
	
	MemberSpecDTO currentMyWeight(String mEmail);
	
	void insertWeight(MemberSpecDTO memberSpecDTO);
	
	void deleteWeight(int msNo);
}
