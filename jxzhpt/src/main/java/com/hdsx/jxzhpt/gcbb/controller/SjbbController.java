package com.hdsx.jxzhpt.gcbb.controller;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.T;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.utile.ExportExcel;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.gcbb.server.SjbbServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Scope("prototype")
@Controller
public class SjbbController extends BaseActionSupport implements ModelDriven<SjbbMessage>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7044079854768005348L;
	private SjbbMessage sjbb=new SjbbMessage();
	@Override
	public SjbbMessage getModel() {
		return sjbb;
	}
	@Resource(name="sjbbServerImpl")
	private SjbbServer sjbbServer;
	private String flag;
	ExportExcel ec=new ExportExcel<T>();
	private List<SjbbMessage> excel_list=new ArrayList<SjbbMessage>();
	
	//2
	public void getLwjgjshzb(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			String gydwdm = "";
			String xzqhdm = "";
			if("flag".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
			}else{
				gydwdm = sjbb.getUnit();
				xzqhdm = sjbb.getDist();
			}
			
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqhdm+")";
			}
			sjbb.setUnit(tiaojian1);
			sjbb.setDist(tiaojian2);
			List<SjbbMessage> list = sjbbServer.getLwjgjsgzb(sjbb);
			if("flag".equals(flag)){
				String tableName=sjbb.getNf()+"年路网结构改造建议计划汇总表";
				String excelHtml="<tr><td>　</td><td>　</td><td>座/项目数</td><td>延米</td><td>处治里程</td>" +
						"<td>补助资金(万元)</td><td>部安排资金</td><td>总投资(万元)</td></tr>";
				//导出设置
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("路网结构改造建设计划汇总表（分国省）");//设置第一行
				eldata.setSheetName("路网结构改造建设计划汇总表");//设置sheeet名
				eldata.setFileName("路网结构改造建设计划汇总表");//设置文件名
				eldata.setEl1(list);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte(" ",1,1,0,0));
				et.add(new Excel_tilte(" ",1,1,1,1));
				et.add(new Excel_tilte("座/项目数",1,1,2,2));
				et.add(new Excel_tilte("延米",1,1,3,3));
				et.add(new Excel_tilte("处治里程",1,1,4,4));
				et.add(new Excel_tilte("地方补助资金(万元)",1,1,5,5));
				et.add(new Excel_tilte("部安排资金",1,1,6,6));
				et.add(new Excel_tilte("总投资(万元)",1,1,7,7));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_exportjsjh(eldata,response);
			}else{
				JsonUtils.write(list, getresponse().getWriter());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//3
	public void getGzgcjz(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			String gydwdm = "";
			String xzqhdm = "";
			if("flag".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
			}else{
				gydwdm = sjbb.getUnit();
				xzqhdm = sjbb.getDist();
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqhdm+")";
			}
			System.out.println(tiaojian1);
			System.out.println(tiaojian2);
			sjbb.setUnit(tiaojian1);
			sjbb.setDist(tiaojian2);
			List<SjbbMessage> list = sjbbServer.getGzgcjz(sjbb);
			if("flag".equals(flag)){
				String tableName=sjbb.getNf()+"年公路路网结构改造工程进展情况汇总表";
				String excelHtml="<tr><td colspan='2'>　</td><td colspan='5'>计划下达</td><td colspan='5'>实际完成</td>" +
						"<td colspan='6'>　</td></tr>;" +
						"<tr><td colspan='2'>　</td><td colspan='2'>工程量</td><td colspan='3'>投资</td><td colspan='2'>工程量</td><td colspan='3'>投资</td><td>已拨付资金</td>" +
						"<td>拨付比例</td><td>完成工程量</td><td>完成总投资</td><td>完成中央投资</td><td>地方配套资金</td></tr>;" +
						"<tr><td colspan='2'>项目</td><td>单位1</td><td>单位2</td><td>总投资(万元)</td><td>中央投资(万元)</td><td>地方自筹(万元)</td><td>单位1</td><td>单位2</td>" +
						"<td>总投资(万元)</td><td>中央投资(万元) </td><td>地方自筹(万元)</td><td>(万元)</td><td>(%)</td><td>比例</td><td>比例</td><td>比例</td><td>到位比例</td>" +
						"</tr>;<tr><td colspan='2'>甲</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 </td>" +
						"<td>9</td><td>10</td><td>　</td><td>　</td><td>　</td><td>　</td><td>　</td><td>　</td></tr>";
				
				//导出设置
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("路网结构改造工程进展情况");//设置第一行
				eldata.setSheetName("路网结构改造工程进展情况");//设置sheeet名
				eldata.setFileName("路网结构改造工程进展情况");//设置文件名
				eldata.setEl1(list);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("项目",1,3,0,1));
				et.add(new Excel_tilte("计划下达",1,1,2,6));
				et.add(new Excel_tilte("实际完成",1,1,7,11));
				et.add(new Excel_tilte(" ",1,1,12,17));
				et.add(new Excel_tilte("工程量",2,2,2,3));
				et.add(new Excel_tilte("投资",2,2,4,6));
				et.add(new Excel_tilte("工程量",2,2,7,8));
				et.add(new Excel_tilte("投资",2,2,9,11));
				et.add(new Excel_tilte("已拨付资金",2,2,12,12));
				et.add(new Excel_tilte("拨付比例",2,2,13,13));
				et.add(new Excel_tilte("完成工程量",2,2,14,14));
				et.add(new Excel_tilte("完成总投资",2,2,15,15));
				et.add(new Excel_tilte("完成中央投资",2,2,16,16));
				et.add(new Excel_tilte("地方配套资金",2,2,17,17));
				et.add(new Excel_tilte("单位1",3,3,2,2));
				et.add(new Excel_tilte("单位2",3,3,3,3));
				et.add(new Excel_tilte("总投资(万元)",3,3,4,4));
				et.add(new Excel_tilte("中央投资(万元)",3,3,5,5));
				et.add(new Excel_tilte("地方自筹(万元)",3,3,6,6));
				et.add(new Excel_tilte("单位1",3,3,7,7));
				et.add(new Excel_tilte("单位2",3,3,8,8));
				et.add(new Excel_tilte("总投资(万元)",3,3,9,9));
				et.add(new Excel_tilte("中央投资(万元)",3,3,10,10));
				et.add(new Excel_tilte("地方自筹(万元)",3,3,11,11));
				et.add(new Excel_tilte("(万元)",3,3,12,12));
				et.add(new Excel_tilte("(%)",3,3,13,13));
				et.add(new Excel_tilte("比例",3,3,14,14));
				et.add(new Excel_tilte("比例",3,3,15,15));
				et.add(new Excel_tilte("比例",3,3,16,16));
				et.add(new Excel_tilte("到位比例",3,3,17,17));
				et.add(new Excel_tilte("甲",4,4,0,1));
				et.add(new Excel_tilte("1",4,4,2,2));
				et.add(new Excel_tilte("2",4,4,3,3));
				et.add(new Excel_tilte("3",4,4,4,4));
				et.add(new Excel_tilte("4",4,4,5,5));
				et.add(new Excel_tilte("5",4,4,6,6));
				et.add(new Excel_tilte("6",4,4,7,7));
				et.add(new Excel_tilte("7",4,4,8,8));
				et.add(new Excel_tilte("8",4,4,9,9));
				et.add(new Excel_tilte("9",4,4,10,10));
				et.add(new Excel_tilte("10",4,4,11,11));
				et.add(new Excel_tilte("",4,4,12,12));
				et.add(new Excel_tilte("",4,4,13,13));
				et.add(new Excel_tilte("",4,4,14,14));
				et.add(new Excel_tilte("",4,4,15,15));
				et.add(new Excel_tilte("",4,4,16,16));
				et.add(new Excel_tilte("",4,4,17,17));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_exportjzqk(eldata,response);
				
			}else{
				JsonUtils.write(list, getresponse().getWriter());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//1
	public void getGdzctzjs(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			String gydwdm = "";
			String xzqhdm = "";
			if("flag".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
			}else{
				gydwdm = sjbb.getUnit();
				xzqhdm = sjbb.getDist();
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqhdm+")";
			}
			System.out.println(tiaojian1);
			System.out.println(tiaojian2);
			sjbb.setUnit(tiaojian1);
			sjbb.setDist(tiaojian2);
			List<SjbbMessage> list = sjbbServer.getGdzctzjs(sjbb);
			if("flag".equals(flag)){
				String tableName=sjbb.getNf()+"年交通固定资产投资建设计划(路网结构改造)";
				String excelHtml="<tr><td rowspan='3' >项目所在地区</td><td colspan='6'>危桥</td><td colspan='6' >安保</td>"+
						"<td colspan='6'>灾害</td><td colspan='3' >总计</td></tr>;"+
						"<tr><td colspan='2'>公路局</td><td colspan='2'>交通局</td><td colspan='2'>小计</td><td colspan='2'>公路局</td><td colspan='2'>交通局</td><td colspan='2'>小计</td>"+
						"<td colspan='2'>公路局</td><td colspan='2'>交通局</td><td colspan='2'>小计</td><td>公路局</td><td>交通局</td><td>小计</td></tr>;"+
						"<tr><td>座</td><td>补助资金(万元)</td><td>座</td><td>补助资金(万元)</td><td>座</td><td>补助资金(万元)</td>"+
						"<td>处治里程(km)</td><td>补助资金(万元)</td><td>处治里程(km)</td><td>补助资金(万元)</td><td>处治里程(km)</td><td>补助资金(万元)</td>"+
						"<td>处治里程(km)</td><td>补助资金(万元)</td><td>处治里程(km)</td><td>补助资金(万元)</td><td>处治里程(km)</td><td>补助资金(万元)</td>"+
						"<td>补助资金(万元)</td><td>补助资金(万元)</td><td>补助资金(万元)</td></tr>";
				//导出设置
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("交通部固定资产投资建设计划表（分地市）");//设置第一行
				eldata.setSheetName("交通部固定资产投资建设计划表");//设置sheeet名
				eldata.setFileName("交通部固定资产投资建设计划表");//设置文件名
				eldata.setEl1(list);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("项目所在地区",1,3,0,0));
				et.add(new Excel_tilte("危桥",1,1,1,6));
				et.add(new Excel_tilte("安保",1,1,7,12));
				et.add(new Excel_tilte("灾害",1,1,13,18));
				et.add(new Excel_tilte("总计",1,1,19,21));
				et.add(new Excel_tilte("公路局",2,2,1,2));
				et.add(new Excel_tilte("交通局",2,2,3,4));
				et.add(new Excel_tilte("小计",2,2,5,6));
				et.add(new Excel_tilte("公路局",2,2,7,8));
				et.add(new Excel_tilte("交通局",2,2,9,10));
				et.add(new Excel_tilte("小计",2,2,11,12));
				et.add(new Excel_tilte("公路局",2,2,13,14));
				et.add(new Excel_tilte("交通局",2,2,15,16));
				et.add(new Excel_tilte("小计",2,2,17,18));
				et.add(new Excel_tilte("公路局",2,2,19,19));
				et.add(new Excel_tilte("交通局",2,2,20,20));
				et.add(new Excel_tilte("小计",2,2,21,21));
				et.add(new Excel_tilte("座",3,3,1,1));
				et.add(new Excel_tilte("补助资金(万元)",3,3,2,2));
				et.add(new Excel_tilte("座",3,3,3,3));
				et.add(new Excel_tilte("补助资金(万元)",3,3,4,4));
				et.add(new Excel_tilte("座",3,3,5,5));
				et.add(new Excel_tilte("补助资金(万元)",3,3,6,6));
				et.add(new Excel_tilte("处治里程(km)",3,3,7,7));
				et.add(new Excel_tilte("补助资金(万元)",3,3,8,8));
				et.add(new Excel_tilte("处治里程(km)",3,3,9,9));
				et.add(new Excel_tilte("补助资金(万元)",3,3,10,10));
				et.add(new Excel_tilte("处治里程(km)",3,3,11,11));
				et.add(new Excel_tilte("补助资金(万元)",3,3,12,12));
				et.add(new Excel_tilte("处治里程(km)",3,3,13,13));
				et.add(new Excel_tilte("补助资金(万元)",3,3,14,14));
				et.add(new Excel_tilte("处治里程(km)",3,3,15,15));
				et.add(new Excel_tilte("补助资金(万元)",3,3,16,16));
				et.add(new Excel_tilte("处治里程(km)",3,3,17,17));
				et.add(new Excel_tilte("补助资金(万元)",3,3,18,18));
				et.add(new Excel_tilte("补助资金(万元)",3,3,19,19));
				et.add(new Excel_tilte("补助资金(万元)",3,3,20,20));
				et.add(new Excel_tilte("补助资金(万元)",3,3,21,21));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_exportgdzc(eldata,response);
			}else{
				JsonUtils.write(list, getresponse().getWriter());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
}
