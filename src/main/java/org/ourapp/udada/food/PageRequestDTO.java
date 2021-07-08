package org.ourapp.udada.food;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PageRequestDTO {
	
	private int pageNum;
	private int pageSize;
	private String keyword;
	
	public PageRequestDTO() {
		this(1,20,"");
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
