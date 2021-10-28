package com.jcpdev.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Page {
	private int currentPage;
	private int totalCount;
	private int pageSize;
	
	private int totalPage;
	private int startPage;
	private int endPage;
	
	private int startNo;
	
	public Page(int currentPage, int totalCount, int pageSize) {
		this.currentPage=currentPage;
		this.totalCount=totalCount;
		this.pageSize=pageSize;
		
		//totalCount = 367개  pageSize= 20, totalPage=?
		totalPage = (totalCount-1)/pageSize + 1;
		this.currentPage=(currentPage > totalPage)? totalPage:currentPage;
		this.currentPage=(currentPage < 1)? 1:currentPage;
		
		//mysql의 limit 사용할때
		startNo=(this.currentPage-1)*pageSize;
		
		startPage = (this.currentPage-1)/10*10+1;
		// 현재 페이지 57, startPage 50
		// 현재 페이지 7, startPage 1
		// 현재 페이지 156, startPage 
		endPage = startPage +9;
		endPage = endPage > totalPage ? totalPage : endPage;
	}

}