package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import itwill.helljava.dto.NoticeService;
import itwill.helljava.mapper.NoticeServiceMapper;

public class NoticeServiceDAOImpl implements NoticeServiceDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertNoticeService(NoticeService noticeService) {
		return sqlSession.getMapper(NoticeServiceMapper.class).insertNoticeService(noticeService);
	}

	@Override
	public int updateNoticeService(NoticeService noticeService) {
		return sqlSession.getMapper(NoticeServiceMapper.class).updateNoticeService(noticeService);
	}

	@Override
	public int selectNoticeServiceCount(int notice_service_sortation) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeServiceCount(notice_service_sortation);
	}

	@Override
	public NoticeService selectNoticeService(int notice_service_no, int notice_service_sortation) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeService(notice_service_no, notice_service_sortation);
	}

	@Override
	public NoticeService selectNoticeService(int notice_service_no, int member_no, int notice_service_sortation) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeService(notice_service_no, member_no,
				notice_service_sortation);

	}

	@Override
	public List<NoticeService> selectNoticeServiceList(Map<String, Object> map1, int notice_service_sortation) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeServiceList(map1, notice_service_sortation);
	}

}
