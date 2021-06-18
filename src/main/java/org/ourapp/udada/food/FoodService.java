package org.ourapp.udada.food;

import java.util.List;

public interface FoodService {
	
	int countAll() throws Exception;
	
	
	
	
	
	
	
	
	
	List<FoodDTO> getByFName(String keyword) throws Exception;

}
