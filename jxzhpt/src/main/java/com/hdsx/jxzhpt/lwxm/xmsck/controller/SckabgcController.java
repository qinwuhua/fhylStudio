package com.hdsx.jxzhpt.lwxm.xmsck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckabgcServer;
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
				dataMapArray = ExcelReader.readExcelContent(4,19,fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			//将数据插入到数据库
			boolean b=abgcServer.importAbgc_sc(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){}
	}
	public void exportExcel_abgc_scgl(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=abgcServer.exportExcel_abgc_scgl(sckabgc);
			//导出设置
			String excelHtml="<tr><td>上报状态</td><td>管养单位</td><td>行政区划</td><td>路线编码</td><td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>起止里程</td><td>总里程</td><td>隐患里程</td><td>修建/改建年度</td><td>项目年份</td><td>建设性质</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("安保工程项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			sheetb.setList(list);
			sheetb.setColnum((short)13);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="安保工程项目";//excel 文件的名字
			//导出excel
			ExportExcel_new ee = new ExportExcel_new();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void exportExcel_abgc_scsh(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=abgcServer.exportExcel_abgc_scsh(sckabgc);
			//导出设置
			String excelHtml="<tr><td>上报状态</td><td>管养单位</td><td>行政区划</td><td>路线编码</td><td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>起止里程</td><td>总里程</td><td>隐患里程</td><td>修建/改建年度</td><td>项目年份</td><td>建设性质</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("安保工程项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			sheetb.setList(list);
			sheetb.setColnum((short)13);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="安保工程项目";//excel 文件的名字
			//导出excel
			ExportExcel_new ee = new ExportExcel_new();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void insertSckabgc(){
		boolean b = abgcServer.insertSckabgc(sckabgc);
		if(b)  ResponseUtils.write(getresponse(), "true");
		else ResponseUtils.write(getresponse(), "false");
	}
	public void selectSckabgc(){
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
		if(abgcServer.xgSckAbgcSbzt(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectSckShabgc(){
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
		if(abgcServer.xgSckAbgcShzt(sckabgc)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
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
	
}
