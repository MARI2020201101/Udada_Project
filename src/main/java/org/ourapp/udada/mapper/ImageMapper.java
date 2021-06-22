package org.ourapp.udada.mapper;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.image.ImageDTO;

public interface ImageMapper {
	
	void insert(ImageDTO imageDTO);
	int delete(@Param("oriNo") Long oriNo, @Param("iDiv")String iDiv);

}
