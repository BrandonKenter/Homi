package com.apt.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.comp.model.CompVO;
import com.mem.model.MemVO;



public class AptDAO implements AptDAO_interface{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HOMII");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ALL_STMT = "SELECT * FROM apartment where member_no = ?";
	private static final String GET_ONE_STMT = "SELECT * FROM apartment where ap_no = ?";
	private static final String GET_ONE_STMT_BY_AP_NAME = "SELECT * FROM apartment where ap_name = ?";
	private static final String GET_ONE_PIC_BY_AP_NAME = "SELECT ap_pic1, ap_pic2, ap_pic3 FROM APARTMENT WHERE AP_NAME=?";
	private static final String INSERT_STMT = "INSERT INTO apartment (member_no, ap_name, ap_address, ap_pic1, ap_pic2, ap_pic3) VALUES (?, ?, ?, ?, ?, ?)";
	@Override
	public AptVO findByPrimaryKey(Integer apt_no) {
		
		AptVO aptVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, apt_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				aptVO = new AptVO();
				aptVO.setAp_no(rs.getInt("ap_no"));
				aptVO.setMember_no(rs.getInt("member_no"));
				aptVO.setAp_name(rs.getString("ap_name"));
				aptVO.setAp_address(rs.getString("ap_address"));
				aptVO.setAp_pic1(rs.getBytes("ap_pic1"));
				aptVO.setAp_pic2(rs.getBytes("ap_pic2"));
				aptVO.setAp_pic3(rs.getBytes("ap_pic3"));
				aptVO.setRating(rs.getFloat("rating"));
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
		return aptVO;
	}
	
	@Override
	public AptVO findByPrimaryKeyByApName(String ap_name) {
		
		AptVO aptVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_AP_NAME);
			pstmt.setString(1, ap_name);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				aptVO = new AptVO();
				aptVO.setAp_no(rs.getInt("ap_no"));
				aptVO.setMember_no(rs.getInt("member_no"));
				aptVO.setAp_name(rs.getString("ap_name"));
				aptVO.setAp_address(rs.getString("ap_address"));
				aptVO.setAp_pic1(rs.getBytes("ap_pic1"));
				aptVO.setAp_pic2(rs.getBytes("ap_pic2"));
				aptVO.setAp_pic3(rs.getBytes("ap_pic3"));
				aptVO.setRating(rs.getFloat("rating"));
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
		return aptVO;
	}
	
	public AptVO getOnePicByApName (String ap_name) {
		AptVO aptVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_PIC_BY_AP_NAME);

			pstmt.setString(1, ap_name);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				aptVO = new AptVO();
				aptVO.setAp_pic1(rs.getBytes("ap_pic1"));
				aptVO.setAp_pic2(rs.getBytes("ap_pic2"));
				aptVO.setAp_pic3(rs.getBytes("ap_pic3"));
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
		return aptVO;
	}
	
	public void insert(AptVO aptVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, aptVO.getMember_no());
			pstmt.setString(2, aptVO.getAp_name());
			pstmt.setString(3, aptVO.getAp_address());
			pstmt.setBytes(4, aptVO.getAp_pic1());
			pstmt.setBytes(5, aptVO.getAp_pic2());
			pstmt.setBytes(6, aptVO.getAp_pic3());

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
}
