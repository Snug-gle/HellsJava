package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.NoticeService;

public interface NoticeServiceDAO {

	int insertNoticeService(NoticeService noticeService);

	int updateNoticeService(NoticeService noticeService);

	int selectNoticeServiceCount(int pt_service_sortation);

	// 합친 DB이기 때문에 구분하려면 혹시 몰라서 글 구분 매개변수도 추가함.
	NoticeService selectNoticeService(int pt_service_no, int pt_service_sortation);

	// 마찬가지로 글 구분 매개변수도 추가함
	List<NoticeService> selectNoticeServiceList(Map<String, Object> map1, int pt_service_sortation);
}
