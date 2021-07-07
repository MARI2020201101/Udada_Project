package org.ourapp.udada.mapper;

import java.util.List;


import org.ourapp.udada.exercise.ExerciseDTO;
import org.ourapp.udada.exercise.Exercise_myDTO;
import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.recipe.RecipeDTO;

public interface ExerciseMapper {
	
	List<ExerciseDTO> getList();
	ExerciseDTO read(Long eNo);
	List<Exercise_myDTO> myList(String mEmail);
	ExerciseDTO myget(Long eNo);
	int delete(Long eNo);
	void insert(Exercise_myDTO exercise_myDTO);
	
	List<ExerciseDTO> selectWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO);
	int countAllWithSearch(PageRequestDTO pageRequestDTO);

}
