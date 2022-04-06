package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;
import itwill.helljava.dto.Trainer;

public interface TrainerService {
	
	void addTrainer(Trainer trainer);

	void modifyTrainer(Trainer trainer);

	int getTrainerListCount(Map<String, Object> map);
	
	int getMainPageTrainerListCount(Map<String, Object> map);
	
	Trainer getTrainer(int memberNo);

	Trainer getTrainerTrainerNo(int trainerNo);
	
	List<Trainer> getTrainerList(Map<String, Object> map);

	// 메인페이지 검색 용 리스트 - > 이름, 동, 센터명 검색
	List<Trainer> getMainPageTrainerList(Map<String, Object> map);
}
