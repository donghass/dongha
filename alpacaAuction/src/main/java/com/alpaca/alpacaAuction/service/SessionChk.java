package com.alpaca.alpacaAuction.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
public class SessionChk extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("id") ==  null) {
			response.sendRedirect("loginForm.do");
			return false;
		}
		return true;
	}
}