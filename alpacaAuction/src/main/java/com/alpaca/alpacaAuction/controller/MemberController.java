package com.alpaca.alpacaAuction.controller;

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
			//String fileName = member.getFile().getOriginalFilename();
			// 파일명을 변경하고 싶으면 UUID 또는 long으로 날자 데이터
		//	member.setFileName("h");
			//String real = session.getServletContext().getRealPath("/resources/upload");
			//FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			/*
			 * fos.write(member.getFile().getBytes()); fos.close();
			 */
			String encPass = bpe.encode(member.getPassword()); // 비밀번호 암호화
			member.setPassword(encPass);
			result = ms.insert(member);
		} else result = -1;  // 이미 있으니 입력하지마
		model.addAttribute("result", result);
		return "member/join";
	}
		
	

	/*
	 * @RequestMapping("join2") public String join2(Member member, Model model,
	 * HttpSession session, MultipartHttpServletRequest mhr) throws IOException {
	 * int result = 0; // member는 화면 입력한 데이터, member2 Db에 있는 데이터 중복여부 체크 Member
	 * member2 = ms.select(member.getId()); if (member2 == null) { // 한번에 여러개의 파일이
	 * 들어온다 List<MultipartFile> list = mhr.getFiles("file"); List<MemberPhoto>
	 * photos = new ArrayList<MemberPhoto>(); String real =
	 * session.getServletContext().getRealPath("/resources/upload"); // list의 사진을
	 * 하나씩 뽑아서 photos에 저장 for(MultipartFile mf : list) { MemberPhoto mp = new
	 * MemberPhoto(); String fileName = mf.getOriginalFilename();
	 * mp.setFileName(fileName); mp.setId(member.getId()); photos.add(mp); //
	 * memberphotos의 갯수는 사진갯수 만큼 // 그림파일 저장 FileOutputStream fos = new
	 * FileOutputStream(new File(real+"/"+fileName)); fos.write(mf.getBytes());
	 * fos.close(); member.setFileName(fileName); } String encPass =
	 * bpe.encode(member.getPassword()); // 비밀번호 암호화 member.setPassword(encPass);
	 * result = ms.insert(member); if (result > 0) ms.insertPhoto(photos); } else
	 * result = -1; // 이미 있으니 입력하지마 model.addAttribute("result", result); return
	 * "join"; }
	 */
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
			session.setAttribute("id", member.getId());
			session.setAttribute("authority", member.getAuthority());
		}
		model.addAttribute("result", result);
		return "member/login";
	}
	
	/*
	 * @RequestMapping("view2") public String view2(Model model, HttpSession
	 * session) { String id = (String)session.getAttribute("id"); Member member =
	 * ms.select(id); List<MemberPhoto> list = ms.listPhoto(id);
	 * model.addAttribute("member", member); model.addAttribute("list", list);
	 * return "view2"; }
	 */
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
		/*
		 * String fileName = member.getFile().getOriginalFilename(); if (fileName !=
		 * null && !fileName.equals("")) { member.setFileName(fileName); String real =
		 * session.getServletContext().getRealPath("/resources/upload");
		 * FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
		 * fos.write(member.getFile().getBytes()); fos.close(); }
		 */
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
	
	/*
	 * // 이메일 인증
	 * 
	 * @RequestMapping(value = "mailResult", produces = "text/html;charset=utf-8")
	 * 
	 * @ResponseBody public String mailResult(String email, Model model) { String
	 * msg = ""; // 코드를 담아 보낼 메세지 String code=""; // 코드 생성
	 * 
	 * // 난수 생성 Random random = new Random(); for(int i=0; i<3; i++) { int index =
	 * random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성 code += (char)index; } int numIndex
	 * = random.nextInt(9999)+1000; //4자리 랜덤 정수 생성 code += numIndex; msg =
	 * (String)code; //메시지 내용 함수입력
	 * 
	 * MimeMessage mm = jMailSender.createMimeMessage(); try { MimeMessageHelper mmh
	 * = new MimeMessageHelper(mm, true, "utf-8"); mmh.setSubject("이메일 인증번호 입니다.");
	 * mmh.setText("인증번호 : " + msg); System.out.println("msg"+msg);
	 * mmh.setTo(email); mmh.setFrom("inhowha9195@naver.com"); jMailSender.send(mm);
	 * model.addAttribute("msg", msg); } catch (Exception e) {
	 * model.addAttribute("msg", e.getMessage()); } return msg; }
	 */
		
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
					mmh.setSubject("타이거 임시비밀번호 입니다.");
					mmh.setText("임시비밀번호 : " + msg);
					mmh.setTo(member.getId());
					mmh.setFrom("inhowha9195@naver.com");
					jMailSender.send(mm);
					
					// 이메일이 성공적으로 보내졌으면 멤버 비밀번호를 변경
					member.setPassword(msg);
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