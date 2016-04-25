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

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckzhfzServer;
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
 * 项目审查库——灾害防治Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class SckzhfzController extends BaseActionSupport implements ModelDriven<Sckzhfz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="sckzhfzServerImpl")
	private SckzhfzServer zhfzServer;
	private Sckzhfz sckzhfz=new Sckzhfz();
	private String delstr;
	private String nf;
	private String tbbmbm1;
	private String tbbmbm2;
	private String sbthcd1;
	private String fileuploadFileName;
	private File fileupload;
	
	
	//审查库安保工程模板数据导入
	public void importZhfz_sc(){
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
			String str=zhfzServer.yanZhen(data, tbbmbm1,tbbmbm2, sbthcd1);
			if(str.equals("sckzhfz_ok")){
				if(zhfzServer.importZhfz_sc(data,tbbmbm2,sbthcd1)) 
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
	public void exportExcel_zhfz_scgl(){
		try {
			if(sckzhfz.getGydw().indexOf(",")==-1){
				sckzhfz.setGydw("and scbmbm like '%'||substr("+sckzhfz.getGydw()+",0,4)||'_'||substr("+sckzhfz.getGydw()+",6)||'%'");
			}else{
				sckzhfz.setGydw("and scbmbm in ("+sckzhfz.getGydw()+")");
			}
			if(sckzhfz.getXzqhdm().indexOf(",")==-1){
				sckzhfz.setXzqhdm("and xzqhdm like '%"+sckzhfz.getXzqhdm()+"%'");
			}else{
				sckzhfz.setXzqhdm("and xzqhdm in ("+sckzhfz.getXzqhdm()+")");
			}
			//先得到导出的数据集
			List <SjbbMessage> list=zhfzServer.exportExcel_zhfz_scgl(sckzhfz);
			//导出设置
			String excelHtml="<tr><td>上报状态</td><td>管养单位</td><td>行政区划</td><td>路线编码</td><td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>起止里程</td><td>总里程</td><td>隐患里程</td><td>修建/改建年度</td><td>项目年份</td><td>建设性质</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("灾害防治项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("灾害");
			sheetb.setList(list);
			sheetb.setColnum((short)13);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="灾害防治项目";//excel 文件的名字
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
	public void exportExcel_zhfz_scsh(){
		try {
			if(sckzhfz.getGydw().indexOf(",")==-1){
				sckzhfz.setGydw("and scbmbm like '%'||substr("+sckzhfz.getGydw()+",0,4)||'_'||substr("+sckzhfz.getGydw()+",6)||'%'");
			}else{
				sckzhfz.setGydw("and scbmbm in ("+sckzhfz.getGydw()+")");
			}
			if(sckzhfz.getXzqhdm().indexOf(",")==-1){
				sckzhfz.setXzqhdm("and xzqhdm like '%"+sckzhfz.getXzqhdm()+"%'");
			}else{
				sckzhfz.setXzqhdm("and xzqhdm in ("+sckzhfz.getXzqhdm()+")");
			}
			if(sckzhfz.getLxjsdj().length()>0){
				String[] tsdqs=sckzhfz.getLxjsdj().split(",");
				String tsdq="and lxjsdj in (";
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
				sckzhfz.setLxjsdj(tsdq);
			}
			//先得到导出的数据集
			List <SjbbMessage> list=zhfzServer.exportExcel_zhfz_scsh(sckzhfz);
			//导出设置
			String excelHtml="<tr><td>上报状态</td><td>管养单位</td><td>行政区划</td><td>路线编码</td><td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>起止里程</td><td>总里程</td><td>隐患里程</td><td>修建/改建年度</td><td>项目年份</td><td>建设性质</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("灾害防治项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("灾害");
			sheetb.setList(list);
			sheetb.setColnum((short)13);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="灾害防治项目";//excel 文件的名字
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
	public void insertSckzhfz(){
		boolean b =zhfzServer.insertSckzhfz(sckzhfz);
		if(b)  ResponseUtils.write(getresponse(), "true");
		else ResponseUtils.write(getresponse(), "false");
	}
	public void selectSckzhfz(){
		if(sckzhfz.getGydw().indexOf(",")==-1){
			sckzhfz.setGydw("and scbmbm like '%'||substr("+sckzhfz.getGydw()+",0,4)||'_'||substr("+sckzhfz.getGydw()+",6)||'%'");
		}else{
			sckzhfz.setGydw("and scbmbm in ("+sckzhfz.getGydw()+")");
		}
		if(sckzhfz.getXzqhdm().indexOf(",")==-1){
			sckzhfz.setXzqhdm("and xzqhdm like '%"+sckzhfz.getXzqhdm()+"%'");
		}else{
			sckzhfz.setXzqhdm("and xzqhdm in ("+sckzhfz.getXzqhdm()+")");
		}
		if(sckzhfz.getTsdq().length()>0){
			String[] tsdqs=sckzhfz.getTsdq().split(",");
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
			sckzhfz.setTsdq(tsdq);
		}
		if(sckzhfz.getGldj().length()>0){
			String[] tsdqs=sckzhfz.getGldj().split(",");
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
			sckzhfz.setGldj(tsdq);
		}
		if(sckzhfz.getJsdj().length()>0){
			String[] tsdqs=sckzhfz.getJsdj().split(",");
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
			sckzhfz.setJsdj(tsdq);
		}
		List<Sckzhfz> list = zhfzServer.selectSckzhfz(sckzhfz);
		int count = zhfzServer.selectZhfzCount(sckzhfz);
		EasyUIPage<Sckzhfz> eui = new EasyUIPage<Sckzhfz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteSckZhfz(){
		if(zhfzServer.deleteSckZhfz(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateSckZhfz(){
		if(zhfzServer.updateSckZhfz(sckzhfz)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckzhfzById(){
		try {
			JsonUtils.write(zhfzServer.selectSckzhfzById(sckzhfz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckZhfzSbzt(){
		if(zhfzServer.xgSckZhfzSbzt(delstr,sckzhfz)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckShzhfz(){
		if(sckzhfz.getGydw().indexOf(",")==-1){
			sckzhfz.setGydw("and scbmbm like '%'||substr("+sckzhfz.getGydw()+",0,4)||'_'||substr("+sckzhfz.getGydw()+",6)||'%'");
		}else{
			sckzhfz.setGydw("and scbmbm in ("+sckzhfz.getGydw()+")");
		}
		if(sckzhfz.getXzqhdm().indexOf(",")==-1){
			sckzhfz.setXzqhdm("and xzqhdm like '%"+sckzhfz.getXzqhdm()+"%'");
		}else{
			sckzhfz.setXzqhdm("and xzqhdm in ("+sckzhfz.getXzqhdm()+")");
		}
		if(sckzhfz.getTsdq().length()>0){
			String[] tsdqs=sckzhfz.getTsdq().split(",");
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
			sckzhfz.setTsdq(tsdq);
		}
		if(sckzhfz.getGldj().length()>0){
			String[] tsdqs=sckzhfz.getGldj().split(",");
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
			sckzhfz.setGldj(tsdq);
		}
		if(sckzhfz.getJsdj().length()>0){
			String[] tsdqs=sckzhfz.getJsdj().split(",");
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
			sckzhfz.setJsdj(tsdq);
		}
		List<Sckzhfz> list = zhfzServer.selectSckShzhfz(sckzhfz);
		int count = zhfzServer.selectZhfzShCount(sckzhfz);
		EasyUIPage<Sckzhfz> eui = new EasyUIPage<Sckzhfz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckZhfzShzt(){
		if(zhfzServer.xgSckZhfzShzt(delstr,sckzhfz,nf,tbbmbm1)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void xgSckZhfzTH(){
		try {
			JsonUtils.write(zhfzServer.xgSckZhfzTH(delstr),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void bzZhfz(){
		boolean b = zhfzServer.bzZhfz(sckzhfz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void lrjhSckzhfz(){
		try{
			boolean b = zhfzServer.lrjhSckzhfz(delstr,nf,sbthcd1);
			if(b){
				zhfzServer.xglrjhSckzhfz(delstr);
				ResponseUtils.write(getresponse(), "true");
			}else ResponseUtils.write(getresponse(), "false");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void onceSckZhfz(){
		boolean b = zhfzServer.onceSckZhfz(sckzhfz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selSckZhfzCount(){
		try {
			if(sckzhfz.getGydw().indexOf(",")==-1){
				sckzhfz.setGydw("and scbmbm like '%'||substr("+sckzhfz.getGydw()+",0,4)||'_'||substr("+sckzhfz.getGydw()+",6)||'%'");
			}else{
				sckzhfz.setGydw("and scbmbm in ("+sckzhfz.getGydw()+")");
			}
			if(sckzhfz.getXzqhdm().indexOf(",")==-1){
				sckzhfz.setXzqhdm("and xzqhdm like '%"+sckzhfz.getXzqhdm()+"%'");
			}else{
				sckzhfz.setXzqhdm("and xzqhdm in ("+sckzhfz.getXzqhdm()+")");
			}
			if(sckzhfz.getTsdq().length()>0){
				String[] tsdqs=sckzhfz.getTsdq().split(",");
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
				sckzhfz.setTsdq(tsdq);
			}
			if(sckzhfz.getGldj().length()>0){
				String[] tsdqs=sckzhfz.getGldj().split(",");
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
				sckzhfz.setGldj(tsdq);
			}
			if(sckzhfz.getJsdj().length()>0){
				String[] tsdqs=sckzhfz.getJsdj().split(",");
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
				sckzhfz.setJsdj(tsdq);
			}
			JsonUtils.write(zhfzServer.selSckZhfzCount(sckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selSckZhfzShCount(){
		try {
			if(sckzhfz.getGydw().indexOf(",")==-1){
				sckzhfz.setGydw("and scbmbm like '%'||substr("+sckzhfz.getGydw()+",0,4)||'_'||substr("+sckzhfz.getGydw()+",6)||'%'");
			}else{
				sckzhfz.setGydw("and scbmbm in ("+sckzhfz.getGydw()+")");
			}
			if(sckzhfz.getXzqhdm().indexOf(",")==-1){
				sckzhfz.setXzqhdm("and xzqhdm like '%"+sckzhfz.getXzqhdm()+"%'");
			}else{
				sckzhfz.setXzqhdm("and xzqhdm in ("+sckzhfz.getXzqhdm()+")");
			}
			if(sckzhfz.getTsdq().length()>0){
				String[] tsdqs=sckzhfz.getTsdq().split(",");
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
				sckzhfz.setTsdq(tsdq);
			}
			if(sckzhfz.getGldj().length()>0){
				String[] tsdqs=sckzhfz.getGldj().split(",");
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
				sckzhfz.setGldj(tsdq);
			}
			if(sckzhfz.getJsdj().length()>0){
				String[] tsdqs=sckzhfz.getJsdj().split(",");
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
				sckzhfz.setJsdj(tsdq);
			}
			JsonUtils.write(zhfzServer.selSckZhfzShCount(sckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void lrjhZhfz(){
		if(sckzhfz.getGydw().indexOf(",")==-1){
			sckzhfz.setGydw("and scbmbm like '%'||substr("+sckzhfz.getGydw()+",0,4)||'_'||substr("+sckzhfz.getGydw()+",6)||'%'");
		}else{
			sckzhfz.setGydw("and scbmbm in ("+sckzhfz.getGydw()+")");
		}
		if(sckzhfz.getXzqhdm().indexOf(",")==-1){
			sckzhfz.setXzqhdm("and xzqhdm like '%"+sckzhfz.getXzqhdm()+"%'");
		}else{
			sckzhfz.setXzqhdm("and xzqhdm in ("+sckzhfz.getXzqhdm()+")");
		}
		List<Sckzhfz> list = zhfzServer.lrjhZhfz(sckzhfz);
		int count = zhfzServer.lrjhZhfzCount(sckzhfz);
		EasyUIPage<Sckzhfz> eui = new EasyUIPage<Sckzhfz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public Sckzhfz getSckzhfz() {
		return sckzhfz;
	}
	public void setSckzhfz(Sckzhfz sckzhfz) {
		this.sckzhfz = sckzhfz;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Sckzhfz getModel() {
		return sckzhfz;
	}
	public SckzhfzServer getZhfzServer() {
		return zhfzServer;
	}
	public void setZhfzServer(SckzhfzServer zhfzServer) {
		this.zhfzServer = zhfzServer;
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
