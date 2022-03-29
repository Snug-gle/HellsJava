package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;
import itwill.helljava.dto.Trainer;

public interface TrainerService {
	
	void addTrainer(Trainer trainer);

	void modifyTrainer(Trainer trainer);

	Trainer getTrainer(int trainer_no);

	List<Trainer> getTrainerList(Map<String, Object> map);

	// 메인페이지 검색 용 리스트 - > 이름, 동, 센터명 검색
	List<Trainer> getMainPageTrainerList(Map<String, Object> map);
}
