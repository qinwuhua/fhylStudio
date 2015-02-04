package com.hdsx.jxzhpt.jhgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.swing.tree.TreeNode;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcsj;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcsjServer;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_gcsjController extends BaseActionSupport{
	private int page = 1;
	private int rows = 10;
	@Resource(name = "plan_GcsjServerImpl")
	private Plan_gcsjServer gcsjServer;
	private Plan_gcsj jh;
	private Plan_lx_gcsj lx;
	private String fileuploadFileName;
	private File fileupload;
	private String gydwdm;
	
	public void querySumMessage(){
		try {
			JsonUtils.write(gcsjServer.querySumMessage(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcsjList(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("total", gcsjServer.queryGcsjCount(jh,lx));
		jsonMap.put("rows", gcsjServer.queryGcsjList(page,rows,jh,lx));
		try {
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcsjById(){
		try {
			JsonUtils.write(gcsjServer.queryGcsjById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcsjNfs(){
		try {
			JsonUtils.write(gcsjServer.queryGcsjNfs(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropGcsjById(){
		try {
			JsonUtils.write(gcsjServer.dropGcsjById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editGcsjById(){
		try {
			JsonUtils.write(gcsjServer.editGcsjById(jh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editGcsjStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(gcsjServer.editGcsjStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void importGcsj_jh(){
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
				dataMapArray = ExcelReader.readExcelContent(3,48,fs,Plan_gcsj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			String strVerify=null;
			boolean boolJh=false,boolLx=false;
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			System.out.println(data);
			for (Map map : data) {
				UUID jhId = UUID.randomUUID(); 
				map.put("jhid", jhId.toString().replace("-", ""));
				map.put("gydwdm", getGydwdm());
				map.put("1", map.get("1").toString().substring(0, map.get("1").toString().indexOf(".")));
				map.put("15", map.get("15").toString().substring(0, map.get("15").toString().indexOf(".")));
				map.put("22", map.get("22").toString().substring(0, map.get("22").toString().indexOf(".")));
				map.put("40", map.get("40").toString().substring(0, map.get("40").toString().indexOf(".")));
				map.put("41", map.get("41").toString().substring(0, map.get("41").toString().indexOf(".")));
				map.put("42", map.get("42").toString().substring(0, map.get("42").toString().indexOf(".")));
				Plan_lx_gcsj lx=new Plan_lx_gcsj();
				lx.setLxbm(map.get("3").toString());
				lx.setQdzh(map.get("7").toString());
				lx.setZdzh(map.get("8").toString());
				lx.setGydwdm(map.get("gydwdm").toString());
				map.put("sfylsjl", gcsjServer.queryJlBylx(lx)>0 ? "是" : "否");
				strVerify=ImportVerify.gcsjVerify(map);
				Plan_lx_gcsj queryGPSBylxbm = gcsjServer.queryGPSBylxbm(lx);
				if(queryGPSBylxbm==null && strVerify.equals("")){
					strVerify="路线【"+map.get("4").toString()+"】【"+map.get("7").toString()+"-"+map.get("8").toString()+"】不正确或不属于您的管辖内;";
				}else{
					if(!map.get("4").toString().equals(queryGPSBylxbm.getLxmc())){
						strVerify+="路线名称不正确;";
					}
					if(!map.get("9").toString().equals(queryGPSBylxbm.getQzlc())){
						strVerify+="起止里程不正确;";
					}
				}
				if(!strVerify.equals("")){
					break;
				}
			}
			if(strVerify.equals("")){
				boolJh=gcsjServer.insertGcsj_Jh(data);
				boolLx=gcsjServer.insertGcsj_lx(data);
			}
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

	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public Plan_gcsjServer getGcsjServer() {
		return gcsjServer;
	}
	public void setGcsjServer(Plan_gcsjServer gcsjServer) {
		this.gcsjServer = gcsjServer;
	}
	public Plan_gcsj getJh() {
		return jh;
	}
	public void setJh(Plan_gcsj jh) {
		this.jh = jh;
	}
	public Plan_lx_gcsj getLx() {
		return lx;
	}
	public void setLx(Plan_lx_gcsj lx) {
		this.lx = lx;
	}

	public String getGydwdm() {
		return gydwdm;
	}

	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
}
