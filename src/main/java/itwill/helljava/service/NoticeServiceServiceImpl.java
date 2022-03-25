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
	public int getNoticeServiceCount(int pt_service_sortation) {
		return noticeServiceDAO.selectNoticeServiceCount(pt_service_sortation);
	}

	@Override
	public void modifyNoticeService(NoticeService noticeService) {
		noticeServiceDAO.updateNoticeService(noticeService);
	}
	@Override
	public NoticeService getNoticeService(int pt_service_no, int pt_service_sortation) {
		return noticeServiceDAO.selectNoticeService(pt_service_no, pt_service_sortation);
	}

	@Override
	public List<NoticeService> getNoticeServiceList(Map<String, Object> map1, int pt_service_sortation) {
		return noticeServiceDAO.selectNoticeServiceList(map1, pt_service_sortation);
	}


}
