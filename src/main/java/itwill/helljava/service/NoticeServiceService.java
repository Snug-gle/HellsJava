package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.NoticeService;

public interface NoticeServiceService {

	void addNoticeService(NoticeService noticeService);

	void modifyNoticeService(NoticeService noticeService);
	
	void modifyReplyNoticeService(NoticeService noticeService);

	// 1:1 공지사항&FAQ 게시글 카운트 (검색 있음 제목, 내용, 이름(1:1문의 관리자) 검색)
	int getNoticeServiceCount(Map<String, Object> map);
	
	int getNoticeServicePersonalCount(int notice_service_sortation, int member_no);

	// 합친 DB이기 때문에 구분하려면 혹시 몰라서 글 구분 매개변수도 추가함. (공지사항&FAQ)
	NoticeService getNoticeService(int notice_service_no);

	// 마찬가지로 글 구분 매개변수도 추가함
	List<NoticeService> getNoticeServiceList(Map<String, Object> map);
	
	List<NoticeService> getNoticeServicePersonalList(Map<String, Object> map);
}
