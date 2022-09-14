package com.ezen.spring8.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.spring8.BoardDTO;
import com.ezen.spring8.MemService;


@Controller
public class BoardController 
{
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/boardinput")
	public String binput()
	{
		return "boardinput";
	}
	
	@RequestMapping(value="/boardsave")
	public String bsave(HttpServletRequest request)
	{
		String writer=request.getParameter("writer");
		String title=request.getParameter("title");
		String content=request.getParameter("content").replace("\r\n","<br>");
		
		MemService ms = sqlSession.getMapper(MemService.class);
		ms.boardinput(writer, title, content);
		
		return "main";
	}
	
	@RequestMapping(value="/boardout")
	public String bout(Model mo)
	{
		MemService ms = sqlSession.getMapper(MemService.class);
		ArrayList<BoardDTO> list = ms.boardout();
		mo.addAttribute("list",list);
		
		return "boardout";
	}
	
	@RequestMapping(value="/boarddelete")
	public String bdelete(HttpServletRequest request)
	{
		int num=Integer.parseInt(request.getParameter("num"));
		MemService ms = sqlSession.getMapper(MemService.class);
		ms.boarddelete(num);
		
		return "redirect:boardout";
	}
	

	
	@RequestMapping(value="/boarddetail")
	public String bdetail(HttpServletRequest request,Model mo)
	{
		int num=Integer.parseInt(request.getParameter("num"));
		Readcnt(num);
		
		MemService ms = sqlSession.getMapper(MemService.class);
		ArrayList<BoardDTO> list = ms.boarddetail(num);
		mo.addAttribute("list",list);
		
		return "boarddetail";
	}
	
	public void Readcnt(int num)
	{
		MemService ms = sqlSession.getMapper(MemService.class);
		ms.readcnt(num);
	}
	
	
	@RequestMapping(value="/replyform",method=RequestMethod.POST)
	public String breply(HttpServletRequest request,Model mo)
	{
		int num=Integer.parseInt(request.getParameter("num"));
		MemService ms = sqlSession.getMapper(MemService.class);
		ArrayList<BoardDTO> list = ms.replyform(num);
		mo.addAttribute("list",list);
		
		return "replyform";
	}
	
	@RequestMapping(value="/reply")
	public String breply2(HttpServletRequest request)
	{
		int num = Integer.parseInt(request.getParameter("num"));
		int groups = Integer.parseInt(request.getParameter("groups"));
		int step = Integer.parseInt(request.getParameter("step"));
		int indent = Integer.parseInt(request.getParameter("indent"));
		String r_writer = request.getParameter("r_writer");
		String r_title = request.getParameter("r_title");
		String r_content = request.getParameter("r_content").replace("\r\n", "<br>");
		MakeReply(groups,step);
		step ++;
		indent ++;
		MemService ms = sqlSession.getMapper(MemService.class);
		ms.boardreply(num, r_writer, r_title, r_content, groups, step, indent);
		
		return "redirect:boardout";
	}
	
	public void MakeReply(int groups, int step){
		MemService ms = sqlSession.getMapper(MemService.class);
		ms.makereply(groups, step);
	}

	
}
