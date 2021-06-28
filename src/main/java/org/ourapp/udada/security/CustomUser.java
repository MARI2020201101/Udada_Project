package org.ourapp.udada.security;

import java.io.Serializable;
import java.util.ArrayList;
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

	public CustomUser(MemberDTO memberDTO, Collection<GrantedAuthority> authList) {
	
		super(memberDTO.getMEmail()					
				,memberDTO.getMPw(), 				
				authList);

		this.memberDTO = memberDTO;
		
	}

	@Override
	public boolean isEnabled() {
		
		return !(super.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_CLOSE")));
	}
	
	

}
