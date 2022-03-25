package itwill.helljava.dao;

import java.util.List;

import itwill.helljava.dto.PtPricing;

public interface PtPricingDAO {
	int insertPtPricing(PtPricing ptPricing);
	int updatePtPricing(PtPricing ptPricing);
	PtPricing selectPtPring(int pt_pricing_no);
	List<PtPricing> selectPtPricingList();
}
