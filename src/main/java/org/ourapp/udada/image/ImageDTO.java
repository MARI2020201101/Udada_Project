package org.ourapp.udada.image;

import java.util.Date;
import java.util.List;

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
public class ImageDTO {
	
	/*
	 * I_UUID	VARCHAR2(100 BYTE)
		ORI_NO	NUMBER
		I_NAME	VARCHAR2(500 BYTE)
		I_DIR	VARCHAR2(500 BYTE)
		I_DIV	VARCHAR2(20 BYTE) (RCP, CRW, JRN) 
	 * */
	
	private String iUuid;
	private Long oriNo;
	private String iName;
	private String iDir;
	private String iDiv;
	
	
	public String getImagePath() throws Exception {
		return iDir + "/" + iUuid + iName.substring(iName.lastIndexOf("."));
	}
	
	public String getThumbnailPath() throws Exception {
		return iDir + "/" + "thumb_" + iUuid + iName.substring(iName.lastIndexOf("."));
	}
}
