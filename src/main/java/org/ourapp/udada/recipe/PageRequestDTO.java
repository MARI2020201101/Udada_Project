package org.ourapp.udada.recipe;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
public class PageRequestDTO {
	
	private int pageNum;
	private int pageSize;
	private String keyword;
	
	public PageRequestDTO() {
		this(1,5,"");
	}

	public PageRequestDTO(int pageNum, int pageSize) {
		this.pageNum=pageNum;
		this.pageSize=pageSize;
	}
	
	public PageRequestDTO(int pageNum, int pageSize, String keyword) {
		this.pageNum=pageNum;
		this.pageSize=pageSize;
		this.keyword=keyword;
	}
}
