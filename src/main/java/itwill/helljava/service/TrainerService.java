package itwill.helljava.service;

import itwill.helljava.dto.Trainer;

public interface TrainerService {
	
	void addTrainer(Trainer trainer);

	void modifyTrainer(Trainer trainer);

	Trainer getTrainer(int trainer_no);

}
