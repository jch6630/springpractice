package kr.co.practice.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class ReplyDTO {
	private int rno;
	private int bno;
	private String replyText;
	private String replyer;
	private Date regdate;
	private Date updateDate;
}