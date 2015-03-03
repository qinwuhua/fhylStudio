package com.hdsx.jxzhpt.gcbb.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
@Controller
public class GcbbController extends BaseActionSupport{
	/***
	 * 获取年份列表
	 */
	public void getYearList(){
		List<String> list= new ArrayList<String>();
		Calendar calendar =Calendar.getInstance();
		int temp=calendar.get(Calendar.YEAR);
		System.out.println(temp);
		for(int i=temp;i>temp-10;i--){
			list.add(i+"");
		}
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}catch (Exception e) {}
	}
}
