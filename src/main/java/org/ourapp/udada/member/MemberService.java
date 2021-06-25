package org.ourapp.udada.member;

import java.util.List;

public interface MemberService {
	void join(MemberDTO memberDTO);
	int duplecateEmail(String mEmail);
	void joinStep2(MemberSpecDTO memberSpecDTO);
	MemberDTO myProfile(String mEmail);
	void leave(MemberDTO memberDTO);
	int pwdCheck(MemberDTO memberDTO);
	void updateMyProfile(MemberDTO memberDTO);
	List<MemberSpecDTO> selectMyWeight(String mEmail);
	MemberSpecDTO currentMyWeight(String mEmail);
	void insertWeight(MemberSpecDTO memberSpecDTO);
	void deleteWeight(int msNo);
}
