package org.ourapp.udada.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FoodMapper {

	int countAll();
}
