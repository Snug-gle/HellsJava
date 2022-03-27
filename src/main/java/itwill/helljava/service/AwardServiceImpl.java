package itwill.helljava.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwill.helljava.dao.AwardDAO;
import itwill.helljava.dto.Award;

@Service
public class AwardServiceImpl implements AwardService {

	@Autowired
	private AwardDAO awardDAO;
	
	@Override
	public void addAward(Award award) {
		awardDAO.insertAward(award);
	}

	@Override
	public void modifyAward(Award award) {
		awardDAO.updateAward(award);
	}

	@Override
	public void removeAward(int award_no) {
		awardDAO.deleteAward(award_no);
	}

	@Override
	public List<Award> getAwardList(int trainer_no) {
		return awardDAO.selectAwardList(trainer_no);
	}

	@Override
	public Award getAward(int award_no) {
		return awardDAO.selectAward(award_no);
	}

}
