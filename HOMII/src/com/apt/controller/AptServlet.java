package com.apt.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.apt.model.AptService;
import com.apt.model.AptVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;

/**
 * Servlet implementation class AptServlet
 */
@WebServlet("/AptServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 5 * 1024 * 1024)
public class AptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=ISO-8859-1");
		InputStream in = null;
		
		if ("insert".equals(action)) { // request from addEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			List<String> successMsgs = new LinkedList<String>();
			req.setAttribute("successMsgs", successMsgs);

			try {
				/***********************
				 * 1.catch requested parameter, do error handling
				 *************************/
				String ap_name = req.getParameter("ap_name");

				String ap_address = req.getParameter("ap_address");


				Integer member_no = new Integer(req.getParameter("member_no"));
				
				Part part1 = req.getPart("ap_pic1");
				in = part1.getInputStream();
				byte[] ap_pic1 = new byte[in.available()];
				in.read(ap_pic1);
				in.close();
				Part part2 = req.getPart("ap_pic2");
				in = part2.getInputStream();
				byte[] ap_pic2 = new byte[in.available()];
				in.read(ap_pic2);
				in.close();
				Part part3 = req.getPart("ap_pic3");
				in = part3.getInputStream();
				byte[] ap_pic3 = new byte[in.available()];
				in.read(ap_pic3);
				in.close();

				AptVO aptVO = new AptVO();
				aptVO.setAp_address(ap_address);
				aptVO.setAp_name(ap_name);
				aptVO.setMember_no(member_no);
				aptVO.setAp_pic1(ap_pic1);
				aptVO.setAp_pic2(ap_pic2);
				aptVO.setAp_pic3(ap_pic3);


				if (!errorMsgs.isEmpty()) {
					req.setAttribute("aptVO", aptVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/apt/addApt.jsp");
					failureView.forward(req, res);
					return;
				}

				/***************************
				 * 2.Start to add member information
				 ***************************************/
				AptService aptSvc = new AptService();
				aptVO = aptSvc.addApt(member_no, ap_name, ap_address, ap_pic1, ap_pic2, ap_pic3);

				/***************************
				 * 3.Added, prepare to forward(Send the Success view)
				 ***********/

				String url = "/front-end/comp/listAllCompForLand.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // after adding, forward to
																				// listAllEmp.jsp
				successView.forward(req, res);

				/***************************
				 * other potential errors
				 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/apt/addApt.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("view_aptPic1".equals(action)) {
			res.setContentType("image/gif, image/jpeg, image/png, image/jpg");
			String ap_name = req.getParameter("ap_name");
			AptService aptSvc = new AptService();
			AptVO aptVO = aptSvc.getOnePicByApName(ap_name);
			byte[] apt_pic1 = aptVO.getAp_pic1();
			if (apt_pic1 != null && apt_pic1.length != 0) {
				res.getOutputStream().write(apt_pic1);
			} else {
				in = req.getServletContext().getResourceAsStream("/img/no_apt.jpg");
				byte[] pic = new byte[in.available()];
				in.read(pic);
				res.getOutputStream().write(pic);
				in.close();
			}
		}
		if ("view_aptPic2".equals(action)) {
			res.setContentType("image/gif, image/jpeg, image/png, image/jpg");
			String ap_name = req.getParameter("ap_name");
			AptService aptSvc = new AptService();
			AptVO aptVO = aptSvc.getOnePicByApName(ap_name);
			byte[] apt_pic2 = aptVO.getAp_pic2();
			if (apt_pic2 != null && apt_pic2.length != 0) {
				res.getOutputStream().write(apt_pic2);
			} else {
				in = req.getServletContext().getResourceAsStream("/img/no_apt.jpg");
				byte[] pic = new byte[in.available()];
				in.read(pic);
				res.getOutputStream().write(pic);
				in.close();
			}
		}
		if ("view_aptPic3".equals(action)) {
			res.setContentType("image/gif, image/jpeg, image/png, image/jpg");
			String ap_name = req.getParameter("ap_name");
			AptService aptSvc = new AptService();
			AptVO aptVO = aptSvc.getOnePicByApName(ap_name);
			byte[] apt_pic3 = aptVO.getAp_pic3();
			if (apt_pic3 != null && apt_pic3.length != 0) {
				res.getOutputStream().write(apt_pic3);
			} else {
				in = req.getServletContext().getResourceAsStream("/img/no_apt.jpg");
				byte[] pic = new byte[in.available()];
				in.read(pic);
				res.getOutputStream().write(pic);
				in.close();
			}
		}
		if ("getOne_For_Display".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("ap_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("enter ap_no");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/index.jsp");
					failureView.forward(req, res);
					return;
				}

				Integer ap_no = null;
				try {
					ap_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("Incorrect format");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/index.jsp");
					failureView.forward(req, res);
					return;
				}

				AptService aptSvc = new AptService();
				AptVO aptvo = aptSvc.getOneApt(ap_no);
				if (aptvo == null) {
					errorMsgs.add("No data");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/index.jsp");
					failureView.forward(req, res);
					return;
				}
				
//				for backup in case we need something from rating, and we can setAttribute to frontend
//				RateService ratingSvc = new RateService();
//				RatingVO ratingCount = ratingSvc.getThisMovieToatalRating(movieno);
//				req.setAttribute("ratingCount", ratingCount);

				req.setAttribute("aptVO", aptvo); 
				String url = "/front-end/apt/listOneApt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("Cannot retrieve data:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/index.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("listApt_ByCompositeQuery".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				HttpSession session = req.getSession();
				Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
				// if statement below will be executed by first time run listApt_ByCompositeQuery
				if (req.getParameter("whichPage") == null){
					Map<String, String[]> map1 = new HashMap<String, String[]>(req.getParameterMap());
					session.setAttribute("map",map1);
					map = map1;
				} 
				AptService aptSvc = new AptService();
				List<AptVO> list  = aptSvc.getAll(map);
				for(AptVO a : list) {
					System.out.println(a.getAp_name());
				}
				req.setAttribute("listApt_ByCompositeQuery", list); 
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/apt/listApt_ByCompositeQuery.jsp"); 
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/index.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
