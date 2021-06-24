package org.ourapp.udada.journal;

import java.util.List;



public interface JournalService {

	List<JournalDTO> getList();
	void register(JournalDTO jounalDTO);
	JournalDTO read(Long jNo);
	boolean modify(JournalDTO journalDTO);
	boolean remove(Long jNo);
	
	int getLike(LikeyouDTO dto) throws Exception;
	void insertLike(LikeyouDTO dto) throws Exception;
	void deleteLike(LikeyouDTO dto) throws Exception;
	void updateLike(LikeyouDTO dto) throws Exception;
	
}//interface end
