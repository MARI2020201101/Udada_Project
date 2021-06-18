package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.ourapp.udada.food.FoodDTO;

@Mapper
public interface FoodMapper {

	int countAll();
	
}
