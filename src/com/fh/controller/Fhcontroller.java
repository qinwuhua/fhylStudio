package com.fh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.fh.server.FhMapper;
import com.fh.tools.DBTools;

public class Fhcontroller {
	//创建角色
	//返回0正常创建失败1，成功，2，已经有角色了
	public static String cjrole(long fromQQ,String str) {
		//查看改qq下是否有角色了
		SqlSession ss=DBTools.getSession();
		FhMapper m = ss.getMapper(FhMapper.class);
		List<HashMap<String, String>> l = m.selectRoleByQq(fromQQ+"");
		if(l.size()>0) {
			ss.close();
			return "[CQ:emoji,id=128514]你已经有角色了，无需再创建";
		}else {
			Map<String, String> role= new HashMap<String, String>();
			role.put("QQ", fromQQ+"");
			role.put("NAME", str.split("-")[1]);
			role.put("SEX", str.split("-")[2]);
			long sm=GetevenNum(150,200);
			long fy=GetevenNum(130,150);
			long gj=500-sm-fy;
			long zl=(sm+fy+gj*2)*10;
			role.put("SM", sm+"");
			role.put("GJ", gj+"");
			role.put("FY", fy+"");
			role.put("ZL", zl+"");
			int i=m.insertRole(role);
			ss.commit();ss.close();
			if(i==1)
			return "[CQ:emoji,id=128512]创建成功";
			else
			return "[CQ:emoji,id=128148]创建失败，请联系作者";
		}
	}
	//查询角色
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//随机数
	public static long GetevenNum(long num1,long num2){  
		long s=(long)num1+(int)(Math.random()*(num2-num1));  
		return s;  
		} 
	
	public static void main(String[] args) {
		System.out.println(cjrole(1665942885,"创建角色-乄大变态丶-男"));
		
	}
}
