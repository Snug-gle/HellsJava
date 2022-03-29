package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.NoticeService;
import itwill.helljava.exception.NoticeServiceNotFoundException;

public interface NoticeServiceDAO {

	int insertNoticeService(NoticeService noticeService);

	int updateNoticeService(NoticeService noticeService);

	// 답글 추가 메서드
	int updateReplyNoticeService(NoticeService noticeService);

	// 글 삭제 메서드
	int deleteNoticeService(int noticeServiceNo);
	
	// 1:1 공지사항&FAQ 게시글 카운트 (검색 있음 제목, 내용, 이름(1:1문의 관리자) 검색)
	int selectNoticeServiceCount(Map<String, Object> map);

	// 내가 쓴 1:1문의 게시글 갯수
	int selectNoticeServicePersonalCount(int notice_service_sortation, int member_no);

	// 합친 DB이기 때문에 구분하려면 혹시 몰라서 글 구분 매개변수도 추가함. (공지사항&FAQ)
	NoticeService selectNoticeService(int notice_service_no);

	// 마찬가지로 글 구분 매개변수도 추가함 (관리자용)
	List<NoticeService> selectNoticeServiceList(Map<String, Object> map);

	// 글구분 개수를 활용한 리스트 뽑기 (회원용) -> 아마 1:1문의에서만 쓰일 수도
	List<NoticeService> selectNoticeServicePersonalList(Map<String, Object> map);

}
