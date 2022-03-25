package itwill.helljava.mapper;

import java.util.List;

import itwill.helljava.dto.Award;

public interface AwardMapper {

	int insertAward(Award award);

	int updateAward(Award award);

	int deleteAward(int award_no);

	Award selectAward(int award_no);

	List<Award> selectAwardList();
}
