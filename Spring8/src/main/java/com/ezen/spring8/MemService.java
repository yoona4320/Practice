package com.ezen.spring8;

import java.util.ArrayList;

public interface MemService 
{
	public MemberDTO login(String id,String pw);
	
	public void memin(String id,String pw,String name,String tel,String email,String address,String birth);
	
	public ArrayList<MemberDTO> memout();
	
	public ArrayList<MemberDTO> updateui(String id);
	public void update(String id,String pw,String name,String tel,String email,String address,String birth);
	
	public ArrayList<MemberDTO> delete1(String id);
	public void delete2(String id);
	
	public void boardinput(String writer, String title, String content);
	public ArrayList<BoardDTO> boardout();
	
	public void boarddelete(int num);
	
	public void readcnt(int num);
	public ArrayList<BoardDTO> boarddetail(int num);
	
	public ArrayList<BoardDTO> replyform(int num);
	public void makereply(int groups, int step);
	public void boardreply(int num, String r_writer, String r_title, String r_content, int groups, int step, int indent);
}	
