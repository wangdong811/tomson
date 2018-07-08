package com.etoak.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.etoak.bean.Page;
import com.etoak.bean.School;
import com.etoak.bean.Students;
import com.etoak.dao.IDao;
import com.etoak.dao.IDaoImpl;

@SuppressWarnings("serial")
public class manager extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String  method=request.getParameter("method");
		@SuppressWarnings("rawtypes")
		Class cls=this.getClass();
		Method m;
		try{
			m=cls.getDeclaredMethod(method, HttpServletRequest.class,HttpServletResponse.class);
			m.invoke(this, request,response);
		}catch(Exception e){
			e.printStackTrace();
		}	
	}
	public void addSch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String location =request.getParameter("location");
		School s=new School();
		s.setLocation(location);
		s.setName(name);
		IDao dao=new IDaoImpl();
		dao.addSch(s);
		response.sendRedirect("welcome.jsp");
		
	}
	
	public void addStu(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String  name=request.getParameter("name");
		String age=request.getParameter("age");
		String   birth=request.getParameter("birth");
		String  status=request.getParameter("status");
		String sid=request.getParameter("sname");
		Students stu=new  Students();
		if(age!=null)stu.setAge(Integer.parseInt(age));
		if(birth!=null)stu.setBirth(Utils.change(birth));
		if(name!=null)stu.setName(name);
		IDao dao=new IDaoImpl();
		School sc=dao.querySchById(Integer.parseInt(sid));
		System.out.println("sc.getName()88888888888888888888"+sc.getName());
		stu.setStatus(status);
		stu.setSc(sc);
		
		dao.addStu(stu);
		response.sendRedirect("welcome.jsp");	
	}	
	public void queryAllSchool(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		IDao dao=new   IDaoImpl();
		List<School> data=dao.queryAllSch();
		JsonConfig con=new  JsonConfig();	
		con.setExcludes(new  String[]{"sc"});
		JSONArray jo=JSONArray.fromObject(data,con);	
		PrintWriter out=response.getWriter();
		out.print(jo);out.flush();out.close();	
	}
	public void querySomeStu(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				response.setContentType("text/plain;charset=utf-8");
				request.setCharacterEncoding("utf-8");
				Page<Students> page=new Page<Students>();
				String cp=request.getParameter("currentPage");	
				String name=request.getParameter("name");
				String sid =request.getParameter("sname");
				page.setCurrentPage(Integer.parseInt(cp));
				
				Map conds=new HashMap();
				
				if(name!=null){
					conds.put("name",name);
				}
				IDao dao1=new  IDaoImpl();
				if(sid!=null){
					conds.put("sid",Integer.parseInt(sid));	
				}
				page.setCurrentPage(Integer.parseInt(cp));
				IDao dao=new  IDaoImpl();
				
				int  count=dao.querySchCount(conds);
				
				
				page.setTotal(count);
				conds.put("start", page.getStart());
				conds.put("max", page.getPageSize());
				
				List<Students> rows=new ArrayList<Students>();
			
				rows=dao.queryStuByConds(conds);
				page.setRows(rows);
				JsonConfig con=new  JsonConfig();
				con.setExcludes(new  String[]{"stus"});
				
				JSONObject jo=JSONObject.fromObject(page,con);
				PrintWriter out = response.getWriter();
				System.out.println("countddddddddd----"+count);
				out.print(jo);
				out.flush();
				out.close();
				
	}
	
	public void deleteStu(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/plain;charset=utf-8");
			String id=request.getParameter("id");
			IDao dao =new IDaoImpl();
			Students stu=dao.queryStuById(Integer.parseInt(id));
			dao.deleteStu(stu);
			PrintWriter out=response.getWriter();
			System.out.println("运行到这里了>???//////////////");
			out.print("{\"flag\":\"success\"}");
			out.flush();
			out.close();
	}
}
