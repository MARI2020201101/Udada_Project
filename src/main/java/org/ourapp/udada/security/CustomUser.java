package org.ourapp.udada.security;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.ourapp.udada.member.MemberDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class CustomUser extends User implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private MemberDTO memberDTO;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		
	}

	public CustomUser(MemberDTO memberDTO) {
		super(memberDTO.getMEmail()					
				,memberDTO.getMPw(), 				
				List.of( new SimpleGrantedAuthority("ROLE_"+memberDTO.getMGrade())));
		this.memberDTO = memberDTO;
		
	}

}
