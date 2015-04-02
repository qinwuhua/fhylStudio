package com.hdsx.jxzhpt.gcbb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcbb.server.DbbbServer;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.util.lang.JsonUtil;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
public class DbbbController extends BaseActionSupport implements ModelDriven<Jckwqgz>{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8781627913390367320L;
	@Resource(name="dbbbServerImpl")
	private DbbbServer dbServer;
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
	//危桥
	public void selectWqjc(){
		List<Jckwqgz> selectWqjc = dbServer.selectWqjc(jckwqgz);
		int count = dbServer.selectWqjcCount(jckwqgz);
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
			List <SjbbMessage> list=dbServer.exportExcel_wqjc(jckwqgz);
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
		List<Sckwqgz> selectWqsc = dbServer.selectWqsc(jckwqgz);
		int count = dbServer.selectWqscCount(jckwqgz);
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
			List <SjbbMessage> list=dbServer.exportExcel_wqsc(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>桥梁编码</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>桥梁全长</td>" +
					"<td>桥梁全宽</td><td>方案评估单位</td><td>方案审查单位</td><td>方案审批时间</td><td>审批文号</td>" +
					"<td>投资估算</td><td>建设性质</td><td>建设内容</td><td>备注</td></tr>";
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
		List<Plan_wqgz> selectWqjh = dbServer.selectWqjh(jckwqgz);
		int count = dbServer.selectWqjhCount(jckwqgz);
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
			List <SjbbMessage> list=dbServer.exportExcel_wqjh(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td>+" +
					"<td>修建/改建年度</td><td>设计单位 </td><td>设计批复单位</td><td>批复文号  </td>" +
					"<td>批复总投资（万元）</td><td>计划使用部补助金额（万元）</td>" +
					"<td>计划使用地方自筹资金（万元）</td><td>是否申请按比例补助 </td><td>按比例补助申请文号 </td></tr>";
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
	//安保
	public void selectAbjc(){
		List<Jckabgc> selectAbjc = dbServer.selectAbjc(jckwqgz);
		int count = dbServer.selectAbjcCount(jckwqgz);
		EasyUIPage<Jckabgc> eui =new EasyUIPage<Jckabgc>();
		eui.setRows(selectAbjc);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_abjc(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=dbServer.exportExcel_abjc(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
					"<td>修建/改建年度</td><td>隐患内容 </td><td>备注</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("安保基础库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			sheetb.setList(list);
			sheetb.setColnum((short)12);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="安保基础库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Jckabgc> ee = new ExportExcel_new<Jckabgc>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void selectAbsc(){
		List<Sckabgc> selectAbsc = dbServer.selectAbsc(jckwqgz);
		int count = dbServer.selectAbscCount(jckwqgz);
		EasyUIPage<Sckabgc> eui =new EasyUIPage<Sckabgc>();
		eui.setRows(selectAbsc);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_absc(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=dbServer.exportExcel_absc(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
					"<td>修建/改建年度</td><td>方案评估单位 </td><td>方案审查单位</td><td>方案审批时间</td>" +
					"<td>审批文号 </td><td>投资估算（万元）</td><td>建设性质 </td><td>建设内容 </td><td>备注 </td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("安保审查库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			sheetb.setList(list);
			sheetb.setColnum((short)18);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="安保审查库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Sckabgc> ee = new ExportExcel_new<Sckabgc>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void selectAbjh(){
		List<Plan_abgc> selectAbjh = dbServer.selectAbjh(jckwqgz);
		int count = dbServer.selectAbjhCount(jckwqgz);
		EasyUIPage<Plan_abgc> eui =new EasyUIPage<Plan_abgc>();
		eui.setRows(selectAbjh);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_abjh(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=dbServer.exportExcel_abjh(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
					"<td>修建/改建年度</td><td>设计单位</td><td>设计批复单位</td><td>批复文号 </td><td>批复总投资（万元）</td>" +
					"<td>计划使用部补助金额（万元） </td><td>计划使用地方自筹资金（万元）</td><td>是否申请按比例补助</td>" +
					"<td>按比例补助申请文号</td>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("安保计划库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			sheetb.setList(list);
			sheetb.setColnum((short)18);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="安保计划库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Plan_abgc> ee = new ExportExcel_new<Plan_abgc>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	//灾害
		public void selectZhjc(){
			List<Jckzhfz> selectZhjc = dbServer.selectZhjc(jckwqgz);
			int count = dbServer.selectZhjcCount(jckwqgz);
			EasyUIPage<Jckzhfz> eui =new EasyUIPage<Jckzhfz>();
			eui.setRows(selectZhjc);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_zhjc(){
			try {
				//先得到导出的数据集
				List <SjbbMessage> list=dbServer.exportExcel_zhjc(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
						"<td>修建/改建年度</td><td>隐患内容 </td><td>备注</td></tr>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("灾害基础库报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("灾害");
				sheetb.setList(list);
				sheetb.setColnum((short)12);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="灾害基础库报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Jckzhfz> ee = new ExportExcel_new<Jckzhfz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectZhsc(){
			List<Sckzhfz> selectZhsc = dbServer.selectZhsc(jckwqgz);
			int count = dbServer.selectZhscCount(jckwqgz);
			EasyUIPage<Sckzhfz> eui =new EasyUIPage<Sckzhfz>();
			eui.setRows(selectZhsc);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_zhsc(){
			try {
				//先得到导出的数据集
				List <SjbbMessage> list=dbServer.exportExcel_zhsc(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
						"<td>修建/改建年度</td><td>方案评估单位 </td><td>方案审查单位</td><td>方案审批时间</td>" +
						"<td>审批文号 </td><td>投资估算（万元）</td><td>建设性质 </td><td>建设内容 </td><td>备注 </td></tr>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("灾害审查库报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("灾害");
				sheetb.setList(list);
				sheetb.setColnum((short)18);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="灾害审查库报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Sckzhfz> ee = new ExportExcel_new<Sckzhfz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectZhjh(){
			List<Plan_zhfz> selectZhjh = dbServer.selectZhjh(jckwqgz);
			int count = dbServer.selectZhjhCount(jckwqgz);
			EasyUIPage<Plan_zhfz> eui =new EasyUIPage<Plan_zhfz>();
			eui.setRows(selectZhjh);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_zhjh(){
			try {
				//先得到导出的数据集
				List <SjbbMessage> list=dbServer.exportExcel_zhjh(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
						"<td>修建/改建年度</td><td>设计单位</td><td>设计批复单位</td><td>批复文号 </td><td>批复总投资（万元）</td>" +
						"<td>计划使用部补助金额（万元） </td><td>计划使用地方自筹资金（万元）</td><td>是否申请按比例补助</td>" +
						"<td>按比例补助申请文号</td>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("灾害计划库报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("灾害");
				sheetb.setList(list);
				sheetb.setColnum((short)18);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="灾害计划库报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Plan_zhfz> ee = new ExportExcel_new<Plan_zhfz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectWqkg(){
			List<Plan_wqgz> selectWqkg = dbServer.selectWqkg(jckwqgz);
			int count = dbServer.selectWqkgCount(jckwqgz);
			EasyUIPage<Plan_wqgz> eui =new EasyUIPage<Plan_wqgz>();
			eui.setRows(selectWqkg);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_wqkg(){
			try {
				//先得到导出的数据集
				List <SjbbMessage> list=dbServer.exportExcel_wqkg(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td>+" +
						"<td>计划下达时间</td><td>计划开工时间 </td><td>计划完工时间</td><td>实际开工时间</td>" +
						"<td>施工单位</td><td>监理单位</td><td>合同金额</td></tr>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("危桥进度库开工信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("危桥进度库开工信息");
				sheetb.setList(list);
				sheetb.setColnum((short)15);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="危桥进度库开工信息报表";//excel 文件的名字
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
		public void selectAbkg(){
			List<Plan_abgc> selectAbkg = dbServer.selectAbkg(jckwqgz);
			int count = dbServer.selectAbkgCount(jckwqgz);
			EasyUIPage<Plan_abgc> eui =new EasyUIPage<Plan_abgc>();
			eui.setRows(selectAbkg);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_abkg(){
			try {
				//先得到导出的数据集
				List <SjbbMessage> list=dbServer.exportExcel_abkg(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>起止里程</td><td>隐患里程</td>+" +
						"<td>计划下达时间</td><td>计划开工时间 </td><td>计划完工时间</td><td>实际开工时间</td>" +
						"<td>施工单位</td><td>监理单位</td><td>合同金额</td></tr>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("安保进度库开工信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("安保安保进度库开工信息");
				sheetb.setList(list);
				sheetb.setColnum((short)15);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="安保进度库开工信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Plan_abgc> ee = new ExportExcel_new<Plan_abgc>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectZhkg(){
			List<Plan_zhfz> selectZhkg = dbServer.selectZhkg(jckwqgz);
			int count = dbServer.selectZhkgCount(jckwqgz);
			EasyUIPage<Plan_zhfz> eui =new EasyUIPage<Plan_zhfz>();
			eui.setRows(selectZhkg);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_zhkg(){
			try {
				//先得到导出的数据集
				List <SjbbMessage> list=dbServer.exportExcel_zhkg(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>起止里程</td><td>隐患里程</td>+" +
						"<td>计划下达时间</td><td>计划开工时间 </td><td>计划完工时间</td><td>实际开工时间</td>" +
						"<td>施工单位</td><td>监理单位</td><td>合同金额</td></tr>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("灾害进度库开工信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("灾害进度库开工信息");
				sheetb.setList(list);
				sheetb.setColnum((short)15);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="灾害进度库开工信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Plan_zhfz> ee = new ExportExcel_new<Plan_zhfz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectWqjz(){
			List<Gcglwqgz> selectWqjd = dbServer.selectWqjz(jckwqgz);
			int count = dbServer.selectWqjzCount(jckwqgz);
			EasyUIPage<Gcglwqgz> eui =new EasyUIPage<Gcglwqgz>();
			eui.setRows(selectWqjd);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_wqjz(){
			try {
				//先得到导出的数据集
				List <SjbbMessage> list=dbServer.exportExcel_wqjz(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>桥梁编码</td><td>桥梁名称</td><td>上报时间</td><td>预计竣工时间</td>+" +
						"<td>完成中央投资(万元)</td><td>完成地方自筹(万元)</td><td>工程竣工时间</td><td>备注</td>" ;
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("危桥进度库进展信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("危桥进度库进展信息");
				sheetb.setList(list);
				sheetb.setColnum((short)12);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="危桥进度库进展信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Gcglwqgz> ee = new ExportExcel_new<Gcglwqgz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		
		public void selectAbjz(){
			List<Gcglabgc> selectWqjd = dbServer.selectAbjz(jckwqgz);
			int count = dbServer.selectAbjzCount(jckwqgz);
			EasyUIPage<Gcglabgc> eui =new EasyUIPage<Gcglabgc>();
			eui.setRows(selectWqjd);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_abjz(){
			try {
				//先得到导出的数据集
				List <SjbbMessage> list=dbServer.exportExcel_abjz(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>上报时间</td><td>预计竣工时间</td>+" +
						"<td>完成中央投资(万元)</td><td>完成地方自筹(万元)</td><td>工程竣工时间</td><td>备注</td>" ;
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("安保进度库进展信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("安保进度库进展信息");
				sheetb.setList(list);
				sheetb.setColnum((short)12);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="安保进度库进展信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Gcglabgc> ee = new ExportExcel_new<Gcglabgc>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		
		public void selectZhjz(){
			List<Gcglzhfz> selectWqjd = dbServer.selectZhjz(jckwqgz);
			int count = dbServer.selectZhjzCount(jckwqgz);
			EasyUIPage<Gcglzhfz> eui =new EasyUIPage<Gcglzhfz>();
			eui.setRows(selectWqjd);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_zhjz(){
			try {
				//先得到导出的数据集
				List <SjbbMessage> list=dbServer.exportExcel_zhjz(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>上报时间</td><td>预计竣工时间</td>+" +
						"<td>完成中央投资(万元)</td><td>完成地方自筹(万元)</td><td>工程竣工时间</td><td>备注</td>" ;
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("灾害进度库进展信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("灾害进度库进展信息");
				sheetb.setList(list);
				sheetb.setColnum((short)12);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="灾害进度库进展信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Gcglzhfz> ee = new ExportExcel_new<Gcglzhfz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void jhtjBb(){
			try {
				Map<String, Object> result=new HashMap<String, Object>();
				result.put("wqGlj", dbServer.jhtjWqgzGlj(jckwqgz));
				result.put("wqJtj", dbServer.jhtjWqgzJtj(jckwqgz));
				result.put("abGlj", dbServer.jhtjAbgcGlj(jckwqgz));
				result.put("abJtj", dbServer.jhtjAbgcGlj(jckwqgz));
				result.put("zhGlj", dbServer.jhtjZhfzGlj(jckwqgz));
				result.put("zhJtj", dbServer.jhtjZhfzGlj(jckwqgz));
				JsonUtils.write(result, getresponse().getWriter());
			}  catch (Exception e) {
				e.printStackTrace();
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
