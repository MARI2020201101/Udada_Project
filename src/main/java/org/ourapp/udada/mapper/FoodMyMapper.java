package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.foodmy.FoodMyDTO;
import org.ourapp.udada.foodmy.FoodMyDayTotalDTO;
import org.ourapp.udada.foodmy.FoodMyMemberSpecDTO;
import org.ourapp.udada.foodmy.FoodMyResultDTO;

public interface FoodMyMapper {

	List<FoodMyResultDTO> select(@Param("day")String day, @Param("mEmail")String mEmail);
	int update(FoodMyDTO foodMyDTO);
	int delete(Long fmNo);	
	FoodMyDayTotalDTO selectDayTotal(@Param("day")String day, @Param("mEmail")String mEmail);
	FoodMyMemberSpecDTO selectMemberInfo(String mEmail);
	
	FoodMyDayTotalDTO selectDayTotalWithDay(@Param("day")String day, @Param("mEmail")String mEmail);
}
