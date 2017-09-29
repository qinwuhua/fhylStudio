package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Zdycx;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzsjServer;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckzhfzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.server.impl.JckwqgzsjServerImpl;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.MyUtil;
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
 * 项目基础库——灾害防治Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class JckzhfzController extends BaseActionSupport implements ModelDriven<Jckzhfz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckzhfzServerImpl")
	private JckzhfzServer zhfzServer;
	private Jckzhfz jckzhfz=new Jckzhfz();
	private String delstr;
	private String tbbmbm1;
	private String tbbmbm2;
	private String sbthcd1;
	private String fileuploadFileName;
	private File fileupload;
	
	public void importZhfz(){
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
				dataMapArray = ExcelReader.readExcelContent(3,15,fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			try{
			List<Map<String,String>> data = ExcelReader.removeBlankRow2(dataMapArray[0]);
			if(zhfzServer.yanZhen(data, tbbmbm1).equals("jckzhfz_ok")){
				if(zhfzServer.importZhfz(data,tbbmbm2,sbthcd1)) 
					response.getWriter().print(fileuploadFileName+"导入成功");
				else 
					response.getWriter().print(fileuploadFileName+"服务器异常,请重试");
			}else{
				response.getWriter().print("提示："+fileuploadFileName+zhfzServer.yanZhen(data, tbbmbm1));
			}
			}catch(Exception e){
				e.printStackTrace();
				response.getWriter().print(fileuploadFileName+"导入失败，请重试");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void exportExcel_zhfz(){
		try {
			if(jckzhfz.getGydw().indexOf(",")==-1){
				jckzhfz.setGydw("and tbbmbm like '%'||substr('"+jckzhfz.getGydw()+"',0,4)||'_'||substr('"+jckzhfz.getGydw()+"',6)||'%'");
			}else{
				jckzhfz.setGydw("and tbbmbm in ("+jckzhfz.getGydw()+")");
			}
			if(jckzhfz.getXzqhdm().indexOf(",")==-1){
				jckzhfz.setXzqhdm("and xzqhdm like '%"+jckzhfz.getXzqhdm()+"%'");
			}else{
				jckzhfz.setXzqhdm("and xzqhdm in ("+jckzhfz.getXzqhdm()+")");
			}
			
			if(jckzhfz.getTsdq().length()>0){
				String[] tsdqs=jckzhfz.getTsdq().split(",");
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
				jckzhfz.setTsdq(tsdq);
			}
			if(jckzhfz.getGldj().length()>0){
				String[] tsdqs=jckzhfz.getGldj().split(",");
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
				jckzhfz.setGldj(tsdq);
			}
			if(jckzhfz.getJsdj().length()>0){
				String[] tsdqs=jckzhfz.getJsdj().split(",");
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
				jckzhfz.setJsdj(tsdq);
			}
			//先得到导出的数据集
			List <Excel_list> list=zhfzServer.exportExcel_zhfz(jckzhfz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("灾害防治项目");//设置第一行 
			eldata.setSheetName("灾害防治");//设置sheeet名
			eldata.setFileName("灾害防治项目");//设置文件名
			eldata.setEl(list);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("行政区划代码",1,1,1,1));
			et.add(new Excel_tilte("行政区划名称",1,1,2,2));
			et.add(new Excel_tilte("管养单位",1,1,3,3));
			et.add(new Excel_tilte("原路线编码",1,1,4,4));
			et.add(new Excel_tilte("原路线名称",1,1,5,5));
			et.add(new Excel_tilte("原路线起点桩号",1,1,6,6));
			et.add(new Excel_tilte("原路线止点桩号",1,1,7,7));
			et.add(new Excel_tilte("总里程",1,1,8,8));
			et.add(new Excel_tilte("隐患里程",1,1,9,9));
			et.add(new Excel_tilte("修建/改建年度",1,1,10,10));
			et.add(new Excel_tilte("项目年份",1,1,11,11));
			et.add(new Excel_tilte("项目库类型",1,1,12,12));
			et.add(new Excel_tilte("隐患内容",1,1,13,13));
			et.add(new Excel_tilte("特殊地区",1,1,14,14));
			et.add(new Excel_tilte("备注",1,1,15,15));
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void exportExcel_zhfz_sh(){
		try {
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			String tsdqS=(String) session.getAttribute("tsdq");
			jckzhfz.setTsdq(tsdqS);
			
			if(jckzhfz.getGydw().indexOf(",")==-1){
				jckzhfz.setGydw("and tbbmbm like '%'||substr('"+jckzhfz.getGydw()+"',0,4)||'_'||substr('"+jckzhfz.getGydw()+"',6)||'%'");
			}else{
				jckzhfz.setGydw("and tbbmbm in ("+jckzhfz.getGydw()+")");
			}
			if(jckzhfz.getXzqhdm().indexOf(",")==-1){
				jckzhfz.setXzqhdm("and xzqhdm like '%"+jckzhfz.getXzqhdm()+"%'");
			}else{
				jckzhfz.setXzqhdm("and xzqhdm in ("+jckzhfz.getXzqhdm()+")");
			}
			
			if(jckzhfz.getTsdq().length()>0){
				String[] tsdqs=jckzhfz.getTsdq().split(",");
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
				jckzhfz.setTsdq(tsdq);
			}
			if(jckzhfz.getGldj().length()>0){
				String[] tsdqs=jckzhfz.getGldj().split(",");
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
				jckzhfz.setGldj(tsdq);
			}
			if(jckzhfz.getJsdj().length()>0){
				String[] tsdqs=jckzhfz.getJsdj().split(",");
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
				jckzhfz.setJsdj(tsdq);
			}
			
			//先得到导出的数据集
			List <Excel_list> list=zhfzServer.exportExcel_zhfz_sh(jckzhfz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("灾害防治项目");//设置第一行 
			eldata.setSheetName("灾害防治");//设置sheeet名
			eldata.setFileName("灾害防治项目");//设置文件名
			eldata.setEl(list);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("行政区划代码",1,1,1,1));
			et.add(new Excel_tilte("行政区划名称",1,1,2,2));
			et.add(new Excel_tilte("管养单位",1,1,3,3));			
			et.add(new Excel_tilte("规划路线编码",1,1,4,4));
			et.add(new Excel_tilte("规划路线名称",1,1,5,5));
			et.add(new Excel_tilte("规划路线起点桩号",1,1,6,6));
			et.add(new Excel_tilte("规划路线止点桩号",1,1,7,7));	
			et.add(new Excel_tilte("原路线编码",1,1,8,8));
			et.add(new Excel_tilte("原路线名称",1,1,9,9));
			et.add(new Excel_tilte("原路线起点桩号",1,1,10,10));
			et.add(new Excel_tilte("原路线止点桩号",1,1,11,11));
			et.add(new Excel_tilte("总里程",1,1,12,12));
			et.add(new Excel_tilte("隐患里程",1,1,13,13));
			et.add(new Excel_tilte("修建/改建年度",1,1,14,14));
			et.add(new Excel_tilte("项目年份",1,1,15,15));
			et.add(new Excel_tilte("项目库类型",1,1,16,16));
			et.add(new Excel_tilte("隐患内容",1,1,17,17));
			et.add(new Excel_tilte("特殊地区",1,1,18,18));
			et.add(new Excel_tilte("备注",1,1,19,19));		
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void insertZhfz(){
		Zdycx z = new Zdycx();//定义一个类，接收查询补助历史的参数
		z.setXmnf(Calendar.getInstance().get(Calendar.YEAR)+"");//本项目的年份
		z.setLxbm(jckzhfz.getLxbm().substring(0, 4));//本项目的路线编码
		z.setQdzh(jckzhfz.getQdzh());//本项目起点
		z.setZdzh(jckzhfz.getZdzh());//本项目止点
		z.setSfafsc("否");//是否安防审查，如果不是就是否
		z.setXzqh(jckzhfz.getXzqhdm());//设置行政区划
		//调用方法，返回历史信息
		JckwqgzsjServer jckwqgzsjServer=new JckwqgzsjServerImpl();
		Zdycx c = jckwqgzsjServer.queryLwLsxx(z);
		jckzhfz.setLsjl(c.getLsjl());//设置值
		jckzhfz.setLsxmxx(c.getLsxmxx());//设置值
		boolean b = zhfzServer.insertZhfz(jckzhfz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectZhfz(){
		if(jckzhfz.getGydw().indexOf(",")==-1){
			jckzhfz.setGydw("and tbbmbm like '%'||substr('"+jckzhfz.getGydw()+"',0,4)||'_'||substr('"+jckzhfz.getGydw()+"',6)||'%'");
		}else{
			jckzhfz.setGydw("and tbbmbm in ("+jckzhfz.getGydw()+")");
		}
		if(jckzhfz.getXzqhdm().indexOf(",")==-1){
			jckzhfz.setXzqhdm("and xzqhdm like '%"+jckzhfz.getXzqhdm()+"%'");
		}else{
			jckzhfz.setXzqhdm("and xzqhdm in ("+jckzhfz.getXzqhdm()+")");
		}
		if(jckzhfz.getTsdq().length()>0){
			String[] tsdqs=jckzhfz.getTsdq().split(",");
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
			jckzhfz.setTsdq(tsdq);
		}
		if(jckzhfz.getGldj().length()>0){
			String[] tsdqs=jckzhfz.getGldj().split(",");
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
			jckzhfz.setGldj(tsdq);
		}
		if(jckzhfz.getJsdj().length()>0){
			String[] tsdqs=jckzhfz.getJsdj().split(",");
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
			jckzhfz.setJsdj(tsdq);
		}
		
		List<Jckzhfz> zhfzList = zhfzServer.selectZhfzList(jckzhfz);
		int count = zhfzServer.selectZhfzCount(jckzhfz);
		EasyUIPage<Jckzhfz> eui = new EasyUIPage<Jckzhfz>();
		eui.setRows(zhfzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectZhfzById(){
		try {
			
			JsonUtils.write(zhfzServer.selectZhfzById(jckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateZhfzById(){
		try {
			Zdycx z = new Zdycx();//定义一个类，接收查询补助历史的参数
			z.setXmnf(Calendar.getInstance().get(Calendar.YEAR)+"");//本项目的年份
			z.setLxbm(jckzhfz.getLxbm().substring(0, 4));//本项目的路线编码
			z.setQdzh(jckzhfz.getQdzh());//本项目起点
			z.setZdzh(jckzhfz.getZdzh());//本项目止点
			z.setSfafsc("否");//是否安防审查，如果不是就是否
			z.setXzqh(jckzhfz.getXzqhdm());//设置行政区划
			//调用方法，返回历史信息
			JckwqgzsjServer jckwqgzsjServer=new JckwqgzsjServerImpl();
			Zdycx c = jckwqgzsjServer.queryLwLsxx(z);
			jckzhfz.setLsjl(c.getLsjl());//设置值
			jckzhfz.setLsxmxx(c.getLsxmxx());//设置值
			JsonUtils.write(zhfzServer.updateZhfzById(jckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteZhfzById(){
		try {
			JsonUtils.write(zhfzServer.deleteZhfzById(delstr),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckZhfzShzt(){
		try {
			JsonUtils.write(zhfzServer.xgJckZhfzShzt(delstr,jckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckZhfzSbzt(){
		try {
			JsonUtils.write(zhfzServer.xgJckZhfzSbzt(delstr,jckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//自动填充LXMC
	public void zhfzGpsroad(){
		try {
			JsonUtils.write(zhfzServer.selectGpsroad(jckzhfz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void JckzhfzRoad(){
		try {
			JsonUtils.write(zhfzServer.JckzhfzRoad(jckzhfz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectZhfzSh(){
		if(jckzhfz.getGydw().indexOf(",")==-1){
			jckzhfz.setGydw("and tbbmbm like '%'||substr('"+jckzhfz.getGydw()+"',0,4)||'_'||substr('"+jckzhfz.getGydw()+"',6)||'%'");
		}else{
			jckzhfz.setGydw("and tbbmbm in ("+jckzhfz.getGydw()+")");
		}
		if(jckzhfz.getXzqhdm().indexOf(",")==-1){
			jckzhfz.setXzqhdm("and xzqhdm like '%"+jckzhfz.getXzqhdm()+"%'");
		}else{
			jckzhfz.setXzqhdm("and xzqhdm in ("+jckzhfz.getXzqhdm()+")");
		}
		if(jckzhfz.getTsdq().length()>0){
			String[] tsdqs=jckzhfz.getTsdq().split(",");
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
			jckzhfz.setTsdq(tsdq);
		}
		if(jckzhfz.getGldj().length()>0){
			String[] tsdqs=jckzhfz.getGldj().split(",");
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
			jckzhfz.setGldj(tsdq);
		}
		if(jckzhfz.getJsdj().length()>0){
			String[] tsdqs=jckzhfz.getJsdj().split(",");
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
			jckzhfz.setJsdj(tsdq);
		}
		
		List<Jckzhfz> zhfzList = zhfzServer.selectJckShzhfz(jckzhfz);
		int count = zhfzServer.selectZhfzShCount(jckzhfz);
		EasyUIPage<Jckzhfz> eui = new EasyUIPage<Jckzhfz>();
		eui.setRows(zhfzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckZhfzTH(){
		try {
			JsonUtils.write(zhfzServer.xgJckZhfzTH(delstr),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void onceZhfz(){
		boolean b = zhfzServer.onceZhfz(jckzhfz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selZhfzCount(){
		try {
			if(jckzhfz.getGydw().indexOf(",")==-1){
				jckzhfz.setGydw("and tbbmbm like '%'||substr('"+jckzhfz.getGydw()+"',0,4)||'_'||substr('"+jckzhfz.getGydw()+"',6)||'%'");
			}else{
				jckzhfz.setGydw("and tbbmbm in ("+jckzhfz.getGydw()+")");
			}
			if(jckzhfz.getXzqhdm().indexOf(",")==-1){
				jckzhfz.setXzqhdm("and xzqhdm like '%"+jckzhfz.getXzqhdm()+"%'");
			}else{
				jckzhfz.setXzqhdm("and xzqhdm in ("+jckzhfz.getXzqhdm()+")");
			}
			if(jckzhfz.getTsdq().length()>0){
				String[] tsdqs=jckzhfz.getTsdq().split(",");
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
				jckzhfz.setTsdq(tsdq);
			}
			if(jckzhfz.getGldj().length()>0){
				String[] tsdqs=jckzhfz.getGldj().split(",");
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
				jckzhfz.setGldj(tsdq);
			}
			if(jckzhfz.getJsdj().length()>0){
				String[] tsdqs=jckzhfz.getJsdj().split(",");
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
				jckzhfz.setJsdj(tsdq);
			}
			
			JsonUtils.write(zhfzServer.selZhfzCount(jckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selZhfzShCount(){
		try {
			if(jckzhfz.getGydw().indexOf(",")==-1){
				jckzhfz.setGydw("and tbbmbm like '%'||substr('"+jckzhfz.getGydw()+"',0,4)||'_'||substr('"+jckzhfz.getGydw()+"',6)||'%'");
			}else{
				jckzhfz.setGydw("and tbbmbm in ("+jckzhfz.getGydw()+")");
			}
			if(jckzhfz.getXzqhdm().indexOf(",")==-1){
				jckzhfz.setXzqhdm("and xzqhdm like '%"+jckzhfz.getXzqhdm()+"%'");
			}else{
				jckzhfz.setXzqhdm("and xzqhdm in ("+jckzhfz.getXzqhdm()+")");
			}
			if(jckzhfz.getTsdq().length()>0){
				String[] tsdqs=jckzhfz.getTsdq().split(",");
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
				jckzhfz.setTsdq(tsdq);
			}
			if(jckzhfz.getGldj().length()>0){
				String[] tsdqs=jckzhfz.getGldj().split(",");
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
				jckzhfz.setGldj(tsdq);
			}
			if(jckzhfz.getJsdj().length()>0){
				String[] tsdqs=jckzhfz.getJsdj().split(",");
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
				jckzhfz.setJsdj(tsdq);
			}
			
			JsonUtils.write(zhfzServer.selZhfzShCount(jckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Jckzhfz getJckzhfz() {
		return jckzhfz;
	}
	public void setJckzhfz(Jckzhfz jckzhfz) {
		this.jckzhfz = jckzhfz;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Jckzhfz getModel() {
		return jckzhfz;
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

	
}
