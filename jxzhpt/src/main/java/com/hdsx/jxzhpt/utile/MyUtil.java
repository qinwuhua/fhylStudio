package com.hdsx.jxzhpt.utile;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.UUID;

import org.junit.Test;

import com.hdsx.jxzhpt.qqgl.lxsh.server.impl.WnjhServerImpl;

public class MyUtil implements Serializable{
	
	private static final long serialVersionUID = 1692982234443300128L;
	/**
	 * 
	 * @param bh 要处理的参数
	 * @param name 要加条件的数据库字段
	 * @return 拼好的条件
	 */
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
	
	/**
	 * 
	 * @param bh 要处理的参数
	 * @param bh1 要处理的参数1
	 * @param name 要加条件的数据库字段
	 * @return 拼好的条件
	 */
	public static String getQueryTJ2(String bh,String bh1,String name){
		
		String result="";
		if(bh!=null&&!"".equals(bh)){
			if(bh1!=null&&!"".equals(bh1)){
				String[] s = bh.split(",");
				String[] s1 = bh1.split(",");
				String[] lssz=new String[s.length*s1.length];
				int k=0;
				for (int i = 0; i < s.length; i++) {
					for (int j = 0; j < s1.length; j++) {
						lssz[k]=s[i]+s1[j];
						k++;
					}
				}
				for (int i = 0; i < lssz.length; i++) {
					if(i==0)
						result+=" and ("+name+" like '%"+lssz[i]+"%'";
					else
						result+=" or "+name+" like '%"+lssz[i]+"%'";
				}
				result+=")";
			}else{
				if(bh1!=null&&!"".equals(bh1)){
				String[] s = bh1.split(",");
				for (int i = 0; i < s.length; i++) {
						if(i==0)
							result+=" and ("+name+" like '%"+s[i]+"%'";
						else
							result+=" or "+name+" like '%"+s[i]+"%'";
					}
					result+=")";
				}
			}
			
		}else{
			if(bh1!=null&&!"".equals(bh1)){
				String[] s = bh1.split(",");
				for (int i = 0; i < s.length; i++) {
						if(i==0)
							result+=" and ("+name+" like '%"+s[i]+"%'";
						else
							result+=" or "+name+" like '%"+s[i]+"%'";
					}
					result+=")";
				}
		}
		return result;
	}
	
	
	/**
	* 提供精确的加法运算。
	* @param v1 被加数
	* @param v2 加数
	* @return 两个参数的和
	*/

	public static double add(double v1,double v2){
	    BigDecimal b1 = new BigDecimal(Double.toString(v1));
	    BigDecimal b2 = new BigDecimal(Double.toString(v2));
	    return b1.add(b2).doubleValue();
	}
	/**
	* 提供精确的减法运算。
	* @param v1 被减数
	* @param v2 减数
	* @return 两个参数的差
	*/
	public static double sub(double v1,double v2){
	    BigDecimal b1 = new BigDecimal(Double.toString(v1));
	    BigDecimal b2 = new BigDecimal(Double.toString(v2));
	    return b1.subtract(b2).doubleValue();
	}
	/**
	* 提供精确的乘法运算。
	* @param v1 被乘数
	* @param v2 乘数
	* @return 两个参数的积
	*/
	public static double mul(double v1,double v2){
	    BigDecimal b1 = new BigDecimal(Double.toString(v1));
	    BigDecimal b2 = new BigDecimal(Double.toString(v2));
	    return b1.multiply(b2).doubleValue();
	}
	
	/**
	* 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指
	* 定精度，以后的数字四舍五入。
	* @param v1 被除数
	* @param v2 除数
	* @param scale 表示表示需要精确到小数点以后几位。
	* @return 两个参数的商
	*/
	public static double div(double v1,double v2,int scale){
	    if(scale<0){
	        throw new IllegalArgumentException(
	        "The scale must be a positive integer or zero");
	    }
	    BigDecimal b1 = new BigDecimal(Double.toString(v1));
	    BigDecimal b2 = new BigDecimal(Double.toString(v2));
	    return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	/**
	* 提供精确的小数位四舍五入处理。
	* @param v 需要四舍五入的数字
	* @param scale 小数点后保留几位
	* @return 四舍五入后的结果
	*/
	public static double round(double v,int scale){
	    if(scale<0){
	        throw new IllegalArgumentException(
	        "The scale must be a positive integer or zero");
	    }
	    BigDecimal b = new BigDecimal(Double.toString(v));
	    BigDecimal one = new BigDecimal("1");
	    return b.divide(one,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	/**
	 * @return String
	 */
	
	public static String getUuid(){
		UUID uuid = UUID.randomUUID();  
        String str = uuid.toString();  
        // 去掉"-"符号  
        String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);  
        return temp;  
	}
	
	public static boolean insertMethd(String arg,Object obj){
		return new WnjhServerImpl().insertMethd(arg, obj);
	}
	
	public static void main(String[] args) {
		System.out.println(getUuid());
	}
	
}
