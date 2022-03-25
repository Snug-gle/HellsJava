package itwill.helljava.mapper;

import java.util.List;

import itwill.helljava.dto.PtPricing;

public interface PtPricingMapper {
	int insertPtPricing(PtPricing ptPricing);
	int updatePtPricing(PtPricing ptPricing);
	List<PtPricing> selectPtPricingList(int trainer_no);
}
