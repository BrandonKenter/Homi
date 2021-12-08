package com.rate.model;

import java.util.List;

import com.comp.model.CompVO;
import com.mem.model.MemVO;
import com.rate.model.*;
import com.apt.model.AptVO;

public class RateService {
	private RateDAO_interface dao;

	public RateService() {
		dao = new RateDAO();
	}

	public RateVO addRate(Integer member_no, Integer ap_no, String rate_handletime,
			String rate_clean, String rate_service, String rate_price, String rate_location, String comment) {

		RateVO rateVO = new RateVO();

		rateVO.setMember_no(member_no);
		rateVO.setAp_no(ap_no);
		rateVO.setRate_handletime(rate_handletime);
		rateVO.setRate_clean(rate_clean);
		rateVO.setRate_service(rate_service);
		rateVO.setRate_price(rate_price);
		rateVO.setRate_location(rate_location);
		rateVO.setComment(comment);

		dao.insert(rateVO);

		return rateVO;
	}

	public List<RateVO> getAllRateByApt(Integer apt_no) {
		return dao.getAllByAptNo(apt_no);
	}

	public RateVO getOneRate(Integer rate_no) {
		return dao.findByPrimaryKey(rate_no);
	}
	public RateVO getOneAvgRate(Integer ap_no) {
		return dao.findRatingByPrimaryKey(ap_no);
	}


}
