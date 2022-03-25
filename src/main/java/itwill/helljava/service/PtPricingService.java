package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.PtPricing;

public interface PtPricingService {
	
	void addPtPricing(PtPricing ptPricing);

	void modifyPtPricing(PtPricing ptPricing);

	List<PtPricing> getPtPricingList(int trainer_no);
}
