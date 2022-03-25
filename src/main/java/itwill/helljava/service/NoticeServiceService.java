package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.NoticeService;

public interface NoticeServiceService {

	void addNoticeService(NoticeService noticeService);

	void modifyNoticeService(NoticeService noticeService);

	int getNoticeServiceCount(int notice_service_sortation);

	// 합친 DB이기 때문에 구분하려면 혹시 몰라서 글 구분 매개변수도 추가함. (공지사항&FAQ)
	NoticeService getNoticeService(int notice_service_no, int notice_service_sortation);

	// 얘는 1:1 문의용 
	NoticeService getNoticeServicePersonal(int notice_service_no, int member_no, int notice_service_sortation);

	// 마찬가지로 글 구분 매개변수도 추가함
	List<NoticeService> getNoticeServiceList(Map<String, Object> map1, int notice_service_sortation);
}
