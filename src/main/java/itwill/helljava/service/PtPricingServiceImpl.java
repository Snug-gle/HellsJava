package itwill.helljava.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwill.helljava.dao.PtPricingDAO;
import itwill.helljava.dto.PtPricing;

@Service
public class PtPricingServiceImpl implements PtPricingService {
	@Autowired
	private PtPricingDAO ptPricingDAO;

	@Override
	public void addPtPricing(PtPricing ptPricing) {
		ptPricingDAO.insertPtPricing(ptPricing);
	}

	@Override
	public void modifyPtPricing(PtPricing ptPricing) {
		ptPricingDAO.updatePtPricing(ptPricing);
	}

	@Override
	public PtPricing getPtPring(int pt_pricing_no) {
		return ptPricingDAO.selectPtPring(pt_pricing_no);
	}

	@Override
	public List<PtPricing> getPtPricingList() {
		return ptPricingDAO.selectPtPricingList();
	}
	
	
}
