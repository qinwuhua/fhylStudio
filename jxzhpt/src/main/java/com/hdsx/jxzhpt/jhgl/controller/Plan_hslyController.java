package com.hdsx.jxzhpt.jhgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_hsly;
import com.hdsx.jxzhpt.jhgl.server.Plan_hslyServer;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_hslyController  extends BaseActionSupport{
	private int page;
	private int rows;
	private String gydwdm;
	private String fileuploadFileName;
	private File fileupload;
	private Plan_hsly hsly;
	@Resource(name = "plan_HslyServerImpl")
	private Plan_hslyServer hslyServer;
	
	public void importHsly_jh(){
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
				dataMapArray = ExcelReader.readExcelContent(3,21,fs,Plan_gcsj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			String strVerify=null;
			boolean boolJh=false,boolLx=false;
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			for (Map map : data) {
				UUID jhId = UUID.randomUUID(); 
				map.put("jhid", jhId.toString().replace("-", ""));
				map.put("gydwdm", getGydwdm());
				map.put("tbsj", new Date());
				map.put("tbbm", getGydwdm());
				map.put("xzqhmc", map.get("0").toString().substring(map.get("0").toString().indexOf("省")));
				//strVerify=ImportVerify.gcsjVerify(map);
//				if(gcsjServer.queryGPSBylxbm(map.get("3").toString())==0){
//					strVerify="【"+map.get("3").toString()+"】不存在！";
//				}
			}
			System.out.println(data);
			hslyServer.insertHsly(data);
//			if(strVerify.equals("")){
//				boolJh=gcsjServer.insertGcsj_Jh(data);
//				boolLx=gcsjServer.insertGcsj_lx(data);
//			}
			//将数据插入到数据库
//			if(boolJh && boolLx)
//				response.getWriter().print(fileuploadFileName+"导入成功");
//			else 
//				response.getWriter().print(fileuploadFileName+"导入失败"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//get set
	public int getPage() {
		return page;
	}
	public Plan_hsly getHsly() {
		return hsly;
	}
	public void setHsly(Plan_hsly hsly) {
		this.hsly = hsly;
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
