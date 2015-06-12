package com.hdsx.jxzhpt.qqgl.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.xpath.operations.Bool;
import org.codehaus.jackson.annotate.JsonUnwrapped;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.impl.JhshServerImpl;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Scope("prototype")
@Controller
public class JhshController extends BaseActionSupport implements ModelDriven<Jhsh>{
	//回复数据集合
	private Map<String, Object> result=new HashMap<String, Object>();
	//计划审核对象
	private Jhsh jhsh=new Jhsh();
	@Override
	public Jhsh getModel() {
		return jhsh;
	}
	//分页参数
	private int page = 1;
	private int rows = 10;
	//上传文件对象参数
	private File uploadJhxd;
	private String uploadJhxdFileName;
	private File fileupload;
	private String fileuploadFileName;
	//数据访问对象
	@Resource(name="jhshServerImpl")
	private JhshServer jhshServer;
	/**
	 * 查询计划审核列表
	 * @throws Exception 
	 */
	public void queryJhsh() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try {
			jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(),"xzqhdm"));
			if(jhsh.getXmlx()==1){
				listData=jhshServer.queryJhshLmsj(jhsh,page,rows);
				total=jhshServer.queryJhshCountLmsj(jhsh);
			}else if(jhsh.getXmlx()==2){
				listData=jhshServer.queryJhshLmgz(jhsh,page,rows);
				total=jhshServer.queryJhshCountLmgz(jhsh);
			}else if(jhsh.getXmlx()==3){
				listData=jhshServer.queryJhshXj(jhsh,page,rows);
				total=jhshServer.queryJhshCountXj(jhsh);
			}
			result.put("total", total);
			result.put("rows", listData);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 计划下达，补充计划下达信息
	 * @throws Exception
	 */
	public void updateJhshxx() throws Exception{
		boolean b=false;
		try {
			List<Jhsh> list=new ArrayList<Jhsh>();
			list.add(jhsh);
			if(jhsh.getXmlx()==1){
				b=jhshServer.updateJhshxxLmsj(list);
			}else if(jhsh.getXmlx()==2){
				b=jhshServer.updateJhshxxLmgz(list);
			}else if(jhsh.getXmlx()==3){
				b=jhshServer.updateJhshxxXj(list);
			}
			result.put("result", new Boolean(b));
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码查询立项审核信息
	 * @throws Exception
	 */
	public void queryLxshByXmbm() throws Exception{
		try {
			Lxsh obj=null;
			if(jhsh.getXmlx()==1)
				obj=jhshServer.queryLxshLmsjByXmbm(jhsh.getXmbm());
			else if(jhsh.getXmlx()==2)
				obj=jhshServer.queryLxshLmgzByXmbm(jhsh.getXmbm());
			else if(jhsh.getXmlx()==3)
				obj=jhshServer.queryLxshXjByXmbm(jhsh.getXmbm());
			JsonUtils.write(obj, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码查询计划审核信息
	 * @throws Exception
	 */
	public void queryJhshxxByXmbm() throws Exception{
		try {
			Jhsh obj=new Jhsh();
			if(jhsh.getXmlx()==1){
				obj=jhshServer.queryJhshxxLmsjByXmbm(jhsh.getXmbm());
			}else if(jhsh.getXmlx()==2){
				obj=jhshServer.queryJhshxxLmgzByXmbm(jhsh.getXmbm());
			}else if(jhsh.getXmlx()==3){
				obj=jhshServer.queryJhshxxXjByXmbm(jhsh.getXmbm());
			}
			JsonUtils.write(obj, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 导出计划审核信息
	 */
	public void exportJhshxx(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[15];
		title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
		title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
		title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
		title[3]=new ExcelTitleCell("起点桩号",false, new ExcelCoordinate(0, (short)3), null,20);
		title[4]=new ExcelTitleCell("讫点桩号",false, new ExcelCoordinate(0, (short)4), null,20);
		title[5]=new ExcelTitleCell("开工时间",false, new ExcelCoordinate(0, (short)5), null,20);
		title[6]=new ExcelTitleCell("完工时间",false, new ExcelCoordinate(0, (short)6), null,20);
		title[7]=new ExcelTitleCell("工期",false, new ExcelCoordinate(0, (short)7), null,20);
		title[8]=new ExcelTitleCell("工可批复文号",false, new ExcelCoordinate(0, (short)8), null,20);
		title[9]=new ExcelTitleCell("设计批复文号",true, new ExcelCoordinate(0, (short)9), null,20);
		title[10]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)10), null,20);
		title[11]=new ExcelTitleCell("计划下达时间",false, new ExcelCoordinate(0, (short)11), null,20);
		title[12]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)12), null,20);
		title[13]=new ExcelTitleCell("部补助资金",false, new ExcelCoordinate(0, (short)13), null,20);
		title[14]=new ExcelTitleCell("省补助资金",false, new ExcelCoordinate(0, (short)14), null,20);
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "qdzh");//起点桩号
		attribute.put("4", "zdzh");//止点桩号
		attribute.put("5", "kgsj");//开工时间
		attribute.put("6", "wgsj");//完工时间
		attribute.put("7", "gq");//工期
		attribute.put("8", "gkpfwh");//工可批复文号
		attribute.put("9", "sjpfwh");//设计批复文号
		attribute.put("10", "xdwh");//计划下达文号
		attribute.put("11", "xdsj");//计划下达时间
		attribute.put("12", "pfztz");//批复总投资
		attribute.put("13", "bbzzj");//部补助资金
		attribute.put("14", "sbzzj");//省补助资金
		jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(),"xzqhdm"));
		List<Object> excelData=new ArrayList<Object>();
		String titleName="";
		String fileName="";
		if(jhsh.getXmlx()==1){
			excelData.addAll(jhshServer.queryJhshLmsj(jhsh, 0, 0));
			titleName="升级改造工程项目";
			fileName="升级改造工程项目-计划下达";
		}
		else if(jhsh.getXmlx()==2){
			excelData.addAll(jhshServer.queryJhshLmgz(jhsh, 0, 0));
			titleName="路面改造工程项目";
			fileName="路面改造工程项目-计划下达";
		}
		else if(jhsh.getXmlx()==3){
			excelData.addAll(jhshServer.queryJhshXj(jhsh, 0, 0));
			titleName="新建工程项目";
			fileName="新建工程项目-计划下达";
		}
		ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, fileName, getresponse());
	}
	public void exportZjxd(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[12];
		title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
		title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
		title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
		title[3]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)3), null,20);
		title[4]=new ExcelTitleCell("计划下达时间",false, new ExcelCoordinate(0, (short)4), null,20);
		title[5]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)5), null,20);
		title[6]=new ExcelTitleCell("部补助资金",false, new ExcelCoordinate(0, (short)6), null,20);
		title[7]=new ExcelTitleCell("省补助资金",false, new ExcelCoordinate(0, (short)7), null,20);
		title[8]=new ExcelTitleCell("下达年份",false, new ExcelCoordinate(0, (short)8), null,20);
		title[9]=new ExcelTitleCell("下达总投资",false, new ExcelCoordinate(0, (short)9), null,20);
		title[10]=new ExcelTitleCell("下达车购税",false, new ExcelCoordinate(0, (short)10), null,20);
		title[11]=new ExcelTitleCell("下达省投资",false, new ExcelCoordinate(0, (short)11), null,20);
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "xdwh");//计划下达文号
		attribute.put("4", "xdsj");//计划下达时间
		attribute.put("5", "pfztz");//批复总投资
		attribute.put("6", "bbzzj");//部补助资金
		attribute.put("7", "sbzzj");//省补助资金
		jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(),"xzqhdm"));
		List<Object> excelData=new ArrayList<Object>();
		String titleName="";
		String fileName="";
		if(jhsh.getXmlx()==1){
			excelData.addAll(jhshServer.queryJhshLmsj(jhsh, 0, 0));
			titleName="升级改造工程项目";
			fileName="升级改造工程项目-资金下达";
		}
		else if(jhsh.getXmlx()==2){
			excelData.addAll(jhshServer.queryJhshLmgz(jhsh, 0, 0));
			titleName="路面改造工程项目";
			fileName="路面改造工程项目-资金下达";
		}
		else if(jhsh.getXmlx()==3){
			excelData.addAll(jhshServer.queryJhshXj(jhsh, 0, 0));
			titleName="新建工程项目";
			fileName="新建工程项目-资金下达";
		}
		ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, fileName, getresponse());
	}
	/**
	 * 导入计划审核信息
	 * @throws Exception
	 */
	public void importExcelJhxd() throws Exception{
		ExcelEntity excel=new ExcelEntity();
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "qdzh");//起点桩号
		attribute.put("4", "zdzh");//止点桩号
		attribute.put("5", "kgsj");//开工时间
		attribute.put("6", "wgsj");//完工时间
		attribute.put("7", "gq");//工期
		attribute.put("8", "gkpfwh");//工可批复文号
		attribute.put("9", "sjpfwh");//设计批复文号
		attribute.put("10", "xdwh");//计划下达文号
		attribute.put("11", "xdsj");//计划下达时间
		attribute.put("12", "pfztz");//批复总投资
		attribute.put("13", "bbzzj");//部补助资金
		attribute.put("14", "sbzzj");//省补助资金
		excel.setAttributes(attribute);
		try {
			boolean b=false;
			List<Jhsh> readerExcel = ExcelImportUtil.readerExcel(fileupload, Jhsh.class, 1, excel);
			for (Jhsh item : readerExcel) {
				item.setXdzt(1);
			}
			if(jhsh.getXmlx()==1){
				b=jhshServer.updateJhshxxLmsj(readerExcel);
			}else if(jhsh.getXmlx()==2){
				b=jhshServer.updateJhshxxLmgz(readerExcel);
			}else if(jhsh.getXmlx()==3){
				b=jhshServer.updateJhshxxXj(readerExcel);
			}
			if(b){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
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
	//get set 方法
	public Jhsh getJhsh() {
		return jhsh;
	}
	public void setJhsh(Jhsh jhsh) {
		this.jhsh = jhsh;
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
	public File getUploadJhxd() {
		return uploadJhxd;
	}
	public void setUploadJhxd(File uploadJhxd) {
		this.uploadJhxd = uploadJhxd;
	}
	public String getUploadJhxdFileName() {
		return uploadJhxdFileName;
	}
	public void setUploadJhxdFileName(String uploadJhxdFileName) {
		this.uploadJhxdFileName = uploadJhxdFileName;
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
}
