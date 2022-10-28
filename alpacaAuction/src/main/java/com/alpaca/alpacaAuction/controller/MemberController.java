package com.alpaca.alpacaAuction.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpaca.alpacaAuction.model.Member;
import com.alpaca.alpacaAuction.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder bpe; // 비밀번호를 암호화
	
	@RequestMapping("joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	
	@RequestMapping("join")
	public String join(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		Member member2 = ms.select(member.getId());
		if (member2 == null) {
			String encPass = bpe.encode(member.getPassword()); // 비밀번호 암호화
			member.setPassword(encPass);
			result = ms.insert(member);
		}
	model.addAttribute("result", result);
	return "join";
	}
	
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		int result = 0;
		Member member2 = ms.select(member.getId());
		if (member2 == null || member2.getDel().equals("y")) result = -1;
		else if (bpe.matches(member.getPassword(), member2.getPassword())) {
			result = 1; // 성공 id와 password가 일치
			session.setAttribute("id", member.getId());
		}
		model.addAttribute("result", result);
		return "login";
	}
	
	@RequestMapping("updateForm")
	public String updateForm(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");		
		Member member = ms.select(id);
		model.addAttribute("member", member);
		return "/member/updateForm";
	}
	
	@RequestMapping("update")
	public String update(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		String encPass = bpe.encode(member.getPassword()); // 비밀번호 암호화
		member.setPassword(encPass);
		result = ms.update(member);
		model.addAttribute("result", result);
		return "update";
	}
	
	@RequestMapping("delete")
	public String delete(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		int result = ms.delete(id);
		if (result > 0) session.invalidate();
		model.addAttribute("result", result);
		return "delete";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "logout";
	}
	
	@RequestMapping("main")
	public String main(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");		
		if (id != null && !id.equals("")) {
			Member member = ms.select(id);
			model.addAttribute("member", member);
		}
		return "main";
	}
	
	@RequestMapping("idChk")
	public String idChk(String id, Model model) {
		String msg = "";
		Member member = ms.select(id);
		if (member == null) msg = "사용 가능한 아이디 입니다";
		else msg = "이미 사용중이니 다른 아이디를 사용하세요";
		model.addAttribute("msg", msg);
		return "/member/idChk";
	}
}