package org.ourapp.udada.exercise;

import java.util.List;


public interface ExerciseService {
	
	List<ExerciseDTO> getList();
	ExerciseDTO get(Long eNo);
	List<Exercise_myDTO> myList();
	ExerciseDTO myget(Long eNo);
	boolean remove(Long eNo) throws Exception;

}
