package itwill.helljava.mapper;

import java.util.List;

import itwill.helljava.dto.Award;

public interface AwardMapper {

	int insertAward(Award award);

	int updateAward(Award award);

	int deleteAward(int award_no);

	Award selectAward(int award_no); // 상세가 없으니까 필요 없을듯

	List<Award> selectAwardList(int trainer_no); // join 필요
}
