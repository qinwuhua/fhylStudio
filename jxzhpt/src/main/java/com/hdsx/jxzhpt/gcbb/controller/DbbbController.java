package com.hdsx.jxzhpt.gcbb.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcbb.server.DbbbServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
public class DbbbController extends BaseActionSupport implements ModelDriven<Jckwqgz>{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8781627913390367320L;
	@Resource(name="dbbbServerImpl")
	private DbbbServer wqgzServer;
	private Jckwqgz jckwqgz=new Jckwqgz();
	/***
	 * 获取年份列表
	 */
	public void getYearList(){
		List<String> list= new ArrayList<String>();
		Calendar calendar =Calendar.getInstance();
		int temp=calendar.get(Calendar.YEAR);
		System.out.println(temp);
		for(int i=temp;i>temp-10;i--){
			list.add(i+"");
		}
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}catch (Exception e) {}
	}
	public void selectWqjc(){
		List<Jckwqgz> selectWqjc = wqgzServer.selectWqjc(jckwqgz);
		int count = wqgzServer.selectWqjcCount(jckwqgz);
		EasyUIPage<Jckwqgz> eui =new EasyUIPage<Jckwqgz>();
		eui.setRows(selectWqjc);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_wqjc(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqjc(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>修建/改建年度</td>" +
					"<td>桥梁全长</td><td>桥梁全宽</td><td>跨径总长</td><td>单孔最大跨径</td><td>按跨径分类</td><td>" +
					"上部结构形式</td><td>评定等级</td><td>病害内容</td><td>备注</td>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥基础库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)18);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥基础库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Jckwqgz> ee = new ExportExcel_new<Jckwqgz>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void selectWqsc(){
		List<Sckwqgz> selectWqsc = wqgzServer.selectWqsc(jckwqgz);
		int count = wqgzServer.selectWqscCount(jckwqgz);
		EasyUIPage<Sckwqgz> eui =new EasyUIPage<Sckwqgz>();
		eui.setRows(selectWqsc);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_wqsc(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqsc(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>桥梁编码</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>桥梁全长</td>" +
					"<td>桥梁全宽</td><td>方案评估单位</td><td>方案审查单位</td><td>方案审批时间</td><td>审批文号</td>" +
					"<td>投资估算</td><td>建设性质</td><td>建设内容</td><td>备注</td>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥审查库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)13);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥审查库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Sckwqgz> ee = new ExportExcel_new<Sckwqgz>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void selectWqjh(){
		List<Plan_wqgz> selectWqjh = wqgzServer.selectWqjh(jckwqgz);
		int count = wqgzServer.selectWqjhCount(jckwqgz);
		EasyUIPage<Plan_wqgz> eui =new EasyUIPage<Plan_wqgz>();
		eui.setRows(selectWqjh);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_wqjh(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqjh(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td>+" +
					"<td>修建/改建年度</td><td>设计单位 </td><td>设计批复单位</td><td>批复文号  </td>" +
					"<td>批复总投资（万元）</td><td>计划使用部补助金额（万元）</td>" +
					"<td>计划使用地方自筹资金（万元）</td><td>是否申请按比例补助 </td><td>按比例补助申请文号 </td>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥计划库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)17);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥计划库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Plan_wqgz> ee = new ExportExcel_new<Plan_wqgz>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	
	public Jckwqgz getJckwqgz() {
		return jckwqgz;
	}
	public void setJckwqgz(Jckwqgz jckwqgz) {
		this.jckwqgz = jckwqgz;
	}
	@Override
	public Jckwqgz getModel() {
		return jckwqgz;
	}
}
