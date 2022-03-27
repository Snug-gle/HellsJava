package itwill.helljava.dao;

import itwill.helljava.dto.Trainer;

public interface TrainerDAO {
	
	int insertTrainer(Trainer trainer);

	int updateTrainer(Trainer trainer);

	Trainer selectTrainer(int trainer_no);
}
