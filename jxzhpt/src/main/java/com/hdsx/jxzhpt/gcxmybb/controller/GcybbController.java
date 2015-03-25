package com.hdsx.jxzhpt.gcxmybb.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFCellUtil;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.gcxmybb.server.GcybbServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.xtgl.bean.Master;
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
	private Gcglwqgz gcglwqgz=new Gcglwqgz();
	private Gcglabgc gcglabgc=new Gcglabgc();
	private Gcglzhfz gcglzhfz=new Gcglzhfz();
	
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
		List<Excel_list> exl = new ArrayList<Excel_list>();
		List<Excel_list> exl1 = new ArrayList<Excel_list>();
		String shijian=nf+"-"+yf;
		gcglwqgz.setSbyf(shijian);
		if("36".equals(gydw)){
			gcglwqgz.setGydw("");
		}
		else gcglwqgz.setGydw(gydw.replaceAll("0*$",""));
		gcglwqgz.setLxmc(lxmc);
		gcglwqgz.setTiaojian(xzdj);
		gcglwqgz.setXzqhdm(xzqh.replaceAll("0*$",""));
		//List<Map<String, Object>> lsit=gcybbServer.getWqgzybb(gcglwqgz);
		Excel_list e1=gcybbServer.getwqgzlist1(gcglwqgz);
		if(e1!=null){
			e1.setV_0("总计");
			exl.add(e1);
		}
		int maxnian=0;
		int minnian=Integer.parseInt(nf);
		List<Map<String, Object>> lsit1=gcybbServer.getWqgzxzqh(gcglwqgz);//查行政区划
		if(lsit1.size()!=0)
		for (Map<String, Object> map : lsit1) {
			gcglwqgz.setXzqhmc(map.get("XZQHDM").toString());
			Excel_list e3=gcybbServer.getwqgzlist3(gcglwqgz);
			if(e3!=null){
				if("景德镇".equals(map.get("XZQHMC").toString())){
					e3.setV_0(map.get("XZQHMC").toString()+"市");
				}
				else e3.setV_0(map.get("XZQHMC").toString());
				exl1.add(e3);
			}
			List<Map<String, Object>> lsit2=gcybbServer.getWqgznf(gcglwqgz);//查年份
			if(lsit2.size()!=0)
			for (Map<String, Object> map2 : lsit2) {
				if(maxnian<Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					maxnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				if(minnian>Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					minnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				gcglwqgz.setXmnf(map2.get("XMNF").toString());
				Excel_list e2=gcybbServer.getwqgzlist2(gcglwqgz);
				e2.setV_0(map2.get("XMNF").toString()+"项目");
				if(e2!=null)
				exl1.add(e2);
				List<Excel_list> exl2=gcybbServer.getwqgzlist4(gcglwqgz);
				if(exl2.size()!=0)
				exl1.addAll(exl2);
			}
		}
		for (int i = minnian; i <= maxnian; i++) {
			gcglwqgz.setXzqhmc("");
			gcglwqgz.setXmnf(i+"年");
			Excel_list e2=gcybbServer.getwqgzlist2(gcglwqgz);
			if(e2!=null){
				e2.setV_0(i+"年项目");
				exl.add(e2);
			}
		}
		exl.addAll(exl1);
		try {
			JsonUtils.write(exl, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void exportWqgzyb(){
		List<Excel_list> exl = new ArrayList<Excel_list>();
		List<Excel_list> exl1 = new ArrayList<Excel_list>();
		String shijian=nf+"-"+yf;
		gcglwqgz.setSbyf(shijian);
		if("36".equals(gydw)){
			gcglwqgz.setGydw("");
		}
		else gcglwqgz.setGydw(gydw.replaceAll("0*$",""));
		gcglwqgz.setLxmc(lxmc);
		gcglwqgz.setTiaojian(xzdj);
		gcglwqgz.setXzqhdm(xzqh.replaceAll("0*$",""));
		//List<Map<String, Object>> lsit=gcybbServer.getWqgzybb(gcglwqgz);
		Excel_list e1=gcybbServer.getwqgzlist1(gcglwqgz);
		if(e1!=null){
			e1.setV_0("总计");
			exl.add(e1);
		}
		int maxnian=0;
		int minnian=Integer.parseInt(nf);
		List<Map<String, Object>> lsit1=gcybbServer.getWqgzxzqh(gcglwqgz);//查行政区划
		if(lsit1.size()!=0)
		for (Map<String, Object> map : lsit1) {
			gcglwqgz.setXzqhmc(map.get("XZQHDM").toString());
			Excel_list e3=gcybbServer.getwqgzlist3(gcglwqgz);
			if(e3!=null){
				if("景德镇".equals(map.get("XZQHMC").toString())){
					e3.setV_0(map.get("XZQHMC").toString()+"市");
				}
				else e3.setV_0(map.get("XZQHMC").toString());
				exl1.add(e3);
			}
			List<Map<String, Object>> lsit2=gcybbServer.getWqgznf(gcglwqgz);//查年份
			if(lsit2.size()!=0)
			for (Map<String, Object> map2 : lsit2) {
				if(maxnian<Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					maxnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				if(minnian>Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					minnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				gcglwqgz.setXmnf(map2.get("XMNF").toString());
				Excel_list e2=gcybbServer.getwqgzlist2(gcglwqgz);
				e2.setV_0(map2.get("XMNF").toString()+"项目");
				if(e2!=null)
				exl1.add(e2);
				List<Excel_list> exl2=gcybbServer.getwqgzlist4(gcglwqgz);
				if(exl2.size()!=0)
				exl1.addAll(exl2);
			}
		}
		for (int i = minnian; i <= maxnian; i++) {
			gcglwqgz.setXzqhmc("");
			gcglwqgz.setXmnf(i+"年");
			Excel_list e2=gcybbServer.getwqgzlist2(gcglwqgz);
			if(e2!=null){
				e2.setV_0(i+"年项目");
				exl.add(e2);
			}
		}
		exl.addAll(exl1);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("江西省"+nf+"年公路路网结构改造工程统计月报表（一） 危桥工程（"+yf+"月）");//设置第一行
		eldata.setSheetName("统计月报表");//设置sheeet名
		eldata.setFileName("江西省"+nf+"年"+yf+"月公路路网结构改造工程统计月报表（一）");//设置文件名
		eldata.setEl(exl);//将实体list放入类中
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
		try {
			Excel_export.excel_export1(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel
	}
	/**
	 * 安保工程
	 */
	public void getAbgcybb(){
		List<Excel_list> exl = new ArrayList<Excel_list>();
		List<Excel_list> exl1 = new ArrayList<Excel_list>();
		String shijian=nf+"-"+yf;
		gcglabgc.setSbyf(shijian);
		if("36".equals(gydw)){
			gcglabgc.setGydw("");
		}
		else gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setTiaojian(xzdj);
		gcglabgc.setXzqhdm(xzqh.replaceAll("0*$",""));
		//List<Map<String, Object>> lsit=gcybbServer.getabgcybb(gcglabgc);
		Excel_list e1=gcybbServer.getabgclist1(gcglabgc);
		if(e1!=null){
			e1.setV_0("总计");
			exl.add(e1);
		}
		int maxnian=0;
		int minnian=Integer.parseInt(nf);
		List<Map<String, Object>> lsit1=gcybbServer.getAbgcxzqh(gcglabgc);//查行政区划
		if(lsit1.size()!=0)
		for (Map<String, Object> map : lsit1) {
			gcglabgc.setXzqhmc(map.get("XZQHDM").toString());
			Excel_list e3=gcybbServer.getabgclist3(gcglabgc);
			if(e3!=null){
				if("景德镇".equals(map.get("XZQHMC").toString())){
					e3.setV_0(map.get("XZQHMC").toString()+"市");
				}
				else e3.setV_0(map.get("XZQHMC").toString());
				exl1.add(e3);
			}
			List<Map<String, Object>> lsit2=gcybbServer.getAbgcnf(gcglabgc);//查年份
			if(lsit2.size()!=0)
			for (Map<String, Object> map2 : lsit2) {
				if(maxnian<Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					maxnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				if(minnian>Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					minnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				gcglabgc.setXmnf(map2.get("XMNF").toString());
				Excel_list e2=gcybbServer.getabgclist2(gcglabgc);
				e2.setV_0(map2.get("XMNF").toString()+"项目");
				if(e2!=null)
				exl1.add(e2);
				List<Excel_list> exl2=gcybbServer.getabgclist4(gcglabgc);
				if(exl2.size()!=0)
				exl1.addAll(exl2);
			}
		}
		for (int i = minnian; i <= maxnian; i++) {
			gcglabgc.setXzqhmc("");
			gcglabgc.setXmnf(i+"年");
			Excel_list e2=gcybbServer.getabgclist2(gcglabgc);
			if(e2!=null){
				e2.setV_0(i+"年项目");
				exl.add(e2);
			}
		}
		exl.addAll(exl1);
		try {
			JsonUtils.write(exl, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportAbgcyb(){
		List<Excel_list> exl = new ArrayList<Excel_list>();
		List<Excel_list> exl1 = new ArrayList<Excel_list>();
		String shijian=nf+"-"+yf;
		gcglabgc.setSbyf(shijian);
		if("36".equals(gydw)){
			gcglabgc.setGydw("");
		}
		else gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setTiaojian(xzdj);
		gcglabgc.setXzqhdm(xzqh.replaceAll("0*$",""));
		//List<Map<String, Object>> lsit=gcybbServer.getabgcybb(gcglabgc);
		Excel_list e1=gcybbServer.getabgclist1(gcglabgc);
		if(e1!=null){
			e1.setV_0("总计");
			exl.add(e1);
		}
		int maxnian=0;
		int minnian=Integer.parseInt(nf);
		List<Map<String, Object>> lsit1=gcybbServer.getAbgcxzqh(gcglabgc);//查行政区划
		if(lsit1.size()!=0)
		for (Map<String, Object> map : lsit1) {
			gcglabgc.setXzqhmc(map.get("XZQHDM").toString());
			Excel_list e3=gcybbServer.getabgclist3(gcglabgc);
			if(e3!=null){
				if("景德镇".equals(map.get("XZQHMC").toString())){
					e3.setV_0(map.get("XZQHMC").toString()+"市");
				}
				else e3.setV_0(map.get("XZQHMC").toString());
				exl1.add(e3);
			}
			List<Map<String, Object>> lsit2=gcybbServer.getAbgcnf(gcglabgc);//查年份
			if(lsit2.size()!=0)
			for (Map<String, Object> map2 : lsit2) {
				if(maxnian<Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					maxnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				if(minnian>Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					minnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				gcglabgc.setXmnf(map2.get("XMNF").toString());
				Excel_list e2=gcybbServer.getabgclist2(gcglabgc);
				e2.setV_0(map2.get("XMNF").toString()+"项目");
				if(e2!=null)
				exl1.add(e2);
				List<Excel_list> exl2=gcybbServer.getabgclist4(gcglabgc);
				if(exl2.size()!=0)
				exl1.addAll(exl2);
			}
		}
		for (int i = minnian; i <= maxnian; i++) {
			gcglabgc.setXzqhmc("");
			gcglabgc.setXmnf(i+"年");
			Excel_list e2=gcybbServer.getabgclist2(gcglabgc);
			if(e2!=null){
				e2.setV_0(i+"年项目");
				exl.add(e2);
			}
		}
		exl.addAll(exl1);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("江西省"+nf+"年公路路网结构改造工程统计月报表（二） 安保工程（"+yf+"月）");//设置第一行
		eldata.setSheetName("统计月报表");//设置sheeet名
		eldata.setFileName("江西省"+nf+"年"+yf+"月公路路网结构改造工程统计月报表（二）");//设置文件名
		eldata.setEl(exl);//将实体list放入类中
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
		try {
			Excel_export.excel_export1(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel
	}
	/**
	 * 灾害
	 */
	public void getZhfzybb(){
		List<Excel_list> exl = new ArrayList<Excel_list>();
		List<Excel_list> exl1 = new ArrayList<Excel_list>();
		String shijian=nf+"-"+yf;
		gcglabgc.setSbyf(shijian);
		if("36".equals(gydw)){
			gcglabgc.setGydw("");
		}
		else gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setTiaojian(xzdj);
		gcglabgc.setXzqhdm(xzqh.replaceAll("0*$",""));
		//List<Map<String, Object>> lsit=gcybbServer.getabgcybb(gcglabgc);
		Excel_list e1=gcybbServer.getabgclist1(gcglabgc);
		if(e1!=null){
			e1.setV_0("总计");
			exl.add(e1);
		}
		int maxnian=0;
		int minnian=Integer.parseInt(nf);
		List<Map<String, Object>> lsit1=gcybbServer.getAbgcxzqh(gcglabgc);//查行政区划
		if(lsit1.size()!=0)
		for (Map<String, Object> map : lsit1) {
			gcglabgc.setXzqhmc(map.get("XZQHDM").toString());
			Excel_list e3=gcybbServer.getabgclist3(gcglabgc);
			if(e3!=null){
				if("景德镇".equals(map.get("XZQHMC").toString())){
					e3.setV_0(map.get("XZQHMC").toString()+"市");
				}
				else e3.setV_0(map.get("XZQHMC").toString());
				exl1.add(e3);
			}
			List<Map<String, Object>> lsit2=gcybbServer.getAbgcnf(gcglabgc);//查年份
			if(lsit2.size()!=0)
			for (Map<String, Object> map2 : lsit2) {
				if(maxnian<Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					maxnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				if(minnian>Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					minnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				gcglabgc.setXmnf(map2.get("XMNF").toString());
				Excel_list e2=gcybbServer.getabgclist2(gcglabgc);
				e2.setV_0(map2.get("XMNF").toString()+"项目");
				if(e2!=null)
				exl1.add(e2);
				List<Excel_list> exl2=gcybbServer.getabgclist4(gcglabgc);
				if(exl2.size()!=0)
				exl1.addAll(exl2);
			}
		}
		for (int i = minnian; i <= maxnian; i++) {
			gcglabgc.setXzqhmc("");
			gcglabgc.setXmnf(i+"年");
			Excel_list e2=gcybbServer.getabgclist2(gcglabgc);
			if(e2!=null){
				e2.setV_0(i+"年项目");
				exl.add(e2);
			}
		}
		exl.addAll(exl1);
		try {
			JsonUtils.write(exl, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
