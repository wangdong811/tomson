package com.etoak.factory;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SF{
	public static SqlSessionFactory f;
	private SF(){}
	static {
		try{
			Reader r=Resources.getResourceAsReader("config.xml");
			f=new SqlSessionFactoryBuilder().build(r);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static SqlSession  getSession(){
		return f.openSession();		
	}
	public static void main(String[] args) {
		SqlSession session=SF.getSession();
		System.out.println(session);
	}
	
}