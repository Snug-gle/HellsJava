package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.NoticeService;

public interface NoticeServiceDAO {

	int insertNoticeService(NoticeService noticeService);

	int updateNoticeService(NoticeService noticeService);
	
	// 답글 추가 메서드
	int updateReplyNoticeService(NoticeService noticeService);

	int selectNoticeServiceCount(int notice_service_sortation);
	
	// 내가 쓴 1:1문의 게시글 갯수
	int selectNoticeServicePersonalCount(int notice_service_sortation, int member_no);

	// 합친 DB이기 때문에 구분하려면 혹시 몰라서 글 구분 매개변수도 추가함. (공지사항&FAQ)
	NoticeService selectNoticeService(int notice_service_no);

	// 마찬가지로 글 구분 매개변수도 추가함 (관리자용)
	List<NoticeService> selectNoticeServiceList(Map<String, Object> map1, int notice_service_sortation);

	// 글구분 개수를 활용한 리스트 뽑기 (회원용) -> 아마 1:1문의에서만 쓰일 수도
	List<NoticeService> selectNoticeServicePersonalList(Map<String, Object> map1, int notice_service_sortation, int member_no);
	
}
