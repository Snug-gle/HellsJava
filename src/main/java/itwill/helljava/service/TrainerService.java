package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.Trainer;

public interface TrainerService {
	
	void addTrainer(Trainer trainer);

	void modifyTrainer(Trainer trainer);

	int getTrainerCount();

	Trainer getTrainer(int trainer_no);

	List<Trainer> getTrainerList();
}
