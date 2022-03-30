package itwill.helljava.service;

import java.util.List;
import java.util.Map;

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
	public int getTrainerListCount(Map<String, Object> map) {
		return trainerDAO.selectTrainerListCount(map);
	}
	
	@Override
	public int getMainPageTrainerListCount(Map<String, Object> map) {
		return trainerDAO.selectMainPageTrainerListCount(map);
	}

	@Override
	public Trainer getTrainer(int trainer_no) {
		return trainerDAO.selectTrainer(trainer_no);
	}

	@Override
	public List<Trainer> getTrainerList(Map<String, Object> map) {
		return trainerDAO.selectTrainerList(map);
	}
	
	@Override
	public List<Trainer> getMainPageTrainerList(Map<String, Object> map) {
		return trainerDAO.selectMainPageTrainerList(map);
	}
}
