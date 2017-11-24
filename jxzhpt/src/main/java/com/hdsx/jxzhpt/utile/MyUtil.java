package com.hdsx.jxzhpt.utile;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import org.junit.Test;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.server.impl.WnjhServerImpl;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.impl.JhshServerImpl;

public class MyUtil implements Serializable{
	private final static String ENCODE = "GBK"; 
	private static final long serialVersionUID = 1692982234443300128L;
	
	/**
     * 两个Double数相除，并保留scale位小数
     * @param v1
     * @param v2
     * @param scale
     * @return Double
     */
    public static Double div(Double v1,Double v2,int scale){
        if(v2==0.0) {
        	return 0.0;
        }
    	if(scale<0){
    		return 0.0;
    	}
        BigDecimal b1 = new BigDecimal(v1.toString());
        BigDecimal b2 = new BigDecimal(v2.toString());
        return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
    }
    
    public static Double divbfb(Double v1,Double v2,int scale){
        if(v2==0.0) {
        	return 0.0;
        }
    	if(scale<0){
    		return 0.0;
    	}
        BigDecimal b1 = new BigDecimal(v1.toString());
        BigDecimal b2 = new BigDecimal(v2.toString());
        BigDecimal b3 = new BigDecimal(100+"");
        return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).multiply(b3).doubleValue();
    }
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
	
	public static String getQueryTJiN(String bh,String name){
		String result="";
		if(bh!=null&&!"".equals(bh)){
			
			String[] s = bh.split(",");
			JhshServer j=new JhshServerImpl();
			for (int i = 0; i < s.length; i++) {
				if(i==0)
					result+=" and ("+name+" like '%"+s[i]+"%'";
				else
					result+=" or "+name+" like '%"+s[i]+"%'";
				List<Lx> l=j.queryLxbyGhlxbm(s[i]);
				if(l.size()>0){
					String tj="";
					for(int k = 0; k < l.size(); k++) {
						if(k==0)
							tj+=" and ((zxlwlxbm like '%"+l.get(k).getLxbm()+"%' and to_number(zxlwqdzh)<"+l.get(k).getZdzh()+" and to_number(zxlwzdzh)>"+l.get(k).getQdzh()+" )";
						else
							tj+=" or (zxlwlxbm like '%"+l.get(k).getLxbm()+"%' and to_number(zxlwqdzh)<"+l.get(k).getZdzh()+" and to_number(zxlwzdzh)>"+l.get(k).getQdzh()+" )";
					}
					tj+=")";
					List<Lx> l2=j.queryLxidbyGhlxbm(tj);
					for (Lx lx : l2) {
						//result+="or gxlxbm like '%"+s[i]+"%' ";
						
						
						result+="or lx.id like '%"+lx.getId()+"%' ";
						
//						result+=" or (id in(select id from zgb_zxlwzhtx_lxsh where zxlwlxbm like '%"+lx.getLxbm()+"%' and to_number(zxlwqdzh)<"+lx.getQdzh()+" and to_number(zxlwzdzh)>"+lx.getZdzh()+" ) )";
//						result+=" or ("+name+" like '%"+lx.getLxbm()+"%' and to_number(decode(f_str_or_num(ghqdzh),1,0,ghqdzh))<"+lx.getQdzh()+" and to_number(decode(f_str_or_num(ghzdzh),1,0,ghzdzh))>"+lx.getZdzh()+")";
					}
				}
				
				
				
				
			}
			result+=")";
			System.out.println(result);
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
	
	// Base64加密  
    public static String getBase64(String str) {  
        byte[] b = null;  
        String s = null;  
        try {  
            b = str.getBytes("utf-8");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
        if (b != null) {  
            s = new BASE64Encoder().encode(b);  
        }  
        return s;  
    }  
  
    // Base64解密  
    public static String getFromBase64(String s) {  
        byte[] b = null;  
        String result = null;  
        if (s != null) {  
            BASE64Decoder decoder = new BASE64Decoder();  
            try {  
                b = decoder.decodeBuffer(s);  
                result = new String(b, "utf-8");  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        return result;  
    }  
	
    /**
     * URL 解码
     * @return String
     */
    public static String getURLDecoderString(String str) {
        String result = "";
        if (null == str) {
            return "";
        }
        try {
            result = java.net.URLDecoder.decode(str, ENCODE);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return result;
    }
    /**
     * URL 转码
     * @return String
     */
    public static String getURLEncoderString(String str) {
        String result = "";
        if (null == str) {
            return "";
        }
        try {
            result = java.net.URLEncoder.encode(str, ENCODE);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    

}
