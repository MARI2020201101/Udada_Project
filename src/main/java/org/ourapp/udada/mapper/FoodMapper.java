package org.ourapp.udada.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.ourapp.udada.food.Criteria;
import org.ourapp.udada.food.FoodDTO;
import org.ourapp.udada.food.PageRequestDTO;
import org.ourapp.udada.food.PagingDTO;


@Mapper
public interface FoodMapper {

	int countAll();
	
	List<FoodDTO> getList();
	List<FoodDTO> getMinList(String fMjclass);
	FoodDTO getFoodList(String fNo);
	
	List<FoodDTO> getMjPagination(Criteria cri);
	//List<FoodDTO> getMjPagination(PageRequestDTO pageRequestDTO);
	//List<FoodDTO> getMjPagination(PagingDTO pagingDTO);
	
	int countAllWithSearch(PageRequestDTO pageRequestDTO);
	
	/*List<FoodDTO> selectWithPagingAndSearch(PageRequestDTO pageRequestDTO);
	
	int countAllWithSearch(PageRequestDTO pageRequestDTO);*/
	
	FoodDTO read(String fNo);
	
	
	
	
	
	
	
	List<FoodDTO> selectByFName(String keyword);
	
}
