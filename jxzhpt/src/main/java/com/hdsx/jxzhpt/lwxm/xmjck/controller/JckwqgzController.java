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
				jckwqgz.setGydw("and tbbmbm like '%"+jckwqgz.getGydw()+"%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqgz(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>上报状态</td><td>管养单位</td><td>行政区划</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>路线编码</td><td>路线名称</td><td>桥梁评定等级</td><td>修建/改建年度</td><td>项目年份</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥改造项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)11);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥改造项目";//excel 文件的名字
			//导出excel
			ExportExcel_new <Jckwqgz> ee = new ExportExcel_new<Jckwqgz>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void exportExcel_wqgz_sh(){
		try {
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%"+jckwqgz.getGydw()+"%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqgz_sh(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>审核状态</td><td>管养单位</td><td>行政区划</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>路线编码</td><td>路线名称</td><td>桥梁评定等级</td><td>修建/改建年度</td><td>项目年份</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥改造项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)11);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥改造项目";//excel 文件的名字
			//导出excel
			ExportExcel_new ee = new ExportExcel_new();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
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
			jckwqgz.setGydw("and tbbmbm like '%"+jckwqgz.getGydw()+"%'");
		}else{
			jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
		}
		if(jckwqgz.getXzqhdm().indexOf(",")==-1){
			jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
		}else{
			jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
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
	public void JckWqgzRoad(){
		try {
			JsonUtils.write(wqgzServer.JckWqgzRoad(jckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectJckShwqgz(){
		if(jckwqgz.getGydw().indexOf(",")==-1){
			jckwqgz.setGydw("and tbbmbm like '%"+jckwqgz.getGydw()+"%'");
		}else{
			jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
		}
		if(jckwqgz.getXzqhdm().indexOf(",")==-1){
			jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
		}else{
			jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
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
				jckwqgz.setGydw("and tbbmbm like '%"+jckwqgz.getGydw()+"%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			ResponseUtils.write(getresponse(), wqgzServer.selectWqgzCount(jckwqgz)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectWqgzShCount(){
		try {
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%"+jckwqgz.getGydw()+"%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
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
}
