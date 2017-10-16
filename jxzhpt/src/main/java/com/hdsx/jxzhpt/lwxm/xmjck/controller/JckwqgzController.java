package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
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
 * 项目基础库——危桥改造Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class JckwqgzController extends BaseActionSupport implements ModelDriven<Jckwqgz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckwqgzServerImpl")
	private JckwqgzServer wqgzServer;
	private Jckwqgz jckwqgz=new Jckwqgz();
	private String delstr;
	private String tbbmbm1;
	private String tbbmbm2;
	private String sbthcd1;
	private String fileuploadFileName;
	private File fileupload;
	private String sfylrbwqk;
	
	public String getSfylrbwqk() {
		return sfylrbwqk;
	}
	public void setSfylrbwqk(String sfylrbwqk) {
		this.sfylrbwqk = sfylrbwqk;
	}
	//excel数据导入
	public void importWqgz(){
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
				dataMapArray = ExcelReader.readExcelContent(3,11,fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			try{
				//去除excel中的空白行数据
				List<Map<String,String>> data=ExcelReader.removeBlankRow2(dataMapArray[0]);
			if(wqgzServer.yanZhen(data, tbbmbm1).equals("jckwqgz_ok")){
				if(wqgzServer.importWqgz2(data,tbbmbm2,sbthcd1)) 
					response.getWriter().print(fileuploadFileName+"导入成功");
				else 
					response.getWriter().print(fileuploadFileName+"服务器异常,请重试");
			}else{
				response.getWriter().print("提示："+fileuploadFileName+wqgzServer.yanZhen(data, tbbmbm1));
			}
			}catch(Exception e){
				e.printStackTrace();
				response.getWriter().print(fileuploadFileName+"导入失败，请重试");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void exportExcel_wqgz(){
		try {
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			if(jckwqgz.getTsdq().length()>0){
				String[] tsdqs=jckwqgz.getTsdq().split(",");
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
				jckwqgz.setTsdq(tsdq);
			}
			if(jckwqgz.getGldj().length()>0){
				String[] tsdqs=jckwqgz.getGldj().split(",");
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
				jckwqgz.setGldj(tsdq);
			}
			if(jckwqgz.getJsdj().length()>0){
				String[] tsdqs=jckwqgz.getJsdj().split(",");
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
				jckwqgz.setJsdj(tsdq);
			}
			if(jckwqgz.getAkjfl().length()>0){
				String[] tsdqs=jckwqgz.getAkjfl().split(",");
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
				jckwqgz.setAkjfl(tsdq);
			}
			//先得到导出的数据集
			List <Excel_list> list=wqgzServer.exportExcel_wqgz(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
/*
			String excelHtml="<tr><td>上报状态</td><td>管养单位</td><td>行政区划</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>路线编码</td><td>路线名称</td><td>评定等级</td><td>修建/改建年度</td><td>项目年份</td><td>原路线编号</td><td>原桥梁编号</td><td>原中心桩号</td><td>原路线名称</td><td>原桥梁名称</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥改造项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)16);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥改造项目";//excel 文件的名字
			//导出excel
			ExportExcel_new <Jckwqgz> ee = new ExportExcel_new<Jckwqgz>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
*/
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("危桥改造项目");//设置第一行 
			eldata.setSheetName("危桥");//设置sheeet名
			eldata.setFileName("危桥改造项目");//设置文件名
			eldata.setEl(list);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("管养单位",1,1,1,1));
			et.add(new Excel_tilte("行政区划代码",1,1,2,2));
			et.add(new Excel_tilte("行政区划名称",1,1,3,3));
			et.add(new Excel_tilte("经度",1,1,4,4));
			et.add(new Excel_tilte("维度",1,1,5,5));			
			et.add(new Excel_tilte("规划路线编码",1,1,6,6));
			et.add(new Excel_tilte("规划路线名称",1,1,7,7));
			et.add(new Excel_tilte("规划桥梁编码",1,1,8,8));
			et.add(new Excel_tilte("规划桥梁名称",1,1,9,9));
			et.add(new Excel_tilte("规划桥梁中心桩号",1,1,10,10));			
			et.add(new Excel_tilte("原路线编码",1,1,11,11));
			et.add(new Excel_tilte("原路线名称",1,1,12,12));
			et.add(new Excel_tilte("原桥梁编码",1,1,13,13));
			et.add(new Excel_tilte("原桥梁名称",1,1,14,14));
			et.add(new Excel_tilte("原桥梁中心桩号",1,1,15,15));			
			et.add(new Excel_tilte("修建/改建年度",1,1,16,16));
			et.add(new Excel_tilte("桥梁全长",1,1,17,17));
			et.add(new Excel_tilte("桥梁全宽",1,1,18,18));
			et.add(new Excel_tilte("跨径总长",1,1,19,19));
			et.add(new Excel_tilte("单孔最大跨径",1,1,20,20));
			et.add(new Excel_tilte("按跨径分类",1,1,21,21));
			et.add(new Excel_tilte("上部结构形式",1,1,22,22));
			et.add(new Excel_tilte("评定等级",1,1,23,23));
			et.add(new Excel_tilte("病害内容",1,1,24,24));
			et.add(new Excel_tilte("项目年份",1,1,25,25));
			et.add(new Excel_tilte("项目库类型",1,1,26,26));
			et.add(new Excel_tilte("特殊地区",1,1,27,27));
			et.add(new Excel_tilte("备注",1,1,28,28));			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void exportExcel_wqgz_sh(){
		try {
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			if(jckwqgz.getTsdq().length()>0){
				String[] tsdqs=jckwqgz.getTsdq().split(",");
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
				jckwqgz.setTsdq(tsdq);
			}
			if(jckwqgz.getGldj().length()>0){
				String[] tsdqs=jckwqgz.getGldj().split(",");
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
				jckwqgz.setGldj(tsdq);
			}
			if(jckwqgz.getJsdj().length()>0){
				String[] tsdqs=jckwqgz.getJsdj().split(",");
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
				jckwqgz.setJsdj(tsdq);
			}
			if(jckwqgz.getAkjfl().length()>0){
				String[] tsdqs=jckwqgz.getAkjfl().split(",");
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
				jckwqgz.setAkjfl(tsdq);
			}
			//先得到导出的数据集
			List <Excel_list> list=wqgzServer.exportExcel_wqgz_sh(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置

			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("危桥改造项目");//设置第一行 
			eldata.setSheetName("危桥");//设置sheeet名
			eldata.setFileName("危桥改造项目");//设置文件名
			eldata.setEl(list);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("管养单位",1,1,1,1));
			et.add(new Excel_tilte("行政区划代码",1,1,2,2));
			et.add(new Excel_tilte("行政区划名称",1,1,3,3));
			et.add(new Excel_tilte("经度",1,1,4,4));
			et.add(new Excel_tilte("维度",1,1,5,5));		
			et.add(new Excel_tilte("规划路线编码",1,1,6,6));
			et.add(new Excel_tilte("规划路线名称",1,1,7,7));
			et.add(new Excel_tilte("规划桥梁编码",1,1,8,8));
			et.add(new Excel_tilte("规划桥梁名称",1,1,9,9));
			et.add(new Excel_tilte("规划桥梁中心桩号",1,1,10,10));		
			et.add(new Excel_tilte("原路线编码",1,1,11,11));
			et.add(new Excel_tilte("原路线名称",1,1,12,12));
			et.add(new Excel_tilte("原桥梁编码",1,1,13,13));
			et.add(new Excel_tilte("原桥梁名称",1,1,14,14));
			et.add(new Excel_tilte("原桥梁中心桩号",1,1,15,15));		
			et.add(new Excel_tilte("修建/改建年度",1,1,16,16));
			et.add(new Excel_tilte("桥梁全长",1,1,17,17));
			et.add(new Excel_tilte("桥梁全宽",1,1,18,18));
			et.add(new Excel_tilte("跨径总长",1,1,19,19));
			et.add(new Excel_tilte("单孔最大跨径",1,1,20,20));
			et.add(new Excel_tilte("按跨径分类",1,1,21,21));
			et.add(new Excel_tilte("上部结构形式",1,1,22,22));
			et.add(new Excel_tilte("评定等级",1,1,23,23));
			et.add(new Excel_tilte("病害内容",1,1,24,24));
			et.add(new Excel_tilte("项目年份",1,1,25,25));
			et.add(new Excel_tilte("项目库类型",1,1,26,26));
			et.add(new Excel_tilte("特殊地区",1,1,27,27));
			et.add(new Excel_tilte("备注",1,1,28,28));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void insertWqgz(){
		boolean b = wqgzServer.insertWqgz(jckwqgz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectWqgz(){
		if(jckwqgz.getGydw().indexOf(",")==-1){
			jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
		}else{
			jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
		}
		if(jckwqgz.getXzqhdm().indexOf(",")==-1){
			jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
		}else{
			jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
		}
		if(jckwqgz.getTsdq().length()>0){
			String[] tsdqs=jckwqgz.getTsdq().split(",");
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
			jckwqgz.setTsdq(tsdq);
		}
		if(jckwqgz.getGldj().length()>0){
			String[] tsdqs=jckwqgz.getGldj().split(",");
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
			jckwqgz.setGldj(tsdq);
		}
		if(jckwqgz.getJsdj().length()>0){
			String[] tsdqs=jckwqgz.getJsdj().split(",");
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
			jckwqgz.setJsdj(tsdq);
		}
		if(jckwqgz.getAkjfl().length()>0){
			String[] tsdqs=jckwqgz.getAkjfl().split(",");
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
			jckwqgz.setAkjfl(tsdq);
		}
		
		List<Jckwqgz> wqgzList = wqgzServer.selectWqgzList(jckwqgz);
		int count = wqgzServer.selectWqgzCount(jckwqgz);
		EasyUIPage<Jckwqgz> eui = new EasyUIPage<Jckwqgz>();
		eui.setRows(wqgzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectWqgzById(){
		try {
			JsonUtils.write(wqgzServer.selectWqgzById(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateWqgzById(){
		try {
			JsonUtils.write(wqgzServer.updateWqgzById(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteWqgzById(){
		try {
			JsonUtils.write(wqgzServer.deleteWqgzById(delstr),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckWqgzShzt(){
		try {
			JsonUtils.write(wqgzServer.xgJckWqgzShzt(delstr,jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckWqgzSbzt(){
		try {
			JsonUtils.write(wqgzServer.xgJckWqgzSbzt(delstr,jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//自动填充LXMC
	public void wqgzGpsroad(){
		try {
			JsonUtils.write(wqgzServer.selectGpsroad(jckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//自动填充LXMC
		public void wqgzGpsroad1(){
			try {
				JsonUtils.write(wqgzServer.selectGpsroad1(jckwqgz), getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void wqgzGpsroad11(){
			try {
				JsonUtils.write(wqgzServer.selectGpsroad11(jckwqgz), getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
	public void JckWqgzRoad(){
		try {
			JsonUtils.write(wqgzServer.JckWqgzRoad(jckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void selectJckShwqgz(){
		if(jckwqgz.getGydw().indexOf(",")==-1){
			jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
		}else{
			jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
		}
		if(jckwqgz.getXzqhdm().indexOf(",")==-1){
			jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
		}else{
			jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
		}
		if(jckwqgz.getTsdq().length()>0){
			String[] tsdqs=jckwqgz.getTsdq().split(",");
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
			jckwqgz.setTsdq(tsdq);
		}
		if(jckwqgz.getGldj().length()>0){
			String[] tsdqs=jckwqgz.getGldj().split(",");
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
			jckwqgz.setGldj(tsdq);
		}
		if(jckwqgz.getJsdj().length()>0){
			String[] tsdqs=jckwqgz.getJsdj().split(",");
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
			jckwqgz.setJsdj(tsdq);
		}
		if(jckwqgz.getAkjfl().length()>0){
			String[] tsdqs=jckwqgz.getAkjfl().split(",");
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
			jckwqgz.setAkjfl(tsdq);
		}
		
		List<Jckwqgz> wqgzList = wqgzServer.selectJckShwqgz(jckwqgz);
		int count = wqgzServer.selectWqgzShCount(jckwqgz);
		EasyUIPage<Jckwqgz> eui = new EasyUIPage<Jckwqgz>();
		eui.setRows(wqgzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckWqgzTH(){
		try {
			JsonUtils.write(wqgzServer.xgJckWqgzTH(delstr),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckWqgzTHxj(){
		try {
			JsonUtils.write(wqgzServer.xgJckWqgzTHxj(delstr),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void onceWqgz(){
		boolean b = wqgzServer.onceWqgz(jckwqgz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selJsdj(){
		try {
			JsonUtils.write(wqgzServer.selJsdj(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectWqgzCount(){
		try {
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			if(jckwqgz.getTsdq().length()>0){
				String[] tsdqs=jckwqgz.getTsdq().split(",");
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
				jckwqgz.setTsdq(tsdq);
			}
			if(jckwqgz.getGldj().length()>0){
				String[] tsdqs=jckwqgz.getGldj().split(",");
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
				jckwqgz.setGldj(tsdq);
			}
			if(jckwqgz.getJsdj().length()>0){
				String[] tsdqs=jckwqgz.getJsdj().split(",");
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
				System.out.println(tsdq);
				jckwqgz.setJsdj(tsdq);
			}
			if(jckwqgz.getAkjfl().length()>0){
				String[] tsdqs=jckwqgz.getAkjfl().split(",");
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
				jckwqgz.setAkjfl(tsdq);
			}
			ResponseUtils.write(getresponse(), wqgzServer.selectWqgzCount(jckwqgz)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectWqgzCount1(){
		try {
			if(jckwqgz.getGydw().indexOf(",")==-1){
				if(jckwqgz.getGydw().length()==9)
					jckwqgz.setGydw("and (gydwbm='"+jckwqgz.getGydw()+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+jckwqgz.getGydw()+"'||'00'))");
					else
				jckwqgz.setGydw("and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
			}else{
				jckwqgz.setGydw("and gydwbm in ("+jckwqgz.getGydw()+")");
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			
			if(jckwqgz.getTsdq().length()>0){
				String[] tsdqs=jckwqgz.getTsdq().split(",");
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
				jckwqgz.setTsdq(tsdq);
			}
			if(jckwqgz.getGldj().length()>0){
				String[] tsdqs=jckwqgz.getGldj().split(",");
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
				jckwqgz.setGldj(tsdq);
			}
			
			if(jckwqgz.getAkjfl().length()>0){
				String[] tsdqs=jckwqgz.getAkjfl().split(",");
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
				jckwqgz.setAkjfl(tsdq);
			}
			ResponseUtils.write(getresponse(), wqgzServer.selectWqgzCount1(jckwqgz)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectWqgzShCount(){
		try {
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			if(jckwqgz.getTsdq().length()>0){
				String[] tsdqs=jckwqgz.getTsdq().split(",");
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
				jckwqgz.setTsdq(tsdq);
			}
			if(jckwqgz.getGldj().length()>0){
				String[] tsdqs=jckwqgz.getGldj().split(",");
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
				jckwqgz.setGldj(tsdq);
			}
			if(jckwqgz.getJsdj().length()>0){
				String[] tsdqs=jckwqgz.getJsdj().split(",");
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
				jckwqgz.setJsdj(tsdq);
			}
			if(jckwqgz.getAkjfl().length()>0){
				String[] tsdqs=jckwqgz.getAkjfl().split(",");
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
				jckwqgz.setAkjfl(tsdq);
			}
			ResponseUtils.write(getresponse(), wqgzServer.selectWqgzShCount(jckwqgz)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Jckwqgz getJckwqgz() {
		return jckwqgz;
	}
	public void setJckwqgz(Jckwqgz jckwqgz) {
		this.jckwqgz = jckwqgz;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Jckwqgz getModel() {
		return jckwqgz;
	}
	public JckwqgzServer getWqgzServer() {
		return wqgzServer;
	}
	public void setWqgzServer(JckwqgzServer wqgzServer) {
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
	public void selectTSDQ(){
		
		List<String> tsdqstr=wqgzServer.selectTSDQ(jckwqgz);
		try {
			JsonUtils.write(tsdqstr, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private String xzqhdm1;
	
	public String getXzqhdm1() {
		return xzqhdm1;
	}
	public void setXzqhdm1(String xzqhdm1) {
		this.xzqhdm1 = xzqhdm1;
	}
	public void selectTSDQ1(){
		
		List<String> tsdqstr=wqgzServer.selectTSDQ1(xzqhdm1);
		try {
			JsonUtils.write(tsdqstr, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
