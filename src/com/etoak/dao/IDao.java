package com.etoak.dao;

import java.util.List;
import java.util.Map;

import com.etoak.bean.School;
import com.etoak.bean.Students;
public interface IDao {
	public void addStu(Students stu);
	public void addSch(School sch);
	public void  deleteStu(Students stu);
	public void deleteSch(School sch);
	public Students queryStuById(int  id);
	public  School querySchById(int  id);
	public List<School> queryAllSch();
	public List<Students> queryStuByConds(Map map);
	public int querySchCount(Map map);
}
