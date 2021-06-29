package org.ourapp.udada.journal;

import java.util.List;

import org.ourapp.udada.image.ImageDTO;
import org.ourapp.udada.mapper.ImageMapper;
import org.ourapp.udada.mapper.JournalMapper;
import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.reply.ReplyDTO;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor

public class JournalServiceImpl implements JournalService{
	
	private final JournalMapper journalMapper;
	private final ImageMapper ImageMapper;

	@Override
	public List<JournalDTO> getList() {
			
		return journalMapper.getList();
			
	}//getList() end
	
	@Override
	public List<JournalDTO> myList() {

		return journalMapper.myList();
	}
	
	@Override
	public void register(JournalDTO journalDTO)  {
		
		journalMapper.register(journalDTO);
		
		
	}//register() end
	
	@Override
	public void registerWithImage(JournalDTO journalDTO) throws Exception {
		journalMapper.insertSelectKey(journalDTO);
		
		long jNo = journalDTO.getJNo();
		
		if(journalDTO.getImageDTO()!=null && journalDTO.getImageDTO().getIName()!="") {
			ImageDTO imageDTO = journalDTO.getImageDTO();
			imageDTO.setOriNo(jNo);
			ImageMapper.insert(imageDTO);
		}
	}
	
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
	public List<JournalDTO> getListWithPaging(PageRequestDTO pageRequestDTO) throws Exception {
		return journalMapper.selectWithPaging(pageRequestDTO);
	}
	
	@Override
	public List<JournalDTO> getListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception {
		return journalMapper.selectWithImageAndPagingAndSearch(pageRequestDTO);
	}
	
	@Override
	public int countAllWithSearch(PageRequestDTO pageRequestDTO) {
		return journalMapper.countAllWithSearch(pageRequestDTO);
	}
	
	@Override
	public JournalDTO getWithIngreAndFoodAndImage(Long jNo) throws Exception {
		return journalMapper.selectWithIngreAndFoodAndImage(jNo);
	}
	
	
	@Override
	public List<JournalDTO> mygetListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception {
		return journalMapper.myselectWithImageAndPagingAndSearch(pageRequestDTO);
	}
	
	@Override
	public boolean modifyWithIngreAndImage(JournalDTO journalDTO) throws Exception {
		Long jNo = journalDTO.getJNo();
		ImageMapper.delete(jNo, "JRN");
		
		int result = journalMapper.update(journalDTO);
		
		if(journalDTO.getImageDTO()!=null && journalDTO.getImageDTO().getIName()!="") {
			ImageDTO imageDTO = journalDTO.getImageDTO();
			imageDTO.setOriNo(jNo);
			ImageMapper.insert(imageDTO);
		}
		
		return result==1;
	}
	
	@Override
	public boolean removeWithIngreAndImage(Long jNo) throws Exception {
		ImageMapper.delete(jNo, "JRN");
		
		return journalMapper.delete(jNo)==1;
	}
	
	@Override
	public int insertReply(ReplyDTO replyDTO) throws Exception {
		return journalMapper.insertReply(replyDTO);
	}
	
	@Override
	public List<ReplyDTO> replyList(Long jNo) throws Exception {
		return journalMapper.replyList(jNo);
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
