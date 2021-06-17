package org.ourapp.udada.journal;

import java.util.List;

import org.ourapp.udada.mapper.FoodMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JournalServiceImpl implements JournalService{

	@Override
	public List<JournalDTO> listAll() throws Exception{
		return journalDao.listAll();
	}//listAll() end
	
}//class end
