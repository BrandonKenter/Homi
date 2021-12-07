package com.comp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;




public class CompDAO implements CompDAO_interface{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HOMII");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO complaint (member_no, ap_name, ap_address, land_name, case_title, description, pubtype, comp_pic, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM complaint where land_name = ?";
	private static final String GET_ALL_STMT_BY_MEMNO = "SELECT * FROM complaint where member_no = ?";
	private static final String GET_ONE_STMT = "SELECT * FROM complaint where complaint_no = ?";
	private static final String GET_ONE_PIC = "SELECT comp_pic FROM complaint WHERE complaint_no=?";
	private static final String GET_ONE_VID = "SELECT comp_vid FROM complaint WHERE complaint_no=?";
	private static final String UPDATERES = "UPDATE complaint set status=?, response=? where complaint_no = ?";
	private static final String GET_ALL_STMT_DESC = "SELECT * FROM complaint where pubtype = 0 order by crt_dt desc;";
	private static final String GET_ALL_STMT_BY_APTNAME = "SELECT * FROM complaint where pubtype = 0 and ap_name = ?;";
	
	public void insert(CompVO compVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, compVO.getMember_no());
			pstmt.setString(2, compVO.getAp_name());
			pstmt.setString(3, compVO.getAp_address());
			pstmt.setString(4, compVO.getLand_name());
			pstmt.setString(5, compVO.getCase_title());
			pstmt.setString(6, compVO.getDescription());
			pstmt.setString(7, compVO.getPubtype());
			pstmt.setBytes(8, compVO.getComp_pic());
			pstmt.setString(9, compVO.getPriority());

			pstmt.executeUpdate();

			

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	
	@Override
	public List<CompVO> getAllByLandName(String land_name) {
		List<CompVO> list = new ArrayList<CompVO>();
		CompVO compVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			pstmt.setString(1, land_name);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				compVO = new CompVO();
				compVO.setComplaint_no(rs.getInt("complaint_no"));
				compVO.setMember_no(rs.getInt("member_no"));
				compVO.setAp_name(rs.getString("ap_name"));
				compVO.setAp_address(rs.getString("ap_address"));
				compVO.setLand_name(rs.getString("land_name"));
				compVO.setCase_title(rs.getString("case_title"));
				compVO.setDescription(rs.getString("description"));
				compVO.setPubtype(rs.getString("pubtype"));
				compVO.setComp_pic(rs.getBytes("comp_pic"));
				compVO.setComp_vid(rs.getBytes("comp_vid"));
				compVO.setCrt_dt(rs.getDate("crt_dt"));
				compVO.setStatus(rs.getString("status"));
				compVO.setResponse(rs.getString("response"));
				compVO.setPriority(rs.getString("priority"));
		
				list.add(compVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	@Override
	public List<CompVO> getAllByMemNo(Integer member_no) {
		List<CompVO> list = new ArrayList<CompVO>();
		CompVO compVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT_BY_MEMNO);
			pstmt.setInt(1, member_no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				compVO = new CompVO();
				compVO.setComplaint_no(rs.getInt("complaint_no"));
				compVO.setMember_no(rs.getInt("member_no"));
				compVO.setAp_name(rs.getString("ap_name"));
				compVO.setAp_address(rs.getString("ap_address"));
				compVO.setLand_name(rs.getString("land_name"));
				compVO.setCase_title(rs.getString("case_title"));
				compVO.setDescription(rs.getString("description"));
				compVO.setPubtype(rs.getString("pubtype"));
				compVO.setComp_pic(rs.getBytes("comp_pic"));
				compVO.setComp_vid(rs.getBytes("comp_vid"));
				compVO.setCrt_dt(rs.getDate("crt_dt"));
				compVO.setStatus(rs.getString("status"));
				compVO.setResponse(rs.getString("response"));
				compVO.setPriority(rs.getString("priority"));
				
				list.add(compVO); // Store the row in the list
			}
			
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	@Override
	public CompVO findByPrimaryKey(Integer complaint_no) {
		
		CompVO compVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, complaint_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				compVO = new CompVO();
				compVO.setComplaint_no(rs.getInt("complaint_no"));
				compVO.setMember_no(rs.getInt("member_no"));
				compVO.setAp_name(rs.getString("ap_name"));
				compVO.setAp_address(rs.getString("ap_address"));
				compVO.setLand_name(rs.getString("land_name"));
				compVO.setCase_title(rs.getString("case_title"));
				compVO.setDescription(rs.getString("description"));
				compVO.setPubtype(rs.getString("pubtype"));
				compVO.setComp_pic(rs.getBytes("comp_pic"));
				compVO.setComp_vid(rs.getBytes("comp_vid"));
				compVO.setCrt_dt(rs.getDate("crt_dt"));
				compVO.setStatus(rs.getString("status"));
				compVO.setResponse(rs.getString("response"));
				compVO.setPriority(rs.getString("priority"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return compVO;
	}
	
	public CompVO getOnePic(Integer complaint_no) {
		CompVO compVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_PIC);

			pstmt.setInt(1, complaint_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				compVO = new CompVO();
				compVO.setComp_pic(rs.getBytes("comp_pic"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return compVO;
	}
	public CompVO getOneVid(Integer complaint_no) {
		CompVO compVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_VID);
			
			pstmt.setInt(1, complaint_no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				compVO = new CompVO();
				compVO.setComp_vid(rs.getBytes("comp_vid"));
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return compVO;
	}
	public void updateRes(CompVO compVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATERES);
			
			pstmt.setString(1, compVO.getStatus());
			pstmt.setString(2, compVO.getResponse());
			pstmt.setInt(3, compVO.getComplaint_no());



			pstmt.executeUpdate();

			

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public List<CompVO> getAllDesc() {
		List<CompVO> list = new ArrayList<CompVO>();
		CompVO compVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT_DESC);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				compVO = new CompVO();
				compVO.setComplaint_no(rs.getInt("complaint_no"));
				compVO.setMember_no(rs.getInt("member_no"));
				compVO.setAp_name(rs.getString("ap_name"));
				compVO.setAp_address(rs.getString("ap_address"));
				compVO.setLand_name(rs.getString("land_name"));
				compVO.setCase_title(rs.getString("case_title"));
				compVO.setDescription(rs.getString("description"));
				compVO.setPubtype(rs.getString("pubtype"));
				compVO.setComp_pic(rs.getBytes("comp_pic"));
				compVO.setComp_vid(rs.getBytes("comp_vid"));
				compVO.setCrt_dt(rs.getDate("crt_dt"));
				compVO.setStatus(rs.getString("status"));
				compVO.setResponse(rs.getString("response"));
				compVO.setPriority(rs.getString("priority"));
				
				list.add(compVO); // Store the row in the list
			}
			
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<CompVO> getAllByAptName(String apt_name) {
		List<CompVO> list = new ArrayList<CompVO>();
		CompVO compVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT_BY_APTNAME);
			pstmt.setString(1, apt_name);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				compVO = new CompVO();
				compVO.setComplaint_no(rs.getInt("complaint_no"));
				compVO.setMember_no(rs.getInt("member_no"));
				compVO.setAp_name(rs.getString("ap_name"));
				compVO.setAp_address(rs.getString("ap_address"));
				compVO.setLand_name(rs.getString("land_name"));
				compVO.setCase_title(rs.getString("case_title"));
				compVO.setDescription(rs.getString("description"));
				compVO.setPubtype(rs.getString("pubtype"));
				compVO.setComp_pic(rs.getBytes("comp_pic"));
				compVO.setComp_vid(rs.getBytes("comp_vid"));
				compVO.setCrt_dt(rs.getDate("crt_dt"));
				compVO.setStatus(rs.getString("status"));
				compVO.setResponse(rs.getString("response"));
				compVO.setPriority(rs.getString("priority"));
				
				list.add(compVO); // Store the row in the list
			}
			
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
}
