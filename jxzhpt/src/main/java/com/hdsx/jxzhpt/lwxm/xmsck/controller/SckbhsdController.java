package com.hdsx.jxzhpt.lwxm.xmsck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckbhsd;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckbhsd;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckbhsdServer;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckbhsdServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.Unit;
import com.hdsx.jxzhpt.xtgl.server.XtglServer;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目审查库——灾害防治Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class SckbhsdController extends BaseActionSupport implements ModelDriven<Sckbhsd>{

	private static final long serialVersionUID = 1L;
	@Resource(name="sckbhsdServerImpl")
	private SckbhsdServer wqgzServer;
	@Resource(name="xtglServerImpl")
	private XtglServer xtglServer;
	private Sckbhsd Sckbhsd=new Sckbhsd();
	private String delstr;
	private String nf;
	private String tbbmbm1;
	private String tbbmbm2;
	private String sbthcd1;
	private String fileuploadFileName;
	private File fileupload;
	private String unit2;
	
	public String getUnit2() {
		return unit2;
	}
	public void setUnit2(String unit2) {
		this.unit2 = unit2;
	}
	//审查库安保工程模板数据导入
	public void importBhsd_sc(){
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
				dataMapArray = ExcelReader.readExcelContent(4,15,fs,Jckbhsd.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map<String,String>> data = ExcelReader.removeBlankRow2(dataMapArray[0]);
			//将数据插入到数据库
			String str=wqgzServer.yanZhen(data, tbbmbm1,tbbmbm2,sbthcd1);
			if(str.equals("Sckbhsd_ok")){
				if(wqgzServer.importWqgz_sc(data,tbbmbm2,sbthcd1)) 
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
	public void exportExcel_bhsd_scgl(){
		try {
			if (Sckbhsd.getSck_sbzt()!=null) {
				Sckbhsd.setSck_sbzt(URLDecoder.decode(Sckbhsd.getSck_sbzt(), "UTF-8"));
			}
			if (Sckbhsd.getAcdfl()!=null) {
				Sckbhsd.setAcdfl(URLDecoder.decode(Sckbhsd.getAcdfl(), "UTF-8"));
			}
			if (Sckbhsd.getJsdj()!=null) {
				Sckbhsd.setJsdj(URLDecoder.decode(Sckbhsd.getJsdj(), "UTF-8"));
			}
			if(Sckbhsd.getXzqhdm().indexOf(",")==-1){
				Sckbhsd.setXzqhdm("and xzqhdm like '%"+Sckbhsd.getXzqhdm()+"%'");
			}else{
				Sckbhsd.setXzqhdm("and xzqhdm in ("+Sckbhsd.getXzqhdm()+")");
			}
			if(Sckbhsd.getGydw().indexOf(",")==-1){
				Sckbhsd.setGydw("and scbmbm like '%'||substr('"+Sckbhsd.getGydw()+"',0,4)||'_'||substr('"+Sckbhsd.getGydw()+"',6)||'%'");
			}else{
				Sckbhsd.setGydw("and scbmbm in ("+Sckbhsd.getGydw()+")");
			}
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqgz_scgl(Sckbhsd);
			//导出设置
			String excelHtml="<tr><td>上报状态</td><td>审核状态</td><td>管养单位</td><td>行政区划</td><td>隧道代码</td><td>隧道名称</td>" +
					"<td>隧道中心桩号</td><td>路线编码</td><td>路线名称</td><td>隧道评定等级</td><td>修建/改建年度</td>" +
					"<td>项目年份</td><td>建设性质</td><td>项目名称</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("病害隧道项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("隧道");
			sheetb.setList(list);
			sheetb.setColnum((short)14);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="病害隧道项目";//excel 文件的名字
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
	public void exportExcel_bhsd_scsh(){
		try {
			if (Sckbhsd.getSck_shzt()!=null) {
				Sckbhsd.setSck_shzt(URLDecoder.decode(Sckbhsd.getSck_shzt(), "UTF-8"));
			}
			if (Sckbhsd.getAcdfl()!=null) {
				Sckbhsd.setAcdfl(URLDecoder.decode(Sckbhsd.getAcdfl(), "UTF-8"));
			}
			if (Sckbhsd.getJsdj()!=null) {
				Sckbhsd.setJsdj(URLDecoder.decode(Sckbhsd.getJsdj(), "UTF-8"));
			}
			if(Sckbhsd.getXzqhdm().indexOf(",")==-1){
				Sckbhsd.setXzqhdm("and xzqhdm like '%"+Sckbhsd.getXzqhdm()+"%'");
			}else{
				Sckbhsd.setXzqhdm("and xzqhdm in ("+Sckbhsd.getXzqhdm()+")");
			}
			if(Sckbhsd.getGydw().indexOf(",")==-1){
				Sckbhsd.setGydw("and scbmbm like '%'||substr('"+Sckbhsd.getGydw()+"',0,4)||'_'||substr('"+Sckbhsd.getGydw()+"',6)||'%'");
			}else{
				Sckbhsd.setGydw("and scbmbm in ("+Sckbhsd.getGydw()+")");
			}
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqgz_scsh(Sckbhsd);
			//导出设置
			String excelHtml="<tr><td>审核状态</td><td>管养单位</td><td>行政区划</td><td>隧道代码</td><td>隧道名称</td>" +
					"<td>隧道中心桩号</td><td>路线编码</td><td>路线名称</td><td>隧道评定等级</td><td>修建/改建年度</td>" +
					"<td>项目年份</td><td>建设性质</td><td>项目名称</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("病害隧道项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("隧道");
			sheetb.setList(list);
			sheetb.setColnum((short)13);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="病害隧道项目";//excel 文件的名字
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
	public void exportExcel_bhsd_scsd(){
		try {
			if (Sckbhsd.getAcdfl()!=null) {
				Sckbhsd.setAcdfl(URLDecoder.decode(Sckbhsd.getAcdfl(), "UTF-8"));
			}
			if (Sckbhsd.getJsdj()!=null) {
				Sckbhsd.setJsdj(URLDecoder.decode(Sckbhsd.getJsdj(), "UTF-8"));
			}
			if(Sckbhsd.getXzqhdm().indexOf(",")==-1){
				Sckbhsd.setXzqhdm("and xzqhdm like '%"+Sckbhsd.getXzqhdm()+"%'");
			}else{
				Sckbhsd.setXzqhdm("and xzqhdm in ("+Sckbhsd.getXzqhdm()+")");
			}
			if(Sckbhsd.getGydw().indexOf(",")==-1){
				Sckbhsd.setGydw("and scbmbm like '%'||substr('"+Sckbhsd.getGydw()+"',0,4)||'_'||substr('"+Sckbhsd.getGydw()+"',6)||'%'");
			}else{
				Sckbhsd.setGydw("and scbmbm in ("+Sckbhsd.getGydw()+")");
			}
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqgz_scsd(Sckbhsd);
			//导出设置
			String excelHtml="<tr><td>审定状态</td><td>管养单位</td><td>行政区划</td><td>隧道代码</td><td>隧道名称</td>" +
					"<td>隧道中心桩号</td><td>路线编码</td><td>路线名称</td><td>隧道评定等级</td><td>修建/改建年度</td>" +
					"<td>项目年份</td><td>建设性质</td><td>项目名称</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("病害隧道项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("隧道");
			sheetb.setList(list);
			sheetb.setColnum((short)13);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="病害隧道项目";//excel 文件的名字
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
	
	public void insertSckbhsd(){
		boolean b = wqgzServer.insertSckbhsd(Sckbhsd);
		if(b)  ResponseUtils.write(getresponse(), "true");
		else ResponseUtils.write(getresponse(), "false");
	}
	public void selectSckbhsd(){
		
		if(Sckbhsd.getXzqhdm().indexOf(",")==-1){
			Sckbhsd.setXzqhdm("and xzqhdm like '%"+Sckbhsd.getXzqhdm()+"%'");
		}else{
			Sckbhsd.setXzqhdm("and xzqhdm in ("+Sckbhsd.getXzqhdm()+")");
		}
		if(Sckbhsd.getGydw().indexOf(",")==-1){
			Sckbhsd.setGydw("and scbmbm like '%'||substr('"+Sckbhsd.getGydw()+"',0,4)||'_'||substr('"+Sckbhsd.getGydw()+"',6)||'%'");
		}else{
			Sckbhsd.setGydw("and scbmbm in ("+Sckbhsd.getGydw()+")");
		}
		List<Sckbhsd> list = wqgzServer.selectSckbhsd(Sckbhsd);
		int count = wqgzServer.selectWqgzCount(Sckbhsd);
		EasyUIPage<Sckbhsd> eui = new EasyUIPage<Sckbhsd>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteSckbhsd(){
		if(wqgzServer.deleteSckbhsd(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateSckbhsd(){
		if(wqgzServer.updateSckbhsd(Sckbhsd)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckbhsdById(){
		try {
			JsonUtils.write(wqgzServer.selectSckbhsdById(Sckbhsd), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckbhsdSbzt(){
		if(wqgzServer.xgSckbhsdSbzt(delstr,Sckbhsd)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void xgSckbhsdTH(){
		try {
			JsonUtils.write(wqgzServer.xgSckbhsdTH(delstr,Sckbhsd),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectSckShbhsd(){

		if(Sckbhsd.getXzqhdm().indexOf(",")==-1){
			Sckbhsd.setXzqhdm("and xzqhdm like '%"+Sckbhsd.getXzqhdm()+"%'");
		}else{
			Sckbhsd.setXzqhdm("and xzqhdm in ("+Sckbhsd.getXzqhdm()+")");
		}
		if(Sckbhsd.getGydw().indexOf(",")==-1){
			Sckbhsd.setGydw("and scbmbm like '%'||substr('"+Sckbhsd.getGydw()+"',0,4)||'_'||substr('"+Sckbhsd.getGydw()+"',6)||'%'");
		}else{
			Sckbhsd.setGydw("and scbmbm in ("+Sckbhsd.getGydw()+")");
		}
		List<Sckbhsd> list = wqgzServer.selectSckShwqgz(Sckbhsd);
		int count = wqgzServer.selectWqgzShCount(Sckbhsd);
		EasyUIPage<Sckbhsd> eui = new EasyUIPage<Sckbhsd>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectSckSdbhsd(){

		if(Sckbhsd.getXzqhdm().indexOf(",")==-1){
			Sckbhsd.setXzqhdm("and xzqhdm like '%"+Sckbhsd.getXzqhdm()+"%'");
		}else{
			Sckbhsd.setXzqhdm("and xzqhdm in ("+Sckbhsd.getXzqhdm()+")");
		}
		if(Sckbhsd.getGydw().indexOf(",")==-1){
			Sckbhsd.setGydw("and scbmbm like '%'||substr('"+Sckbhsd.getGydw()+"',0,4)||'_'||substr('"+Sckbhsd.getGydw()+"',6)||'%'");
		}else{
			Sckbhsd.setGydw("and scbmbm in ("+Sckbhsd.getGydw()+")");
		}
		List<Sckbhsd> list = wqgzServer.selectSckSdwqgz(Sckbhsd);
		int count = wqgzServer.selectWqgzSdCount(Sckbhsd);
		EasyUIPage<Sckbhsd> eui = new EasyUIPage<Sckbhsd>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void xgSckbhsdShzt(){
		if(wqgzServer.xgSckbhsdShzt(delstr,Sckbhsd,tbbmbm1,nf)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void xgSckbhsdSdzt(){
		if(wqgzServer.xgSckbhsdSdzt(delstr,Sckbhsd,tbbmbm1,nf)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void onceSckBhsd(){
		boolean b = wqgzServer.onceSckbhsd(Sckbhsd);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void bzBhsd(){
		boolean b = wqgzServer.bzWqgz(Sckbhsd);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void lrjhSckbhsd(){
		try{
			boolean b = wqgzServer.lrjhSckbhsd(delstr,nf,sbthcd1);
			if(b){
				wqgzServer.xglrjhSckbhsd(delstr);
				ResponseUtils.write(getresponse(), "true");
			}else ResponseUtils.write(getresponse(), "false");
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public void selectBhsdCount(){
		try {

			if(Sckbhsd.getXzqhdm().indexOf(",")==-1){
				Sckbhsd.setXzqhdm("and xzqhdm like '%"+Sckbhsd.getXzqhdm()+"%'");
			}else{
				Sckbhsd.setXzqhdm("and xzqhdm in ("+Sckbhsd.getXzqhdm()+")");
			}
			if(Sckbhsd.getGydw().indexOf(",")==-1){
				Sckbhsd.setGydw("and scbmbm like '%'||substr('"+Sckbhsd.getGydw()+"',0,4)||'_'||substr('"+Sckbhsd.getGydw()+"',6)||'%'");
			}else{
				Sckbhsd.setGydw("and scbmbm in ("+Sckbhsd.getGydw()+")");
			}
			ResponseUtils.write(getresponse(), wqgzServer.selectWqgzCount(Sckbhsd)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectBhsdShCount(){
		try {
			if(Sckbhsd.getXzqhdm().indexOf(",")==-1){
				Sckbhsd.setXzqhdm("and xzqhdm like '%"+Sckbhsd.getXzqhdm()+"%'");
			}else{
				Sckbhsd.setXzqhdm("and xzqhdm in ("+Sckbhsd.getXzqhdm()+")");
			}
			if(Sckbhsd.getGydw().indexOf(",")==-1){
				Sckbhsd.setGydw("and scbmbm like '%'||substr('"+Sckbhsd.getGydw()+"',0,4)||'_'||substr('"+Sckbhsd.getGydw()+"',6)||'%'");
			}else{
				Sckbhsd.setGydw("and scbmbm in ("+Sckbhsd.getGydw()+")");
			}
			ResponseUtils.write(getresponse(), wqgzServer.selectWqgzShCount(Sckbhsd)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectBhsdSdCount(){
		try {

			if(Sckbhsd.getXzqhdm().indexOf(",")==-1){
				Sckbhsd.setXzqhdm("and xzqhdm like '%"+Sckbhsd.getXzqhdm()+"%'");
			}else{
				Sckbhsd.setXzqhdm("and xzqhdm in ("+Sckbhsd.getXzqhdm()+")");
			}
			if(Sckbhsd.getGydw().indexOf(",")==-1){
				Sckbhsd.setGydw("and scbmbm like '%'||substr('"+Sckbhsd.getGydw()+"',0,4)||'_'||substr('"+Sckbhsd.getGydw()+"',6)||'%'");
			}else{
				Sckbhsd.setGydw("and scbmbm in ("+Sckbhsd.getGydw()+")");
			}
			ResponseUtils.write(getresponse(), wqgzServer.selectWqgzSdCount(Sckbhsd)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void lrjhBhsd(){

		if(Sckbhsd.getXzqhdm().indexOf(",")==-1){
			Sckbhsd.setXzqhdm("and xzqhdm like '%"+Sckbhsd.getXzqhdm()+"%'");
		}else{
			Sckbhsd.setXzqhdm("and xzqhdm in ("+Sckbhsd.getXzqhdm()+")");
		}
		List<Sckbhsd> list = wqgzServer.lrjhWqgz(Sckbhsd);
		int count = wqgzServer.lrjhWqgzCount(Sckbhsd);
		EasyUIPage<Sckbhsd> eui = new EasyUIPage<Sckbhsd>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

	public Sckbhsd getSckbhsd() {
		return Sckbhsd;
	}
	public void setSckbhsd(Sckbhsd Sckbhsd) {
		this.Sckbhsd = Sckbhsd;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Sckbhsd getModel() {
		return Sckbhsd;
	}
	public SckbhsdServer getWqgzServer() {
		return wqgzServer;
	}
	public void setWqgzServer(SckbhsdServer wqgzServer) {
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
	public XtglServer getXtglServer() {
		return xtglServer;
	}
	public void setXtglServer(XtglServer xtglServer) {
		this.xtglServer = xtglServer;
	}
	
}
