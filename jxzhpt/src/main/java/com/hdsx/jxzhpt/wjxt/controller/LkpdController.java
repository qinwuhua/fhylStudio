package com.hdsx.jxzhpt.wjxt.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;
import com.hdsx.jxzhpt.jhgl.controller.ImportVerify;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExcelReader1;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class LkpdController extends BaseActionSupport{
	private int page = 1;
	private int rows = 10;
	@Resource(name = "trqkServerImpl")
	private TrqkServer trqkServer;
	private String gydw;
	private String tiaojian;
	private Trqk trqk=new Trqk();
	private Lkmxb lkmxb=new Lkmxb();
	private File fileupload;
	private String fileuploadFileName;
	private String id;
	private Lktjb lktjb=new Lktjb();
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Lkmxb getLkmxb() {
		return lkmxb;
	}

	public void setLkmxb(Lkmxb lkmxb) {
		this.lkmxb = lkmxb;
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

	public Trqk getTrqk() {
		return trqk;
	}

	public void setTrqk(Trqk trqk) {
		this.trqk = trqk;
	}
	
	
	public File getFileupload() {
		return fileupload;
	}

	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}

	public String getFileuploadFileName() {
		return fileuploadFileName;
	}

	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}

	public Lktjb getLktjb() {
		return lktjb;
	}

	public void setLktjb(Lktjb lktjb) {
		this.lktjb = lktjb;
	}

	public void insertLkpdData(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader1.readExcelContent(2,17,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			String strVerify="";
			boolean booltb=false,booldata=false;
			Lkmxb lkmxb1=new Lkmxb();
			String s = UUID.randomUUID().toString(); 
			String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
			lkmxb1.setTbdw(data.get(0).get("1").toString());
			lkmxb1.setTbnf(data.get(0).get("7").toString());
			lkmxb1.setDwfzr(data.get(data.size()-1).get("0").toString().split("：")[1]);
			lkmxb1.setTjfzr(data.get(data.size()-1).get("4").toString().split("：")[1]);
			lkmxb1.setTjf(data.get(data.size()-1).get("8").toString().split("：")[1]);
			lkmxb1.setTbrq(data.get(data.size()-1).get("12").toString().split("：")[1]);
			
			lkmxb1.setId(s1);
			booltb=trqkServer.insertLqpdmxb(lkmxb1);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(data.size()-1);
			int i=1;
			for (Map map : data) {
				map.put("id", i);
				i++;
				map.put("mxb_id", s1);
			}
			booldata=trqkServer.insertLqpdmxbdata(data);
			if(booltb && booldata)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void selectMxbList(){
		List<Lkmxb> list = trqkServer.selectMxbList(lkmxb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void getMxbDataList(){
		System.out.println("开始"+id);
		lkmxb.setId(id);
		List<Lkmxb> list = trqkServer.getMxbDataList(lkmxb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void getMxbDataList1(){
		lkmxb.setId(id);
		Lkmxb lkmxb1 = trqkServer.getMxbDataList1(lkmxb);
		try {
			JsonUtils.write(lkmxb1, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void deletemxb(){
		Boolean bl=trqkServer.deletemxb(lkmxb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	//
	public void insertLkpdtjData(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader1.readExcelContent(2,11,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			String s = UUID.randomUUID().toString(); 
			String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
			Lktjb lktjb1=new Lktjb();
			lktjb1.setId(s1);
			lktjb1.setTbdw(data.get(0).get("1").toString());
			lktjb1.setTbnf(data.get(0).get("4").toString());
			System.out.println(data.get(data.size()-1).get("0").toString());
			lktjb1.setDwfzr(data.get(data.size()-1).get("0").toString().split("：")[1]);
			lktjb1.setFzr(data.get(data.size()-1).get("2").toString().split("：")[1]);
			lktjb1.setTbr(data.get(data.size()-1).get("5").toString().split("：")[1]);
			lktjb1.setTbrq(data.get(data.size()-1).get("8").toString().split("：")[1]);
			System.out.println(lktjb1);
			boolean booltb=false,booldata=false;
			booltb=trqkServer.insertLktjb(lktjb1);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(data.size()-1);
			int i=1;
			for (Map map : data) {
				map.put("id", i);
				map.put("bh", i);
				i++;
				map.put("tjb_id", s1);
			}
			booldata=trqkServer.insertLktjbData(data);
			if(booltb && booldata)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void selectTjbList(){
		List<Lktjb> list = trqkServer.selectTjbList(lktjb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void getTjbDataList(){
		System.out.println("开始"+id);
		lktjb.setId(id);
		List<Lktjb> list = trqkServer.getTjbDataList(lktjb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void getTjbDataList1(){
		lktjb.setId(id);
		Lktjb lkmxb1 = trqkServer.getTjbDataList1(lktjb);
		try {
			JsonUtils.write(lkmxb1, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
}
