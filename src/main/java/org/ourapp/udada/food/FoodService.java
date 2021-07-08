package org.ourapp.udada.food;

import java.util.List;

public interface FoodService {
	
	int countAll() throws Exception;
	
	List<FoodDTO> getList(FoodCriteria FCri) throws Exception;
	
	int foodCount(FoodCriteria FCri) throws Exception;
	
	FoodDTO read(String fNo) throws Exception;
	
	
	
	
	
	
	List<FoodDTO> getByFName(String keyword) throws Exception;

}
