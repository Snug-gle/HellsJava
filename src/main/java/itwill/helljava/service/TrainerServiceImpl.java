package itwill.helljava.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwill.helljava.dao.TrainerDAO;
import itwill.helljava.dto.Trainer;

@Service
public class TrainerServiceImpl implements TrainerService {
	@Autowired
	private TrainerDAO trainerDAO;

	@Override
	public void addTrainer(Trainer trainer) {
		trainerDAO.insertTrainer(trainer);
	}

	@Override
	public void modifyTrainer(Trainer trainer) {
		trainerDAO.updateTrainer(trainer);
	}

	@Override
	public Trainer getTrainer(int trainer_no) {
		return trainerDAO.selectTrainer(trainer_no);
	}

}
