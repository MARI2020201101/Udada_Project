package org.ourapp.udada.mapper;

import java.util.List;

import org.ourapp.udada.journal.JournalDTO;
import org.ourapp.udada.journal.LikeyouDTO;
import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.reply.ReplyDTO;



public interface JournalMapper {

	List<JournalDTO> getList();
	void register(JournalDTO jounalDTO);
	JournalDTO read(Long jNo);
	int update(JournalDTO journalDTO);
	int delete(Long jNo);
	List<JournalDTO> myList();
	
	void insertSelectKey(JournalDTO journalDto);
	List<JournalDTO> selectWithPaging(PageRequestDTO pageRequestDTO);
	int countAllWithSearch(PageRequestDTO pageRequestDTO);
	List<JournalDTO> selectWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO);
	JournalDTO selectWithIngreAndFoodAndImage(Long jNo);
	List<JournalDTO> myselectWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO);
	
	int insertReply(ReplyDTO replyDTO) throws Exception;
	List<ReplyDTO> replyList(Long jNo) throws Exception;
	
	int getLike(LikeyouDTO dto);
	void createLike(LikeyouDTO dto);
	void deleteLike(LikeyouDTO dto);
	void updateLike(LikeyouDTO dto);
	
}//interface end