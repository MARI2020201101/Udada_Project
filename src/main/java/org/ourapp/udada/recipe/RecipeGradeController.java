package org.ourapp.udada.recipe;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequiredArgsConstructor
public class RecipeGradeController {

	private final RecipeGradeService recipeGradeService;

	
	@GetMapping("/recipe/grade/{rNo}") 
	public ResponseEntity<Double> loadAvgByRNo(@PathVariable("rNo")Long rNo) throws Exception{
	   Double avg = recipeGradeService.loadAvgByRNo(rNo);
	   log.info("avg : "+avg);
	   if(avg==null)  avg=0.00;
	   
	   return new ResponseEntity<>(avg , HttpStatus.OK);
	  }
	
	@PostMapping("/recipe/grade")
	public ResponseEntity<String> register(@RequestBody RecipeGradeDTO recipeGradeDTO) throws Exception {
		recipeGradeService.register(recipeGradeDTO);
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	 

}
