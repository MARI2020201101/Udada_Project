package org.ourapp.udada.recipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import lombok.RequiredArgsConstructor;

@RestController
@Slf4j
public class RecipeGradeController {

	@Autowired
	private RecipeGradeService recipeGradeService;

	/*
	 * @GetMapping("/recipe/grade/{rNo}") public ResponseEntity<double>
	 * loadAvgByRNo(@PathVariable("rNo") Long rNo){
	 * 
	 * }
	 */

}
