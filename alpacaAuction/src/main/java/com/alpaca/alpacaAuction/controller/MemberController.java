package com.alpaca.alpacaAuction.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	@Autowired
	private JavaMailSender jMailSender;
	
	
	@RequestMapping("joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	@RequestMapping("join")
	public String join(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		// member는 화면 입력한 데이터, member2 Db에 있는 데이터 중복여부 체크
		Member member2 = ms.select(member.getId());
		if (member2 == null) {
			String real = session.getServletContext().getRealPath("/resources/upload");
			String encPass = bpe.encode(member.getPassword()); // 비밀번호 암호화
			member.setPassword(encPass);
			result = ms.insert(member);
		} else result = -1;  // 이미 있으니 입력하지마
		model.addAttribute("result", result);
		return "member/join";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		int result = 0;
		Member member2 = ms.select(member.getId());
		if (member2 == null || member2.getDel().equals("y")) result = -1; // 없는 id
//		bpe.matches 두개다 암호화 한 상태로 같은 데이터인가 
		else if (bpe.matches(member.getPassword(), member2.getPassword())) {
			result = 1; // 성공 id와 password가 일치
			session.setAttribute("id", member2.getId());
			session.setAttribute("authority", member2.getAuthority());
			session.setAttribute("name", member2.getName());
		}
		model.addAttribute("result", result);
		return "member/login";
	}
	
	@RequestMapping("view")
	public String view(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");		
		Member member = ms.select(id);
		model.addAttribute("member", member);
		return "member/view";
	}
	@RequestMapping("updateForm")
	public String updateForm(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");		
		Member member = ms.select(id);
		model.addAttribute("member", member);
		return "member/updateForm";
	}
	@RequestMapping("update")
	public String update(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		// 사진을 수정할 수도 안할 수도 있다(안하면 fileName이 null 또는 공란)
		String encPass = bpe.encode(member.getPassword()); // 비밀번호 암호화
		member.setPassword(encPass);
		result = ms.update(member);
		model.addAttribute("result", result);
		return "member/update";
	}
	@RequestMapping("delete")
	public String delete(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		int result = ms.delete(id);
		if (result > 0) session.invalidate();
		model.addAttribute("result", result);
		return "member/delete";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/logout";
	}
	@RequestMapping("main")
	public String main(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");		
		if (id != null && !id.equals("")) {
			Member member = ms.select(id);
			model.addAttribute("member", member);
		}
		return "member/main";
	}
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8")
	@ResponseBody   // jsp로 가지말고 바로 본문을 전달
	public String idChk(String id, Model model) {
		String msg = "";
		Member member = ms.select(id);
		if (member == null) msg = "사용 가능한 아이디 입니다";
		else msg = "이미 등록된 아이디 입니다";
		return msg;
	}
	
		// 아이디 찾기
		@RequestMapping("findIdResult")
		public String findIdResult(Member member, Model model) {
			int result = 0;
			Member member2 = ms.selectFindId(member);
			if (member2 != null) {
				result = 1;
				model.addAttribute("member", member2);
			} else {
				result = -1;
			}
			model.addAttribute("result", result);
			return "member/findIdResult";
		}
		
		// 아이디 찾기 폼으로 이동
		@RequestMapping("findIdForm")
		public String findIdForm() {
			return "member/findIdForm";
		}
		
		// 비밀번호 찾기 폼으로 이동
		@RequestMapping("findPwForm")
		public String findPwForm(String id, Model model) {
			// 아이디 찾기 후 비밀번호를 찾으면 값이 자동으로 넘어가게 하기 위함
			model.addAttribute("id", id);
			return "member/findPwForm";
		}
		
		// 비밀번호 찾기
		@RequestMapping("findPwResult")
		public String findPwResult(Member member, Model model) {
			int result = 0;
			Member member2 = ms.selectFindPw(member);
			if (member2 != null) {
				// 아이디가 존재 할 때 결과 값 1을 반영
				result = 1;
				model.addAttribute("member", member2);
				
				// 난수 생성
				String msg = "";
				String code = "";
				Random random = new Random();
				for(int i=0; i<3; i++) {
					int index = random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
					code += (char)index;
				}
				int numIndex = random.nextInt(9999)+1000; //4자리 랜덤 정수 생성
				code += numIndex;		
				msg = (String)code;  //메시지 내용 함수입력
						
				MimeMessage mm = jMailSender.createMimeMessage();
				try {
					MimeMessageHelper mmh = new MimeMessageHelper(mm, true, "utf-8");
					mmh.setSubject("알파카옥션 임시비밀번호 입니다.");
					mmh.setText("임시비밀번호 : " + msg);
					mmh.setTo(member.getEmail());
					mmh.setFrom("inhowha9195@naver.com");
					jMailSender.send(mm);
					
					// 이메일이 성공적으로 보내졌으면 멤버 비밀번호를 변경
					member.setPassword(bpe.encode(msg));
					int resultUpdatePw = ms.updatePw(member);
					model.addAttribute("resultUpdatePw", resultUpdatePw);
					
				} catch (Exception e) {
					result = 0;
					model.addAttribute("msg", e.getMessage());
				}		
			} else {
				result = -1;
			}
			model.addAttribute("result", result);
			return "member/findPwResult";
		}
}