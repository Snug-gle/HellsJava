package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.PtPricing;

public interface PtPricingService {
	void addPtPricing(PtPricing ptPricing);
	void modifyPtPricing(PtPricing ptPricing);
	PtPricing getPtPring(int pt_pricing_no);
	List<PtPricing> getPtPricingList();
}
