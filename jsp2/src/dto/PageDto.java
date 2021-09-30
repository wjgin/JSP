package dto;

import lombok.Data;

@Data
public class PageDto {
	private int currentPage; // 현재 페이지
	private int totalCount; // 글의 전체 개수
	private int pageSize; // 한개 페이지에 보여줄 글 개수

	private int totalPage; // 전체 페이지 개수
	private int startPage; // 보여줄 페이지 시작 번호
	private int endPage; // 꼭 필요하지 않습니다.

	private int startNo;

	public PageDto(int currentPage, int totalPage, int pageSize) { // 외부(비지니스로직)에서 결정
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.pageSize = pageSize;

		// totalPage = totalCount / pageSize 올림
		// 1 ~ totalPage의 유효성 검사
		totalPage = (totalCount - 1) / pageSize + 1;
		this.currentPage = (currentPage > totalPage) ? totalPage : currentPage;
		this.currentPage = (currentPage < 1) ? 1 : currentPage;

		// mysql의 limit 사용할 때,
		int startNo = (this.currentPage - 1) * pageSize;

		startPage = (this.currentPage - 1) / 10 * 10 + 1; // 페이지 크기에 따른 페이지 시작 위치
		endPage = startPage + 9;
	}

}
