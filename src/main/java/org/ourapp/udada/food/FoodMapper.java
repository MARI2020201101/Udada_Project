package org.ourapp.udada.food;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FoodMapper {

	int countAll();
}
