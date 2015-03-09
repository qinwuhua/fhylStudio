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
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class JtlController extends BaseActionSupport{
	private int page = 1;
	private int rows = 10;
	@Resource(name = "trqkServerImpl")
	private TrqkServer trqkServer;
	private String gydw;
	private String tiaojian;
	private File fileupload;
	private String fileuploadFileName;
	private String id;
	private Jtlhz jtlhz=new Jtlhz();
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public Jtlhz getJtlhz() {
		return jtlhz;
	}

	public void setJtlhz(Jtlhz jtlhz) {
		this.jtlhz = jtlhz;
	}

	public void insertJtlhzData(){
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
				dataMapArray = ExcelReader1.readExcelContent(5,35,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			boolean booltb=false,booldata=false;
			Jtlhz jtlhz1=new Jtlhz();
			String s = UUID.randomUUID().toString(); 
			String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
			if(data.get(0).get("0").toString().split("：").length>1)
			jtlhz1.setTbdw(data.get(0).get("0").toString().split("：")[1]);
			else jtlhz1.setTbdw("");
			jtlhz1.setTbnf(data.get(0).get("10").toString());
			if(data.get(data.size()-1).get("0").toString().split(":").length>1)
			jtlhz1.setDwfzr(data.get(data.size()-1).get("0").toString().split(":")[1]);
			else jtlhz1.setDwfzr("");
			jtlhz1.setTjfzr(data.get(data.size()-1).get("4").toString());
			jtlhz1.setTbr(data.get(data.size()-1).get("8").toString());
			jtlhz1.setLxdh(data.get(data.size()-1).get("20").toString());
			jtlhz1.setBcrq(data.get(data.size()-1).get("33").toString());
			jtlhz1.setId(s1);
			booltb=trqkServer.insertJtlhz(jtlhz1);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(data.size()-1);
			int i=1;
			for (Map map : data) {
				map.put("id", i);
				i++;
				map.put("hzb_id", s1);
			}
			booldata=trqkServer.insertJtlhzdata(data);
			if(booltb && booldata)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void selectJtlList(){
		List<Jtlhz> list = trqkServer.selectJtlList(jtlhz);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void getJtlDataList(){
		System.out.println("开始"+id);
		jtlhz.setId(id);
		List<Jtlhz> list = trqkServer.getJtlDataList(jtlhz);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void getJtlDataList1(){
		jtlhz.setId(id);
		Jtlhz lkmxb1 = trqkServer.getJtlDataList1(jtlhz);
		try {
			JsonUtils.write(lkmxb1, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void deletejtl(){
		Boolean bl=trqkServer.deletejtl(jtlhz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}	
/*
	public void deletemxb(){
		Boolean bl=trqkServer.deletemxb(lkmxb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	*/
	
}
