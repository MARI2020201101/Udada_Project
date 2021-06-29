package org.ourapp.udada.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.ourapp.udada.food.FoodCriteria;
import org.ourapp.udada.food.FoodDTO;


@Mapper
public interface FoodMapper {

	int countAll();
	
	List<FoodDTO> getList(FoodCriteria FCri);
	
	int foodCount(FoodCriteria FCri);
	
	FoodDTO read(String fNo);
	
	
	
	
	
	
	
	List<FoodDTO> selectByFName(String keyword);
	
}
