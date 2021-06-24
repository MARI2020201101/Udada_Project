package org.ourapp.udada.journal;

import java.util.List;


import org.ourapp.udada.mapper.JournalMapper;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor

public class JournalServiceImpl implements JournalService{
	
	private final JournalMapper journalMapper;

	@Override
	public List<JournalDTO> getList() {
			
		return journalMapper.getList();
			
	}//getList() end
	
	@Override
	public void register(JournalDTO jounalDTO)  {
		
		journalMapper.register(jounalDTO);
		
	}//register() end
	
	@Override
	public JournalDTO read(Long jNo) {

		return journalMapper.read(jNo);
	}
	
	@Override
	public boolean modify(JournalDTO journalDTO) {

		return journalMapper.update(journalDTO)==1;
	}
	
	@Override
	public boolean remove(Long jNo) {

		return journalMapper.delete(jNo)==1;
	}
	
	
	@Override
	public void insertLike(LikeyouDTO dto) throws Exception {
		journalMapper.createLike(dto);
		
	}
	
	@Override
	public void deleteLike(LikeyouDTO dto) throws Exception {
		journalMapper.deleteLike(dto);
		
	}
	
	@Override
	public void updateLike(LikeyouDTO dto) throws Exception {
		journalMapper.updateLike(dto);
		
	}
	
	@Override
	public int getLike(LikeyouDTO dto) throws Exception {
		return journalMapper.getLike(dto);
	}
	
	
	
}//class end
