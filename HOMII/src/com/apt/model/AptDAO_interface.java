package com.apt.model;

import java.util.List;
import java.util.Map;


public interface AptDAO_interface {
	public AptVO findByPrimaryKey(Integer apt_no);
	public AptVO findByPrimaryKeyByApName(String ap_name);
	public AptVO getOnePicByApName (String ap_name);
	public void insert(AptVO aptVO);
	public List<AptVO> getAllByMemNo(Integer member_no);
	public List<AptVO> getAllDesc();
	public List<AptVO> getAllAsc();
	public List<AptVO> getAll(Map<String, String[]> map);
}
