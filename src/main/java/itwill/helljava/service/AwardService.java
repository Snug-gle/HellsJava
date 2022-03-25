package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.Award;

public interface AwardService {

	void addAward(Award award);
	void modifyAward(Award award);
	void removeAward(int award_no);
	// Award getAward(int award_no); // 수상경력 1개 가져오는 건 필요 없을듯.
	List<Award> getAwardList(int trainer_no);
}
