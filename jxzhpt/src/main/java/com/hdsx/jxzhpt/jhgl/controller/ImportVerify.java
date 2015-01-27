package com.hdsx.jxzhpt.jhgl.controller;

import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;

public class ImportVerify {
	public static String gcgjVerify(Map obj){
		String result="";
		//result.append("验证有误");
		//路线编码验证
		if(!lxbhVerify(obj.get("3").toString())){
			result+="【路线编码】";
		}
		if(!otherVerify("^[0-9]*.[0-9]*$",obj.get("8").toString())){
			result+="【起点桩号】";
		}
		if(!otherVerify("^[0-9]*.[0-9]*$",obj.get("9").toString())){
			result+="【止点桩号】";
		}
		if(!doubleVerify(obj.get("10").toString())){
			result+="【起止里程】";
		}
		if(!doubleVerify(obj.get("11").toString())){
			result+="【隐患里程】";
		}
		if(!timeVerify(obj.get("14").toString())){
			result+="【方案审批时间】";
		}
		if(!numVerify(obj.get("16").toString())){
			result+="【投资估算】";
		}
		if(!obj.get("17").toString().equals("路面改造工程项目")){
			result+="【建设性质】";
		}
		if(!otherVerify("^[0-9]*.[0-9]*$", obj.get("20").toString())){
			result+="【路面宽度】";
		}
		if(!obj.get("21").toString().equals("是") && !obj.get("21").toString().equals("否")){
			result+="【是否提前实施】";
		}
		if(!nfVerify(obj.get("22").toString())){
			result+="【上报年份】";
		}
		if(!timeVerify(obj.get("23").toString())){
			result+="【计划开工时间】";
		}
		if(!timeVerify(obj.get("24").toString())){
			result+="【计划完工时间】";
		}
		if(!timeVerify(obj.get("28").toString())){
			result+="【批复时间】";
		}
		if(!obj.get("29").toString().equals("大修") && !obj.get("29").toString().equals("中修") && !obj.get("29").toString().equals("预防性养护")){
			result+="【养护类别】";
		}
		if(!numVerify(obj.get("34").toString())){
			result+="【批复总投资】";
		}
		if(!numVerify(obj.get("35").toString())){
			result+="【计划使用部补助资金】 ";
		}
		if(!numVerify(obj.get("36").toString())){
			result+="【计划使用省补助资金】";
		}
		if(new Integer(obj.get("34").toString()).intValue()!=
				new Integer(obj.get("35").toString()).intValue()
				+new Integer(obj.get("36").toString()).intValue()){
			result+="批复总投资金额统计不正确";
		}
		if(!obj.get("37").toString().equals("是") && !obj.get("37").toString().equals("否")){
			result+="【是否申请按比例补助】";
		}
		if(obj.get("37").toString().equals("是") && obj.get("38").toString().length()==0){
			result+="【按比例申请文号】";
		}
		if(!obj.get("39").toString().equals("是") && !obj.get("39").toString().equals("否")){
			result+="【是否归市局养护部门】";
		}
		if(!result.equals("")){
			result+="信息填写有问题，请检查";
		}
		return result;
	}
	
	public static String shuihVerify(Map obj){
		String result="";
		//result.append("验证有误");
		//路线编码验证
		if(!lxbhVerify(obj.get("3").toString())){
			result+="【路线编码】";
		}
		if(!otherVerify("^[0-9]*.[0-9]*$",obj.get("8").toString())){
			result+="【起点桩号】";
		}
		if(!otherVerify("^[0-9]*.[0-9]*$",obj.get("9").toString())){
			result+="【止点桩号】";
		}
		if(!doubleVerify(obj.get("10").toString())){
			result+="【起止里程】";
		}
		if(!doubleVerify(obj.get("11").toString())){
			result+="【隐患里程】";
		}
		if(!timeVerify(obj.get("14").toString())){
			result+="【方案审批时间】";
		}
		if(!numVerify(obj.get("16").toString())){
			result+="【投资估算】";
		}
		if(!obj.get("17").toString().equals("水毁重建工程项目")){
			result+="【建设性质】";
		}
		if(!otherVerify("^[0-9]*.[0-9]*$", obj.get("20").toString())){
			result+="【路面宽度】";
		}
		if(!obj.get("21").toString().equals("是") && !obj.get("21").toString().equals("否")){
			result+="【是否提前实施】";
		}
		if(!nfVerify(obj.get("22").toString())){
			result+="【上报年份】";
		}
		if(!timeVerify(obj.get("23").toString())){
			result+="【计划开工时间】";
		}
		if(!timeVerify(obj.get("24").toString())){
			result+="【计划完工时间】";
		}
		if(!timeVerify(obj.get("28").toString())){
			result+="【批复时间】";
		}
		if(!obj.get("29").toString().equals("大修") && !obj.get("29").toString().equals("中修") && !obj.get("29").toString().equals("预防性养护")){
			result+="【养护类别】";
		}
		if(!numVerify(obj.get("34").toString())){
			result+="【批复总投资】";
		}
		if(!numVerify(obj.get("35").toString())){
			result+="【计划使用部补助资金】 ";
		}
		if(!numVerify(obj.get("36").toString())){
			result+="【计划使用省补助资金】";
		}
		if(new Integer(obj.get("34").toString()).intValue()!=
				new Integer(obj.get("35").toString()).intValue()
				+new Integer(obj.get("36").toString()).intValue()){
			result+="批复总投资金额统计不正确";
		}
		if(!obj.get("37").toString().equals("是") && !obj.get("37").toString().equals("否")){
			result+="【是否申请按比例补助】";
		}
		if(obj.get("37").toString().equals("是") && obj.get("38").toString().length()==0){
			result+="【按比例申请文号】";
		}
		if(!obj.get("39").toString().equals("是") && !obj.get("39").toString().equals("否")){
			result+="【是否归市局养护部门】";
		}
		if(!result.equals("")){
			result+="信息填写有问题，请检查";
		}
		return result;
	}
	
	public static String gcsjVerify(Map obj){
		String result="";
		//路线编码验证
		if(!lxbhVerify(obj.get("3").toString())){
			result+="【路线编码】";
		}
		if(!zhVerify(obj.get("7").toString())){
			result+="【起点桩号】";
		}
		if(!zhVerify(obj.get("8").toString())){
			result+="【止点桩号】";
		}
		if(!doubleVerify(obj.get("9").toString())){
			result+="【起止里程】";
		}
		if(!doubleVerify(obj.get("10").toString())){
			result+="【项目里程】";
		}
		if(!timeVerify(obj.get("13").toString())){
			result+="【方案审批时间】";
		}
		if(!obj.get("16").toString().equals("大修") && !obj.get("16").toString().equals("中修") &&!obj.get("16").toString().equals("改建")){
			result+="【建设性质】";
		}
		if(!obj.get("21").toString().equals("是") && !obj.get("21").toString().equals("否")){
			result+="【是否提前实施】";
		}
		if(!nfVerify(obj.get("22").toString())){
			result+="【上报年份】";
		}
		if(!timeVerify(obj.get("23").toString())){
			result+="【计划开工时间】";
		}
		if(!timeVerify(obj.get("24").toString())){
			result+="【计划完工时间】";
		}
		if(!timeVerify(obj.get("28").toString())){
			result+="【批复时间】";
		}
		if(!numVerify(obj.get("40").toString())){
			result+="【批复总投资】";
		}
		if(!numVerify(obj.get("41").toString())){
			result+="【计划使用部补助资金】 ";
		}
		if(!numVerify(obj.get("42").toString())){
			result+="【计划使用省补助资金】";
		}
		if(new Integer(obj.get("40").toString()).intValue()!=
				new Integer(obj.get("41").toString()).intValue()
				+new Integer(obj.get("42").toString()).intValue()){
			result+="批复总投资金额统计不正确";
		}
		if(!obj.get("43").toString().equals("是") && !obj.get("43").toString().equals("否")){
			result+="【是否申请按比例补助】";
		}
		if(obj.get("43").toString().equals("是") && obj.get("44").toString().length()==0){
			result+="【按比例申请文号】";
		}
		if(!result.equals("")){
			result+="信息填写有问题，请检查";
		}
		return result;
	}
	
	public static boolean doubleVerify(String dou){
		String regex="^[0-9]*.[0-9]*$";
		return dou.matches(regex);
	}
	/**
	 * 年份验证
	 * @param nf
	 * @return
	 */
	public static boolean nfVerify(String nf){
		String regex="^[0-9]{4}$";
		return nf.matches(regex);
	}
	/**
	 * 日期时间验证
	 * @param time 日期
	 * @return
	 */
	public static boolean timeVerify(String time){
		String regex="^20[0-9]{2}-[0-9]{2}-[0-9]{2}$";
		return time.matches(regex);
	}
	/**
	 * 路线编码验证
	 * @param lxbh
	 * @return
	 */
	public static boolean lxbhVerify(String lxbh){
		String regex="^[GSX][0-9]*$";
		return lxbh.matches(regex);
	}
	/**
	 * 桩号的验证
	 * @param zh
	 * @return
	 */
	public static boolean zhVerify(String zh){
		String regex="^[0-9]*.[0-9]{3}$";
		return zh.matches(regex);
	}
	/**
	 * 数字验证
	 * @param num
	 * @return
	 */
	public static boolean numVerify(String num){
		String regex="^[0-9]*$";
		return num.matches(regex);
	}
	/**
	 * 其他自定义；验证
	 * @param regex	正则表达式
	 * @param str 要验证的字符串
	 * @return
	 */
	public static boolean otherVerify(String regex,String str){
		return str.matches(regex);
	}
}
