package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.bcel.generic.NEW;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckbhsd;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckbhsdServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.server.XtglServer;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目基础库——危桥改造Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class JckbhsdController extends BaseActionSupport implements ModelDriven<Jckbhsd>{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckbhsdServerImpl")
	private JckbhsdServer bhsdServer;
	@Resource(name="xtglServerImpl")
	private XtglServer xtglServer;
	private Jckbhsd jckwqgz=new Jckbhsd();
	private String delstr;
	private String tbbmbm1;
	private String tbbmbm2;
	private String sbthcd1;
	private String fileuploadFileName;
	private File fileupload;
	private String unit2;
	
	//excel数据导入
	public void importBhsd(){
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
				dataMapArray = ExcelReader.readExcelContent(3,16,fs,Jckbhsd.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			try{
				//去除excel中的空白行数据
				List<Map<String,String>> data=ExcelReader.removeBlankRow2(dataMapArray[0]);
			if(bhsdServer.yanZhen(data, tbbmbm1).equals("jckbhsd_ok")){
				if(bhsdServer.importWqgz2(data,tbbmbm2,sbthcd1)) 
					response.getWriter().print(fileuploadFileName+"导入成功");
				else 
					response.getWriter().print(fileuploadFileName+"服务器异常,请重试");
			}else{
				response.getWriter().print("提示："+fileuploadFileName+bhsdServer.yanZhen(data, tbbmbm1));
			}
			}catch(Exception e){
				e.printStackTrace();
				response.getWriter().print(fileuploadFileName+"导入失败，请重试");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void exportExcel_bhsd(){
		try {
			if (jckwqgz.getSbzt()!=null) {
				jckwqgz.setSbzt(URLDecoder.decode(jckwqgz.getSbzt(), "UTF-8"));
			}
			if (jckwqgz.getAcdfl()!=null) {
				jckwqgz.setAcdfl(URLDecoder.decode(jckwqgz.getAcdfl(), "UTF-8"));
			}
			if (jckwqgz.getJsdj()!=null) {
				jckwqgz.setJsdj(URLDecoder.decode(jckwqgz.getJsdj(), "UTF-8"));
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			//先得到导出的数据集
			List <SjbbMessage> list=bhsdServer.exportExcel_wqgz(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>上报状态</td><td>管养单位</td><td>行政区划</td><td>隧道代码</td><td>隧道名称</td>" +
					"<td>隧道中心桩号</td><td>路线编码</td><td>路线名称</td><td>隧道评定等级</td><td>修建/改建年度</td>" +
					"<td>项目年份</td><td>项目名称</td><td>建设性质</td></tr>";
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
			ExportExcel_new <Jckbhsd> ee = new ExportExcel_new<Jckbhsd>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void exportExcel_bhsd_sh(){
		try {
			if (jckwqgz.getShzt()!=null) {
				jckwqgz.setShzt(URLDecoder.decode(jckwqgz.getShzt(), "UTF-8"));
			}
			if (jckwqgz.getAcdfl()!=null) {
				jckwqgz.setAcdfl(URLDecoder.decode(jckwqgz.getAcdfl(), "UTF-8"));
			}
			if (jckwqgz.getJsdj()!=null) {
				jckwqgz.setJsdj(URLDecoder.decode(jckwqgz.getJsdj(), "UTF-8"));
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			//先得到导出的数据集
			List <SjbbMessage> list=bhsdServer.exportExcel_wqgz_sh(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>审核状态</td><td>管养单位</td><td>行政区划</td><td>隧道代码</td><td>隧道名称</td>" +
					"<td>隧道中心桩号</td><td>路线编码</td><td>路线名称</td><td>隧道评定等级</td><td>修建/改建年度</td>" +
					"<td>项目年份</td><td>项目名称</td><td>建设性质</td></tr>";
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
	
	public void exportExcel_bhsd_sd(){
		try {
			if (jckwqgz.getAcdfl()!=null) {
				jckwqgz.setAcdfl(URLDecoder.decode(jckwqgz.getAcdfl(), "UTF-8"));
			}
			if (jckwqgz.getJsdj()!=null) {
				jckwqgz.setJsdj(URLDecoder.decode(jckwqgz.getJsdj(), "UTF-8"));
			}
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			//先得到导出的数据集
			List <SjbbMessage> list=bhsdServer.exportExcel_wqgz_sd(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>审定状态</td><td>管养单位</td><td>行政区划</td><td>隧道代码</td><td>隧道名称</td>" +
					"<td>隧道中心桩号</td><td>路线编码</td><td>路线名称</td><td>隧道评定等级</td><td>修建/改建年度</td>" +
					"<td>项目年份</td><td>项目名称</td><td>建设性质</td></tr>";
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
	
	public void insertBhsd(){
		boolean b = bhsdServer.insertWqgz(jckwqgz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectBhsd(){
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
		List<Jckbhsd> wqgzList = bhsdServer.selectWqgzList(jckwqgz);
		int count = bhsdServer.selectWqgzCount(jckwqgz);
		EasyUIPage<Jckbhsd> eui = new EasyUIPage<Jckbhsd>();
		eui.setRows(wqgzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectBhsdById(){
		try {
			JsonUtils.write(bhsdServer.selectWqgzById(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateBhsdById(){
		try {
			JsonUtils.write(bhsdServer.updateWqgzById(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteBhsdById(){
		try {
			JsonUtils.write(bhsdServer.deleteWqgzById(delstr),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckBhsdShzt(){
		try {
			JsonUtils.write(bhsdServer.xgJckbhsdShzt(delstr,jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void xgJckBhsdSdzt(){
		try {
			JsonUtils.write(bhsdServer.xgJckbhsdSdzt(delstr,jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void xgJckBhsdSbzt(){
		try {
			JsonUtils.write(bhsdServer.xgJckbhsdSbzt(delstr,jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//自动填充LXMC
	public void bhsdGpsroad(){
		try {
			JsonUtils.write(bhsdServer.selectGpsroad(jckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void JckBhsdRoad(){
		try {
			JsonUtils.write(bhsdServer.JckbhsdRoad(jckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectJckShbhsd(){
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
//		if (jckwqgz.getXtType()!=null&&!jckwqgz.getXtType().equals("")
//				&&jckwqgz.getXtType().equals("nc")) {
//			jckwqgz.setXtType("and substr(lxbm,1,1) not in('G','S')");
//		}else {
//			jckwqgz.setXtType("and substr(lxbm,1,1) in('G','S')");
//		}
		List<Jckbhsd> wqgzList = bhsdServer.selectJckShwqgz(jckwqgz);
		int count = bhsdServer.selectWqgzShCount(jckwqgz);
		EasyUIPage<Jckbhsd> eui = new EasyUIPage<Jckbhsd>();
		eui.setRows(wqgzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectJckSdbhsd(){
		if(jckwqgz.getXzqhdm().indexOf(",")==-1){
			jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
		}else{
			jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
		}
		if(jckwqgz.getGydw().indexOf(",")==-1){
			jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
		}else{
			jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
		}
		
		List<Jckbhsd> wqgzList = bhsdServer.selectJckSdwqgz(jckwqgz);
		int count = bhsdServer.selectWqgzSdCount(jckwqgz);
		EasyUIPage<Jckbhsd> eui = new EasyUIPage<Jckbhsd>();
		eui.setRows(wqgzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void xgJckBhsdTH(){
		try {
			JsonUtils.write(bhsdServer.xgJckbhsdTH(delstr,jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void onceBhsd(){
		boolean b = bhsdServer.onceWqgz(jckwqgz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selJsdj(){
		try {
			JsonUtils.write(bhsdServer.selJsdj(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectBhsdCount(){
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
//			if (jckwqgz.getXtType()!=null&&!jckwqgz.getXtType().equals("")
//					&&jckwqgz.getXtType().equals("nc")) {
//				jckwqgz.setXtType("and substr(lxbm,1,1) not in('G','S')");
//			}else {
//				jckwqgz.setXtType("and substr(lxbm,1,1) in('G','S')");
//			}
			ResponseUtils.write(getresponse(), bhsdServer.selectWqgzCount(jckwqgz)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectBhsdShCount(){
		try {
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			ResponseUtils.write(getresponse(), bhsdServer.selectWqgzShCount(jckwqgz)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectBhsdSdCount(){
		try {
			if(jckwqgz.getXzqhdm().indexOf(",")==-1){
				jckwqgz.setXzqhdm("and xzqhdm like '%"+jckwqgz.getXzqhdm()+"%'");
			}else{
				jckwqgz.setXzqhdm("and xzqhdm in ("+jckwqgz.getXzqhdm()+")");
			}
			if(jckwqgz.getGydw().indexOf(",")==-1){
				jckwqgz.setGydw("and tbbmbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'");
			}else{
				jckwqgz.setGydw("and tbbmbm in ("+jckwqgz.getGydw()+")");
			}
			ResponseUtils.write(getresponse(), bhsdServer.selectWqgzSdCount(jckwqgz)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	public JckbhsdServer getbhsdServer() {
		return bhsdServer;
	}
	public void setbhsdServer(JckbhsdServer bhsdServer) {
		this.bhsdServer = bhsdServer;
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
	private String xzqhdm1;

	public String getXzqhdm1() {
		return xzqhdm1;
	}
	public void setXzqhdm1(String xzqhdm1) {
		this.xzqhdm1 = xzqhdm1;
	}
	public void selectTSDQ(){
		System.out.println(xzqhdm1+"**");
		List<String> tsdqstr=bhsdServer.selectTSDQ(xzqhdm1);
		try {
			JsonUtils.write(tsdqstr, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getUnit2() {
		return unit2;
	}
	public void setUnit2(String unit2) {
		this.unit2 = unit2;
	}
	@Override
	public Jckbhsd getModel() {
		return jckwqgz;
	}
	public Jckbhsd getJckwqgz() {
		return jckwqgz;
	}
	public void setJckwqgz(Jckbhsd jckwqgz) {
		this.jckwqgz = jckwqgz;
	}
	
}
