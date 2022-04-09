package itwill.helljava.dao;

import java.util.List;

import itwill.helljava.dto.PtPricing;

public interface PtPricingDAO {
	
	int insertPtPricing(PtPricing ptPricing);

	int updatePtPricing(PtPricing ptPricing);

	int deleteTrainerPtPricing(int trainer_no);
	
	List<PtPricing> selectPtPricingList(int trainer_no);
}
