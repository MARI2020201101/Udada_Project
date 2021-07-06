
 package org.ourapp.udada.exercise;
  
  import java.util.List;

  
  import org.ourapp.udada.mapper.ExerciseMapper;
import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.recipe.RecipeDTO;
import org.springframework.stereotype.Service;
  
  import lombok.RequiredArgsConstructor; 
  import lombok.extern.log4j.Log4j;
  
  @Service
  @RequiredArgsConstructor
  @Log4j 
  public class ExerciseServiceImpl implements ExerciseService{
  
  private final ExerciseMapper exerciseMapper;
  
  @Override 
  public List<ExerciseDTO> getList() {
  log.info("exerciseService~.~"); 
  	 return exerciseMapper.getList(); 
  }

  @Override
  public ExerciseDTO get(Long eNo) {		
	 return exerciseMapper.read(eNo); 
  }

  @Override
  public List<Exercise_myDTO> myList(String mEmail) {
	 return exerciseMapper.myList(mEmail);
  }

  @Override
  public ExerciseDTO myget(Long eNo) {
	  return exerciseMapper.myget(eNo);
  }

  @Override
  public boolean remove(Long eNo) throws Exception {
	  return exerciseMapper.delete(eNo)==1;
  }

  @Override
  public void insert(Exercise_myDTO exercise_myDTO) {
	  exerciseMapper.insert(exercise_myDTO);
	
  }

  @Override
  public int countAllWithSearch(PageRequestDTO pageRequestDTO) {
	  return exerciseMapper.countAllWithSearch(pageRequestDTO);
  }

  @Override
  public List<ExerciseDTO> getListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception {
	  return exerciseMapper.selectWithImageAndPagingAndSearch(pageRequestDTO);
}

  
  
  

}