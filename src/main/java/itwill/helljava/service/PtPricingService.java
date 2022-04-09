package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.PtPricing;

public interface PtPricingService {
	
	void addPtPricing(PtPricing ptPricing);

	void modifyPtPricing(PtPricing ptPricing);

	void removeTrainerPtPricing(int trainer_no);
	
	List<PtPricing> getPtPricingList(int trainer_no);
}
