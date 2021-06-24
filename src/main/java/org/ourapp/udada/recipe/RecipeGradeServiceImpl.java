package org.ourapp.udada.recipe;

import org.ourapp.udada.mapper.RecipeGradeMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class RecipeGradeServiceImpl implements RecipeGradeService{
	
	private final RecipeGradeMapper recipeGradeMapper;
	
	@Override
	public void register(RecipeGradeDTO recipeGradeDTO) throws Exception {
		recipeGradeMapper.delete(recipeGradeDTO);
		recipeGradeMapper.insert(recipeGradeDTO);
		
	}

	@Override
	public Double loadAvgByRNo(Long rNo) throws Exception {
		return recipeGradeMapper.selectAvgByRNo(rNo);
	}
	
	

}
