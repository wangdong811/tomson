package com.etoak.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.etoak.bean.School;
import com.etoak.bean.Students;
import com.etoak.factory.SF;

public class IDaoImpl  implements IDao {
	SqlSession session =null;
	@Override
	public void addStu(Students stu) {
		try{
		session =SF.getSession();
		session.insert("com.etoak.stu.addStu",stu );
		session.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(session!=null)session.rollback();
		}finally{
			if(session!=null){
				session.close();
			}
		}
	}
	@Override
	public void addSch(School sch) {
		try{
			session=SF.getSession();
			session.insert("com.etoak.sch.addSch", sch);
			session.commit();
			System.out.println(sch);
		}catch(Exception e){
			e.printStackTrace();
			if(session!=null){
				session.rollback();
			}
			}finally{
				if(session!=null){
					session.close();
				}
		}
	}

	@Override
	public void deleteStu(Students stu) {
		try{
		session=SF.getSession();
		session.delete("com.etoak.stu.deleteStu",stu);
		session.commit();		
		}catch(Exception e){
			e.printStackTrace();
			if(session!=null)session.rollback();
		}finally{
			
			if(session!=null)session.close();
		}
	}
	@Override
	public void deleteSch(School sch) {
		try{
			session=SF.getSession();
			session.delete("com.etoak.sch.deleteSch",sch);
			session.commit();		
			}catch(Exception e){
				e.printStackTrace();
				if(session!=null)session.rollback();
			}finally{
				
				if(session!=null)session.close();
			}
		
	}

	@Override
	public Students queryStuById(int id) {
		try{
			session=SF.getSession();
			Students stu=session.selectOne("com.etoak.stu.queryStuById",id);
			session.commit();
			return stu; 	
			}catch(Exception e){
				e.printStackTrace();
				if(session!=null)session.rollback();
			}finally{
				
				if(session!=null)session.close();
			}
		return null;
	}

	@Override
	public School querySchById(int id) {
		try{
			session=SF.getSession();
			School stu=session.selectOne("com.etoak.sch.querySchById",id);
			session.commit();
			return stu; 	
			}catch(Exception e){
				e.printStackTrace();
				if(session!=null)session.rollback();
			}finally{
				
				if(session!=null)session.close();
			}
		return null;
	}

	@Override
	public List<School> queryAllSch() {
		try{
			session=SF.getSession();
			List<School> schs=session.selectList("com.etoak.sch.queryAllSch");
			session.commit();
			return schs; 	
			}catch(Exception e){
				e.printStackTrace();
				if(session!=null)session.rollback();
			}finally{
				
				if(session!=null)session.close();
			}
		return null;
	}
	@Override
	public List<Students> queryStuByConds(Map map) {
		try{
			session=SF.getSession();
			List<Students> stu=session.selectList("com.etoak.stu.queryStuByConds",map);
			session.commit();
			System.out.println(stu);
			return stu; 	
			}catch(Exception e){
				e.printStackTrace();
				if(session!=null)session.rollback();
			}finally{			
				if(session!=null)session.close();
			}
		return null;
	}
	@Override
	public int querySchCount(Map map){
		try{
			session=SF.getSession();
			int stu=session.selectOne("com.etoak.stu.querySchCount",map);
			session.commit();
			System.out.println(map);
			return stu; 	
			}catch(Exception e){
				e.printStackTrace();
				if(session!=null)session.rollback();
				return 0;
			}finally{
				
				if(session!=null)session.close();
			}
	}

}
