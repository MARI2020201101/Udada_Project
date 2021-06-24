package org.ourapp.udada.food;

import java.util.List;

import org.ourapp.udada.mapper.FoodMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class FoodServiceImpl implements FoodService{

	private final FoodMapper foodMapper;
	
	public int countAll() throws Exception{
		return foodMapper.countAll();
	}

	/*
	 * @Override public List<FoodDTO> getFood_Soups() { // TODO Auto-generated
	 * method stub
	 * 
	 * log.info("FoodService........................................."); return
	 * foodMapper.getFood_Soups();
	 * 
	 * }
	 */
	
	@Override
	public List<FoodDTO> getList() {
		// TODO Auto-generated method stub
		
		return foodMapper.getList();
		
	}
	
	@Override
	public List<FoodDTO> getMn_List(String fMjclass) {
		// TODO Auto-generated method stub
		return foodMapper.getMn_List(fMjclass);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<FoodDTO> getByFName(String keyword) throws Exception {
		return foodMapper.selectByFName(keyword);
	}
	
}
