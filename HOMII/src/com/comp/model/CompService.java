package com.comp.model;

import java.util.List;

import com.comp.model.CompDAO;
import com.comp.model.CompDAO_interface;
import com.comp.model.CompVO;
import com.mem.model.MemVO;

public class CompService {
private CompDAO_interface dao;
	
	public CompService() {
		dao = new CompDAO();
	}
	
	
	public CompVO addComp(Integer member_no, String ap_name, String ap_address, 
			 String land_name, String case_title, String description, String pubtype, byte[] comp_pic, String priority) {
		
		CompVO compVO = new CompVO();
		
		compVO.setMember_no(member_no);
		compVO.setAp_name(ap_name);
		compVO.setAp_address(ap_address);
		compVO.setLand_name(land_name);
		compVO.setCase_title(case_title);
		compVO.setDescription(description);
		compVO.setPubtype(pubtype);
		compVO.setComp_pic(comp_pic);
		compVO.setPriority(priority);

		dao.insert(compVO);
		
		return compVO;
	}
	public List<CompVO> getAllCompByLand(String land_name){
		return dao.getAllByLandName(land_name);
	}
	public List<CompVO> getAllCompByMemNo(Integer member_no){
		return dao.getAllByMemNo(member_no);
	}
	public CompVO getOneComplaint(Integer complaint_no) {
		return dao.findByPrimaryKey(complaint_no);
	}
	public CompVO getOnePic(Integer complaint_no) {
		return dao.getOnePic(complaint_no);
	}
	public CompVO getOneVid(Integer complaint_no) {
		return dao.getOneVid(complaint_no);
	}
	public CompVO updateResponse(Integer complaint_no, String status, String response) {
		CompVO compVO = new CompVO();
		compVO.setComplaint_no(complaint_no);
		compVO.setStatus(status);
		compVO.setResponse(response);
		dao.updateRes(compVO);
		return compVO;
	}
	public List<CompVO> getAllLatestCase(){
		return dao.getAllDesc();
	}
	public List<CompVO> getAllCompByAptName(String apt_name){
		return dao.getAllByAptName(apt_name);
	}
}

