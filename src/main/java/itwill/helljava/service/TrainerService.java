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

}
