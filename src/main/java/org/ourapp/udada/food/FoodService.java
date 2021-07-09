package org.ourapp.udada.food;

import java.util.List;

import org.ourapp.udada.foodmy.FoodMyDTO;

public interface FoodService {
	
	List<FoodDTO> getList() throws Exception;
	List<FoodDTO> getMinList(String fMjclass) throws Exception;
	FoodDTO getFoodList(String fNo) throws Exception;
	
	int countAll() throws Exception;
	
	void registerFoodMy(FoodMyDTO foodMyDTO) throws Exception;
	List<FoodDTO> getByFName(String keyword) throws Exception;

}
