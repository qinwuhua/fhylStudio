package com.hdsx.jxzhpt.lwxm.xmsck.controller;

import java.io.File;
import java.io.FileInputStream;
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

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckwqgzServer;
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
 * 前期管理——危桥改造控制层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class SckwqgzController extends BaseActionSupport implements ModelDriven<Sckwqgz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="sckwqgzServerImpl")
	private SckwqgzServer wqgzServer;
	private Sckwqgz sckwqgz=new Sckwqgz();
	private String delstr;
	private String nf;
	private String tbbmbm1;
	private String tbbmbm2;
	private String sbthcd1;
	private String fileuploadFileName;
	private File fileupload;
	
	//审查库安保工程模板数据导入
	public void importWqgz_sc(){
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
				dataMapArray = ExcelReader.readExcelContent(4,14,fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map<String,String>> data = ExcelReader.removeBlankRow2(dataMapArray[0]);
			//将数据插入到数据库
			String str=wqgzServer.yanZhen(data, tbbmbm1,tbbmbm2,sckwqgz.getSbthcd1());
			if(str.equals("sckwqgz_ok")){
				if(wqgzServer.importWqgz_sc(data,tbbmbm2,sckwqgz.getSbthcd1())) 
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
	public void exportExcel_wqgz_scgl(){
		try {
			if(sckwqgz.getGydw().indexOf(",")==-1){
				sckwqgz.setGydw("and scbmbm like '%'||substr("+sckwqgz.getGydw()+",0,4)||'_'||substr("+sckwqgz.getGydw()+",6)||'%'");
			}else{
				sckwqgz.setGydw("and scbmbm in ("+sckwqgz.getGydw()+")");
			}
			if(sckwqgz.getXzqhdm().indexOf(",")==-1){
				sckwqgz.setXzqhdm("and xzqhdm like '%"+sckwqgz.getXzqhdm()+"%'");
			}else{
				sckwqgz.setXzqhdm("and xzqhdm in ("+sckwqgz.getXzqhdm()+")");
			}
			if(sckwqgz.getAkjfl().length()>0){
				String[] tsdqs=sckwqgz.getAkjfl().split(",");
				String tsdq="and akjfl in (";
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
				sckwqgz.setAkjfl(tsdq);
			}
			if(sckwqgz.getXmnf().length()>0){
				String[] tsdqs=sckwqgz.getXmnf().split(",");
				String tsdq="and scxmnf in (";
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
				sckwqgz.setXmnf(tsdq);
			}
			if(sckwqgz.getTsdq().length()>0){
				String[] tsdqs=sckwqgz.getTsdq().split(",");
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
				sckwqgz.setTsdq(tsdq);
			}
			if(sckwqgz.getJsdj().length()>0){
				String[] tsdqs=sckwqgz.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckwqgz.setJsdj(tsdq);
			}
			if(sckwqgz.getGldj().length()>0){
				String[] tsdqs=sckwqgz.getGldj().split(",");
				String tsdq="and substr(qlbh,0,1) in (";
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
				sckwqgz.setGldj(tsdq);
			}
			//先得到导出的数据集
			List <Excel_list> list=wqgzServer.exportExcel_wqgz_scgl(sckwqgz);
			//导出设置

			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("危桥改造项目");//设置第一行 
			eldata.setSheetName("危桥");//设置sheeet名
			eldata.setFileName("危桥改造项目");//设置文件名
			eldata.setEl(list);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("行政区划",1,1,1,1));
			et.add(new Excel_tilte("原桥梁编码",1,1,2,2));
			et.add(new Excel_tilte("原桥梁名称",1,1,3,3));
			et.add(new Excel_tilte("原桥梁中心桩号",1,1,4,4));
			et.add(new Excel_tilte("原路线编码",1,1,5,5));
			et.add(new Excel_tilte("原路线名称",1,1,6,6));
			et.add(new Excel_tilte("桥梁全长",1,1,7,7));
			et.add(new Excel_tilte("桥梁全宽",1,1,8,8));
			et.add(new Excel_tilte("方案评估单位",1,1,9,9));
			et.add(new Excel_tilte("方案审查单位",1,1,10,10));
			et.add(new Excel_tilte("方案审批时间",1,1,11,11));
			et.add(new Excel_tilte("审批文号",1,1,12,12));
			et.add(new Excel_tilte("投资估算（万元）",1,1,13,13));
			et.add(new Excel_tilte("建设性质",1,1,14,14));
			et.add(new Excel_tilte("建设内容",1,1,15,15));
			et.add(new Excel_tilte("项目年份",1,1,16,16));
			et.add(new Excel_tilte("备注",1,1,17,17));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void exportExcel_wqgz_scsh(){
		try {
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			String tsdqS=(String) session.getAttribute("tsdq");
			sckwqgz.setTsdq(tsdqS);
			
			if(sckwqgz.getGydw().indexOf(",")==-1){
				sckwqgz.setGydw("and scbmbm like '%'||substr("+sckwqgz.getGydw()+",0,4)||'_'||substr("+sckwqgz.getGydw()+",6)||'%'");
			}else{
				sckwqgz.setGydw("and scbmbm in ("+sckwqgz.getGydw()+")");
			}
			if(sckwqgz.getXzqhdm().indexOf(",")==-1){
				sckwqgz.setXzqhdm("and xzqhdm like '%"+sckwqgz.getXzqhdm()+"%'");
			}else{
				sckwqgz.setXzqhdm("and xzqhdm in ("+sckwqgz.getXzqhdm()+")");
			}
			if(sckwqgz.getTsdq().length()>0){
				String[] tsdqs=sckwqgz.getTsdq().split(",");
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
				sckwqgz.setTsdq(tsdq);
			}
			if(sckwqgz.getGldj().length()>0){
				String[] tsdqs=sckwqgz.getGldj().split(",");
				String tsdq="and substr(qlbh,0,1) in (";
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
				sckwqgz.setGldj(tsdq);
			}
			if(sckwqgz.getJsdj().length()>0){
				String[] tsdqs=sckwqgz.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckwqgz.setJsdj(tsdq);
			}
			if(sckwqgz.getAkjfl().length()>0){
				String[] tsdqs=sckwqgz.getAkjfl().split(",");
				String tsdq="and akjfl in (";
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
				sckwqgz.setAkjfl(tsdq);
			}
			
			//先得到导出的数据集
			List <Excel_list> list=wqgzServer.exportExcel_wqgz_scsh(sckwqgz);
			//导出设置

			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("危桥改造项目");//设置第一行 
			eldata.setSheetName("危桥");//设置sheeet名
			eldata.setFileName("危桥改造项目");//设置文件名
			eldata.setEl(list);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("行政区划",1,1,1,1));
			et.add(new Excel_tilte("原桥梁编码",1,1,2,2));
			et.add(new Excel_tilte("原桥梁名称",1,1,3,3));
			et.add(new Excel_tilte("原桥梁中心桩号",1,1,4,4));
			et.add(new Excel_tilte("原路线编码",1,1,5,5));
			et.add(new Excel_tilte("原路线名称",1,1,6,6));
			et.add(new Excel_tilte("桥梁全长",1,1,7,7));
			et.add(new Excel_tilte("桥梁全宽",1,1,8,8));
			et.add(new Excel_tilte("方案评估单位",1,1,9,9));
			et.add(new Excel_tilte("方案审查单位",1,1,10,10));
			et.add(new Excel_tilte("方案审批时间",1,1,11,11));
			et.add(new Excel_tilte("审批文号",1,1,12,12));
			et.add(new Excel_tilte("投资估算（万元）",1,1,13,13));
			et.add(new Excel_tilte("建设性质",1,1,14,14));
			et.add(new Excel_tilte("建设内容",1,1,15,15));
			et.add(new Excel_tilte("项目年份",1,1,16,16));
			et.add(new Excel_tilte("备注",1,1,17,17));		
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void insertSckwqgz(){
		boolean b = wqgzServer.insertSckwqgz(sckwqgz);
		if(b)  ResponseUtils.write(getresponse(), "true");
		else ResponseUtils.write(getresponse(), "false");
	}
	public void selectSckwqgz(){
		if(sckwqgz.getGydw().indexOf(",")==-1){
			sckwqgz.setGydw("and scbmbm like '%'||substr("+sckwqgz.getGydw()+",0,4)||'_'||substr("+sckwqgz.getGydw()+",6)||'%'");
		}else{
			sckwqgz.setGydw("and scbmbm in ("+sckwqgz.getGydw()+")");
		}
		if(sckwqgz.getXzqhdm().indexOf(",")==-1){
			sckwqgz.setXzqhdm("and xzqhdm like '%"+sckwqgz.getXzqhdm()+"%'");
		}else{
			sckwqgz.setXzqhdm("and xzqhdm in ("+sckwqgz.getXzqhdm()+")");
		}
		if(sckwqgz.getTsdq().length()>0){
			String[] tsdqs=sckwqgz.getTsdq().split(",");
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
			sckwqgz.setTsdq(tsdq);
		}
		if(sckwqgz.getGldj().length()>0){
			String[] tsdqs=sckwqgz.getGldj().split(",");
			String tsdq="and substr(qlbh,0,1) in (";
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
			sckwqgz.setGldj(tsdq);
		}
		if(sckwqgz.getJsdj().length()>0){
			String[] tsdqs=sckwqgz.getJsdj().split(",");
			String tsdq="and substr(jsdj,0,1) in (";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
				else
					tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			sckwqgz.setJsdj(tsdq);
		}
		if(sckwqgz.getAkjfl().length()>0){
			String[] tsdqs=sckwqgz.getAkjfl().split(",");
			String tsdq="and akjfl in (";
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
			sckwqgz.setAkjfl(tsdq);
		}
		
		List<Sckwqgz> list = wqgzServer.selectSckwqgz(sckwqgz);
		int count = wqgzServer.selectWqgzCount(sckwqgz);
		EasyUIPage<Sckwqgz> eui = new EasyUIPage<Sckwqgz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteSckWqgz(){
		if(wqgzServer.deleteSckWqgz(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateSckwqgz(){
		if(wqgzServer.updateSckWqgz(sckwqgz)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckwqgzById(){
		try {
			JsonUtils.write(wqgzServer.selectSckwqgzById(sckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckWqgzSbzt(){
		if(wqgzServer.xgSckWqgzSbzt(delstr,sckwqgz)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void xgSckWqgzTH(){
		try {
			JsonUtils.write(wqgzServer.xgSckWqgzTH(delstr),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectSckShwqgz(){
		if(sckwqgz.getGydw().indexOf(",")==-1){
			sckwqgz.setGydw("and scbmbm like '%'||substr("+sckwqgz.getGydw()+",0,4)||'_'||substr("+sckwqgz.getGydw()+",6)||'%'");
		}else{
			sckwqgz.setGydw("and scbmbm in ("+sckwqgz.getGydw()+")");
		}
		if(sckwqgz.getXzqhdm().indexOf(",")==-1){
			sckwqgz.setXzqhdm("and xzqhdm like '%"+sckwqgz.getXzqhdm()+"%'");
		}else{
			sckwqgz.setXzqhdm("and xzqhdm in ("+sckwqgz.getXzqhdm()+")");
		}
		if(sckwqgz.getTsdq().length()>0){
			String[] tsdqs=sckwqgz.getTsdq().split(",");
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
			sckwqgz.setTsdq(tsdq);
		}
		if(sckwqgz.getGldj().length()>0){
			String[] tsdqs=sckwqgz.getGldj().split(",");
			String tsdq="and substr(qlbh,0,1) in (";
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
			sckwqgz.setGldj(tsdq);
		}
		if(sckwqgz.getJsdj().length()>0){
			String[] tsdqs=sckwqgz.getJsdj().split(",");
			String tsdq="and substr(jsdj,0,1) in (";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
				else
					tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			sckwqgz.setJsdj(tsdq);
		}
		if(sckwqgz.getAkjfl().length()>0){
			String[] tsdqs=sckwqgz.getAkjfl().split(",");
			String tsdq="and akjfl in (";
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
			sckwqgz.setAkjfl(tsdq);
		}
		List<Sckwqgz> list = wqgzServer.selectSckShwqgz(sckwqgz);
		int count = wqgzServer.selectWqgzShCount(sckwqgz);
		EasyUIPage<Sckwqgz> eui = new EasyUIPage<Sckwqgz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckWqgzShzt(){
		if(wqgzServer.xgSckWqgzShzt(delstr,sckwqgz,tbbmbm1,nf)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void onceSckWqgz(){
		boolean b = wqgzServer.onceSckWqgz(sckwqgz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void bzWqgz(){
		boolean b = wqgzServer.bzWqgz(sckwqgz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void lrjhSckwqgz(){
		try{
			boolean b = wqgzServer.lrjhSckwqgz(delstr,nf,sbthcd1);
			if(b){
				wqgzServer.xglrjhSckwqgz(delstr);
				ResponseUtils.write(getresponse(), "true");
			}else ResponseUtils.write(getresponse(), "false");
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public void selectWqgzCount(){
		try {
			if(sckwqgz.getGydw().indexOf(",")==-1){
				sckwqgz.setGydw("and scbmbm like '%'||substr("+sckwqgz.getGydw()+",0,4)||'_'||substr("+sckwqgz.getGydw()+",6)||'%'");
			}else{
				sckwqgz.setGydw("and scbmbm in ("+sckwqgz.getGydw()+")");
			}
			if(sckwqgz.getXzqhdm().indexOf(",")==-1){
				sckwqgz.setXzqhdm("and xzqhdm like '%"+sckwqgz.getXzqhdm()+"%'");
			}else{
				sckwqgz.setXzqhdm("and xzqhdm in ("+sckwqgz.getXzqhdm()+")");
			}
			if(sckwqgz.getTsdq().length()>0){
				String[] tsdqs=sckwqgz.getTsdq().split(",");
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
				sckwqgz.setTsdq(tsdq);
			}
			if(sckwqgz.getGldj().length()>0){
				String[] tsdqs=sckwqgz.getGldj().split(",");
				String tsdq="and substr(qlbh,0,1) in (";
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
				sckwqgz.setGldj(tsdq);
			}
			if(sckwqgz.getJsdj().length()>0){
				String[] tsdqs=sckwqgz.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckwqgz.setJsdj(tsdq);
			}
			if(sckwqgz.getAkjfl().length()>0){
				String[] tsdqs=sckwqgz.getAkjfl().split(",");
				String tsdq="and akjfl in (";
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
				sckwqgz.setAkjfl(tsdq);
			}
			ResponseUtils.write(getresponse(), wqgzServer.selectWqgzCount(sckwqgz)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectWqgzShCount(){
		try {
			if(sckwqgz.getGydw().indexOf(",")==-1){
				sckwqgz.setGydw("and scbmbm like '%'||substr("+sckwqgz.getGydw()+",0,4)||'_'||substr("+sckwqgz.getGydw()+",6)||'%'");
			}else{
				sckwqgz.setGydw("and scbmbm in ("+sckwqgz.getGydw()+")");
			}
			if(sckwqgz.getXzqhdm().indexOf(",")==-1){
				sckwqgz.setXzqhdm("and xzqhdm like '%"+sckwqgz.getXzqhdm()+"%'");
			}else{
				sckwqgz.setXzqhdm("and xzqhdm in ("+sckwqgz.getXzqhdm()+")");
			}
			if(sckwqgz.getTsdq().length()>0){
				String[] tsdqs=sckwqgz.getTsdq().split(",");
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
				sckwqgz.setTsdq(tsdq);
			}
			if(sckwqgz.getGldj().length()>0){
				String[] tsdqs=sckwqgz.getGldj().split(",");
				String tsdq="and substr(qlbh,0,1) in (";
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
				sckwqgz.setGldj(tsdq);
			}
			if(sckwqgz.getJsdj().length()>0){
				String[] tsdqs=sckwqgz.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				sckwqgz.setJsdj(tsdq);
			}
			if(sckwqgz.getAkjfl().length()>0){
				String[] tsdqs=sckwqgz.getAkjfl().split(",");
				String tsdq="and akjfl in (";
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
				sckwqgz.setAkjfl(tsdq);
			}
			//System.out.println(sckwqgz.getXmklx());
			ResponseUtils.write(getresponse(), wqgzServer.selectWqgzShCount(sckwqgz)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void lrjhWqgz(){
		if(sckwqgz.getGydw().indexOf(",")==-1){
			sckwqgz.setGydw("and scbmbm like '%'||substr("+sckwqgz.getGydw()+",0,4)||'_'||substr("+sckwqgz.getGydw()+",6)||'%'");
		}else{
			sckwqgz.setGydw("and scbmbm in ("+sckwqgz.getGydw()+")");
		}
		if(sckwqgz.getXzqhdm().indexOf(",")==-1){
			sckwqgz.setXzqhdm("and xzqhdm like '%"+sckwqgz.getXzqhdm()+"%'");
		}else{
			sckwqgz.setXzqhdm("and xzqhdm in ("+sckwqgz.getXzqhdm()+")");
		}
		List<Sckwqgz> list = wqgzServer.lrjhWqgz(sckwqgz);
		int count = wqgzServer.lrjhWqgzCount(sckwqgz);
		EasyUIPage<Sckwqgz> eui = new EasyUIPage<Sckwqgz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

	public Sckwqgz getSckwqgz() {
		return sckwqgz;
	}
	public void setSckwqgz(Sckwqgz sckwqgz) {
		this.sckwqgz = sckwqgz;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Sckwqgz getModel() {
		return sckwqgz;
	}
	public SckwqgzServer getWqgzServer() {
		return wqgzServer;
	}
	public void setWqgzServer(SckwqgzServer wqgzServer) {
		this.wqgzServer = wqgzServer;
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
