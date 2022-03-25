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
	public int getNoticeServiceCount(int notice_service_sortation) {
		return noticeServiceDAO.selectNoticeServiceCount(notice_service_sortation);
	}

	@Override
	public void modifyNoticeService(NoticeService noticeService) {
		noticeServiceDAO.updateNoticeService(noticeService);
	}

	@Override
	public NoticeService getNoticeService(int notice_service_no, int notice_service_sortation) {
		return noticeServiceDAO.selectNoticeService(notice_service_no, notice_service_sortation);
	}

	@Override
	public NoticeService getNoticeServicePersonal(int notice_service_no, int member_no, int notice_service_sortation) {
		return noticeServiceDAO.selectNoticeServicePersonal(notice_service_no, member_no, notice_service_sortation);
	}

	@Override
	public List<NoticeService> getNoticeServiceList(Map<String, Object> map1, int notice_service_sortation) {
		return noticeServiceDAO.selectNoticeServiceList(map1, notice_service_sortation);
	}

}
