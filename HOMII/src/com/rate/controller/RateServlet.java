package com.rate.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apt.model.AptService;
import com.apt.model.AptVO;
import com.rate.model.RateService;
import com.rate.model.RateVO;

/**
 * Servlet implementation class RateServlet
 */
@WebServlet("/RateServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class RateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RateServlet() {

	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String action = req.getParameter("action");
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

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
				// rate_no,member_no,ap_no,
				// rate_handletime,rate_clean,rate_service,rate_price,rate_location,comment

				Integer member_no;

				String memNo = req.getParameter("memNo");// ****get parameter
				member_no = new Integer(memNo.trim());

				Integer ap_no;

				String apNo = req.getParameter("ap_no");
				ap_no = new Integer(apNo.trim());


				String rate_handletime = req.getParameter("rate_handletime");
				String rateReg = "^[(1-5)]{1}$";
				if (rate_handletime == null || rate_handletime.trim().length() == 0) {
					errorMsgs.add("Please enter rating");
				} else if (!rate_handletime.trim().matches(rateReg)) {
					errorMsgs.add("Priority only accept digit from 1-5 and length must be 1");
				}

				String rate_clean = req.getParameter("rate_clean");
				if (rate_clean == null || rate_clean.trim().length() == 0) {
					errorMsgs.add("Please enter rating");
				} else if (!rate_clean.trim().matches(rateReg)) {
					errorMsgs.add("Priority only accept digit from 1-5 and length must be 1");
				}

				String rate_service = req.getParameter("rate_service");
				if (rate_service == null || rate_service.trim().length() == 0) {
					errorMsgs.add("Please enter rating");
				} else if (!rate_service.trim().matches(rateReg)) {
					errorMsgs.add("Priority only accept digit from 1-5 and length must be 1");
				}

				String rate_price = req.getParameter("rate_price");
				if (rate_price == null || rate_price.trim().length() == 0) {
					errorMsgs.add("Please enter rating");
				} else if (!rate_price.trim().matches(rateReg)) {
					errorMsgs.add("Priority only accept digit from 1-5 and length must be 1");
				}

				String rate_location = req.getParameter("rate_location");
				if (rate_location == null || rate_location.trim().length() == 0) {
					errorMsgs.add("Please enter rating");
				} else if (!rate_location.trim().matches(rateReg)) {
					errorMsgs.add("Priority only accept digit from 1-5 and length must be 1");
				}

				String comment = req.getParameter("comment");
				if (comment == null || comment.trim().length() == 0) {
					errorMsgs.add("Please enter comments");
				}

				RateVO rateVO = new RateVO();
				rateVO.setMember_no(member_no);
				rateVO.setAp_no(ap_no);
				rateVO.setRate_handletime(rate_handletime);
				rateVO.setRate_clean(rate_clean);
				rateVO.setRate_service(rate_service);
				rateVO.setRate_price(rate_price);
				rateVO.setRate_location(rate_location);
				rateVO.setComment(comment);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("rateVO", rateVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/rate/addRate.jsp"); // need JSP
					failureView.forward(req, res);
					return;
				}

				/***************************
				 * 2.Start to add member information
				 ***************************************/
				RateService rateSvc = new RateService();

				rateVO = rateSvc.addRate( member_no, ap_no, rate_handletime, rate_clean, rate_service,
						rate_price, rate_location, comment);
				
				AptService aptSvc = new AptService();
				AptVO aptVO = aptSvc.getOneApt(ap_no);

				req.setAttribute("aptVO", aptVO); 
				String url = "/front-end/apt/listOneApt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);

				successView.forward(req, res);

				/***************************
				 * other potential errors
				 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/rate/addRate.jsp");
				failureView.forward(req, res);
			}
		}

	}

}
