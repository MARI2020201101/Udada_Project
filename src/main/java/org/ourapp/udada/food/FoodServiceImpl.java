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
	public List<FoodDTO> getByFName(String keyword) throws Exception {
		return foodMapper.selectByFName(keyword);
	}
	
}
