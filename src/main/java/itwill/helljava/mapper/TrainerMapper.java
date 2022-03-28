package itwill.helljava.mapper;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;
import itwill.helljava.dto.Trainer;

public interface TrainerMapper {
	
	int insertTrainer(Trainer trainer);

	int updateTrainer(Trainer trainer);

	Trainer selectTrainer(int trainer_no);

	// 트레이너 조회 리스트 (검색 기능 아이디, 이름 포함)
	List<Trainer> selectTrainerList(Map<String, Object> map);
}
