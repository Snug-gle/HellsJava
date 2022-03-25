package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.Award;

public interface AwardService {

	void addAward(Award award);
	void modifyAward(Award award);
	void removeAward(int award_no);
	Award getAward(int award_no);
	List<Award> getAwardList();
}
