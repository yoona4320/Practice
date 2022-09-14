package com.ezen.spring8;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class HomeController 
{
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/")
	public String home()
	{
		return "main";
	}
	@RequestMapping(value="/main")
	public String mem0()
	{
		return "main";
	}
	
	
	//로그인
		@RequestMapping(value="/login")
		public String mlogin()
		{
			return "loginform";
		}
		
		@RequestMapping(value="/loginaction",method=RequestMethod.POST)
		public ModelAndView mlogin1(RedirectAttributes at,HttpServletRequest request)
		{
			ModelAndView mv = new ModelAndView();
			MemberDTO memberDTO;
			String id=request.getParameter("id")		;
			String pw=request.getParameter("pw");
			MemService ms = sqlSession.getMapper(MemService.class);
			memberDTO = ms.login(id, pw);
			
			if(memberDTO != null)	//로그인 성공
			{
				HttpSession session = request.getSession();
				session.setAttribute("member",memberDTO);
				session.setAttribute("isLogOn",true);
				mv.setViewName("redirect:main");
			}
			else	//로그인 실패
			{
				at.addAttribute("result","loginFailed");
				mv.setViewName("redirect:loginform");
			}
			return mv;
		}
		
		@RequestMapping(value="/logout")
		public ModelAndView logout(HttpServletRequest request)
		{
			ModelAndView mv = new ModelAndView();
			HttpSession session = request.getSession();
			session.removeAttribute("member");
			session.removeAttribute("isLogOn");
			mv.setViewName("redirect:main");
			
			return mv;
		}
		
							//loginform과 연관 (*form)
		@RequestMapping(value="/*form",method=RequestMethod.GET)
		private ModelAndView form(@RequestParam(value="result",required=false) String result,HttpServletRequest request)
		{
			ModelAndView mv = new ModelAndView();
			String viewName= (String) request.getAttribute("viewName");
			mv.addObject("result",result);
			mv.setViewName(viewName);
			
			return mv;
		}
	
	
	
	@RequestMapping(value="/memin")
	public String mem1()
	{
		return "meminput";
	}
	
	@RequestMapping(value="/memsave")
	public String mem2(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String birth=request.getParameter("birth");
		
		MemService ms = sqlSession.getMapper(MemService.class);
		ms.memin(id, pw, name, tel, email, address, birth);
		
		return "redirect:memin";
	}
	
	@RequestMapping(value="/memout")
	public String mem3(Model mo)
	{
		MemService ms = sqlSession.getMapper(MemService.class);
		ArrayList<MemberDTO> list = ms.memout();
		
		mo.addAttribute("list",list);
		
		return "memout";
	}
	
	@RequestMapping(value="/updateui")
	public String update1(HttpServletRequest request,Model mo)
	{
		String id = request.getParameter("id");
		MemService ms = sqlSession.getMapper(MemService.class);
		ArrayList<MemberDTO> dt = ms.updateui(id);
		
		mo.addAttribute("dt",dt);
		
		return "updateui";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update2(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String birth = request.getParameter("birth");
		
		MemService ms = sqlSession.getMapper(MemService.class);
		ms.update(id, pw, name, tel, email, address, birth);
		
		
		return "redirect:memout";
	}
	
	@RequestMapping(value="/deleteui")
	public String delete()
	{
		return "deleteui";
	}
	
	@RequestMapping(value="/deleteform",method=RequestMethod.POST)
	public String delete1(HttpServletRequest request,Model mo)
	{
		String id=request.getParameter("id");
		
		MemService ms = sqlSession.getMapper(MemService.class);
		ArrayList<MemberDTO> list = ms.delete1(id);
		mo.addAttribute("list",list);
		
		return "deleteform";
	}
	
	@RequestMapping(value="/deletedata",method=RequestMethod.POST)
	public String delete2(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("d_id");
		
		MemService ms = sqlSession.getMapper(MemService.class);
		ms.delete2(id);
		
		return "redirect:memout";
	}
	
}
