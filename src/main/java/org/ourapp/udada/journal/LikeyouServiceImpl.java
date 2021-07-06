package org.ourapp.udada.journal;

import java.util.List;

import org.ourapp.udada.mapper.LikeyouMapper;
import org.ourapp.udada.mapper.ReplyMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LikeyouServiceImpl implements LikeyouService{
	
	private final LikeyouMapper likeyouMapper;
	
	@Override
	public int getLike(Long jNo, String mEmail) throws Exception {

		return likeyouMapper.getLike(jNo, mEmail);
		
	}
	
	@Override
	public void insertLike(Long jNo, String mEmail) throws Exception {
		
		likeyouMapper.createLike(jNo, mEmail);
		likeyouMapper.updateLike(jNo);
	}
	
	@Override
	public void deleteLike(Long jNo, String mEmail) throws Exception {
		likeyouMapper.deleteLike(jNo, mEmail);
		likeyouMapper.updateLike(jNo);
		
	}
	
	@Override
	public void updateLike(Long jNo) throws Exception {
		likeyouMapper.updateLike(jNo);
		
	}

	
	
}//class end
