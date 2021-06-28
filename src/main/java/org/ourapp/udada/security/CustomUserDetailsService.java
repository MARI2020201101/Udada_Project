package org.ourapp.udada.security;

import java.util.ArrayList;
import java.util.Collection;

import org.ourapp.udada.mapper.MemberMapper;
import org.ourapp.udada.member.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@NoArgsConstructor
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDTO memberDTO = memberMapper.myProfile(username);
		Collection<GrantedAuthority> authList = new ArrayList<>();
		authList.add(new SimpleGrantedAuthority("ROLE_"+memberDTO.getMGrade()));

		
		return new CustomUser(memberDTO,authList);
	}

}
