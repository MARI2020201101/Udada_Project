package org.ourapp.udada.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
public class PageRequestDTO {
	
	private int pageNum;
	private int pageSize;
	
	public PageRequestDTO() {
		this(1,10);
	}

	public PageRequestDTO(int pageNum, int pageSize) {
		this.pageNum=pageNum;
		this.pageSize=pageSize;
	}
}
