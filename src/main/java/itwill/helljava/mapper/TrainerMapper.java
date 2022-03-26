package itwill.helljava.mapper;

import itwill.helljava.dto.Trainer;

public interface TrainerMapper {
	
	int insertTrainer(Trainer trainer);

	int updateTrainer(Trainer trainer);

	Trainer selectTrainer(int trainer_no);

}
