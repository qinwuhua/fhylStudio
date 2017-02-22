package com.hdsx.jxzhpt.utile;

import java.io.Serializable;

public class MyUtil implements Serializable{
	
	private static final long serialVersionUID = 1692982234443300128L;

	public static String getQueryTJ(String bh,String name){
		String result="";
		if(bh!=null&&!"".equals(bh)){
			
			String[] s = bh.split(",");
			for (int i = 0; i < s.length; i++) {
				if(i==0)
					result+=" and ("+name+" like '%"+s[i]+"%'";
				else
					result+=" or "+name+" like '%"+s[i]+"%'";
			}
			result+=")";
			//System.out.println(result);
			//result= bh.indexOf(",")==-1 ? " x."+name+" like '%"+bh+"%'": "x."+name+" in ("+bh+")";
		}
		return result;
	}
}
