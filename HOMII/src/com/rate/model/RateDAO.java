package com.rate.model;

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

import com.comp.model.CompVO;
import com.mem.model.MemVO;

public class RateDAO implements RateDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HOMII");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

//rate_no,member_no,ap_no,rate_handletime,rate_clean,rate_service,rate_price,rate_location,comment

	private static final String INSERT_STMT = "INSERT INTO rating (member_no, ap_no, rate_handletime, rate_clean, rate_service, rate_price, rate_location, comment) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM rating where rate_no = ?";
	private static final String GET_ALL_STMT_BY_APTNO = "SELECT * FROM rating where ap_no = ?";
	private static final String GET_ONE_STMT = "SELECT * FROM rating where rate_no = ?";

	@Override
	public void insert(RateVO rateVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, rateVO.getMember_no());
			pstmt.setInt(2, rateVO.getAp_no());
			pstmt.setString(3, rateVO.getRate_handletime());
			pstmt.setString(4, rateVO.getRate_clean());
			pstmt.setString(5, rateVO.getRate_service());
			pstmt.setString(6, rateVO.getRate_price());
			pstmt.setString(7, rateVO.getRate_location());
			pstmt.setString(8, rateVO.getComment());

			pstmt.executeUpdate();

//			getRate_no() 
//			getMember_no()
//			getAp_name() 
//			getRate_handletime() 
//			getRate_clean() 
//			getRate_service() 
//			getRate_price() 
//			getRate_location() 
//			getComment() 

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
	public RateVO findByPrimaryKey(Integer rate_no) {
		RateVO rateVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, rate_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rateVO = new RateVO();
				rateVO.setRate_no(rs.getInt("rate_no"));
				rateVO.setMember_no(rs.getInt("member_no"));
				rateVO.setAp_no(rs.getInt("ap_no"));
				rateVO.setRate_handletime(rs.getString("rate_handletime"));
				rateVO.setRate_clean(rs.getString("rate_clean"));
				rateVO.setRate_service(rs.getString("rate_service"));
				rateVO.setRate_price(rs.getString("rate_price"));
				rateVO.setRate_location(rs.getString("rate_location"));
				rateVO.setComment(rs.getString("comment"));
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
		return rateVO;

	}

	@Override
	public List<RateVO> getAllByAptNo(Integer apt_no) {
		List<RateVO> list = new ArrayList<RateVO>();
		RateVO rateVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT_BY_APTNO);
			pstmt.setInt(1, apt_no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				rateVO = new RateVO();
				rateVO.setRate_no(rs.getInt("rate_no"));
				rateVO.setMember_no(rs.getInt("member_no"));
				rateVO.setAp_no(rs.getInt("ap_no"));
				rateVO.setRate_handletime(rs.getString("rate_handletime"));
				rateVO.setRate_clean(rs.getString("rate_clean"));
				rateVO.setRate_service(rs.getString("rate_service"));
				rateVO.setRate_price(rs.getString("rate_price"));
				rateVO.setRate_location(rs.getString("rate_location"));
				rateVO.setComment(rs.getString("comment"));
				
				list.add(rateVO); // Store the row in the list
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
