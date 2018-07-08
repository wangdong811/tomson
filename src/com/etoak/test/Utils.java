package com.etoak.test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {
	public static Date change(String date) {
		try{
			SimpleDateFormat sdf=new  SimpleDateFormat("yyyy-MM-dd");
			if(date!=null){
			return sdf.parse(date);
			}else{
				return null;
			}
		}catch(Exception  e){
			e.printStackTrace();
		}
		return null;
	}
}
