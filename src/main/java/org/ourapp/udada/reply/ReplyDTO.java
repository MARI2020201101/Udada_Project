package org.ourapp.udada.reply;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyDTO {

	private long reNo;
	private long oriNo;
	private String mEmail;
	private String reContent;
	private Date reDate;
	private String reDiv; //RCP, CHG, JRN
	private int reGroup;
	private int reIndent;
	
}//class end
