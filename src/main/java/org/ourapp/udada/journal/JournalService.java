package org.ourapp.udada.journal;

import java.util.List;

import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.recipe.RecipeDTO;
import org.ourapp.udada.reply.ReplyDTO;





public interface JournalService {

	List<JournalDTO> getList();
	List<JournalDTO> myList();
	void register(JournalDTO jounalDTO);
	JournalDTO read(Long jNo);
	boolean modify(JournalDTO journalDTO);
	boolean remove(Long jNo);
	
	void registerWithImage(JournalDTO journalDTO) throws Exception;
	List<JournalDTO> getListWithPaging(PageRequestDTO pageRequestDTO) throws Exception;
	int countAllWithSearch(PageRequestDTO pageRequestDTO);
	List<JournalDTO> getListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception;
	JournalDTO getWithIngreAndFoodAndImage(Long jNo) throws Exception;
	List<JournalDTO> mygetListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception;
	boolean modifyWithIngreAndImage(JournalDTO journalDTO)throws Exception;
	boolean removeWithIngreAndImage(Long jNo)throws Exception;
	
	int insertReply(ReplyDTO replyDTO) throws Exception;
	List<ReplyDTO>replyList(Long jNo) throws Exception;
	
	int getLike(LikeyouDTO dto) throws Exception;
	void insertLike(LikeyouDTO dto) throws Exception;
	void deleteLike(LikeyouDTO dto) throws Exception;
	void updateLike(LikeyouDTO dto) throws Exception;
	
}//interface end
