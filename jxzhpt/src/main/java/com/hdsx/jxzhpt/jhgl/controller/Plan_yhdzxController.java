package com.hdsx.jxzhpt.jhgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_yhdzx;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_yhdzxServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.util.lang.JsonUtil;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_yhdzxController extends BaseActionSupport{
	private int page=1;
	private int rows=10;
	private Plan_yhdzx jh;
	private Plan_lx_yhdzx lx;
	private String gydwdm;
	@Resource(name = "plan_yhdzxServerImpl")
	private Plan_yhdzxServer yhdzxServer;
	private String fileuploadFileName;
	private File fileupload;
	
	public void querySumYhdzx(){
		try {
			JsonUtils.write(yhdzxServer.querySumYhdzx(jh,lx), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryYhdzxList(){
		try {
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			jsonMap.put("total", yhdzxServer.queryYhdzxCount(jh,lx));
			jsonMap.put("rows", yhdzxServer.queryYhdzxList(page,rows,jh,lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryYhdzxById(){
		try {
			JsonUtils.write(yhdzxServer.queryYhdzxById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropYhdzxById(){
		try {
			Map<String, Object> result=new HashMap<String, Object>();
			result.put("jh", new Boolean(yhdzxServer.dropYhdzxById(jh.getId())));
			result.put("lx", new Boolean(yhdzxServer.dropYhdzxLxByJhid(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editYhdzxStatus(){
		try {
			System.out.println("设计批复问好："+jh.getDevisenumbder());
			Map<String,String> result=new HashMap<String, String>();
			result.put("result", new Boolean(yhdzxServer.editYhdzxStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editYhdzxById(){
		try {
			System.out.println("路面结构："+lx.getLmjg());
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(yhdzxServer.editYhdzxById(jh, lx)).toString());
			result.put("lx", new Boolean(yhdzxServer.editYhdzxLxById(jh,lx)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void importYhdzx_jh(){
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
				dataMapArray = ExcelReader.readExcelContent(3,40,fs,Plan_gcsj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			String strVerify=null;
			boolean boolJh=true,boolLx=true;
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			for (Map map : data) {
				UUID jhId = UUID.randomUUID(); 
				map.put("jhid", jhId.toString().replace("-", ""));
				map.put("gydwdm", getGydwdm());
				map.put("tbsj", new Date());
				map.put("1", map.get("1").toString().substring(0, map.get("1").toString().indexOf(".")));
				map.put("13", map.get("13").toString().substring(0, map.get("13").toString().indexOf(".")));
			}
			System.out.println(data);
			yhdzxServer.insertYhdzx_lx(data);
			yhdzxServer.insertYhdzx_jh(data);
			//将数据插入到数据库
			if(boolJh && boolLx)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//set get
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
	public Plan_yhdzx getJh() {
		return jh;
	}
	public void setJh(Plan_yhdzx jh) {
		this.jh = jh;
	}
	public Plan_lx_yhdzx getLx() {
		return lx;
	}
	public void setLx(Plan_lx_yhdzx lx) {
		this.lx = lx;
	}
	public Plan_yhdzxServer getYhdzxServer() {
		return yhdzxServer;
	}
	public void setYhdzxServer(Plan_yhdzxServer yhdzxServer) {
		this.yhdzxServer = yhdzxServer;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
}
