package org.ourapp.udada.food;

import java.util.List;

import org.ourapp.udada.mapper.FoodDetailMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class FoodDetailServiceImpl implements FoodDetailService{
	
	private final FoodDetailMapper foodDetailMapper;

	@Override
	public List<FoodDetailDTO> getNameList(FoodDetailDTO foodDetailDTO) throws Exception {
		// TODO Auto-generated method stub
	
		return foodDetailMapper.selectFname(foodDetailDTO);
		
	}
	
}
