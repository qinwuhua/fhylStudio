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
			String fileTitle="";
			if(cbsj.getXmlx()==1){
				fileTitle="<title=项目名称,fieid=xmmc>,<title=项目编码,fieid=xmbm>,<title=行政区划,fieid=xzqh>,<title=建设单位,fieid=jsdw>,<title=建设技术等级,fieid=jsjsdj>,<title=建设性质,fieid=jsxz>,<title=路线编码,fieid=ylxbh>,<title=起点桩号,fieid=qdzh>,<title=止点桩号,fieid=zdzh>,<title=里程,fieid=lc>,<title=一级公路,fieid=yilc>,<title=二级公路,fieid=erlc>,<title=三级公路,fieid=sanlc>,<title=四级公路,fieid=silc>,<title=等外公路,fieid=dwlc>,<title=无路,fieid=wllc>,<title=建设后一级公路,fieid=jhyilc>,<title=建设后二级公路,fieid=jherlc>,<title=建设后三级公路,fieid=jhsanlc>,<title=建设后四级公路,fieid=jhsilc>,<title=建设后等外公路,fieid=jhdwlc>,<title=建设后无路,fieid=jhwllc>,<title=路基(m3),fieid=lj>,<title=桥梁(座),fieid=ql>,<title=桥梁延米,fieid=ql_ym>,<title=涵洞(座),fieid=hd>,<title=涵洞(米),fieid=hd_m>,<title=隧道(座),fieid=sd>,<title=隧道延米,fieid=sd_ym>,<title=面层类型,fieid=mc>,<title=面层里程,fieid=mc_lc>,<title=基层类型,fieid=jc>,<title=基层里程,fieid=jc_lc>,<title=垫层类型,fieid=dc>,<title=垫层里程,fieid=dc_lc>,<title=大桥名称,fieid=dq>,<title=大桥长度,fieid=dq_cd>,<title=大桥单跨,fieid=dq_dk>,<title=隧道名称,fieid=sdmc>,<title=隧道双幅长度,fieid=sd_sfcd>,<title=隧道类型,fieid=sd_lx>,<title=开工时间,fieid=kgsj>,<title=完工时间,fieid=wgsj>,<title=工期,fieid=gq>,<title=设计单位,fieid=sjdw>,<title=设计批复文号,fieid=sjpfwh>,<title=批复时间,fieid=pfsj>,<title=建安费,fieid=jaf>,<title=地方自筹,fieid=dfzc>,<title=银行贷款,fieid=yhdk>";
			}else if(cbsj.getXmlx()==2){
				fileTitle="<title=项目名称,fieid=xmmc>,<title=项目编码,fieid=xmbm>,<title=行政区划,fieid=xzqh>,<title=建设单位,fieid=jsdw>,<title=建设技术等级,fieid=jsjsdj>,<title=建设性质,fieid=jsxz>,<title=路线编码,fieid=ylxbh>,<title=起点桩号,fieid=qdzh>,<title=止点桩号,fieid=zdzh>,<title=里程,fieid=lc>,<title=一级公路,fieid=yilc>,<title=二级公路,fieid=erlc>,<title=三级公路,fieid=sanlc>,<title=四级公路,fieid=silc>,<title=等外公路,fieid=dwlc>,<title=无路,fieid=wllc>,<title=路基(m3),fieid=lj>,<title=桥梁(座),fieid=ql>,<title=桥梁延米,fieid=ql_ym>,<title=涵洞(座),fieid=hd>,<title=涵洞(米),fieid=hd_m>,<title=隧道(座),fieid=sd>,<title=隧道延米,fieid=sd_ym>,<title=面层类型,fieid=mc>,<title=面层里程,fieid=mc_lc>,<title=基层类型,fieid=jc>,<title=基层里程,fieid=jc_lc>,<title=垫层类型,fieid=dc>,<title=垫层里程,fieid=dc_lc>,<title=大桥名称,fieid=dq>,<title=大桥长度,fieid=dq_cd>,<title=大桥单跨,fieid=dq_dk>,<title=隧道名称,fieid=sdmc>,<title=隧道双幅长度,fieid=sd_sfcd>,<title=隧道类型,fieid=sd_lx>,<title=开工时间,fieid=kgsj>,<title=完工时间,fieid=wgsj>,<title=工期,fieid=gq>,<title=设计单位,fieid=sjdw>,<title=设计批复文号,fieid=sjpfwh>,<title=批复时间,fieid=pfsj>,<title=建安费,fieid=jaf>,<title=地方自筹,fieid=dfzc>,<title=银行贷款,fieid=yhdk>";
			}else if(cbsj.getXmlx()==3){
				fileTitle="<title=项目名称,fieid=xmmc>,<title=项目编码,fieid=xmbm>,<title=行政区划,fieid=xzqh>,<title=建设单位,fieid=jsdw>,<title=建设技术等级,fieid=jsjsdj>,<title=建设性质,fieid=jsxz>,<title=路线编码,fieid=ylxbh>,<title=起点桩号,fieid=qdzh>,<title=止点桩号,fieid=zdzh>,<title=新建路线编码,fieid=xjlxbm>,<title=新建起点桩号,fieid=xjqdzh>,<title=新建止点桩号,fieid=xjzdzh>,<title=一级公路,fieid=yilc>,<title=二级公路,fieid=erlc>,<title=三级公路,fieid=sanlc>,<title=四级公路,fieid=silc>,<title=等外公路,fieid=dwlc>,<title=无路,fieid=wllc>,<title=路基(m3),fieid=lj>,<title=桥梁(座),fieid=ql>,<title=桥梁延米,fieid=ql_ym>,<title=涵洞(座),fieid=hd>,<title=涵洞(米),fieid=hd_m>,<title=隧道(座),fieid=sd>,<title=隧道延米,fieid=sd_ym>,<title=面层类型,fieid=mc>,<title=面层里程,fieid=mc_lc>,<title=基层类型,fieid=jc>,<title=基层里程,fieid=jc_lc>,<title=垫层类型,fieid=dc>,<title=垫层里程,fieid=dc_lc>,<title=大桥名称,fieid=dq>,<title=大桥长度,fieid=dq_cd>,<title=大桥单跨,fieid=dq_dk>,<title=隧道名称,fieid=sdmc>,<title=隧道双幅长度,fieid=sd_sfcd>,<title=隧道类型,fieid=sd_lx>,<title=开工时间,fieid=kgsj>,<title=完工时间,fieid=wgsj>,<title=工期,fieid=gq>,<title=设计单位,fieid=sjdw>,<title=设计批复文号,fieid=sjpfwh>,<title=批复时间,fieid=pfsj>,<title=建安费,fieid=jaf>,<title=地方自筹,fieid=dfzc>,<title=银行贷款,fieid=yhdk>";
			}else{
				fileTitle="<title=项目名称,fieid=xmmc>,<title=项目编码,fieid=xmbm>,<title=行政区划,fieid=xzqh>,<title=建设单位,fieid=jsdw>,<title=建设技术等级,fieid=jsjsdj>,<title=建设性质,fieid=jsxz>,<title=路线编码,fieid=ylxbh>,<title=起点桩号,fieid=qdzh>,<title=讫点桩号,fieid=zdzh>,<title=里程,fieid=lc>,<title=一级公路,fieid=yilc>,<title=二级公路,fieid=erlc>,<title=三级公路,fieid=sanlc>,<title=四级公路,fieid=silc>,<title=等外公路,fieid=dwlc>,<title=无路,fieid=wllc>,<title=面层类型,fieid=mc>,<title=面层里程,fieid=mc_lc>,<title=基层类型,fieid=jc>,<title=基层里程,fieid=jc_lc>,<title=垫层类型,fieid=dc>,<title=垫层里程,fieid=dc_lc>,<title=开工时间,fieid=kgsj>,<title=完工时间,fieid=wgsj>,<title=工期,fieid=gq>,<title=设计单位,fieid=sjdw>,<title=设计批复文号,fieid=sjpfwh>,<title=批复时间,fieid=pfsj>,<title=建设方案,fieid=jsfa>";
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
			System.out.println(fileTitle);
			ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,getresponse());
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
		
		String str="xmmc,xmbm,xzqh,jsdw,jsjsdj,jsxz,ylxbh,qdzh,zdzh,lc,yilc,erlc,sanlc,silc,dwlc,wllc,mc,mc_lc,jc,jc_lc,dc,dc_lc,kgsj,wgsj,gq,sjdw,sjpfwh,pfsj,jsfa";
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readExcel(str, 0, Cbsj.class,fileupload);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setLxbm(cbsj.getYlxbh());
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setYilc(cbsj.getYilc());
				lx.setErlc(cbsj.getErlc());
				lx.setSanlc(cbsj.getSanlc());
				lx.setSilc(cbsj.getSilc());
				lx.setDwlc(cbsj.getDwlc());
				lx.setWllc(cbsj.getWllc());
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
		
		String str="xmmc,xmbm,xzqh,jsdw,jsjsdj,jsxz,ylxbh,qdzh,zdzh,lc,yilc,erlc,sanlc,silc,dwlc,wllc,mc,mc_lc,jc,jc_lc,dc,dc_lc,kgsj,wgsj,gq,sjdw,sjpfwh,pfsj,jsfa";
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readExcel(str, 0, Cbsj.class,fileupload);
			List<Lx> lxlist = new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setLxbm(cbsj.getYlxbh());
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setYilc(cbsj.getYilc());
				lx.setErlc(cbsj.getErlc());
				lx.setSanlc(cbsj.getSanlc());
				lx.setSilc(cbsj.getSilc());
				lx.setDwlc(cbsj.getDwlc());
				lx.setWllc(cbsj.getWllc());
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
		String str="xmmc,xmbm,xzqh,jsdw,jsjsdj,jsxz,ylxbh,qdzh,zdzh,lc,yilc,erlc,sanlc,silc,dwlc,wllc,lj,ql,ql_ym,hd,hd_m,sd,sd_ym,mc,mc_lc,jc,jc_lc,dc,dc_lc,dq,dq_cd,dq_dk,sdmc," +
				"sd_sfcd,sd_lx,kgsj,wgsj,gq,sjdw,sjpfwh,pfsj,dfzc,yhdk";
		
		HashMap<String, String> attribute = new HashMap<String, String>();
		
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readExcel(str, 0, Cbsj.class,fileupload);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setYilc(cbsj.getYilc());
				lx.setErlc(cbsj.getErlc());
				lx.setSanlc(cbsj.getSanlc());
				lx.setSilc(cbsj.getSilc());
				lx.setDwlc(cbsj.getDwlc());
				lx.setWllc(cbsj.getWllc());
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
		String str="xmmc,xmbm,xzqh,jsdw,jsjsdj,jsxz,ylxbh,qdzh,zdzh,lc,yilc,erlc,sanlc,silc,dwlc,wllc,jhyilc,jherlc,jhsanlc,jhsilc,jhdwlc,jhwllc,lj,ql,ql_ym,hd,hd_m,sd,sd_ym,mc,mc_lc,jc,jc_lc,dc,dc_lc,dq,dq_cd,dq_dk,sdmc," +
				"sd_sfcd,sd_lx,kgsj,wgsj,gq,sjdw,sjpfwh,pfsj,dfzc,yhdk";
		
		HashMap<String, String> attribute = new HashMap<String, String>();
		
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readExcel(str, 0, Cbsj.class,fileupload);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
				lx.setLc(cbsj.getLc());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
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
		String str="xmmc,xmbm,xzqh,jsdw,jsjsdj,jsxz,ylxbh,qdzh,zdzh,xjlxbm,xjqdzh,xjzdzh,yilc,erlc,sanlc,silc,dwlc,wllc,lj,ql,ql_ym,hd,hd_m,sd,sd_ym,mc,mc_lc,jc,jc_lc,dc,dc_lc,dq,dq_cd,dq_dk,sdmc,sd_sfcd,sd_lx,kgsj,wgsj,gq,sjdw,sjpfwh,pfsj,jaf,dfzc,yhdk";
		HashMap<String, String> attribute = new HashMap<String, String>();
		
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readExcel(str, 0, Cbsj.class,fileupload);
			List<Lx> lxlist=new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
				lx.setQdmc(cbsj.getQdmc());
				lx.setZdmc(cbsj.getZdmc());
				lx.setXjlxbm(cbsj.getXjlxbm());
				lx.setXjqdzh(cbsj.getXjqdzh());
				lx.setXjzdzh(cbsj.getXjzdzh());
				lx.setYilc(cbsj.getYilc());
				lx.setErlc(cbsj.getErlc());
				lx.setSanlc(cbsj.getSanlc());
				lx.setSilc(cbsj.getSilc());
				lx.setDwlc(cbsj.getDwlc());
				lx.setWllc(cbsj.getWllc());
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
