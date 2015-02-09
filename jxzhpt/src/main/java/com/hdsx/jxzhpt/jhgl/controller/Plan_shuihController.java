package com.hdsx.jxzhpt.jhgl.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;
import com.hdsx.jxzhpt.jhgl.server.Plan_shuihServer;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_shuihController extends BaseActionSupport {
	private int page=1;
	private int rows=10;
	@Resource(name="plan_shuihServerImpl")
	private Plan_shuihServer shuihServer;
	private Plan_shuih jh;
	private Plan_lx_shuih lx;
	private String fileuploadFileName;
	private File fileupload;
	private String gydwdm;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	
	public void queryShuihwjById(){
		try {
			HttpServletResponse response = getresponse();
			response.setContentType("octets/stream");
			Plan_shuih shuih = shuihServer.queryShuihwjById(jh.getId());
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			byte[] file=null;
			if(jh.getGkbgmc()!=null){
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(jh.getGkbgmc().substring(0,jh.getGkbgmc().indexOf(".")).getBytes("gb2312"), "ISO-8859-1")+ jh.getGkbgmc().substring(jh.getGkbgmc().indexOf(".")));
				file=shuih.getGkbgwj();
			}else if(jh.getSjsgtmc()!=null){
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(jh.getSjsgtmc().substring(0,jh.getSjsgtmc().indexOf(".")).getBytes("gb2312"), "ISO-8859-1")+ jh.getSjsgtmc().substring(jh.getSjsgtmc().indexOf(".")));
				file=shuih.getSjsgtwj();
			}
			out.write(file);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void uploadShuihFile(){
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8"); 
			FileInputStream inputStream = null;
			byte [] file=null;
			if(uploadGk!=null){
				file =new byte[(int)uploadGk.length()];
				inputStream=new FileInputStream(uploadGk);
			}
			if(uploadSjt!=null){
				file=new byte[(int)uploadSjt.length()];
				inputStream=new FileInputStream(uploadSjt);
			}
			ByteArrayOutputStream byteOutpu=new ByteArrayOutputStream();
			int index=0;
			while((index=inputStream.read(file))!=-1){
				byteOutpu.write(file, 0, index);
			}
			if(uploadGkFileName!=null){
				jh.setGkbgmc(uploadGkFileName);
				jh.setGkbgwj(file);
			}
			if(uploadSjtFileName!=null){
				jh.setSjsgtmc(uploadSjtFileName);
				jh.setSjsgtwj(file);
			}
			shuihServer.uploadShuihFile(jh);
			response.getWriter().write(uploadGkFileName==null ? uploadSjtFileName : uploadGkFileName);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void querySumShuih(){
		try {
			JsonUtils.write(shuihServer.querySumShuih(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryShuihList(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		try {
			jsonMap.put("total", shuihServer.queryShuihCount(jh, lx));
			jsonMap.put("rows",shuihServer.queryShuihList(page, rows, jh, lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryShuihById(){
		try {
			JsonUtils.write(shuihServer.queryShuihById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryShuihNfs(){
		try {
			JsonUtils.write(shuihServer.queryShuihNfs(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropShuihById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("jh", new Boolean(shuihServer.dropShuihById(jh.getId())).toString());
			result.put("lx", new Boolean(shuihServer.dropShuihLxByJhid(jh.getId())).toString());
			JsonUtils.write(result,getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editShuihById(){
		try {
			JsonUtils.write(shuihServer.editShuihById(jh), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editShuihStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(shuihServer.editShuihStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void importShuih_jh(){
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
				dataMapArray = ExcelReader.readExcelContent(3,43,fs,Plan_gcsj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			String strVerify="";
			boolean boolJh=false,boolLx=false;
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			for (Map map : data) {
				UUID jhId = UUID.randomUUID(); 
				map.put("jhid", jhId.toString().replace("-", ""));
				map.put("gydwdm", getGydwdm());
				map.put("tbsj", new Date());
				map.put("1", map.get("1").toString().substring(0, map.get("1").toString().indexOf(".")));
				map.put("16", map.get("16").toString().substring(0, map.get("16").toString().indexOf(".")));
				map.put("22", map.get("22").toString().substring(0, map.get("22").toString().indexOf(".")));
				map.put("34", map.get("34").toString().substring(0, map.get("34").toString().indexOf(".")));
				map.put("35", map.get("35").toString().substring(0, map.get("35").toString().indexOf(".")));
				map.put("36", map.get("36").toString().substring(0, map.get("36").toString().indexOf(".")));
				Plan_lx_shuih shuih=new Plan_lx_shuih();
				shuih.setLxbm(map.get("3").toString());
				shuih.setQdzh(map.get("8").toString());
				shuih.setZdzh(map.get("9").toString());
				shuih.setGydwdm(map.get("gydwdm").toString());
				shuih.setJhid(map.get("22").toString());//此处的Jhid存储的是 “上报年份”
				if(shuihServer.queryJhExist(shuih)==0){
					strVerify=ImportVerify.shuihVerify(map);
					Plan_lx_shuih queryGPSBylxbm = shuihServer.queryGPSBylxbm(shuih);
					map.put("yjsdj", queryGPSBylxbm.getYjsdj());
					if(queryGPSBylxbm==null){
						strVerify+="路线【"+map.get("4").toString()+"】【"+map.get("8").toString()+"-"+map.get("9").toString()+"】不正确或不属于您的管辖内;";
					}else{
						if(!map.get("4").toString().equals(queryGPSBylxbm.getLxmc())){
							strVerify+="路线名称不正确;";
						}else if(!map.get("10").toString().equals(queryGPSBylxbm.getQzlc())){
							strVerify+="起止里程不正确;";
						}else{
							map.put("sfylsjl", shuihServer.queryJlBylx(shuih)>0 ?"是" :"否");
						}
					}
				}else{
					strVerify="路线【"+map.get("4").toString()+"】【"+map.get("8").toString()+"-"+map.get("9").toString()+"】已存在计划！";
				}
				
				if(!strVerify.equals("")){
					break;
				}
			}
			System.out.println(data);
			if(strVerify.equals("")){
				boolJh=shuihServer.insertShuih_Jh(data);
				boolLx=shuihServer.insertShuih_Lx(data);
			}
			//将数据插入到数据库
			if(boolJh && boolLx)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r\n"+strVerify);
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
	public Plan_shuihServer getShuihServer() {
		return shuihServer;
	}
	public void setShuihServer(Plan_shuihServer shuihServer) {
		this.shuihServer = shuihServer;
	}
	public Plan_shuih getJh() {
		return jh;
	}
	public void setJh(Plan_shuih jh) {
		this.jh = jh;
	}
	public Plan_lx_shuih getLx() {
		return lx;
	}
	public void setLx(Plan_lx_shuih lx) {
		this.lx = lx;
	}

	public String getGydwdm() {
		return gydwdm;
	}

	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}

	public File getUploadGk() {
		return uploadGk;
	}

	public void setUploadGk(File uploadGk) {
		this.uploadGk = uploadGk;
	}

	public String getUploadGkFileName() {
		return uploadGkFileName;
	}

	public void setUploadGkFileName(String uploadGkFileName) {
		this.uploadGkFileName = uploadGkFileName;
	}

	public File getUploadSjt() {
		return uploadSjt;
	}

	public void setUploadSjt(File uploadSjt) {
		this.uploadSjt = uploadSjt;
	}

	public String getUploadSjtFileName() {
		return uploadSjtFileName;
	}

	public void setUploadSjtFileName(String uploadSjtFileName) {
		this.uploadSjtFileName = uploadSjtFileName;
	}
}
