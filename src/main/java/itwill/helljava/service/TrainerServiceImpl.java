package itwill.helljava.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itwill.helljava.dao.TrainerDAO;
import itwill.helljava.dto.Trainer;

@Service
public class TrainerServiceImpl implements TrainerService {
	@Autowired
	private TrainerDAO trainerDAO;
	
	@Transactional
	@Override
	public void addTrainer(Trainer trainer) {
		trainerDAO.insertTrainer(trainer);
	}
	
	@Transactional
	@Override
	public void modifyTrainer(Trainer trainer) {
		trainerDAO.updateTrainer(trainer);
	}

	@Override
	public Trainer getTrainer(int trainer_no) {
		return trainerDAO.selectTrainer(trainer_no);
	}

}
