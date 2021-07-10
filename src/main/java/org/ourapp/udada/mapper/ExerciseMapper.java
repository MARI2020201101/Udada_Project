package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.exercise.ExerciseDTO;
import org.ourapp.udada.exercise.ExerciseGetMyListDTO;
import org.ourapp.udada.exercise.ExercisePageRequestDTO;
import org.ourapp.udada.exercise.ExercisePageResultDTO;
import org.ourapp.udada.exercise.Exercise_myDTO;


public interface ExerciseMapper {
	
	List<ExerciseDTO> getList();
	ExerciseDTO read(Long eNo);
	List<Exercise_myDTO> myList(ExercisePageRequestDTO exercisePageRequestDTO);
	ExerciseDTO myget(Long eNo);
	int delete(Long eNo);
	void insert(Exercise_myDTO exercise_myDTO);

	List<ExerciseDTO> selectWithImageAndPagingAndSearch(ExercisePageRequestDTO exercisePageRequestDTO);
	int countAllWithSearch(ExercisePageRequestDTO exercisePageRequestDTO);
	int countAllMylist(ExercisePageRequestDTO exercisePageRequestDTO);
	List<ExerciseGetMyListDTO> getMyExcsList(@Param("mEmail") String mEmail);

}
