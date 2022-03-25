package itwill.helljava.mapper;

import java.util.List;

import itwill.helljava.dto.Trainer;

public interface TrainerMapper {
	int insertTrainer(Trainer trainer);
	int updateTrainer(Trainer trainer);
	int selectTrainerCount();
	Trainer selectTrainer(int trainer_no);
	List<Trainer> selectTrainerList();
}
