package org.ourapp.udada.mapper;

import java.util.List;

import org.ourapp.udada.journal.JournalDTO;
import org.ourapp.udada.journal.LikeyouDTO;


public interface JournalMapper {

	List<JournalDTO> getList();
	void register(JournalDTO jounalDTO);
	JournalDTO read(Long jNo);
	int update(JournalDTO journalDTO);
	int delete(Long jNo);
	
	int getLike(LikeyouDTO dto);
	void createLike(LikeyouDTO dto);
	void deleteLike(LikeyouDTO dto);
	void updateLike(LikeyouDTO dto);
	
}//interface end
