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
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
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
	//分页参数
	private int page = 1;
	private int rows = 10;
	//上传文件对象参数
	private File uploadSjpf;
	private String uploadSjpfFileName;
	//数据访问对象
	@Resource(name="cbsjServerImpl")
	private CbsjServer cbsjServer;
	/**
	 * 分页查询路面升级项目信息
	 * @throws Exception
	 */
	public void queryCbsj() throws Exception{
		try {
			cbsj.setXzqhdm(xzqhBm(cbsj.getXzqhdm(),"xzqhdm"));
			//分页查询信息列表
			result.put("rows", cbsjServer.queryCbsjLmgz(cbsj, page, rows));
			//查询信息总数量
			result.put("total", cbsjServer.queryCbsjLmgzCount(cbsj));
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
	public void queryCbsjLmgzByXmbm() throws Exception{
		Cbsj object= cbsjServer.queryCbsjLmgzByXmbm(cbsj.getXmbm());
		try {
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
	public void updateCbsjLmgz() throws Exception{
		try{
			boolean b = cbsjServer.updateCbsjLmgz(cbsj);
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
	public void deleteLmgzByXmbm() throws Exception{
		try {
			boolean b=cbsjServer.deleteLmgzByXmbm(cbsj.getXmbm());
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
	public void uploadSjpf() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		Plan_upload uploads;
		response.setCharacterEncoding("utf-8"); 
		FileInputStream inputStream = null;
		byte [] file=new byte[(int)uploadSjpf.length()];
		try {
			inputStream=new FileInputStream(uploadSjpf);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw e;
		}
		ByteArrayOutputStream byteOutpu=new ByteArrayOutputStream();
		int index=0;
		try {
			while((index=inputStream.read(file))!=-1){
				byteOutpu.write(file, 0, index);
			}
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
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
	}
	public void queryFileByXmbm() throws Exception{
		try {
			List<Plan_upload> list = cbsjServer.queryFileByXmbm(cbsj.getXmbm());
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
}
