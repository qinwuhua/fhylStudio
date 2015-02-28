package com.hdsx.jxzhpt.jhgl.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
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
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
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
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	
	public void queryWjById(){
		try {
			HttpServletResponse response = getresponse();
			response.setContentType("octets/stream");
			Plan_gcsj gcsj = gcsjServer.queryWjById(jh.getId());
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			byte[] file=null;
			if(jh.getGkbgmc()!=null){
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(jh.getGkbgmc().substring(0,jh.getGkbgmc().indexOf(".")).getBytes("gb2312"), "ISO-8859-1")+ jh.getGkbgmc().substring(jh.getGkbgmc().indexOf(".")));
				file=gcsj.getGkbgwj();
			}else if(jh.getSjsgtmc()!=null){
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(jh.getSjsgtmc().substring(0,jh.getSjsgtmc().indexOf(".")).getBytes("gb2312"), "ISO-8859-1")+ jh.getSjsgtmc().substring(jh.getSjsgtmc().indexOf(".")));
				file=gcsj.getSjsgtwj();
			}
			out.write(file);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void uploadGcsjFile(){
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
			gcsjServer.uploadGcsjFile(jh);
			response.getWriter().write(uploadGkFileName==null ? uploadSjtFileName : uploadGkFileName);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
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
			Map<String, String> result=new HashMap<String, String>();
			result.put("jh", new Boolean(gcsjServer.dropGcsjById(jh.getId())).toString());
			result.put("lx", new Boolean(gcsjServer.dropGcsjLxByJhid(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
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
				map.put("tbsj", new Date());
				map.put("1", map.get("1").toString().substring(0, map.get("1").toString().indexOf(".")));
				map.put("15", map.get("15").toString().substring(0, map.get("15").toString().indexOf(".")));
				map.put("22", map.get("22").toString().substring(0, map.get("22").toString().indexOf(".")));
				map.put("40", map.get("40").toString().substring(0, map.get("40").toString().indexOf(".")));
				map.put("41", map.get("41").toString().substring(0, map.get("41").toString().indexOf(".")));
				map.put("42", map.get("42").toString().substring(0, map.get("42").toString().indexOf(".")));
				Plan_lx_gcsj lx=new Plan_lx_gcsj();
				lx.setXzqhdm(map.get("1").toString());
				lx.setLxbm(map.get("3").toString());
				lx.setQdzh(map.get("7").toString());
				lx.setZdzh(map.get("8").toString());
				lx.setGydwdm(map.get("gydwdm").toString());
				lx.setJhid(map.get("22").toString());//此处的Jhid存储的是 “上报年份”
				if(gcsjServer.queryJhExist(lx)==0){
					//内容验证
					strVerify=ImportVerify.gcsjVerify(map);
					//从计划中查询是否有此计划
					Plan_lx_gcsj queryGPSBylxbm = gcsjServer.queryGPSBylxbm(lx);
					if(queryGPSBylxbm==null){
						strVerify="路线【"+map.get("4").toString()+"】【"+map.get("7").toString()+"-"+map.get("8").toString()+"】不正确或不属于您的管辖内;";
					}else if(queryGPSBylxbm!=null && strVerify.equals("")){
						//验证一下信息是否相同
						if(map.get("5").toString().equals(queryGPSBylxbm.getYjsdj())){
							lx.setYjsdj(queryGPSBylxbm.getYjsdj());//技术等级
						}else{
							strVerify+="【"+map.get("4").toString()+"】中的技术等级与计划内的技术等级不符<br/>";
						}
						if(!map.get("4").toString().equals(queryGPSBylxbm.getLxmc())){
							strVerify+="【"+map.get("4").toString()+"】与计划内的路线名称不符<br/>";
						}else if(!map.get("9").toString().equals(queryGPSBylxbm.getQzlc())){
							strVerify+="【"+map.get("4").toString()+"】与计划内的起止里程不符<br/>";
						}else{
							map.put("sfylsjl", gcsjServer.queryJlBylx(lx)>0 ? "是" : "否");
						}
						//根据行政区划查询是否有特殊地区  此处存储的为特殊地区名称
						lx.setTsdqbm(gcsjServer.queryTsdqByXzqh(lx.getXzqhdm()));
						//设置非路网项目的查询条件
						Plan_flwbzbz flw=new Plan_flwbzbz();
						flw.setXmlx("工程改造路面升级");//建设项目类型
						flw.setGldj(lx.getLxbm().substring(0, 1));//公路等级
						flw.setJsdj(lx.getYjsdj());//技术等级
						flw.setTsdq(lx.getTsdqbm());
						Plan_flwbzbz flwResult=gcsjServer.queryBzzj(flw);
						if(flwResult==null){
							String gldj=null;
							if(flw.getGldj().equals("X"))
								gldj="县道";
							if(flw.getGldj().equals("S"))
								gldj="省道";
							if(flw.getGldj().equals("G"))
								gldj="国道";
							strVerify+="请先添加【"+gldj+"】技术等级【"+flw.getJsdj()+"】"+
									(flw.getTsdq()==null ? "" : "特殊地区为【"+flw.getTsdq()+"】")
									+"【"+flw.getXmlx()+"】项目的补助标准;";
						}else{
							//对金额进行技术验证
						}
					}
				}else{
					strVerify="路线【"+map.get("4").toString()+"】【"+map.get("7").toString()+"-"+map.get("8").toString()+"】已经存在计划！";
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
				response.getWriter().print(fileuploadFileName+"导入失败！</br>"+strVerify);
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
