package org.ourapp.udada.food;

import java.util.List;

public interface FoodService {
	
	int countAll() throws Exception;
	
	List<FoodDTO> getList() throws Exception;
	List<FoodDTO> getMinList(String fMjclass) throws Exception;
	List<FoodDTO> getFoodList(String fMinclass) throws Exception;
	
	/*List<FoodDTO> getListWithPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception;
	  
	int countAllWithSearch(PageRequestDTO pageRequestDTO);*/
	 
	
	FoodDTO read(String fNo) throws Exception;
	
	
	
	
	
	
	
	List<FoodDTO> getByFName(String keyword) throws Exception;

}
