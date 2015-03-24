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
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.gcxmybb.server.GcybbServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
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
		System.out.println("开始");
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
}
