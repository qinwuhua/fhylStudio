package com.hdsx.jxzhpt.jhgl.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcgjServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.webutil.struts.BaseActionSupport;


@Scope("prototype")
@Controller
public class Plan_gcgjController extends BaseActionSupport{
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcgjServerImpl")
	private Plan_gcgjServer gcgjServer;//工程改建
	private Plan_gcgj jh;
	private Plan_lx_gcgj lx;
	private String gydwdm;
	private String fileuploadFileName;
	private File fileupload;
	/**
	 * 获取工程改建项目列表
	 */
	public void queryGcgjList(){
		try {
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			jsonMap.put("total", gcgjServer.queryGcgjCount(jh,lx));
			jsonMap.put("rows", gcgjServer.queryGcgjList(page,rows,jh,lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据ID获取计划信息
	 */
	public void queryGcgjById(){
		try {
			JsonUtils.write(gcgjServer.queryGcgjById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcgjNfs(){
		try {
			List<TreeNode> queryGcgjNfs = gcgjServer.queryGcgjNfs();
			System.out.println("年份："+queryGcgjNfs.size());
			JsonUtils.write(gcgjServer.queryGcgjNfs(),getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void dropGcgjById(){
		try {
			JsonUtils.write(gcgjServer.dropGcgjById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editGcgjById(){
		try {
			JsonUtils.write(gcgjServer.editGcgjById(jh), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editGcgjStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(gcgjServer.editGcgjStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void importGcgj_jh(){
		System.out.println(" 管养单位代码："+gydwdm);
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
				dataMapArray = ExcelReader.readExcelContent(3,43,fs,Plan_gcgj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			String strVerify=null;
			boolean boolJh=false,boolLx=false;
			for (Map map : data) {
				UUID jhId = UUID.randomUUID(); 
				map.put("jhid", jhId.toString().replace("-", ""));
				map.put("gydwdm", getGydwdm());
				map.put("1", map.get("1").toString().substring(0, map.get("1").toString().indexOf(".")));
				map.put("16", map.get("16").toString().substring(0, map.get("16").toString().indexOf(".")));
				map.put("22", map.get("22").toString().substring(0, map.get("22").toString().indexOf(".")));
				map.put("34", map.get("34").toString().substring(0, map.get("34").toString().indexOf(".")));
				map.put("35", map.get("35").toString().substring(0, map.get("35").toString().indexOf(".")));
				map.put("36", map.get("36").toString().substring(0, map.get("36").toString().indexOf(".")));
				strVerify = ImportVerify.gcgjVerify(map);
				if(gcgjServer.queryGPSBylxbm(map.get("3").toString())==0){
					strVerify+="路线【"+map.get("3").toString()+"】不存在";
				}
			}
			System.out.println(data);
			//将数据插入到数据库
			if(strVerify.equals("")){
				boolJh=gcgjServer.insertGcgj_jh(data);
				boolLx=gcgjServer.insertGcgj_lx(data);
			}
			
			if(boolJh && boolLx)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//get set
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
	public Plan_gcgjServer getGcgjServer() {
		return gcgjServer;
	}
	public void setGcgjServer(Plan_gcgjServer gcgjServer) {
		this.gcgjServer = gcgjServer;
	}
	public Plan_gcgj getJh() {
		return jh;
	}
	public void setJh(Plan_gcgj jh) {
		this.jh = jh;
	}
	public Plan_lx_gcgj getLx() {
		return lx;
	}
	public void setLx(Plan_lx_gcgj lx) {
		this.lx = lx;
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
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
}
