package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Trainer;

public interface TrainerService {
	
	void addTrainer(Trainer trainer);

	void modifyTrainer(Trainer trainer);

	Trainer getTrainer(int trainer_no);

	List<Trainer> selectTrainerList(Map<String, Object> map, String member_id, String member_name);

}
