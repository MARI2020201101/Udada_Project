package org.ourapp.udada.food;

import java.util.List;

import org.ourapp.udada.mapper.FoodMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FoodServiceImpl implements FoodService{

	private final FoodMapper foodMapper;
	
	public int countAll() throws Exception{
		return foodMapper.countAll();
	}

	@Override
	public List<FoodDTO> getList() throws Exception {
		// TODO Auto-generated method stub
		return foodMapper.getList();
	}
	
	@Override
	public List<FoodDTO> getMinList(String fMjclass) throws Exception {
		// TODO Auto-generated method stub
		return foodMapper.getMinList(fMjclass);
	}
	
	@Override
	public List<FoodDTO> getFoodList(String fMinclass) throws Exception {
		// TODO Auto-generated method stub
		return foodMapper.getFoodList(fMinclass);
	}
	
	
	/*@Override 
	public int countAllWithSearch(PageRequestDTO pageRequestDTO) {	
		//TODO Auto-generated method stub return
		return foodMapper.countAllWithSearch(pageRequestDTO); 
		
	}
	 
	 @Override
	 public List<FoodDTO> getListWithPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception { 
		 // TODO Auto-generated method stub return
		 return foodMapper.selectWithPagingAndSearch(pageRequestDTO);
	 }*/
	
	@Override
	public FoodDTO read(String fNo) throws Exception {
		// TODO Auto-generated method stub
		return foodMapper.read(fNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<FoodDTO> getByFName(String keyword) throws Exception {
		return foodMapper.selectByFName(keyword);
	}
	
}
