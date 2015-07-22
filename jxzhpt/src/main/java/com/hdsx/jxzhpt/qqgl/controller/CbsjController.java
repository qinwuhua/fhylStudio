package com.hdsx.jxzhpt.qqgl.controller;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
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
	//导入Excel
	private String fileuploadFileName;
	private File fileupload;
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
			lx.setYilc(cbsj.getYilc());
			lx.setErlc(cbsj.getErlc());
			lx.setSanlc(cbsj.getSanlc());
			lx.setSilc(cbsj.getSilc());
			lx.setDwlc(cbsj.getDwlc());
			lx.setWllc(cbsj.getWllc());
			lx.setJhyilc(cbsj.getJhyilc());
			lx.setJherlc(cbsj.getJherlc());
			lx.setJhsanlc(cbsj.getJhsanlc());
			lx.setJhsilc(cbsj.getJhsilc());
			lx.setJhdwlc(cbsj.getJhdwlc());
			lx.setJhwllc(cbsj.getJhwllc());
			lx.setLc(cbsj.getLc());
			lx.setSffirst("1");
			lx.setJdbs(cbsj.getJdbs());
			System.out.println("里程："+cbsj.getLc());
			if(cbsj.getXmlx()==1){
				lx.setJhyilc(cbsj.getJhyilc());
				lx.setJherlc(cbsj.getJherlc());
				lx.setJhsanlc(cbsj.getJhsanlc());
				lx.setJhsilc(cbsj.getJhsilc());
				lx.setJhdwlc(cbsj.getJhdwlc());
				lx.setJhwllc(cbsj.getJhwllc());
				b = cbsjServer.updateCbsjLmsj(cbsj);
			}else if(cbsj.getXmlx()==2){
				b=cbsjServer.updateCbsjLmgz(cbsj);
			}else if(cbsj.getXmlx()==3){
				lx.setXjlxbm(cbsj.getXjlxbm());
				lx.setXjqdzh(cbsj.getXjqdzh());
				lx.setXjzdzh(cbsj.getXjzdzh());
				int xjlc=Integer.parseInt(cbsj.getXjzdzh())-Integer.parseInt(cbsj.getXjqdzh());
				lx.setXjlc(cbsj.getXjlc()==null ? new Integer(xjlc).toString() : cbsj.getXjlc());
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
	public void exportExcelCbsj(){
		try {
			ExcelTitleCell [] title=null;
			Map<String, String> attribute=null;
			if(cbsj.getXmlx()<=3){
				title=new ExcelTitleCell[36];
				title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
				title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
				title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
				title[3]=new ExcelTitleCell("建设单位",false, new ExcelCoordinate(0, (short)3), null,20);
				title[4]=new ExcelTitleCell("建设技术等级",false, new ExcelCoordinate(0, (short)4), null,20);
				title[5]=new ExcelTitleCell("建设性质",false, new ExcelCoordinate(0, (short)5), null,20);
				title[6]=new ExcelTitleCell("起点桩号",false, new ExcelCoordinate(0, (short)6), null,20);
				title[7]=new ExcelTitleCell("讫点桩号",false, new ExcelCoordinate(0, (short)7), null,20);
				title[8]=new ExcelTitleCell("路基(m3)",false, new ExcelCoordinate(0, (short)8), null,20);
				title[9]=new ExcelTitleCell("桥梁(座)",false, new ExcelCoordinate(0, (short)9), null,20);
				title[10]=new ExcelTitleCell("桥梁延米",false, new ExcelCoordinate(0, (short)10), null,20);
				title[11]=new ExcelTitleCell("涵洞(座)",false, new ExcelCoordinate(0, (short)11), null,20);
				title[12]=new ExcelTitleCell("涵洞米",false, new ExcelCoordinate(0, (short)12), null,20);
				title[13]=new ExcelTitleCell("隧道(座)",false, new ExcelCoordinate(0, (short)13), null,20);
				title[14]=new ExcelTitleCell("隧道延米",false, new ExcelCoordinate(0, (short)14), null,20);
				title[15]=new ExcelTitleCell("面层类型",false, new ExcelCoordinate(0, (short)15), null,20);
				title[16]=new ExcelTitleCell("面层里程",false, new ExcelCoordinate(0, (short)16), null,20);
				title[17]=new ExcelTitleCell("基层类型",false, new ExcelCoordinate(0, (short)17), null,20);
				title[18]=new ExcelTitleCell("基层里程",false, new ExcelCoordinate(0, (short)18), null,20);
				title[19]=new ExcelTitleCell("垫层类型",false, new ExcelCoordinate(0, (short)19), null,20);
				title[20]=new ExcelTitleCell("垫层里程",false, new ExcelCoordinate(0, (short)20), null,20);
				title[21]=new ExcelTitleCell("大桥名称",false, new ExcelCoordinate(0, (short)21), null,20);
				title[22]=new ExcelTitleCell("大桥长度",false, new ExcelCoordinate(0, (short)22), null,20);
				title[23]=new ExcelTitleCell("大桥单跨",false, new ExcelCoordinate(0, (short)23), null,20);
				title[24]=new ExcelTitleCell("隧道名称",false, new ExcelCoordinate(0, (short)24), null,20);
				title[25]=new ExcelTitleCell("隧道双幅长度",false, new ExcelCoordinate(0, (short)25), null,20);
				title[26]=new ExcelTitleCell("隧道类型",false, new ExcelCoordinate(0, (short)26), null,20);
				title[27]=new ExcelTitleCell("开工时间",false, new ExcelCoordinate(0, (short)27), null,20);
				title[28]=new ExcelTitleCell("完工时间",false, new ExcelCoordinate(0, (short)28), null,20);
				title[29]=new ExcelTitleCell("工期",false, new ExcelCoordinate(0, (short)29), null,20);
				title[30]=new ExcelTitleCell("设计单位",false, new ExcelCoordinate(0, (short)30), null,20);
				title[31]=new ExcelTitleCell("设计批复文号",false, new ExcelCoordinate(0, (short)31), null,20);
				title[32]=new ExcelTitleCell("批复时间",false, new ExcelCoordinate(0, (short)32), null,20);
				title[33]=new ExcelTitleCell("建安费",false, new ExcelCoordinate(0, (short)33), null,20);
				title[34]=new ExcelTitleCell("地方自筹",false, new ExcelCoordinate(0, (short)34), null,20);
				title[35]=new ExcelTitleCell("银行贷款",false, new ExcelCoordinate(0, (short)35), null,20);
				//设置列与字段对应
				attribute=new HashMap<String, String>();
				attribute.put("0", "xmmc");//项目名称
				attribute.put("1", "xmbm");//项目编码
				attribute.put("2", "xzqh");//行政区划
				attribute.put("3", "jsdw");
				attribute.put("4", "jsjsdj");
				attribute.put("5", "jsxz");
				attribute.put("6", "qdzh");
				attribute.put("7", "zdzh");
				attribute.put("8", "lj");
				attribute.put("9", "ql");
				attribute.put("10", "ql_ym");
				attribute.put("11", "hd");
				attribute.put("12", "hd_m");
				attribute.put("13", "sd");
				attribute.put("14", "sd_ym");
				attribute.put("15", "mc");
				attribute.put("16", "mc_lc");
				attribute.put("17", "jc");
				attribute.put("18", "jc_lc");
				attribute.put("19", "dc");
				attribute.put("20", "dc_lc");
				attribute.put("21", "dq");
				attribute.put("22", "dq_cd");
				attribute.put("23", "dq_dk");
				attribute.put("24", "sdmc");
				attribute.put("25", "sd_sfcd");
				attribute.put("26", "sd_lx");
				attribute.put("27", "kgsj");
				attribute.put("28", "wgsj");
				attribute.put("29", "gq");
				attribute.put("30", "sjdw");
				attribute.put("31", "sjpfwh");
				attribute.put("32", "pfsj");
				attribute.put("33", "jaf");
				attribute.put("34", "dfzc");
				attribute.put("35", "yhdk");
			}else{
				title=new ExcelTitleCell[22];
				title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
				title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
				title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
				title[3]=new ExcelTitleCell("建设单位",false, new ExcelCoordinate(0, (short)3), null,20);
				title[4]=new ExcelTitleCell("建设技术等级",false, new ExcelCoordinate(0, (short)4), null,20);
				title[5]=new ExcelTitleCell("建设性质",false, new ExcelCoordinate(0, (short)5), null,20);
				title[6]=new ExcelTitleCell("起点桩号",false, new ExcelCoordinate(0, (short)6), null,20);
				title[7]=new ExcelTitleCell("讫点桩号",false, new ExcelCoordinate(0, (short)7), null,20);
				title[8]=new ExcelTitleCell("里程",false, new ExcelCoordinate(0, (short)8), null,20);
				title[9]=new ExcelTitleCell("面层类型",false, new ExcelCoordinate(0, (short)9), null,20);
				title[10]=new ExcelTitleCell("面层里程",false, new ExcelCoordinate(0, (short)10), null,20);
				title[11]=new ExcelTitleCell("基层类型",false, new ExcelCoordinate(0, (short)11), null,20);
				title[12]=new ExcelTitleCell("基层里程",false, new ExcelCoordinate(0, (short)12), null,20);
				title[13]=new ExcelTitleCell("垫层类型",false, new ExcelCoordinate(0, (short)13), null,20);
				title[14]=new ExcelTitleCell("垫层里程",false, new ExcelCoordinate(0, (short)14), null,20);
				title[15]=new ExcelTitleCell("开工时间",false, new ExcelCoordinate(0, (short)15), null,20);
				title[16]=new ExcelTitleCell("完工时间",false, new ExcelCoordinate(0, (short)16), null,20);
				title[17]=new ExcelTitleCell("工期",false, new ExcelCoordinate(0, (short)17), null,20);
				title[18]=new ExcelTitleCell("设计单位",false, new ExcelCoordinate(0, (short)18), null,20);
				title[19]=new ExcelTitleCell("设计批复文号",false, new ExcelCoordinate(0, (short)19), null,20);
				title[20]=new ExcelTitleCell("批复时间",false, new ExcelCoordinate(0, (short)20), null,20);
				title[21]=new ExcelTitleCell("建设方案",false, new ExcelCoordinate(0, (short)21), null,20);
				//设置列与字段对应
				attribute=new HashMap<String, String>();
				attribute.put("0", "xmmc");//项目名称
				attribute.put("1", "xmbm");//项目编码
				attribute.put("2", "xzqh");//行政区划
				attribute.put("3", "jsdw");
				attribute.put("4", "jsjsdj");
				attribute.put("5", "jsxz");
				attribute.put("6", "qdzh");
				attribute.put("7", "zdzh");
				attribute.put("8", "lc");
				attribute.put("9", "mc");
				attribute.put("10", "mc_lc");
				attribute.put("11", "jc");
				attribute.put("12", "jc_lc");
				attribute.put("13", "dc");
				attribute.put("14", "dc_lc");
				attribute.put("15", "kgsj");
				attribute.put("16", "wgsj");
				attribute.put("17", "gq");
				attribute.put("18", "sjdw");
				attribute.put("19", "sjpfwh");
				attribute.put("20", "pfsj");
				attribute.put("21", "jsfa");
			}
			cbsj.setXzqhdm(xzqhBm(cbsj.getXzqhdm(),"xzqhdm"));
			//数据
			List<Object> excelData=new ArrayList<Object>();
			//设置标题、文件名称
			String titleName="";
			String fileName="";
			if(cbsj.getXmlx()==1){
				titleName="改建工程项目";
				fileName="改建工程项目初步设计或施工图设计";
				excelData = cbsjServer.queryLmsjExcel(cbsj);
			}else if(cbsj.getXmlx()==2){
				titleName="路面改造工程";
				fileName="路面改造初步设计或施工图设计";
				excelData = cbsjServer.queryLmgzExcel(cbsj);
			}else if(cbsj.getXmlx()==3){
				titleName="新建工程";
				fileName="新建初步设计或施工图设计";
				excelData = cbsjServer.queryXjExcel(cbsj);
			}else if(cbsj.getXmlx()==4){
				titleName="养护大中修";
				fileName="养护大中修初步设计或施工图设计";
				excelData = cbsjServer.queryYhdzxExcel(cbsj);
			}else if(cbsj.getXmlx()==5){
				titleName="灾毁重建";
				fileName="灾毁重建初步设计或施工图设计";
				excelData = cbsjServer.queryShExcel(cbsj);
			}
			
			ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
			ExcelExportUtil.excelWrite(excel, fileName, getresponse());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导入养护大中修初步设计
	 */
	@SuppressWarnings("unchecked")
	public void importExcelYhdzxCbsj(){
		HashMap<String, String> attribute = new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "jsdw");
		attribute.put("4", "jsjsdj");
		attribute.put("5", "jsxz");
		attribute.put("6", "qdzh");
		attribute.put("7", "zdzh");
		attribute.put("8", "lc");
		attribute.put("9", "mc");
		attribute.put("10", "mc_lc");
		attribute.put("11", "jc");
		attribute.put("12", "jc_lc");
		attribute.put("13", "dc");
		attribute.put("14", "dc_lc");
		attribute.put("15", "kgsj");
		attribute.put("16", "wgsj");
		attribute.put("17", "gq");
		attribute.put("18", "sjdw");
		attribute.put("19", "sjpfwh");
		attribute.put("20", "pfsj");
		attribute.put("21", "jsfa");
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readerExcel(fileupload, Cbsj.class, 1, excel);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(cbsjServer.updateCbsjYhdzx(list) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入灾毁重建初步设计
	 */
	@SuppressWarnings("unchecked")
	public void importExcelShCbsj(){
		HashMap<String, String> attribute = new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "jsdw");
		attribute.put("4", "jsjsdj");
		attribute.put("5", "jsxz");
		attribute.put("6", "qdzh");
		attribute.put("7", "zdzh");
		attribute.put("8", "lc");
		attribute.put("9", "mc");
		attribute.put("10", "mc_lc");
		attribute.put("11", "jc");
		attribute.put("12", "jc_lc");
		attribute.put("13", "dc");
		attribute.put("14", "dc_lc");
		attribute.put("15", "kgsj");
		attribute.put("16", "wgsj");
		attribute.put("17", "gq");
		attribute.put("18", "sjdw");
		attribute.put("19", "sjpfwh");
		attribute.put("20", "pfsj");
		attribute.put("21", "jsfa");
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readerExcel(fileupload, Cbsj.class, 1, excel);
			List<Lx> lxlist = new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(cbsjServer.updateCbsjSh(list) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入路面改造初步设计
	 */
	@SuppressWarnings("unchecked")
	public void importExcelLmgzCbsj(){
		HashMap<String, String> attribute = new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "jsdw");
		attribute.put("4", "jsjsdj");
		attribute.put("5", "jsxz");
		attribute.put("6", "qdzh");
		attribute.put("7", "zdzh");
		attribute.put("8", "lj");
		attribute.put("9", "ql");
		attribute.put("10", "ql_ym");
		attribute.put("11", "hd");
		attribute.put("12", "hd_m");
		attribute.put("13", "sd");
		attribute.put("14", "sd_ym");
		attribute.put("15", "mc");
		attribute.put("16", "mc_lc");
		attribute.put("17", "jc");
		attribute.put("18", "jc_lc");
		attribute.put("19", "dc");
		attribute.put("20", "dc_lc");
		attribute.put("21", "dq");
		attribute.put("22", "dq_cd");
		attribute.put("23", "dq_dk");
		attribute.put("24", "sdmc");
		attribute.put("25", "sd_sfcd");
		attribute.put("26", "sd_lx");
		attribute.put("27", "kgsj");
		attribute.put("28", "wgsj");
		attribute.put("29", "gq");
		attribute.put("30", "sjdw");
		attribute.put("31", "sjpfwh");
		attribute.put("32", "pfsj");
		attribute.put("33", "jaf");
		attribute.put("34", "dfzc");
		attribute.put("35", "yhdk");
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readerExcel(fileupload, Cbsj.class, 1, excel);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(cbsjServer.updateCbsjLmgz(list) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入升级初步设计
	 */
	@SuppressWarnings("unchecked")
	public void importExcelLmsjCbsj(){
		HashMap<String, String> attribute = new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "jsdw");
		attribute.put("4", "jsjsdj");
		attribute.put("5", "jsxz");
		attribute.put("6", "qdzh");
		attribute.put("7", "zdzh");
		attribute.put("8", "lj");
		attribute.put("9", "ql");
		attribute.put("10", "ql_ym");
		attribute.put("11", "hd");
		attribute.put("12", "hd_m");
		attribute.put("13", "sd");
		attribute.put("14", "sd_ym");
		attribute.put("15", "mc");
		attribute.put("16", "mc_lc");
		attribute.put("17", "jc");
		attribute.put("18", "jc_lc");
		attribute.put("19", "dc");
		attribute.put("20", "dc_lc");
		attribute.put("21", "dq");
		attribute.put("22", "dq_cd");
		attribute.put("23", "dq_dk");
		attribute.put("24", "sdmc");
		attribute.put("25", "sd_sfcd");
		attribute.put("26", "sd_lx");
		attribute.put("27", "kgsj");
		attribute.put("28", "wgsj");
		attribute.put("29", "gq");
		attribute.put("30", "sjdw");
		attribute.put("31", "sjpfwh");
		attribute.put("32", "pfsj");
		attribute.put("33", "jaf");
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readerExcel(fileupload, Cbsj.class, 1, excel);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(cbsjServer.updateCbsjLmsj(list) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入新建项目初步设计
	 */
	@SuppressWarnings("unchecked")
	public void importExcelXjCbsj(){
		HashMap<String, String> attribute = new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "jsdw");
		attribute.put("4", "jsjsdj");
		attribute.put("5", "jsxz");
		attribute.put("6", "qdzh");
		attribute.put("7", "zdzh");
		attribute.put("8", "lj");
		attribute.put("9", "ql");
		attribute.put("10", "ql_ym");
		attribute.put("11", "hd");
		attribute.put("12", "hd_m");
		attribute.put("13", "sd");
		attribute.put("14", "sd_ym");
		attribute.put("15", "mc");
		attribute.put("16", "mc_lc");
		attribute.put("17", "jc");
		attribute.put("18", "jc_lc");
		attribute.put("19", "dc");
		attribute.put("20", "dc_lc");
		attribute.put("21", "dq");
		attribute.put("22", "dq_cd");
		attribute.put("23", "dq_dk");
		attribute.put("24", "sdmc");
		attribute.put("25", "sd_sfcd");
		attribute.put("26", "sd_lx");
		attribute.put("27", "kgsj");
		attribute.put("28", "wgsj");
		attribute.put("29", "gq");
		attribute.put("30", "sjdw");
		attribute.put("31", "sjpfwh");
		attribute.put("32", "pfsj");
		attribute.put("33", "jaf");
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readerExcel(fileupload, Cbsj.class, 1, excel);
			List<Lx> lxlist=new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(cbsjServer.updateCbsjXj(list) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
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
