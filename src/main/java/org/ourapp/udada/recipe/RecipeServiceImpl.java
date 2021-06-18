package org.ourapp.udada.recipe;

import java.util.List;

import org.ourapp.udada.mapper.RecipeIngredientMapper;
import org.ourapp.udada.mapper.RecipeMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class RecipeServiceImpl implements RecipeService{
	
	private final RecipeMapper recipeMapper;
	private final RecipeIngredientMapper recipeIngredientMapper;

	@Override
	public List<RecipeDTO> getList() throws Exception{	
		log.info("recipeService.........................................");
		return recipeMapper.getList();
	}

	@Override
	public RecipeDTO get(Long rNo) throws Exception{		
		return recipeMapper.read(rNo);
	}

	@Override
	public boolean modify(RecipeDTO recipeDTO) throws Exception{		
		return recipeMapper.update(recipeDTO)==1;
	}

	@Override
	public boolean remove(Long rNo) throws Exception{		
		return recipeMapper.delete(rNo)==1;
	}

	@Override
	public void register(RecipeDTO recipeDTO) throws Exception{
		recipeMapper.register(recipeDTO);
		
	}

	@Override @Transactional
	public void registerWithIngredient(RecipeDTO recipeDTO) throws Exception {
		recipeMapper.insertSelectKey(recipeDTO);
		
		if(recipeDTO.getIngredientList()!=null && recipeDTO.getIngredientList().size()>0) {
			
			List<RecipeIngredientDTO> ingredientList = recipeDTO.getIngredientList();
			for(RecipeIngredientDTO dto : ingredientList) {
				dto.setRNo(recipeDTO.getRNo());
				recipeIngredientMapper.insert(dto);
			}
		}		
	}
	
	

}
