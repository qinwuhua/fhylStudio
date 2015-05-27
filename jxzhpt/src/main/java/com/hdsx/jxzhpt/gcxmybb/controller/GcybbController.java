package com.hdsx.jxzhpt.gcxmybb.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcxmybb.server.GcybbServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 系统管理Controller层
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class GcybbController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcybbServerImpl")
	private GcybbServer gcybbServer;
	private String nf;
	private String yf;
	private String xzqh;
	private String xzdj;
	private String lxmc;
	private String gydw;
	private String tiaojian;
	private String xmmc;
	private String xmnf;
	private Gcglwqgz gcglwqgz=new Gcglwqgz();
	private Gcglabgc gcglabgc=new Gcglabgc();
	private Gcglzhfz gcglzhfz=new Gcglzhfz();
	private Gcglsh gcglsh=new Gcglsh();
	private String flag;
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getXmnf() {
		return xmnf;
	}

	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}

	public String getXmmc() {
		return xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}

	public Gcglsh getGcglsh() {
		return gcglsh;
	}

	public void setGcglsh(Gcglsh gcglsh) {
		this.gcglsh = gcglsh;
	}

	public Gcglzhfz getGcglzhfz() {
		return gcglzhfz;
	}

	public void setGcglzhfz(Gcglzhfz gcglzhfz) {
		this.gcglzhfz = gcglzhfz;
	}

	public Gcglabgc getGcglabgc() {
		return gcglabgc;
	}

	public void setGcglabgc(Gcglabgc gcglabgc) {
		this.gcglabgc = gcglabgc;
	}

	public Gcglwqgz getGcglwqgz() {
		return gcglwqgz;
	}

	public void setGcglwqgz(Gcglwqgz gcglwqgz) {
		this.gcglwqgz = gcglwqgz;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getNf() {
		return nf;
	}

	public void setNf(String nf) {
		this.nf = nf;
	}

	public String getYf() {
		return yf;
	}

	public void setYf(String yf) {
		this.yf = yf;
	}

	public String getXzqh() {
		return xzqh;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}

	public String getXzdj() {
		return xzdj;
	}

	public void setXzdj(String xzdj) {
		this.xzdj = xzdj;
	}

	public String getLxmc() {
		return lxmc;
	}

	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}

	public String getGydw() {
		return gydw;
	}

	public void setGydw(String gydw) {
		this.gydw = gydw;
	}

	public String getTiaojian() {
		return tiaojian;
	}

	public void setTiaojian(String tiaojian) {
		this.tiaojian = tiaojian;
	}

	public void getWqgzybb(){		
		String shijian=nf+"-"+yf;
		String tiaojian1="";
		String tiaojian2="";
		String xzqhdm = "";
		String gydwdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = gydw;
		xzqhdm	= xzqh;
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%"+gydwdm+"%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		gcglwqgz.setSbyf(shijian);
		gcglwqgz.setGydw(tiaojian1);
		gcglwqgz.setLxmc(lxmc);
		gcglwqgz.setTiaojian(xzdj);
		gcglwqgz.setXzqhdm(tiaojian2);
		gcglwqgz.setXmnf(xmnf);
		gcglwqgz.setQlmc(xmmc);
		//查总合list
		try {
		List<Map<String,Object>> list1=gcybbServer.getwqgzbblist1(gcglwqgz);
		//按行政区划查询每个行政区划的合list
		List<Map<String,Object>> list2=gcybbServer.getwqgzbblist2(gcglwqgz);
		//按行政区划和年份查每个行政区划下每个年份的合
		List<Map<String,Object>> list3=gcybbServer.getwqgzbblist3(gcglwqgz);
		//查询所有列表
		List<Map<String,Object>> list4=gcybbServer.getwqgzbblist4(gcglwqgz);
		if(list2.size()>0)
		for (Map<String, Object> map : list2) {
			list1.add(map);
			if(list3.size()>0)
			for (Map<String, Object> map1 : list3) {
				if(map.get("XZQH").toString().equals(map1.get("XZQH").toString())){
					list1.add(map1);
					if(list4.size()>0)
					for (Map<String, Object> map2 : list4) {
						if(map.get("XZQH").toString().equals(map2.get("XZQH").toString())&&map1.get("XDNF").toString().equals(map2.get("XDNF").toString())){
							list1.add(map2);
						}
					}
				}
			}
		}
		
		if("flag".equals(flag)){
			List<Excel_list> elist=new ArrayList<Excel_list>();
			for (Map<String, Object> map : list1) {
				Excel_list l=new Excel_list();
				try {l.setV_0(map.get("QLMC").toString());} catch (Exception e) {l.setV_0("");}
				try {l.setV_1(map.get("QLDM").toString());} catch (Exception e) {l.setV_1("");}
				try {l.setV_2(map.get("QLZXZH").toString());} catch (Exception e) {l.setV_2("");}
				try {l.setV_3(map.get("LXBM").toString());} catch (Exception e) {l.setV_3("");}
				try {l.setV_4(map.get("LXMC").toString());} catch (Exception e) {l.setV_4("");}
				try {l.setV_5(map.get("JSDJ").toString());} catch (Exception e) {l.setV_5("");}
				try {l.setV_6(map.get("QLQC").toString());} catch (Exception e) {l.setV_6("");}
				try {l.setV_7(map.get("KJZC").toString());} catch (Exception e) {l.setV_7("");}
				try {l.setV_8(map.get("DKZDKJ").toString());} catch (Exception e) {l.setV_8("");}
				try {l.setV_9(map.get("QLQK").toString());} catch (Exception e) {l.setV_9("");}
				try {l.setV_10(map.get("SBJGXS").toString());} catch (Exception e) {l.setV_10("");}
				try {l.setV_11(map.get("DQ").toString());} catch (Exception e) {l.setV_11("");}
				try {l.setV_12(map.get("ZQ").toString());} catch (Exception e) {l.setV_12("");}
				try {l.setV_13(map.get("XJGJND").toString());} catch (Exception e) {l.setV_13("");}
				try {l.setV_14(map.get("SL").toString());} catch (Exception e) {l.setV_14("");}
				try {l.setV_15(map.get("WL").toString());} catch (Exception e) {l.setV_15("");}
				try {l.setV_16(map.get("BNHJ").toString());} catch (Exception e) {l.setV_16("");}
				try {l.setV_17(map.get("BNBTZ").toString());} catch (Exception e) {l.setV_17("");}
				try {l.setV_18(map.get("BNSTZ").toString());} catch (Exception e) {l.setV_18("");}
				try {l.setV_19(map.get("BYHJ").toString());} catch (Exception e) {l.setV_19("");}
				try {l.setV_20(map.get("BYBTZ").toString());} catch (Exception e) {l.setV_20("");}
				try {l.setV_21(map.get("BYSTZ").toString());} catch (Exception e) {l.setV_21("");}
				try {l.setV_22(map.get("YYHJ").toString());} catch (Exception e) {l.setV_22("");}
				try {l.setV_23(map.get("YYBTZ").toString());} catch (Exception e) {l.setV_23("");}
				try {l.setV_24(map.get("YYSTZ").toString());} catch (Exception e) {l.setV_24("");}
				try {l.setV_25(map.get("KGHJ").toString());} catch (Exception e) {l.setV_25("");}
				try {l.setV_26(map.get("KGBTZ").toString());} catch (Exception e) {l.setV_26("");}
				try {l.setV_27(map.get("KGSTZ").toString());} catch (Exception e) {l.setV_27("");}
				try {l.setV_28(map.get("YYJGQK").toString());} catch (Exception e) {l.setV_28("");}
				try {l.setV_29(map.get("YYGJQK").toString());} catch (Exception e) {l.setV_29("");}
				try {l.setV_30(map.get("YYCJQK").toString());} catch (Exception e) {l.setV_30("");}
				try {l.setV_31(map.get("ZJGQK").toString());} catch (Exception e) {l.setV_31("");}
				try {l.setV_32(map.get("ZGJQK").toString());} catch (Exception e) {l.setV_32("");}
				try {l.setV_33(map.get("ZCJQK").toString());} catch (Exception e) {l.setV_33("");}
				try {l.setV_34(map.get("JSXZ").toString());} catch (Exception e) {l.setV_34("");}
				try {l.setV_35(map.get("JHKGN").toString());} catch (Exception e) {l.setV_35("");}
				try {l.setV_36(map.get("JHWGN").toString());} catch (Exception e) {l.setV_36("");}
				try {l.setV_37(map.get("JSNR").toString());} catch (Exception e) {l.setV_37("");}
				elist.add(l);
			}
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("公路建设下达计划（国省道改造项目）");//设置第一行
			eldata.setSheetName("公路建设下达计划表");//设置sheeet名
			eldata.setFileName("公路建设下达计划表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("桥梁名称",1,3,0,0));
			et.add(new Excel_tilte("桥梁代码",1,3,1,1));
			et.add(new Excel_tilte("桥梁中心桩号",1,3,2,2));	
			et.add(new Excel_tilte("所属路线情况", 1, 1, 3, 5));
			et.add(new Excel_tilte("老桥梁基本状况", 1, 1, 6, 13));
			et.add(new Excel_tilte("评定等级", 1, 2, 14, 15));
			et.add(new Excel_tilte("本年计划投资(万元)", 1, 2, 16, 18));
			et.add(new Excel_tilte("本月完成投资（万元）", 1, 2, 19, 21));
			et.add(new Excel_tilte("自元月至本月完成投资（万元）", 1, 2, 22, 24));
			et.add(new Excel_tilte("开工至本月完成投资（万元）", 1, 2, 25, 27));
			et.add(new Excel_tilte("本年自元月至本月底形象进度完成情况", 1, 1, 28, 30));
			et.add(new Excel_tilte("开工至本月底形象进度完成情况", 1, 1, 31, 33));
			et.add(new Excel_tilte("建设性质", 1, 3, 34, 34));
			et.add(new Excel_tilte("建设年限", 1, 1, 35, 36));
			et.add(new Excel_tilte("主要建设内容", 1, 3, 37, 37));
			et.add(new Excel_tilte("路线编码", 2, 3, 3, 3));
			et.add(new Excel_tilte("路线名称", 2, 3, 4, 4));
			et.add(new Excel_tilte("技术等级", 2, 3, 5, 5));
			et.add(new Excel_tilte("桥梁全长(米)", 2, 3, 6, 6));
			et.add(new Excel_tilte("跨径总长(米)", 2, 3, 7, 7));
			et.add(new Excel_tilte("单跨最大跨径 (米)", 2, 3, 8, 8));
			et.add(new Excel_tilte("桥梁全宽", 2, 3, 9, 9));
			et.add(new Excel_tilte("主桥上部构造结构形式", 2, 3, 10, 10));
			et.add(new Excel_tilte("按跨径分类", 2, 2, 11, 12));
			et.add(new Excel_tilte("修建/改建年度", 2, 3, 13, 13));
			et.add(new Excel_tilte("危桥加固", 2, 2, 28, 28));
			et.add(new Excel_tilte("危桥改建", 2, 2, 29, 29));
			et.add(new Excel_tilte("危桥重建", 2, 2, 30, 30));
			et.add(new Excel_tilte("危桥加固", 2, 2, 31, 31));
			et.add(new Excel_tilte("危桥改建", 2, 2, 32, 32));
			et.add(new Excel_tilte("危桥重建", 2, 2, 33, 33));
			et.add(new Excel_tilte("计划开工年", 2, 3, 35, 35));
			et.add(new Excel_tilte("计划完工年", 2, 3, 36, 36));
			et.add(new Excel_tilte("大桥", 3, 3, 11, 11));
			et.add(new Excel_tilte("中桥", 3, 3, 12, 12));
			et.add(new Excel_tilte("四类", 3, 3, 14, 14));
			et.add(new Excel_tilte("五类", 3, 3, 15, 15));
			et.add(new Excel_tilte("合计", 3, 3, 16, 16));
			et.add(new Excel_tilte("部投资", 3, 3, 17, 17));
			et.add(new Excel_tilte("省投资", 3, 3, 18, 18));
			et.add(new Excel_tilte("合计", 3, 3, 19, 19));
			et.add(new Excel_tilte("部投资", 3, 3, 20, 20));
			et.add(new Excel_tilte("省投资", 3, 3, 21, 21));
			et.add(new Excel_tilte("合计", 3, 3, 22, 22));
			et.add(new Excel_tilte("部投资", 3, 3, 23, 23));
			et.add(new Excel_tilte("省投资", 3, 3, 24, 24));
			et.add(new Excel_tilte("合计", 3, 3, 25, 25));
			et.add(new Excel_tilte("部投资", 3, 3, 26, 26));
			et.add(new Excel_tilte("省投资", 3, 3, 27, 27));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 28, 28));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 29, 29));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 30, 30));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 31, 31));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 32, 32));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 33, 33));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export1(eldata,response);
		}else{
			if(list1.size()==1){
				JsonUtils.write(null, getresponse().getWriter());
			}
				JsonUtils.write(list1, getresponse().getWriter());
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 安保工程
	 */
	public void getAbgcybb(){
		String shijian=nf+"-"+yf;
		gcglabgc.setSbyf(shijian);
		String tiaojian1="";
		String tiaojian2="";
		String xzqhdm = "";
		String gydwdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = gydw;
		xzqhdm	= xzqh;
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%"+gydwdm+"%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setTiaojian(xzdj);
		gcglabgc.setXzqhdm(tiaojian2);
		gcglabgc.setXmnf(xmnf);
		gcglabgc.setXmmc(xmmc);
		//查总合list
		try {
		List<Map<String,Object>> list1=gcybbServer.getabgcbblist1(gcglabgc);
		//按行政区划查询每个行政区划的合list
		List<Map<String,Object>> list2=gcybbServer.getabgcbblist2(gcglabgc);
		//按行政区划和年份查每个行政区划下每个年份的合
		List<Map<String,Object>> list3=gcybbServer.getabgcbblist3(gcglabgc);
		//查询所有列表
		List<Map<String,Object>> list4=gcybbServer.getabgcbblist4(gcglabgc);
		if(list2.size()>0)
		for (Map<String, Object> map : list2) {
			list1.add(map);
			if(list3.size()>0)
			for (Map<String, Object> map1 : list3) {
				if(map.get("XZQH").toString().equals(map1.get("XZQH").toString())){
					list1.add(map1);
					if(list4.size()>0)
					for (Map<String, Object> map2 : list4) {
						if(map.get("XZQH").toString().equals(map2.get("XZQH").toString())&&map1.get("XDNF").toString().equals(map2.get("XDNF").toString())){
							list1.add(map2);
						}
					}
				}
			}
		}
		if("flag".equals(flag)){
			List<Excel_list> elist=new ArrayList<Excel_list>();
			for (Map<String, Object> map : list1) {
				Excel_list l=new Excel_list();
				try {l.setV_0(map.get("LXBM").toString());} catch (Exception e) {l.setV_0("");}
				try {l.setV_1(map.get("LXMC").toString());} catch (Exception e) {l.setV_1("");}
				try {l.setV_2(map.get("QDZH").toString());} catch (Exception e) {l.setV_2("");}
				try {l.setV_3(map.get("ZDZH").toString());} catch (Exception e) {l.setV_3("");}
				try {l.setV_4(map.get("JSDJ").toString());} catch (Exception e) {l.setV_4("");}
				try {l.setV_5(map.get("XJGJND").toString());} catch (Exception e) {l.setV_5("");}
				try {l.setV_6(map.get("BNHJ").toString());} catch (Exception e) {l.setV_6("");}
				try {l.setV_7(map.get("BNBTZ").toString());} catch (Exception e) {l.setV_7("");}
				try {l.setV_8(map.get("BNSTZ").toString());} catch (Exception e) {l.setV_8("");}
				try {l.setV_9(map.get("YHLX").toString());} catch (Exception e) {l.setV_9("");}
				try {l.setV_10(map.get("JSXZ").toString());} catch (Exception e) {l.setV_10("");}
				try {l.setV_11(map.get("JHC").toString());} catch (Exception e) {l.setV_11("");}
				try {l.setV_12(map.get("JHGL").toString());} catch (Exception e) {l.setV_12("");}
				try {l.setV_13(map.get("JHKGN").toString());} catch (Exception e) {l.setV_13("");}
				try {l.setV_14(map.get("JHWGN").toString());} catch (Exception e) {l.setV_14("");}
				try {l.setV_15(map.get("BYWCC").toString());} catch (Exception e) {l.setV_15("");}
				try {l.setV_16(map.get("BYWCGL").toString());} catch (Exception e) {l.setV_16("");}
				try {l.setV_17(map.get("YYWCC").toString());} catch (Exception e) {l.setV_17("");}
				try {l.setV_18(map.get("YYWCGL").toString());} catch (Exception e) {l.setV_18("");}
				try {l.setV_19(map.get("KGWCC").toString());} catch (Exception e) {l.setV_19("");}
				try {l.setV_20(map.get("KGWCGL").toString());} catch (Exception e) {l.setV_20("");}
				try {l.setV_21(map.get("BYHJ").toString());} catch (Exception e) {l.setV_21("");}
				try {l.setV_22(map.get("BYBTZ").toString());} catch (Exception e) {l.setV_22("");}
				try {l.setV_23(map.get("BYSTZ").toString());} catch (Exception e) {l.setV_23("");}
				try {l.setV_24(map.get("YYHJ").toString());} catch (Exception e) {l.setV_24("");}
				try {l.setV_25(map.get("YYBTZ").toString());} catch (Exception e) {l.setV_25("");}
				try {l.setV_26(map.get("YYSTZ").toString());} catch (Exception e) {l.setV_26("");}
				try {l.setV_27(map.get("KGHJ").toString());} catch (Exception e) {l.setV_27("");}
				try {l.setV_28(map.get("KGBTZ").toString());} catch (Exception e) {l.setV_28("");}
				try {l.setV_29(map.get("KGSTZ").toString());} catch (Exception e) {l.setV_29("");}
				try {l.setV_30(map.get("JSNR").toString());} catch (Exception e) {l.setV_30("");}
				
				elist.add(l);
			}
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("公路建设下达计划（国省道改造项目）");//设置第一行
			eldata.setSheetName("公路建设下达计划表");//设置sheeet名
			eldata.setFileName("公路建设下达计划表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("路线编码",1,2,0,0));
			et.add(new Excel_tilte("路线名称",1,2,1,1));
			et.add(new Excel_tilte("基本情况",1,1,2,5));	
			et.add(new Excel_tilte("本年计划投资(万元)", 1, 1, 6, 8));
			et.add(new Excel_tilte("隐患类型", 1, 2, 9, 9));
			et.add(new Excel_tilte("建设类型", 1, 2, 10, 10));
			et.add(new Excel_tilte("计划处治隐患", 1, 1, 11, 12));
			et.add(new Excel_tilte("建设年限", 1, 1, 13, 14));
			et.add(new Excel_tilte("本月完成工程量", 1, 1, 15, 16));
			et.add(new Excel_tilte("自元月至本月底完成工程量", 1, 1, 17, 18));
			et.add(new Excel_tilte("开工至本月底累计完成工程量", 1, 1, 19, 20));
			et.add(new Excel_tilte("本月完成投资(万元)", 1, 1, 21, 23));
			et.add(new Excel_tilte("自元月至本月底完成投资（万元）", 1, 1, 24, 26));
			et.add(new Excel_tilte("开工至本月底累计完成投资(万元)", 1, 1, 27, 29));
			et.add(new Excel_tilte("主要建设内容", 1, 2, 30, 30));
			et.add(new Excel_tilte("起点桩号", 2, 2, 2, 2));
			et.add(new Excel_tilte("止点桩号", 2, 2, 3, 3));
			et.add(new Excel_tilte("技术等级", 2, 2, 4, 4));
			et.add(new Excel_tilte("公路修建/改建年度", 2, 2, 5, 5));
			et.add(new Excel_tilte("合计", 2, 2, 6, 6));
			et.add(new Excel_tilte("部投资", 2, 2, 7, 7));
			et.add(new Excel_tilte("省投资", 2, 2, 8, 8));
			et.add(new Excel_tilte("处", 2, 2, 11, 11));
			et.add(new Excel_tilte("公里", 2, 2, 12, 12));
			et.add(new Excel_tilte("计划开工年", 2, 2, 13, 13));
			et.add(new Excel_tilte("计划完工年", 2, 2, 14, 14));
			et.add(new Excel_tilte("处", 2, 2, 15, 15));
			et.add(new Excel_tilte("公里", 2, 2, 16, 16));
			et.add(new Excel_tilte("处", 2, 2, 17, 17));
			et.add(new Excel_tilte("公里", 2, 2, 18, 18));
			et.add(new Excel_tilte("处", 2, 2, 19, 19));
			et.add(new Excel_tilte("公里", 2, 2, 20, 20));
			et.add(new Excel_tilte("总投资", 2, 2, 21, 21));
			et.add(new Excel_tilte("部投资", 2, 2, 22, 22));
			et.add(new Excel_tilte("省投资", 2, 2, 23, 23));
			et.add(new Excel_tilte("总投资", 2, 2, 24, 24));
			et.add(new Excel_tilte("部投资", 2, 2, 25, 25));
			et.add(new Excel_tilte("省投资", 2, 2, 26, 26));
			et.add(new Excel_tilte("总投资", 2, 2, 27, 27));
			et.add(new Excel_tilte("部投资", 2, 2, 28, 28));
			et.add(new Excel_tilte("省投资", 2, 2, 29, 29));
			
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export1(eldata,response);
			
		}else{
			if(list1.size()==1){
				JsonUtils.write(null, getresponse().getWriter());
			}else
			JsonUtils.write(list1, getresponse().getWriter());
		}                                                                          
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 灾害
	 */
	public void getZhfzybb(){
		String shijian=nf+"-"+yf;
		gcglzhfz.setSbyf(shijian);
		String tiaojian1="";
		String tiaojian2="";
		String xzqhdm = "";
		String gydwdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = gydw;
		xzqhdm	= xzqh;
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%"+gydwdm+"%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		gcglzhfz.setGydw(tiaojian1);
		gcglzhfz.setLxmc(lxmc);
		gcglzhfz.setTiaojian(xzdj);
		gcglzhfz.setXzqhdm(tiaojian2);
		gcglzhfz.setXmnf(xmnf);
		gcglzhfz.setXmmc(xmmc);
		//查总合list
		try {
		List<Map<String,Object>> list1=gcybbServer.getzhfzbblist1(gcglzhfz);
		//按行政区划查询每个行政区划的合list
		List<Map<String,Object>> list2=gcybbServer.getzhfzbblist2(gcglzhfz);
		//按行政区划和年份查每个行政区划下每个年份的合
		List<Map<String,Object>> list3=gcybbServer.getzhfzbblist3(gcglzhfz);
		//查询所有列表
		List<Map<String,Object>> list4=gcybbServer.getzhfzbblist4(gcglzhfz);
		if(list2.size()>0)
		for (Map<String, Object> map : list2) {
			list1.add(map);
			if(list3.size()>0)
			for (Map<String, Object> map1 : list3) {
				if(map.get("XZQH").toString().equals(map1.get("XZQH").toString())){
					list1.add(map1);
					if(list4.size()>0)
					for (Map<String, Object> map2 : list4) {
						if(map.get("XZQH").toString().equals(map2.get("XZQH").toString())&&map1.get("XDNF").toString().equals(map2.get("XDNF").toString())){
							list1.add(map2);
						}
					}
				}
			}
		}
		if("flag".equals(flag)){
			List<Excel_list> elist=new ArrayList<Excel_list>();
			for (Map<String, Object> map : list1) {
				Excel_list l=new Excel_list();
				try {l.setV_0(map.get("LXBM").toString());} catch (Exception e) {l.setV_0("");}
				try {l.setV_1(map.get("LXMC").toString());} catch (Exception e) {l.setV_1("");}
				try {l.setV_2(map.get("QDZH").toString());} catch (Exception e) {l.setV_2("");}
				try {l.setV_3(map.get("ZDZH").toString());} catch (Exception e) {l.setV_3("");}
				try {l.setV_4(map.get("JSDJ").toString());} catch (Exception e) {l.setV_4("");}
				try {l.setV_5(map.get("XJGJND").toString());} catch (Exception e) {l.setV_5("");}
				try {l.setV_6(map.get("BNHJ").toString());} catch (Exception e) {l.setV_6("");}
				try {l.setV_7(map.get("BNBTZ").toString());} catch (Exception e) {l.setV_7("");}
				try {l.setV_8(map.get("BNSTZ").toString());} catch (Exception e) {l.setV_8("");}
				try {l.setV_9(map.get("BYWCGL").toString());} catch (Exception e) {l.setV_9("");}
				try {l.setV_10(map.get("YYWCGL").toString());} catch (Exception e) {l.setV_10("");}
				try {l.setV_11(map.get("KGWCGL").toString());} catch (Exception e) {l.setV_11("");}
				try {l.setV_12(map.get("BYHJ").toString());} catch (Exception e) {l.setV_12("");}
				try {l.setV_13(map.get("BYBTZ").toString());} catch (Exception e) {l.setV_13("");}
				try {l.setV_14(map.get("BYSTZ").toString());} catch (Exception e) {l.setV_14("");}
				try {l.setV_15(map.get("YYHJ").toString());} catch (Exception e) {l.setV_15("");}
				try {l.setV_16(map.get("YYBTZ").toString());} catch (Exception e) {l.setV_16("");}
				try {l.setV_17(map.get("YYSTZ").toString());} catch (Exception e) {l.setV_17("");}
				try {l.setV_18(map.get("KGHJ").toString());} catch (Exception e) {l.setV_18("");}
				try {l.setV_19(map.get("KGBTZ").toString());} catch (Exception e) {l.setV_19("");}
				try {l.setV_20(map.get("KGSTZ").toString());} catch (Exception e) {l.setV_20("");}
				try {l.setV_21(map.get("JSNR").toString());} catch (Exception e) {l.setV_21("");}
				elist.add(l);
			}
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("公路建设下达计划（国省道改造项目）");//设置第一行
			eldata.setSheetName("公路建设下达计划表");//设置sheeet名
			eldata.setFileName("公路建设下达计划表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("路线编码",1,2,0,0));
			et.add(new Excel_tilte("路线名称",1,2,1,1));
			et.add(new Excel_tilte("基本情况",1,1,2,5));	
			et.add(new Excel_tilte("计划投资(万元)", 1, 1, 6, 8));
			et.add(new Excel_tilte("本月完成工程量（公里）", 1, 2, 9, 9));
			et.add(new Excel_tilte("自元月至本月底完成工程量（公里）", 1, 2, 10, 10));
			et.add(new Excel_tilte("开工至本月底完成工程量（公里）", 1, 2, 11, 11));
			et.add(new Excel_tilte("本月完成投资(万元)", 1, 1, 12, 14));
			et.add(new Excel_tilte("自元月至本月底完成投资（万元）", 1, 1, 15, 17));
			et.add(new Excel_tilte("开工至本月底累计完成投资(万元)", 1, 1, 18, 20));
			et.add(new Excel_tilte("主要建设内容", 1, 2, 21, 21));
			et.add(new Excel_tilte("起点桩号", 2, 2, 2, 2));
			et.add(new Excel_tilte("止点桩号", 2, 2, 3, 3));
			et.add(new Excel_tilte("技术等级", 2, 2, 4, 4));
			et.add(new Excel_tilte("公路修建/改建年度", 2, 2, 5, 5));
			et.add(new Excel_tilte("总投资", 2, 2, 6, 6));
			et.add(new Excel_tilte("部投资", 2, 2, 7, 7));
			et.add(new Excel_tilte("省投资", 2, 2, 8, 8));
			et.add(new Excel_tilte("总投资", 2, 2, 12, 12));
			et.add(new Excel_tilte("部投资", 2, 2, 13, 13));
			et.add(new Excel_tilte("省投资", 2, 2, 14, 14));
			et.add(new Excel_tilte("总投资", 2, 2, 15, 15));
			et.add(new Excel_tilte("部投资", 2, 2, 16, 16));
			et.add(new Excel_tilte("省投资", 2, 2, 17, 17));
			et.add(new Excel_tilte("总投资", 2, 2, 18, 18));
			et.add(new Excel_tilte("部投资", 2, 2, 19, 19));
			et.add(new Excel_tilte("省投资", 2, 2, 20, 20));			
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export1(eldata,response);
			
		}else{
			if(list1.size()==1){
				JsonUtils.write(null, getresponse().getWriter());
			}else
				JsonUtils.write(list1, getresponse().getWriter());
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportZhfzyb(){
		List<Excel_list> exl = new ArrayList<Excel_list>();
		List<Excel_list> exl1 = new ArrayList<Excel_list>();
		String shijian=nf+"-"+yf;
		gcglzhfz.setSbyf(shijian);
		if("36".equals(gydw)){
			gcglzhfz.setGydw("");
		}
		else gcglzhfz.setGydw(gydw.replaceAll("0*$",""));
		gcglzhfz.setLxmc(lxmc);
		gcglzhfz.setTiaojian(xzdj);
		gcglzhfz.setXzqhdm(xzqh.replaceAll("0*$",""));
		//List<Map<String, Object>> lsit=gcybbServer.getzhfzybb(gcglzhfz);
		Excel_list e1=gcybbServer.getzhfzlist1(gcglzhfz);
		if(e1!=null){
			e1.setV_0("总计");
			exl.add(e1);
		}
		int maxnian=0;
		int minnian=Integer.parseInt(nf);
		List<Map<String, Object>> lsit1=gcybbServer.getZhfzxzqh(gcglzhfz);//查行政区划
		if(lsit1.size()!=0)
		for (Map<String, Object> map : lsit1) {
			gcglzhfz.setXzqhmc(map.get("XZQHDM").toString());
			Excel_list e3=gcybbServer.getzhfzlist1(gcglzhfz);
			if(e3!=null){
				if("景德镇".equals(map.get("XZQHMC").toString())){
					e3.setV_0(map.get("XZQHMC").toString()+"市");
				}
				else e3.setV_0(map.get("XZQHMC").toString());
				exl1.add(e3);
			}
			List<Map<String, Object>> lsit2=gcybbServer.getZhfznf(gcglzhfz);//查年份
			if(lsit2.size()!=0)
			for (Map<String, Object> map2 : lsit2) {
				if(maxnian<Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					maxnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				if(minnian>Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					minnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				gcglzhfz.setXmnf(map2.get("XMNF").toString());
				Excel_list e2=gcybbServer.getzhfzlist1(gcglzhfz);
				e2.setV_0(map2.get("XMNF").toString()+"项目");
				if(e2!=null)
				exl1.add(e2);
				List<Excel_list> exl2=gcybbServer.getzhfzlist2(gcglzhfz);
				if(exl2.size()!=0)
				exl1.addAll(exl2);
			}
		}
		for (int i = minnian; i <= maxnian; i++) {
			gcglzhfz.setXzqhmc("");
			gcglzhfz.setXmnf(i+"年");
			Excel_list e2=gcybbServer.getzhfzlist1(gcglzhfz);
			if(e2!=null){
				e2.setV_0(i+"年项目");
				exl.add(e2);
			}
		}
		exl.addAll(exl1);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("江西省"+nf+"年公路路网结构改造工程统计月报表（三） 灾害防治（"+yf+"月）");//设置第一行
		eldata.setSheetName("统计月报表");//设置sheeet名
		eldata.setFileName("江西省"+nf+"年"+yf+"月公路路网结构改造工程统计月报表（三）");//设置文件名
		eldata.setEl(exl);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("路线编码",1,2,0,0));
		et.add(new Excel_tilte("路线名称",1,2,1,1));
		et.add(new Excel_tilte("基本情况",1,1,2,5));	
		et.add(new Excel_tilte("计划投资(万元)", 1, 1, 6, 8));
		et.add(new Excel_tilte("本月完成工程量（公里）", 1, 2, 9, 9));
		et.add(new Excel_tilte("自元月至本月底完成工程量（公里）", 1, 2, 10, 10));
		et.add(new Excel_tilte("开工至本月底完成工程量（公里）", 1, 2, 11, 11));
		et.add(new Excel_tilte("本月完成投资(万元)", 1, 1, 12, 14));
		et.add(new Excel_tilte("自元月至本月底完成投资（万元）", 1, 1, 15, 17));
		et.add(new Excel_tilte("开工至本月底累计完成投资(万元)", 1, 1, 18, 20));
		et.add(new Excel_tilte("主要建设内容", 1, 2, 21, 21));
		et.add(new Excel_tilte("起点桩号", 2, 2, 2, 2));
		et.add(new Excel_tilte("止点桩号", 2, 2, 3, 3));
		et.add(new Excel_tilte("技术等级", 2, 2, 4, 4));
		et.add(new Excel_tilte("公路修建/改建年度", 2, 2, 5, 5));
		et.add(new Excel_tilte("总投资", 2, 2, 6, 6));
		et.add(new Excel_tilte("部投资", 2, 2, 7, 7));
		et.add(new Excel_tilte("省投资", 2, 2, 8, 8));
		et.add(new Excel_tilte("总投资", 2, 2, 12, 12));
		et.add(new Excel_tilte("部投资", 2, 2, 13, 13));
		et.add(new Excel_tilte("省投资", 2, 2, 14, 14));
		et.add(new Excel_tilte("总投资", 2, 2, 15, 15));
		et.add(new Excel_tilte("部投资", 2, 2, 16, 16));
		et.add(new Excel_tilte("省投资", 2, 2, 17, 17));
		et.add(new Excel_tilte("总投资", 2, 2, 18, 18));
		et.add(new Excel_tilte("部投资", 2, 2, 19, 19));
		et.add(new Excel_tilte("省投资", 2, 2, 20, 20));		
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export1(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel
	}
	
	
	//
	public void getGjxjmxb(){
		//System.out.println(gcglwqgz.getTiaojian()+"---"+gcglwqgz.getXmnf());
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		String tableName="";
		try{
			    if("路面升级".equals(gcglwqgz.getTiaojian()))
			    	tableName="yb_sj";
				
				if("路面改造".equals(gcglwqgz.getTiaojian()))
					tableName="yb_gj";
				if("水毁".equals(gcglwqgz.getTiaojian()))
					tableName="yb_sh";
				
				String[] arr=gcglwqgz.getXmnf().split(",");
				String sql="select xzqhmc";
				String in="";
				for(int j=0;j<arr.length;j++){
					if(j==0)
					    in=in+"'"+arr[j]+"'";
					else
						in=in+",'"+arr[j]+"'";
					sql=sql+",decode(sum(decode(jhnf,'"+arr[j]+"',xmsl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',xmsl)) )xmsl"+arr[j]+
							",decode(sum(decode(jhnf,'"+arr[j]+"',xmlc)),null,0,sum(decode(jhnf,'"+arr[j]+"',xmlc))) xmlc"+arr[j]+
				        ",decode(sum(decode(jhnf,'"+arr[j]+"',xmzj)),null,0,sum(decode(jhnf,'"+arr[j]+"',xmzj))) xmzj"+arr[j]+
				        ",decode(sum(decode(jhnf,'"+arr[j]+"',wclc)),null,0,sum(decode(jhnf,'"+arr[j]+"',wclc))) wclc"+arr[j]+
				        ",decode(sum(decode(jhnf,'"+arr[j]+"',wcxmzj)),null,0,sum(decode(jhnf,'"+arr[j]+"',wcxmzj))) wcxmzj"+arr[j]+"";
				}
				sql=sql+" from "+tableName+"  where jhnf in("+in+")group by xzqhmc,xzqh order by xzqh";		
				System.out.println(sql);
				list=gcybbServer.getGjxjmxbsj(sql);
				for(int i=0;i<list.size();i++){
					HashMap<String,Object> hm=(HashMap<String, Object>) list.get(i);
					double xmsl=0;
					double xmlc=0;
					double xmzj=0;
					double wclc=0;
					double wcxmzj=0;
					for(int j=arr.length-1;j>=0;j--){
						xmsl=xmsl+Double.valueOf(hm.get("XMSL"+arr[j]).toString());
						xmlc=xmlc+Double.valueOf(hm.get("XMLC"+arr[j]).toString());
						xmzj=xmzj+Double.valueOf(hm.get("XMZJ"+arr[j]).toString());
						wclc=wclc+Double.valueOf(hm.get("WCLC"+arr[j]).toString());
						wcxmzj=wcxmzj+Double.valueOf(hm.get("WCXMZJ"+arr[j]).toString());
						hm.put("LJWCLC"+arr[j],xmlc);
					}
				   hm.put("XMSL",xmsl);
				   hm.put("XMLC",xmlc);
				   hm.put("XMZJ",xmzj);
				   hm.put("WCLC",wclc);
				   hm.put("WCXMZJ",wcxmzj);
				   hm.put("LJWCLC",wclc);
				   hm.put("XH", i);
				}
				if("flag".equals(flag)){
					String[] nf = gcglwqgz.getXmnf().split(",");
					Arrays.sort(nf);
					List<Excel_list> elist=new ArrayList<Excel_list>();
					int cd=(nf.length+1)*6+3;
					NumberFormat nfs = NumberFormat.getInstance(); 
			        nfs.setRoundingMode(RoundingMode.HALF_UP);//设置四舍五入 
			        nfs.setMinimumFractionDigits(2);//设置最小保留几位小数 
			        nfs.setMaximumFractionDigits(2);//设置最大保留几位小数
					for(int i=0;i<list.size();i++){
						Excel_list l = new Excel_list();
						Class cl = l.getClass();
						if("0".equals(list.get(i).get("XH").toString())){
							Method method = cl.getMethod("setV_"+0, new Class[]{String.class});
							method.invoke(l, new Object[]{list.get(i).get("XZQHMC").toString()});
						}else{
							Method method = cl.getMethod("setV_"+0, new Class[]{String.class});
							method.invoke(l, new Object[]{list.get(i).get("XH").toString()});
						}
						
						Method method1 = cl.getMethod("setV_"+1, new Class[]{String.class});
						method1.invoke(l, new Object[]{list.get(i).get("XZQHMC").toString()});
						Method method2 = cl.getMethod("setV_"+2, new Class[]{String.class});
						method2.invoke(l, new Object[]{gcglwqgz.getTiaojian()});
						Method method3 = cl.getMethod("setV_"+3, new Class[]{String.class});
						method3.invoke(l, new Object[]{list.get(i).get("XMSL").toString().substring(0, list.get(i).get("XMSL").toString().length()-2)});
						Method method4 = cl.getMethod("setV_"+4, new Class[]{String.class});
						method4.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("XMLC").toString()))});
						Method method5 = cl.getMethod("setV_"+5, new Class[]{String.class});
						method5.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("XMZJ").toString()))});
						Method method6 = cl.getMethod("setV_"+6, new Class[]{String.class});
						method6.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCLC").toString()))});
						Method method7 = cl.getMethod("setV_"+7, new Class[]{String.class});
						method7.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("LJWCLC").toString()))});
						Method method8 = cl.getMethod("setV_"+8, new Class[]{String.class});
						method8.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCXMZJ").toString()))});
						int k=9;
						for (int j = 0; j < nf.length; j++) {
							Method method9 = cl.getMethod("setV_"+k, new Class[]{String.class});
							method9.invoke(l, new Object[]{list.get(i).get("XMSL"+nf[j]).toString()});
							Method method10 = cl.getMethod("setV_"+(k+1), new Class[]{String.class});
							method10.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("XMLC"+nf[j]).toString()))});
							Method method11 = cl.getMethod("setV_"+(k+2), new Class[]{String.class});
							method11.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("XMZJ"+nf[j]).toString()))});
							Method method12 = cl.getMethod("setV_"+(k+3), new Class[]{String.class});
							method12.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCLC"+nf[j]).toString()))});
							Method method13 = cl.getMethod("setV_"+(k+4), new Class[]{String.class});
							method13.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("LJWCLC"+nf[j]).toString()))});
							Method method14 = cl.getMethod("setV_"+(k+5), new Class[]{String.class});
							method14.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCXMZJ"+nf[j]).toString()))});
							k+=6;
						}
						Method method15 = cl.getMethod("setV_"+cd, new Class[]{String.class});
						method15.invoke(l, new Object[]{""});
						elist.add(l);
					}
					//把数据放入elist
					ExcelData eldata=new ExcelData();//创建一个类
					eldata.setTitleName("公路改造工程新上、续建工程项目完成情况明细表");//设置第一行 
					eldata.setSheetName("完成情况表");//设置sheeet名
					eldata.setFileName("公路改造工程新上、续建工程项目完成情况明细表");//设置文件名
					eldata.setEl(elist);//将实体list放入类中
					List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
					et.add(new Excel_tilte("序号",1,3,0,0));
					et.add(new Excel_tilte("设区市",1,3,1,1));
					et.add(new Excel_tilte("项目类型",1,3,2,2));
					et.add(new Excel_tilte("计划下达及完成情况",1,1,3,8));
					int sj1=9;
					for (int i = 0; i < nf.length; i++) {
						et.add(new Excel_tilte("计划下达及完成情况",1,1,sj1,sj1+5));
						sj1=sj1+6;
					}
					et.add(new Excel_tilte("备注",1,3,sj1,sj1));
					et.add(new Excel_tilte(nf[0]+"-"+nf[nf.length-1]+"年度",2,2,3,5));
					et.add(new Excel_tilte("本年完成里程(公里)",2,3,6,6));
					et.add(new Excel_tilte("累计完成里程(公里)",2,3,7,7));
					et.add(new Excel_tilte("本年完成投资(万元)",2,3,8,8));
					int sj2=9;
					for (int i = 0; i < nf.length; i++) {
						et.add(new Excel_tilte(nf[i]+"年度",2,2,sj2,sj2+2));
						et.add(new Excel_tilte("本年完成里程(公里)",2,3,sj2+3,sj2+3));
						et.add(new Excel_tilte("累计完成里程(公里)",2,3,sj2+4,sj2+4));
						et.add(new Excel_tilte("本年完成投资(万元)",2,3,sj2+5,sj2+5));
						sj2=sj2+6;
					}
					et.add(new Excel_tilte("项目数量",3,3,3,3));
					et.add(new Excel_tilte("计划里程(公里)",3,3,4,4));
					et.add(new Excel_tilte("中央或省统筹资金(万元)含续建",3,3,5,5));
					int sj3=9;
					for (int i = 0; i < nf.length; i++) {
						et.add(new Excel_tilte("项目数量",3,3,sj3,sj3));
						et.add(new Excel_tilte("计划里程(公里)",3,3,sj3+1,sj3+1));
						et.add(new Excel_tilte("中央或省统筹资金(万元)含续建",3,3,sj3+2,sj3+2));
						sj3=sj3+6;
					}
					eldata.setEt(et);//将表头内容设置到类里面
					HttpServletResponse response= getresponse();//获得一个HttpServletResponse
					Excel_export.excel_exportmxb(eldata,response);
					
				}else
				JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
	
	//weiqiao
	public void getWqgzjsb(){
		String tiaojian1="";
		String tiaojian2="";
		String xzqhdm = "";
		String gydwdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = gydw;
		xzqhdm	= xzqh;
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%"+gydwdm+"%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		gcglwqgz.setSbyf(nf);
		gcglwqgz.setGydw(tiaojian1);
		gcglwqgz.setTiaojian(xzdj);
		gcglwqgz.setXzqhdm(tiaojian2);
		gcglwqgz.setXmnf(xmnf);
		List<Map<String, Object>> list=gcybbServer.getWqgzJsb(gcglwqgz);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
