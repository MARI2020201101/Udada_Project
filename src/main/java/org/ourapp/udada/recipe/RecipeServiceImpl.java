package org.ourapp.udada.recipe;

import java.util.List;

import org.ourapp.udada.mapper.RecipeMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class RecipeServiceImpl implements RecipeService{
	
	private final RecipeMapper recipeMapper;

	@Override
	public List<RecipeDTO> getList() {	
		log.info("recipeService.........................................");
		return recipeMapper.getList();
	}

	@Override
	public RecipeDTO get(Long rNo) {		
		return recipeMapper.read(rNo);
	}

	@Override
	public boolean modify(RecipeDTO recipeDTO) {		
		return recipeMapper.update(recipeDTO)==1;
	}

	@Override
	public boolean remove(Long rNo) {		
		return recipeMapper.delete(rNo)==1;
	}

	@Override
	public void register(RecipeDTO recipeDTO) {
		recipeMapper.register(recipeDTO);
		
	}
	
	

}
