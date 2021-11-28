package com.apt.model;

import java.util.List;
import java.util.Map;

import com.comp.model.CompVO;

public class AptService {
	
	private AptDAO_interface dao;
	
	public AptService() {
		dao = new AptDAO();
	}
	public AptVO getOneApt(Integer ap_no) {
		return dao.findByPrimaryKey(ap_no);
	}
	public AptVO getOneAptByApName(String ap_name) {
		return dao.findByPrimaryKeyByApName(ap_name);
	}
	public AptVO getOnePicByApName(String ap_name) {
		return dao.getOnePicByApName(ap_name);
	}
	public AptVO addApt(Integer member_no, String ap_name, String ap_address, byte[] ap_pic1,
			byte[] ap_pic2, byte[] ap_pic3) {

		
		AptVO aptVO = new AptVO();
		aptVO.setAp_address(ap_address);
		aptVO.setAp_name(ap_name);
		aptVO.setMember_no(member_no);
		aptVO.setAp_pic1(ap_pic1);
		aptVO.setAp_pic2(ap_pic2);
		aptVO.setAp_pic3(ap_pic3);

		dao.insert(aptVO);
		
		return aptVO;
	}
	public List<AptVO> getAllAptByMemNo(Integer member_no){
		return dao.getAllByMemNo(member_no);
	}
	
	public List<AptVO> getAllTop(){
		return dao.getAllDesc();
	}
	public List<AptVO> getAllBottom(){
		return dao.getAllAsc();
	}
	public List<AptVO> getAll(Map<String, String[]> map) {		
		return dao.getAll(map);
	}
}
