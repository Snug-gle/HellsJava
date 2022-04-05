package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itwill.helljava.dto.NoticeService;
import itwill.helljava.mapper.NoticeServiceMapper;

@Repository
public class NoticeServiceDAOImpl implements NoticeServiceDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertNoticeService(NoticeService noticeService) {
		return sqlSession.getMapper(NoticeServiceMapper.class).insertNoticeService(noticeService);
	}

	@Override
	public int updateNoticeService(NoticeService noticeService) {
		return sqlSession.getMapper(NoticeServiceMapper.class).updateNoticeService(noticeService);
	}

	@Override
	public int updateReplyNoticeService(NoticeService noticeService) {
		return sqlSession.getMapper(NoticeServiceMapper.class).updateReplyNoticeService(noticeService);
	}

	@Override
	public int updateNoticeServiceHits(int noticeServiceNo) {
		return sqlSession.getMapper(NoticeServiceMapper.class).updateNoticeServiceHits(noticeServiceNo);
	}
	
	@Override
	public int deleteNoticeService(int noticeServiceNo) {
		return sqlSession.getMapper(NoticeServiceMapper.class).deleteNoticeService(noticeServiceNo);
	}
	
	@Override
	public int selectNoticeServiceCount(Map<String, Object> map) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeServiceCount(map);
	}
	
	@Override
	public int selectNoticeServiceFaqCount(int noticeServiceCategory) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeServiceFaqCount(noticeServiceCategory);
	}
	@Override
	public int selectNoticeServicePersonalCount(Map<String, Object> map) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeServicePersonalCount(map);
	}

	@Override
	public NoticeService selectNoticeService(int notice_service_no) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeService(notice_service_no);
	}

	@Override
	public List<NoticeService> selectNoticeServiceList(Map<String, Object> map) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeServiceList(map);
	}
	
	@Override
	public List<NoticeService> selectNoticeServiceFaqList(Map<String, Object> map) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeServiceFaqList(map);
	}

	@Override
	public List<NoticeService> selectNoticeServicePersonalList(Map<String, Object> map) {
		return sqlSession.getMapper(NoticeServiceMapper.class).selectNoticeServicePersonalList(map);
	}

}
