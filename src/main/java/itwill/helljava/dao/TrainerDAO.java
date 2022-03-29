package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;
import itwill.helljava.dto.Trainer;

public interface TrainerDAO {
	
	int insertTrainer(Trainer trainer);

	int updateTrainer(Trainer trainer);

	// 포스팅에 띄울 친구 (member, Trainer join)
	Trainer selectTrainer(int trainer_no);
	
	// 트레이너 조회 리스트 (검색 기능 아이디, 이름 포함)
	List<Trainer> selectTrainerList(Map<String, Object> map);

	// 메인페이지 검색 용 리스트 - > 이름, 동, 센터명 검색
	List<Trainer> selectMainPageTrainerList(Map<String, Object> map);
}
