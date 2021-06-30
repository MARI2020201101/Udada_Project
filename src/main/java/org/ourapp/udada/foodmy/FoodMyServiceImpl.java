package org.ourapp.udada.foodmy;

import java.util.List;

import org.ourapp.udada.mapper.FoodMyMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Service
@RequiredArgsConstructor
@Slf4j
public class FoodMyServiceImpl implements FoodMyService{

	private final FoodMyMapper foodMyMapper;
	
	@Override
	public List<FoodMyResultDTO> getList(String day, String mEmail) throws Exception{
		
		return foodMyMapper.select(day, mEmail);
	}

	@Override
	public void modify(FoodMyDTO foodMyDTO) throws Exception {
		foodMyMapper.update(foodMyDTO);
	}

	@Override
	public void delete(Long fmNo) throws Exception{
		foodMyMapper.delete(fmNo);
	}

	@Override
	public FoodMyDayTotalDTO getDayTotal(String day, String mEmail) throws Exception{
		return foodMyMapper.selectDayTotal(day, mEmail);
	}

}
