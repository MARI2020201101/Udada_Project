package org.ourapp.udada.member;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.ourapp.udada.image.ImageDTO;
import org.ourapp.udada.recipe.RecipeDTO;
import org.ourapp.udada.recipe.RecipeIngredientDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO implements Serializable{
	
	
	private String mEmail;	
	private String mName;
	private String mPw;
	private Date mBirth;
	private String mGender;
	private String mGrade;

}
