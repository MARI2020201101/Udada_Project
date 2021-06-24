package org.ourapp.udada.food;

import java.util.List;

public interface FoodService {
	
	int countAll() throws Exception;
	
	//List<FoodDTO> getFood_Soups();
	
	List<FoodDTO> getList();
	
	List<FoodDTO> getMn_List(String fMjclass);
	
	List<FoodDTO> getByFName(String keyword) throws Exception;

}
