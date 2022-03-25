package itwill.helljava.mapper;

import java.util.List;

import itwill.helljava.dto.PtPricing;

public interface PtPricingMapper {
	int insertPtPricing(PtPricing ptPricing);
	int updatePtPricing(PtPricing ptPricing);
	PtPricing selectPtPring(int pt_pricing_no);
	List<PtPricing> selectPtPricingList();
}
