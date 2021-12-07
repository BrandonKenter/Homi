package com.comp.model;

import java.util.List;


public interface CompDAO_interface {
    public void insert(CompVO CompVO);
	public List<CompVO> getAllByLandName(String landlord_name);
	public CompVO findByPrimaryKey(Integer complaint_no);
	public CompVO getOnePic(Integer complaint_no);
	public CompVO getOneVid(Integer complaint_no);
	public void updateRes(CompVO compVO);
	public List<CompVO> getAllByMemNo(Integer member_no);	
	public List<CompVO> getAllDesc();
	public List<CompVO> getAllByAptName(String apt_name);
}

