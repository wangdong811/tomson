package com.etoak.test;

import java.util.HashMap;
import java.util.Map;

import com.etoak.bean.School;
import com.etoak.dao.IDao;
import com.etoak.dao.IDaoImpl;

public class Test {
	public static void main(String[] args) {
		IDao dao=new  IDaoImpl();
		School s=new School();
		s.setLocation("济南");
		s.setName("山大");
		dao.addSch(s);	
		Map conds=new  HashMap();
		
		conds.put("start", 0);
		conds.put("max", 3);
		dao.queryStuByConds(conds);
		System.out.println(dao.queryStuByConds(conds).size());
		
	}	
}
