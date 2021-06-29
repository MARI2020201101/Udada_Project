package org.ourapp.udada.member;

import java.util.List;

import org.ourapp.udada.mapper.MemberMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService{

	private final MemberMapper memberMapper;
	private final PasswordEncoder passwordEncoder;
	
	@Override
	public void join(MemberDTO memberDTO) {
		memberDTO.setMPw(passwordEncoder.encode(memberDTO.getMPw()));
		memberMapper.join(memberDTO);
	}

	@Override
	public int duplecateEmail(String mEmail) {
		return memberMapper.duplecateEmail(mEmail);
		
	}

	@Override
	public void joinStep2(MemberSpecDTO memberSpecDTO) {
		memberMapper.joinStep2(memberSpecDTO);
	}

	@Override
	public int pwdCheck(MemberDTO memberDTO) {
		return memberMapper.pwdCheck(memberDTO);
	}

	@Override
	public MemberDTO myProfile(String mEmail) {
		//System.out.println(mEmail);
		return memberMapper.myProfile(mEmail);
	}


	@Override
	public void leave(MemberDTO memberDTO) {
		memberMapper.leave(memberDTO);
	}

	@Override
	public void updateMyProfile(MemberDTO memberDTO) {
		//System.out.println("#"+memberDTO.getMEmail()+"#");
		memberMapper.updateMyProfile(memberDTO);
	}

	@Override
	public List<MemberSpecDTO> selectMyWeight(String mEmail) {
		return memberMapper.selectMyWeight(mEmail);
	}

	@Override
	public MemberSpecDTO currentMyWeight(String mEmail) {
		return memberMapper.currentMyWeight(mEmail);
	}

	@Override
	public void insertWeight(MemberSpecDTO memberSpecDTO) {
		memberMapper.insertWeight(memberSpecDTO);
	}

	@Override
	public void deleteWeight(int msNo) {
		memberMapper.deleteWeight(msNo);
	}

	
}
