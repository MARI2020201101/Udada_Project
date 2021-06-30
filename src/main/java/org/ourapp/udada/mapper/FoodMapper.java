package org.ourapp.udada.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.ourapp.udada.food.FoodDTO;
import org.ourapp.udada.food.PageRequestDTO;


@Mapper
public interface FoodMapper {

	int countAll();
	
	List<FoodDTO> getList();
	List<FoodDTO> getMinList(String fMjclass);
	List<FoodDTO> getFoodList(String fMinclass);
	/*List<FoodDTO> selectWithPagingAndSearch(PageRequestDTO pageRequestDTO);
	
	int countAllWithSearch(PageRequestDTO pageRequestDTO);*/
	
	
	FoodDTO read(String fNo);
	
	
	
	
	
	
	
	List<FoodDTO> selectByFName(String keyword);
	
}
