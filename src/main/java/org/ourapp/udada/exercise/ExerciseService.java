package org.ourapp.udada.exercise;

import java.util.List;

import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.recipe.RecipeDTO;


public interface ExerciseService {
	
	List<ExerciseDTO> getList();
	ExerciseDTO get(Long eNo);
	List<Exercise_myDTO> myList(String mEmail);
	ExerciseDTO myget(Long eNo);
	boolean remove(Long eNo) throws Exception;
	void insert(Exercise_myDTO exercise_myDTO);
	
	int countAllWithSearch(PageRequestDTO pageRequestDTO);
	List<ExerciseDTO> getListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception;

}
