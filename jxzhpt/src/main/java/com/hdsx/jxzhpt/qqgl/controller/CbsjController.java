package com.hdsx.jxzhpt.qqgl.controller;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Scope("prototype")
@Controller
public class CbsjController extends BaseActionSupport implements ModelDriven<Cbsj>{
	//回复数据集合
	private Map<String, Object> result=new HashMap<String, Object>();
	//初步设计路面升级对象
	private Cbsj cbsj=new Cbsj();
	private Plan_upload file;
	//分页参数
	private int page = 1;
	private int rows = 10;
	//上报审核状态，批量操作
	private String sbzt1;
	private String shzt1;
	//上传文件对象参数
	private File uploadSjpf;
	private String uploadSjpfFileName;
	//数据访问对象
	@Resource(name="cbsjServerImpl")
	private CbsjServer cbsjServer;
	@Resource(name="jhshServerImpl")
	private JhshServer jhshServer;
	//路线参数
	private String jdbs;//阶段标示
	/**
	 * 分页查询路面升级项目信息
	 * @throws Exception
	 */
	public void queryCbsj() throws Exception{
		try {
			cbsj.setXzqhdm(xzqhBm(cbsj.getXzqhdm(),"xzqhdm"));
			List<Cbsj> resultData=null;
			int total=0;
			if(cbsj.getXmlx()==1){
				resultData=cbsjServer.queryCbsjLmsj(cbsj, page, rows);
				total=cbsjServer.queryCbsjLmsjCount(cbsj);
			}else if(cbsj.getXmlx()==2){
				resultData = cbsjServer.queryCbsjLmgz(cbsj, page, rows);
				total = cbsjServer.queryCbsjLmgzCount(cbsj);
			}else if(cbsj.getXmlx()==3){
				resultData = cbsjServer.queryCbsjXj(cbsj, page, rows);
				total = cbsjServer.queryCbsjXjCount(cbsj);
			}else if(cbsj.getXmlx()==4){
				resultData = cbsjServer.queryCbsjYhdzx(cbsj, page, rows);
				total = cbsjServer.queryCbsjYhdzxCount(cbsj);
			}else if(cbsj.getXmlx()==5){
				resultData = cbsjServer.queryCbsjSh(cbsj, page, rows);
				total = cbsjServer.queryCbsjShCount(cbsj);
			}
			result.put("rows", resultData);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码查询计划初步设计信息
	 * @throws Exception
	 */
	public void queryCbsjByXmbm() throws Exception{
		Cbsj object=new Cbsj();
		try {
			if(cbsj.getXmlx()==1){
				object=cbsjServer.queryCbsjLmsjByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==2){
				object = cbsjServer.queryCbsjLmgzByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==3){
				object =cbsjServer.queryCbsjXjByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==4){
				object =cbsjServer.queryCbsjYhdzxByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==5){
				object =cbsjServer.queryCbsjShByXmbm(cbsj.getXmbm());
			}
			if(object!=null)
				object.setXmlx(cbsj.getXmlx());
			JsonUtils.write(object, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 修改路面改造初步设计信息
	 * @throws Exception
	 */
	public void updateCbsj() throws Exception{
		try{
			boolean b = false;
			//准备路线桩号信息
			Lx lx=new Lx();
			lx.setQdzh(cbsj.getQdzh());
			lx.setZdzh(cbsj.getZdzh());
			lx.setXmid(cbsj.getXmbm());
			lx.setQdmc(cbsj.getQdmc());
			lx.setZdmc(cbsj.getZdmc());
			lx.setSffirst("1");
			lx.setJdbs(jdbs);
			
			if(cbsj.getXmlx()==1){
				b = cbsjServer.updateCbsjLmsj(cbsj);
			}else if(cbsj.getXmlx()==2){
				b=cbsjServer.updateCbsjLmgz(cbsj);
			}else if(cbsj.getXmlx()==3){
				b=cbsjServer.updateCbsjXj(cbsj);
			}else if(cbsj.getXmlx()==4){
				b=cbsjServer.updateCbsjYhdzx(cbsj);
			}else if(cbsj.getXmlx()==5){
				b=cbsjServer.updateCbsjSh(cbsj);
			}
			if(b){
				jhshServer.updateLx(lx);
			}
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码删除信息
	 * @throws Exception
	 */
	public void deleteCbsjByXmbm() throws Exception{
		try {
			boolean b=false;
			if(cbsj.getXmlx()==1){
				b=cbsjServer.deleteLmsjByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==2){
				b = cbsjServer.deleteLmgzByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==3){
				b = cbsjServer.deleteXjByXmbm(cbsj.getXmbm());
			}
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 审核流程，修改上报、审核状态
	 * @throws Exception 
	 */
	public void shCbsjByXmbm() throws Exception{
		try {
			boolean b=false;
			if(cbsj.getXmlx()==1){
				b=cbsjServer.shCbsjLmsjByXmbm(cbsj,sbzt1,shzt1);
				if(b && (shzt1!=null && !shzt1.equals(""))){
					jhshServer.insertJhshLmsjFromCbsj(cbsj.getXmbm());
				}
			}else if(cbsj.getXmlx()==2){
				b = cbsjServer.shCbsjLmgzByXmbm(cbsj,sbzt1,shzt1);
				if(b && (shzt1!=null && !shzt1.equals(""))){
					jhshServer.insertJhshLmgzFromCbsj(cbsj.getXmbm());
				}
			}else if(cbsj.getXmlx()==3){
				b = cbsjServer.shCbsjXjByXmbm(cbsj,sbzt1,shzt1);
				if(b && (shzt1!=null && !shzt1.equals(""))){
					jhshServer.insertJhshXjFromCbsj(cbsj.getXmbm());
				}
			}else if(cbsj.getXmlx()==4){
				b = cbsjServer.shCbsjYhdzxByXmbm(cbsj,shzt1);
				jhshServer.insertJhshYhdzxFromCbsj(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==5){
				b = cbsjServer.shCbsjShByXmbm(cbsj,shzt1);
				jhshServer.insertJhshShFromCbsj(cbsj.getXmbm());
			}
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 上传设计批复文件
	 * @throws IOException 
	 */
	public void uploadSjpf() throws Exception{
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			Plan_upload uploads;
			response.setCharacterEncoding("utf-8"); 
			FileInputStream inputStream = null;
			byte [] file=new byte[(int)uploadSjpf.length()];
			inputStream=new FileInputStream(uploadSjpf);
			ByteArrayOutputStream byteOutpu=new ByteArrayOutputStream();
			int index=0;
			while((index=inputStream.read(file))!=-1){
				byteOutpu.write(file, 0, index);
			}
			uploads=new Plan_upload();
			uploads.setParentid(cbsj.getXmbm());
			uploads.setFiledata(file);
			uploads.setFiletype("设计批复文件");
			uploads.setFilename(uploadSjpfFileName);
			boolean result = cbsjServer.insertFile(uploads);
			if(result){
				response.getWriter().print(uploadSjpfFileName+"导入成功");
			}else{
				response.getWriter().print(uploadSjpfFileName+"导入成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void queryFileByXmbm() throws Exception{
		try {
			List<Plan_upload> list = cbsjServer.queryFileByXmbm(file);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 处理行政区划编码为条件语句
	 * @param bh
	 * @param name
	 * @return
	 */
	public String xzqhBm(String bh,String name){
		String result=null;
		if(bh!=null){
			if(bh.indexOf(",")==-1){
				int i=0;
				if(bh.matches("^[0-9]*[1-9]00$")){
					i=2;
				}else if(bh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				bh=bh.substring(0,bh.length()-i);
			}
			result= bh.indexOf(",")==-1 ? " l."+name+" like '%"+bh+"%'": "l."+name+" in ("+bh+")";
		}
		return result;
	}

	//get set方法
	public Cbsj getCbsj() {
		return cbsj;
	}
	public void setCbsj(Cbsj cbsj) {
		this.cbsj = cbsj;
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
	@Override
	public Cbsj getModel() {
		return cbsj;
	}
	public File getUploadSjpf() {
		return uploadSjpf;
	}
	public void setUploadSjpf(File uploadSjpf) {
		this.uploadSjpf = uploadSjpf;
	}
	public String getUploadSjpfFileName() {
		return uploadSjpfFileName;
	}
	public void setUploadSjpfFileName(String uploadSjpfFileName) {
		this.uploadSjpfFileName = uploadSjpfFileName;
	}
	public String getSbzt1() {
		return sbzt1;
	}
	public void setSbzt1(String sbzt1) {
		this.sbzt1 = sbzt1;
	}
	public String getShzt1() {
		return shzt1;
	}
	public void setShzt1(String shzt1) {
		this.shzt1 = shzt1;
	}
	public Plan_upload getFile() {
		return file;
	}
	public void setFile(Plan_upload file) {
		this.file = file;
	}
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
}
