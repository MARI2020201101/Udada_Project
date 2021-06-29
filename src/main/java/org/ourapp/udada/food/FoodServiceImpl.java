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
	public List<FoodDTO> getList(FoodCriteria FCri) throws Exception {
		// TODO Auto-generated method stub
		return foodMapper.getList(FCri);
	}
	
	@Override
	public int foodCount(FoodCriteria FCri) throws Exception {
		// TODO Auto-generated method stub
		return foodMapper.foodCount(FCri);
	}
	
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
