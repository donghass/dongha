package com.alpaca.alpacaAuction.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
public class AdminSessionChk extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("id")==null) {
			response.sendRedirect("loginForm.do");
			return false;
		}else {
			if(session.getAttribute("authority")==null || session.getAttribute("authority").equals("n")) {
				response.sendRedirect("auctionList.do");
				return false;
			}else {return true;}
		}
	}
}