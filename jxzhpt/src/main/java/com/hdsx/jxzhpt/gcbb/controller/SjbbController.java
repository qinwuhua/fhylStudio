package com.hdsx.jxzhpt.gcbb.controller;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.utile.ExportExcel;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.gcbb.server.SjbbServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
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
			String gydwdm = sjbb.getUnit();
			String xzqhdm = sjbb.getDist();
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwbm like '%"+gydwdm+"%'";
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
			List<SjbbMessage> list = sjbbServer.getLwjgjsgzb(sjbb);
			if("flag".equals(flag)){
				String tableName=sjbb.getNf()+"年路网结构改造建议计划汇总表";
				String excelHtml="<tr><td>　</td><td>　</td><td>座/项目数</td><td>延米</td><td>处治里程</td>" +
						"<td>补助资金(万元)</td><td>部安排资金</td><td>总投资(万元)</td></tr>";
				//导出设置
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName(tableName);
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("sheet1");
				sheetb.setList(list);
				sheetb.setColnum((short)8);
				sheetBeans.add(sheetb);
				String stylefileName="module_xu1.xls";
				//导出excel
				ExportExcel_new ee = new ExportExcel_new();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
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
			String gydwdm = sjbb.getUnit();
			String xzqhdm = sjbb.getDist();
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwbm like '%"+gydwdm+"%'";
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
				/*
				for(int i=0;i<list.size();i++){
					if(i!=6){
						if(i==0||i==3){
							excelHtml+="<tr><td rowspan='3'>"+list.get(i).getV_0()+"</td>"+"<td>"+list.get(i).getV_1()+"</td>"+"<td>"+list.get(i).getV_2()+"</td>"+"<td>"+list.get(i).getV_3()+"</td>"
							+"<td>"+list.get(i).getV_4()+"</td>"+"<td>"+list.get(i).getV_5()+"</td>"+"<td>"+list.get(i).getV_6()+"</td>"+"<td>"+list.get(i).getV_7()+"</td>"
							+"<td>"+list.get(i).getV_8()+"</td>"+"<td>"+list.get(i).getV_9()+"</td>"+"<td>"+list.get(i).getV_10()+"</td>"+"<td>"+list.get(i).getV_11()+"</td>"
							+"<td>"+list.get(i).getV_12()+"</td>"+"<td>"+list.get(i).getV_13()+"</td>"+"<td>"+list.get(i).getV_14()+"</td>"+"<td>"+list.get(i).getV_15()+"</td>"
							+"<td>"+list.get(i).getV_16()+"</td>"+"<td>"+list.get(i).getV_17()+"</td></tr>;";
						}else{
							excelHtml+="<tr align='center'><td>"+list.get(i).getV_1()+"</td>"+"<td>"+list.get(i).getV_2()+"</td>"+"<td>"+list.get(i).getV_3()+"</td>"
							+"<td>"+list.get(i).getV_4()+"</td>"+"<td>"+list.get(i).getV_5()+"</td>"+"<td>"+list.get(i).getV_6()+"</td>"+"<td>"+list.get(i).getV_7()+"</td>"
							+"<td>"+list.get(i).getV_8()+"</td>"+"<td>"+list.get(i).getV_9()+"</td>"+"<td>"+list.get(i).getV_10()+"</td>"+"<td>"+list.get(i).getV_11()+"</td>"
							+"<td>"+list.get(i).getV_12()+"</td>"+"<td>"+list.get(i).getV_13()+"</td>"+"<td>"+list.get(i).getV_14()+"</td>"+"<td>"+list.get(i).getV_15()+"</td>"
							+"<td>"+list.get(i).getV_16()+"</td>"+"<td>"+list.get(i).getV_17()+"</td></tr>;";
						}
					}else{
						excelHtml+="<tr align='center'><td>"+list.get(i).getV_0()+"</td>"+"<td>"+list.get(i).getV_1()+"</td>"+"<td>"+list.get(i).getV_2()+"</td>"+"<td>"+list.get(i).getV_3()+"</td>"
						+"<td>"+list.get(i).getV_4()+"</td>"+"<td>"+list.get(i).getV_5()+"</td>"+"<td>"+list.get(i).getV_6()+"</td>"+"<td>"+list.get(i).getV_7()+"</td>"+"<td>"+list.get(i).getV_8()+"</td>"+"<td>"+list.get(i).getV_9()+"</td>"
						+"<td>"+list.get(i).getV_10()+"</td>"+"<td>"+list.get(i).getV_11()+"</td>"
						+"<td>"+list.get(i).getV_12()+"</td>"+"<td>"+list.get(i).getV_13()+"</td>"+"<td>"+list.get(i).getV_14()+"</td>"+"<td>"+list.get(i).getV_15()+"</td>"
						+"<td>"+list.get(i).getV_16()+"</td>"+"<td>"+list.get(i).getV_17()+"</td></tr>";
					}
				}*/
				//导出设置
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName(tableName);
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("sheet1");
				sheetb.setList(list);
				sheetb.setColnum((short)18);
				sheetBeans.add(sheetb);
				String stylefileName="module_xu1.xls";
				//导出excel
				ExportExcel_new ee = new ExportExcel_new();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
				
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
			String gydwdm = sjbb.getUnit();
			String xzqhdm = sjbb.getDist();
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwbm like '%"+gydwdm+"%'";
			}else{
				tiaojian1="and gydwbm in ('"+gydwdm+"')";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and xzqhdm in ('"+xzqhdm+"')";
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
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName(tableName);
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("sheet1");
				sheetb.setList(list);
				sheetb.setColnum((short)22);
				sheetBeans.add(sheetb);
				String stylefileName="module_xu1.xls";
				//导出excel
				ExportExcel_new ee = new ExportExcel_new();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
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
