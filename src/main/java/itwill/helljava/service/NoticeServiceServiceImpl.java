package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import itwill.helljava.dao.NoticeServiceDAO;
import itwill.helljava.dto.NoticeService;

public class NoticeServiceServiceImpl implements NoticeServiceService {

	@Autowired
	NoticeServiceDAO noticeServiceDAO;

	@Override
	public void addNoticeService(NoticeService noticeService) {
		noticeServiceDAO.insertNoticeService(noticeService);
	}
	
	@Override
	public void modifyNoticeService(NoticeService noticeService) {
		noticeServiceDAO.updateNoticeService(noticeService);
	}
	
	@Override
	public void modifyReplyNoticeService(NoticeService noticeService) {
		noticeServiceDAO.updateReplyNoticeService(noticeService);
	}

	@Override
	public int getNoticeServiceCount(int notice_service_sortation) {
		return noticeServiceDAO.selectNoticeServiceCount(notice_service_sortation);
	}

	@Override
	public int getNoticeServicePersonalCount(int notice_service_sortation, int member_no) {
		return noticeServiceDAO.selectNoticeServicePersonalCount(notice_service_sortation, member_no);
	}

	@Override
	public NoticeService getNoticeService(int notice_service_no) {
		return noticeServiceDAO.selectNoticeService(notice_service_no);
	}
	
	@Override
	public List<NoticeService> getNoticeServiceList(Map<String, Object> map1, int notice_service_sortation) {
		return noticeServiceDAO.selectNoticeServiceList(map1, notice_service_sortation);
	}

	@Override
	public List<NoticeService> getNoticeServicePersonalList(Map<String, Object> map1, int notice_service_sortation,
			int member_no) {
		return noticeServiceDAO.selectNoticeServicePersonalList(map1, notice_service_sortation, member_no);
	}

}
