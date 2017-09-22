package com.hdsx.jxzhpt.lwxm.xmsck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckabgcServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目审查库——安保工程Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class SckabgcController extends BaseActionSupport implements ModelDriven<Sckabgc>{

	private static final long serialVersionUID = 1L;
	@Resource(name="sckabgcServerImpl")
	private SckabgcServer abgcServer;
	private Sckabgc sckabgc=new Sckabgc();
	private String delstr;
	private String nf;
	private String tbbmbm1;
	private String tbbmbm2;
	private String sbthcd1;
	private String fileuploadFileName;
	private File fileupload;
	
	//审查库安保工程模板数据导入
	public void importAbgc_sc(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
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
				dataMapArray = ExcelReader.readExcelContent(4,20,fs,Jckzhfz.class);
			}catch(Exception e){ 
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map<String,String>> data = ExcelReader.removeBlankRow2(dataMapArray[0]);
			//将数据插入到数据库
			String str=abgcServer.yanZhen(data, tbbmbm1,tbbmbm2, sbthcd1);
			if(str.equals("sckabgc_ok")){
				if(abgcServer.importAbgc_sc(data,tbbmbm2,sbthcd1)) 
					response.getWriter().print(fileuploadFileName+"导入成功");
				else 
					response.getWriter().print(fileuploadFileName+"服务器异常,请重试");
			}else{
				response.getWriter().print("提示："+fileuploadFileName+str);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void exportExcel_abgc_scgl(){
		try {
			if(sckabgc.getGydw().indexOf(",")==-1){
				sckabgc.setGydw("and scbmbm like '%'||substr("+sckabgc.getGydw()+",0,4)||'_'||substr("+sckabgc.getGydw()+",6)||'%'");
			}else{
				sckabgc.setGydw("and scbmbm in ("+sckabgc.getGydw()+")");
			}
			if(sckabgc.getXzqhdm().indexOf(",")==-1){
				sckabgc.setXzqhdm("and xzqhdm like '%"+sckabgc.getXzqhdm()+"%'");
			}else{
				sckabgc.setXzqhdm("and xzqhdm in ("+sckabgc.getXzqhdm()+")");
			}
			if(sckabgc.getTsdq().length()>0){
				String[] tsdqs=sckabgc.getTsdq().split(",");
				String tsdq="and (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setTsdq(tsdq);
			}
			if(sckabgc.getGldj().length()>0){
				String[] tsdqs=sckabgc.getGldj().split(",");
				String tsdq="and substr(lxbm,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setGldj(tsdq);
			}
			if(sckabgc.getJsdj().length()>0){
				String[] tsdqs=sckabgc.getJsdj().split(",");
				String tsdq="and substr(lxjsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setJsdj(tsdq);
			}
			//先得到导出的数据集
			List <Excel_list> list=abgcServer.exportExcel_abgc_scgl(sckabgc);
			//导出设置
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("安防工程项目");//设置第一行 
			eldata.setSheetName("安防");//设置sheeet名
			eldata.setFileName("安防工程项目");//设置文件名
			eldata.setEl(list);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("行政区划代码",1,1,1,1));
			et.add(new Excel_tilte("行政区划名称",1,1,2,2));
			et.add(new Excel_tilte("原路线编码",1,1,3,3));
			et.add(new Excel_tilte("原路线名称",1,1,4,4));
			et.add(new Excel_tilte("原路线起点桩号",1,1,5,5));
			et.add(new Excel_tilte("原路线止点桩号",1,1,6,6));
			et.add(new Excel_tilte("总里程",1,1,7,7));
			et.add(new Excel_tilte("隐患里程",1,1,8,8));
			et.add(new Excel_tilte("修建/改建年度",1,1,9,9));
			et.add(new Excel_tilte("方案评估单位",1,1,10,10));
			et.add(new Excel_tilte("方案审查单位",1,1,11,11));
			et.add(new Excel_tilte("方案审批时间",1,1,12,12));
			et.add(new Excel_tilte("审批文号",1,1,13,13));
			et.add(new Excel_tilte("投资估算（万元）",1,1,14,14));
			et.add(new Excel_tilte("建设性质",1,1,15,15));
			et.add(new Excel_tilte("建设内容",1,1,16,16));
			et.add(new Excel_tilte("项目年份",1,1,17,17));
			et.add(new Excel_tilte("备注",1,1,18,18));	
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void exportExcel_abgc_scsh(){
		try {
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			String tsdqS=(String) session.getAttribute("tsdq");
			sckabgc.setTsdq(tsdqS);
			
			if(sckabgc.getGydw().indexOf(",")==-1){
				sckabgc.setGydw("and scbmbm like '%'||substr("+sckabgc.getGydw()+",0,4)||'_'||substr("+sckabgc.getGydw()+",6)||'%'");
			}else{
				sckabgc.setGydw("and scbmbm in ("+sckabgc.getGydw()+")");
			}
			if(sckabgc.getXzqhdm().indexOf(",")==-1){
				sckabgc.setXzqhdm("and xzqhdm like '%"+sckabgc.getXzqhdm()+"%'");
			}else{
				sckabgc.setXzqhdm("and xzqhdm in ("+sckabgc.getXzqhdm()+")");
			}
			if(sckabgc.getTsdq().length()>0){
				String[] tsdqs=sckabgc.getTsdq().split(",");
				String tsdq="and (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setTsdq(tsdq);
			}
			if(sckabgc.getGldj().length()>0){
				String[] tsdqs=sckabgc.getGldj().split(",");
				String tsdq="and substr(lxbm,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setGldj(tsdq);
			}
			if(sckabgc.getJsdj().length()>0){
				String[] tsdqs=sckabgc.getJsdj().split(",");
				String tsdq="and substr(lxjsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setJsdj(tsdq);
			}
			//先得到导出的数据集
			List <Excel_list> list=abgcServer.exportExcel_abgc_scsh(sckabgc);
			//导出设置
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("安防工程项目");//设置第一行 
			eldata.setSheetName("安防");//设置sheeet名
			eldata.setFileName("安防工程项目");//设置文件名
			eldata.setEl(list);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("行政区划代码",1,1,1,1));
			et.add(new Excel_tilte("行政区划名称",1,1,2,2));
			et.add(new Excel_tilte("原路线编码",1,1,3,3));
			et.add(new Excel_tilte("原路线名称",1,1,4,4));
			et.add(new Excel_tilte("原路线起点桩号",1,1,5,5));
			et.add(new Excel_tilte("原路线止点桩号",1,1,6,6));
			et.add(new Excel_tilte("总里程",1,1,7,7));
			et.add(new Excel_tilte("隐患里程",1,1,8,8));
			et.add(new Excel_tilte("修建/改建年度",1,1,9,9));
			et.add(new Excel_tilte("方案评估单位",1,1,10,10));
			et.add(new Excel_tilte("方案审查单位",1,1,11,11));
			et.add(new Excel_tilte("方案审批时间",1,1,12,12));
			et.add(new Excel_tilte("审批文号",1,1,13,13));
			et.add(new Excel_tilte("投资估算（万元）",1,1,14,14));
			et.add(new Excel_tilte("建设性质",1,1,15,15));
			et.add(new Excel_tilte("建设内容",1,1,16,16));
			et.add(new Excel_tilte("项目年份",1,1,17,17));
			et.add(new Excel_tilte("备注",1,1,18,18));	
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void insertSckabgc(){
		boolean b = abgcServer.insertSckabgc(sckabgc);
		if(b)  ResponseUtils.write(getresponse(), "true");
		else ResponseUtils.write(getresponse(), "false");
	}
	public void selectSckabgc(){
		if(sckabgc.getGydw().indexOf(",")==-1){
			sckabgc.setGydw("and scbmbm like '%'||substr("+sckabgc.getGydw()+",0,4)||'_'||substr("+sckabgc.getGydw()+",6)||'%'");
		}else{
			sckabgc.setGydw("and scbmbm in ("+sckabgc.getGydw()+")");
		}
		if(sckabgc.getXzqhdm().indexOf(",")==-1){
			sckabgc.setXzqhdm("and xzqhdm like '%"+sckabgc.getXzqhdm()+"%'");
		}else{
			sckabgc.setXzqhdm("and xzqhdm in ("+sckabgc.getXzqhdm()+")");
		}
		if(sckabgc.getTsdq().length()>0){
			String[] tsdqs=sckabgc.getTsdq().split(",");
			String tsdq="and(";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="tsdq like '%"+tsdqs[i]+"%'";
				else
					tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			sckabgc.setTsdq(tsdq);
		}
		if(sckabgc.getGldj().length()>0){
			String[] tsdqs=sckabgc.getGldj().split(",");
			String tsdq="and substr(lxbm,0,1) in (";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="'"+tsdqs[i]+"'";
				else
					tsdq+=",'"+tsdqs[i]+"'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			sckabgc.setGldj(tsdq);
		}
		if(sckabgc.getJsdj().length()>0){
			String[] tsdqs=sckabgc.getJsdj().split(",");
			String tsdq="and substr(lxjsdj,0,1) in (";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
				else
					tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			sckabgc.setJsdj(tsdq);
		}
		List<Sckabgc> list = abgcServer.selectSckabgc(sckabgc);
		int count = abgcServer.selectAbgcCount(sckabgc);
		EasyUIPage<Sckabgc> eui = new EasyUIPage<Sckabgc>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteSckAbgc(){
		if(abgcServer.deleteSckAbgc(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateSckabgc(){
		if(abgcServer.updateSckabgc(sckabgc)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckabgcById(){
		try {
			JsonUtils.write(abgcServer.selectSckabgcById(sckabgc), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckAbgcSbzt(){
		if(abgcServer.xgSckAbgcSbzt(delstr,sckabgc)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectSckShabgc(){
		if(sckabgc.getGydw().indexOf(",")==-1){
			sckabgc.setGydw("and scbmbm like '%'||substr("+sckabgc.getGydw()+",0,4)||'_'||substr("+sckabgc.getGydw()+",6)||'%'");
		}else{
			sckabgc.setGydw("and scbmbm in ("+sckabgc.getGydw()+")");
		}
		if(sckabgc.getXzqhdm().indexOf(",")==-1){
			sckabgc.setXzqhdm("and xzqhdm like '%"+sckabgc.getXzqhdm()+"%'");
		}else{
			sckabgc.setXzqhdm("and xzqhdm in ("+sckabgc.getXzqhdm()+")");
		}
		if(sckabgc.getTsdq().length()>0){
			String[] tsdqs=sckabgc.getTsdq().split(",");
			String tsdq="and(";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="tsdq like '%"+tsdqs[i]+"%'";
				else
					tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			sckabgc.setTsdq(tsdq);
		}
		if(sckabgc.getGldj().length()>0){
			String[] tsdqs=sckabgc.getGldj().split(",");
			String tsdq="and substr(lxbm,0,1) in (";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="'"+tsdqs[i]+"'";
				else
					tsdq+=",'"+tsdqs[i]+"'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			sckabgc.setGldj(tsdq);
		}
		if(sckabgc.getJsdj().length()>0){
			String[] tsdqs=sckabgc.getJsdj().split(",");
			String tsdq="and substr(lxjsdj,0,1) in (";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
				else
					tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			sckabgc.setJsdj(tsdq);
		}
		List<Sckabgc> list = abgcServer.selectSckShabgc(sckabgc);
		int count = abgcServer.selectAbgcShCount(sckabgc);
		EasyUIPage<Sckabgc> eui = new EasyUIPage<Sckabgc>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckAbgcShzt(){
		if(abgcServer.xgSckAbgcShzt(delstr,sckabgc,nf,tbbmbm1)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void xgSckAbgcTH(){
		try {
			JsonUtils.write(abgcServer.xgSckAbgcTH(delstr),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void bzAbgc(){
		boolean b = abgcServer.bzAbgc(sckabgc);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void lrjhSckabgc(){
			boolean b = abgcServer.lrjhSckabgc(delstr,nf,sbthcd1);
			if(b){
				abgcServer.xglrjhSckabgc(delstr);
				ResponseUtils.write(getresponse(), "true");
			}else ResponseUtils.write(getresponse(), "false");
	}
	public void onceSckAbgc(){
		boolean b = abgcServer.onceSckAbgc(sckabgc);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selSckAbgcCount(){
		try {
			if(sckabgc.getGydw().indexOf(",")==-1){
				sckabgc.setGydw("and scbmbm like '%'||substr("+sckabgc.getGydw()+",0,4)||'_'||substr("+sckabgc.getGydw()+",6)||'%'");
			}else{
				sckabgc.setGydw("and scbmbm in ("+sckabgc.getGydw()+")");
			}
			if(sckabgc.getXzqhdm().indexOf(",")==-1){
				sckabgc.setXzqhdm("and xzqhdm like '%"+sckabgc.getXzqhdm()+"%'");
			}else{
				sckabgc.setXzqhdm("and xzqhdm in ("+sckabgc.getXzqhdm()+")");
			}
			if(sckabgc.getTsdq().length()>0){
				String[] tsdqs=sckabgc.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setTsdq(tsdq);
			}
			if(sckabgc.getGldj().length()>0){
				String[] tsdqs=sckabgc.getGldj().split(",");
				String tsdq="and substr(lxbm,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setGldj(tsdq);
			}
			if(sckabgc.getJsdj().length()>0){
				String[] tsdqs=sckabgc.getJsdj().split(",");
				String tsdq="and substr(lxjsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setJsdj(tsdq);
			}
			JsonUtils.write(abgcServer.selSckAbgcCount(sckabgc), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selSckAbgcShCount(){
		try {
			if(sckabgc.getGydw().indexOf(",")==-1){
				sckabgc.setGydw("and scbmbm like '%'||substr("+sckabgc.getGydw()+",0,4)||'_'||substr("+sckabgc.getGydw()+",6)||'%'");
			}else{
				sckabgc.setGydw("and scbmbm in ("+sckabgc.getGydw()+")");
			}
			if(sckabgc.getXzqhdm().indexOf(",")==-1){
				sckabgc.setXzqhdm("and xzqhdm like '%"+sckabgc.getXzqhdm()+"%'");
			}else{
				sckabgc.setXzqhdm("and xzqhdm in ("+sckabgc.getXzqhdm()+")");
			}
			if(sckabgc.getTsdq().length()>0){
				String[] tsdqs=sckabgc.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setTsdq(tsdq);
			}
			if(sckabgc.getGldj().length()>0){
				String[] tsdqs=sckabgc.getGldj().split(",");
				String tsdq="and substr(lxbm,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setGldj(tsdq);
			}
			if(sckabgc.getJsdj().length()>0){
				String[] tsdqs=sckabgc.getJsdj().split(",");
				String tsdq="and substr(lxjsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckabgc.setJsdj(tsdq);
			}
			JsonUtils.write(abgcServer.selSckAbgcShCount(sckabgc), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void lrjhAbgc(){
		if(sckabgc.getGydw().indexOf(",")==-1){
			sckabgc.setGydw("and scbmbm like '%'||substr("+sckabgc.getGydw()+",0,4)||'_'||substr("+sckabgc.getGydw()+",6)||'%'");
		}else{
			sckabgc.setGydw("and scbmbm in ("+sckabgc.getGydw()+")");
		}
		if(sckabgc.getXzqhdm().indexOf(",")==-1){
			sckabgc.setXzqhdm("and xzqhdm like '%"+sckabgc.getXzqhdm()+"%'");
		}else{
			sckabgc.setXzqhdm("and xzqhdm in ("+sckabgc.getXzqhdm()+")");
		}
		List<Sckabgc> list = abgcServer.lrjhAbgc(sckabgc);
		int count = abgcServer.lrjhAbgcCount(sckabgc);
		EasyUIPage<Sckabgc> eui = new EasyUIPage<Sckabgc>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	public Sckabgc getSckabgc() {
		return sckabgc;
	}
	public void setSckabgc(Sckabgc sckabgc) {
		this.sckabgc = sckabgc;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Sckabgc getModel() {
		return sckabgc;
	}
	public SckabgcServer getAbgcServer() {
		return abgcServer;
	}
	public void setAbgcServer(SckabgcServer abgcServer) {
		this.abgcServer = abgcServer;
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
	public String getTbbmbm1() {
		return tbbmbm1;
	}
	public void setTbbmbm1(String tbbmbm1) {
		this.tbbmbm1 = tbbmbm1;
	}
	public String getTbbmbm2() {
		return tbbmbm2;
	}
	public void setTbbmbm2(String tbbmbm2) {
		this.tbbmbm2 = tbbmbm2;
	}
	public String getSbthcd1() {
		return sbthcd1;
	}
	public void setSbthcd1(String sbthcd1) {
		this.sbthcd1 = sbthcd1;
	}
	public String getNf() {
		return nf;
	}
	public void setNf(String nf) {
		this.nf = nf;
	}
	
}
