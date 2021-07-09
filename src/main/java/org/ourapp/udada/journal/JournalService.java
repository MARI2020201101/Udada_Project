package org.ourapp.udada.journal;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.journal.JournalDTO;
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
	int mycountAllWithSearch(PageRequestDTO pageRequestDTO);
	List<JournalDTO> getListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception;
	JournalDTO getWithIngreAndFoodAndImage(Long jNo) throws Exception;
	List<JournalDTO> mygetListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception;
	boolean modifyWithIngreAndImage(JournalDTO journalDTO)throws Exception;
	boolean removeWithIngreAndImage(Long jNo)throws Exception;

	int getLike(Long jNo, String loginEmail) throws Exception;
	List<LikeyouDTO> getLikeList(Long jNo, String mEmail);
	void insertLike(Long jNo, String mEmail) throws Exception;
	void deleteLike(Long jNo, String mEmail) throws Exception;
	void updateLike(Long jNo) throws Exception;
	List<ReplyDTO> replyList(Long oriNo, String reDiv);
	int replyCount(Long reNo, Long oriNo);
	List<ReplyDTO> commentList(Long reNo);
	
}//interface end
