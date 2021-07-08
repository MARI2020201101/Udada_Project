package org.ourapp.udada.food;

import java.util.List;

public interface FoodService {
	
	List<FoodDTO> getList() throws Exception;
	List<FoodDTO> getMinList(String fMjclass) throws Exception;
	FoodDTO getFoodList(String fNo) throws Exception;
	
	List<FoodDTO> getList(Criteria cri) throws Exception;
	int countAll() throws Exception;
	
	//List<FoodDTO> MjPagination(PageRequestDTO pageRequestDTO) throws Exception;
	//List<FoodDTO> MjPagination(PagingDTO pagingDTO) throws Exception;
	
	int countAllWithSearch(PageRequestDTO pageRequestDTO);
	
	/*List<FoodDTO> getListWithPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception;
	  
	*/
	 
	
	FoodDTO read(String fNo) throws Exception;
	
	
	
	
	
	
	List<FoodDTO> getByFName(String keyword) throws Exception;

}
