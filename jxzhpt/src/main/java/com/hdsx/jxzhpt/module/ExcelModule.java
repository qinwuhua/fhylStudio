package com.hdsx.jxzhpt.module;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.Region;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.jhgl.server.impl.Plan_abgcServerImpl;
import com.hdsx.jxzhpt.jhgl.server.impl.Plan_wqgzServerImpl;
import com.hdsx.jxzhpt.jhgl.server.impl.Plan_zhfzServerImpl;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckabgcServer;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckwqgzServer;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckzhfzServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;

/**
 * @author excel模板导出
 */
@Controller
public class ExcelModule extends BaseActionSupport {

	@Resource(name = "sckabgcServerImpl")
	private SckabgcServer abgcServer;
	@Resource(name = "sckwqgzServerImpl")
	private SckwqgzServer wqgzServer;
	@Resource(name = "sckzhfzServerImpl")
	private SckzhfzServer zhfzServer;
	private String moduleName;
	private String sbdw;
	private String tbdw;
	private String sck_sbthcd;
	public void getModule() {
		String filename = moduleName;
		if (filename == null || "".equals(filename)) {
			return;
		}
		try {
			HttpServletResponse response = getresponse();
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(filename.getBytes("gb2312"), "ISO-8859-1")
					+ ".xls");
			OutputStream out = new BufferedOutputStream(
					response.getOutputStream());
			InputStream fi = ExcelModule.class.getClassLoader()
					.getResourceAsStream("/excelModule/" + filename + ".xls");
			byte[] buffer = new byte[fi.available()];
			fi.read(buffer);
			fi.close();
			out.write(buffer);
			out.flush();
			out.close();
		} catch (Exception e) {
			HttpServletResponse response = getresponse();
			try {
				response.getWriter().write("该名称模板不存在！");
			} catch (IOException e1) {
			}
		}
	}

	public void getModule_sc() {
		System.out.println(tbdw );
		String filename = moduleName;
		if (filename == null || "".equals(filename)) {
			return;
		}
		try {
			HttpServletResponse response = getresponse();
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(filename.getBytes("gb2312"), "ISO-8859-1")
					+ ".xls");
			OutputStream out = new BufferedOutputStream(
					response.getOutputStream());
			InputStream fi = ExcelModule.class.getClassLoader()
					.getResourceAsStream("/excelModule/" + filename + ".xls");
			POIFSFileSystem ps = new POIFSFileSystem(fi);
			HSSFWorkbook wb = new HSSFWorkbook(ps);
			HSSFSheet sheet = wb.getSheetAt(0);
			CellStyle style = sheet.getRow(3).getCell(1).getCellStyle();
			for (int i = 4; i <=sheet.getLastRowNum(); i++) {
				sheet.removeRow(sheet.getRow(i));
			}
			// 去数据库将数据拿到放到模板中
			List<SjbbMessage> list = new ArrayList<SjbbMessage>();
			String descr="";
			Map map = new HashMap();
			map.put("tbdw", tbdw);
			if ("SCK_Security".equals(moduleName)) { // 安保的数据
				list = abgcServer.insertToSheet(map);
				descr="填表说明：\n"+
					"1.列1桥梁代码：按照路线编码+县级政区编码+L+4位数字。桥梁代码必须与养护统计报表保持一致。\n"+   
					"2.列2桥梁名称，填写桥梁的具体名称，如：高升大桥等。\n"+
					"3.列3桥梁中心桩号：按照数字型填写，以公里为单位，保留三位小数，如：K708+245填写为708.245。\n"+
					"4.列4桥梁全长、列5桥梁全宽：当建设性质为“加固改造”时，应与基础项目库保持一致，不得更改；当建设性质为“拆除重建（新建）”时，填写为新建桥梁的全长、全宽。\n"+
					"5.列6方案评估单位、列7方案审查单位：填写改造路段方案评估单位、方案审查单位全称；\n"+
					"6.列8方案审批时间：填写方案审批时间。格式为2013-03-19；\n"+
					"7.列9审批文号：填写审批文号。\n"+
					"8.列10投资估算：填写投资估算金额，精确到万元；\n"+
					"9.列11建设性质：按照拟改造工程分类填写为加固改造、拆除重建（新建）。\n"+
					"10.列12建设内容：填写改造桥梁详细项目实施内容。\n"+
					"11.列13备注。";
			} else if ("SCK_Bridge".equals(moduleName)) { // 危桥的数据
				list = wqgzServer.insertToSheet(map);
//				descr="填报说明：\n"+
//					"1.列1行政区划代码、列2行政区划名称填写到县级，其中行政区划代码具体参照国家统计局网站最近一次公布《行政区划代码》 （网址：http;//www.stats.gov.cn/tjbz/xzqhdm)。\n"+
//					"2.列3路线编号、列4路线名称：按照《公路路线标识规则和过道编号》（GB/T917-2009）的相关规定填报。路线编号只填写一位字母吗（G、S、X）加相应的编号。\n"+
//					"3.列5-列6路段的起点、止点桩号：填写改造路段的起、止点桩号。注：审查库中的起止点桩号范围必须在项目库中的某条项目的起止点桩号范围以内或者相等；\n"+
//					"按照数字型填写，以公里为单位，保留三位小数，如：K708+245填写为708.245。\n"+
//					"4.列7总里程：填写改造路段的总里程：列7=列6-列5。按照数字型填写，以公里为单位，保留三位小数，如：K708+245填写为708.245。\n"+
//					"5.列8隐患里程：填写带三位小数的阿拉伯数字。单位：公里。隐患里程应小于等于总里程；\n"+
//					"6.列9修改建年度：填写改造路段修改建年度。如：2001；\n"+
//					"7.列10方案评估单位、列11方案审查单位：填写改造路段方案股评单位、方案审查单位全称；\n"+
//					"8.列12方案审批时间：填写方案审批时间。如：2013-03-19；\n"+
//					"9.列13审批文号：填写审批文号。\n"+
//					"10.列14投资估算：填写投资估算金额，估算金额填写精确到万元；\n"+
//					"11.列15建设性质：按照拟改造工程分类填写，中修、大修。\n"+
//					"12.列16建设内容：填写改造路段详细项目实施内容。\n"+
//					"13.列17备注。";
				descr="填报说明：\n"+
					"1.列7方案评估单位、列8方案审查单位：填写改造路段方案评估单位、方案审查单位全称；\n"+
					"2.列9方案审批时间：填写方案审批时间。如：2016-04-22；\n"+
					"3.列10审批文号：填写审批文号。\n"+
					"4.列11投资估算：填写投资估算金额，估算金额填写精确到万元；\n"+
					"5.列12建设性质：按照拟改造工程分类填写，加固改造、拆除重建。\n"+
					"6.列13建设内容：填写改造路段详细项目实施内容。\n"+
					"7.列14备注。";
			} else { // 灾害防治的数据
				list = zhfzServer.insertToSheet(map);
				descr="填报说明：\n"+
					"1.列1行政区划代码、列2行政区划名称填写到县级，其中行政区划代码具体参照国家统计局网站最近一次公布《行政区划代码》（网址：http;//www.stats.gov.cn/tjbz/xzqhdm)。\n"+
					"2.列3路线编号、列4路线名称：按照《公路路线标识规则和过道编号》（GB/T917-2009）的相关规定填报。路线编号只填写一位字母吗（G、S、X）加相应的编号。\n"+
					"3.列5-列6路段的起点、止点桩号：填写改造路段的起、止点桩号。注：审查库中的起止点桩号范围必须在项目库中的某条项目的起止点桩号范围以内或者相等；\n"+
					"按照数字型填写，以公里为单位，保留三位小数，如：K708+245填写为708.245。\n"+
					"4.列7总里程：填写改造路段的总里程：列7=列6-列5。按照数字型填写，以公里为单位，保留三位小数，如：K708+245填写为708.245。\n"+
					"5.列8隐患里程：填写带三位小数的阿拉伯数字。单位：公里。隐患里程应小于等于总里程；\n"+
					"6.列9修改建年度：填写改造路段修改建年度。如：2001；\n"+
					"7.列10方案评估单位、列11方案审查单位：填写改造路段方案股评单位、方案审查单位全称；\n"+
					"8.列12方案审批时间：填写方案审批时间。如：2013-03-19；\n"+
					"9.列13审批文号：填写审批文号。\n"+
					"10.列14投资估算：填写投资估算金额，估算金额填写精确到万元；\n"+
					"11.列15建设性质：按照拟改造工程分类填写，中修、大修。\n"+
					"12.列16建设内容：填写改造路段详细项目实施内容。\n"+
					"13.列17备注。";
			}
			insertDataToSheet(wb, list, style,descr);
			wb.write(out);
			out.flush();
			out.close();
		} catch (Exception e) {
			HttpServletResponse response = getresponse();
			try {
				response.getWriter().write("该名称模板不存在！");
			} catch (IOException e1) {
			}
		}
	}
	
	public void getModule_jh() {
		String filename = moduleName;
		if (filename == null || "".equals(filename)) {
			return;
		}
		try {
			HttpServletResponse response = getresponse();
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			InputStream fi = ExcelModule.class.getClassLoader().getResourceAsStream("/excelModule/" + filename + ".xls");
			POIFSFileSystem ps = new POIFSFileSystem(fi);
			HSSFWorkbook wb = new HSSFWorkbook(ps);
			HSSFSheet sheet = wb.getSheetAt(0);
			CellStyle style = sheet.getRow(3).getCell(1).getCellStyle();
			for (int i = 4; i <=sheet.getLastRowNum(); i++) {
				sheet.removeRow(sheet.getRow(i));
			}
			// 去数据库将数据拿到放到模板中
			List<SjbbMessage> list = new ArrayList<SjbbMessage>();
			String descr="";
			Plan_wqgzServer wqgzServer = new Plan_wqgzServerImpl();
			Plan_abgcServer abgcServer = new Plan_abgcServerImpl();
			Plan_zhfzServer zhfzServer = new Plan_zhfzServerImpl();
			Map map = new HashMap();
			map.put("sbdw", sbdw);
			map.put("sck_sbthcd", sck_sbthcd);
			map.put("tbdw", tbdw);
			if("Plan_Bridge".equals(moduleName)){
				list = wqgzServer.insertToSheet(map);
				descr = "填表说明: \n"+
					"1.列1行政区划代码、列2行政区划名称填写到县级，其中行政区划代码具体参照国家统计局网站最近一次公布《行政区划代码》（网址：http;//www.stats.gov.cn/tjbz/xzqhdm)。\n"+
					"2.列3路线编号、列4路线名称：按照《公路路线标识规则和过道编号》（GB/T917-2009）的相关规定填报。路线编号只填写一位字母吗（G、S、X）加相应的编号。\n"+
					"3.列5-列6桥梁编码、桥梁名称。\n"+
					"4.列7桥梁中心桩号：按照数字型填写。\n"+
					"5.列8建设性质：按照拟改造工程分类填写为加固改造、拆除重建（新建）。\n"+
					"6.列9建设内容：详细填写项目实施内容。\n"+
					"7.列10-列13：上报年份、计划开工时间、计划完工时间、计划下达时间。\n"+
					"8.列14设计单位、列15设计批复单位：填写单位全称。\n"+
					"9.列16批复文号：填写设计批复文件文号。 \n"+
					"10列17：批复时间。          \n"+
					"11.列18-列20：填写批复总投资额、拟申请的部投资额及地方自筹资金额。数值填写至个位数，如总投资为155.3万元填写为155。列18=列19+列20。\n"+    
					"12.列21是否申请按比例补助、列20按比例补助申请文号：根据《公路路网结构改造工程管理办法》（交公路发{2011}182号）第十九条有关规定，\n"+
					"总投资超过500万元的项目可按照项目投资比例进行补助。如第21列填写“是”，第22列需填写省级交通运输主管部门报交通运输部的申请文件文号。\n"+
					"13.列23：备注";
			}else if("Plan_Security".equals(moduleName)){
				list = abgcServer.insertToSheet(map);
				descr = "填表说明:\n"+
					"1.列1行政区划代码、列2行政区划名称填写到县级，其中行政区划代码具体参照国家统计局网站最近一次公布《行政区划代码》（网址：http;//www.stats.gov.cn/tjbz/xzqhdm)。\n"+
					"2.列3路线编号、列4路线名称：按照《公路路线标识规则和过道编号》（GB/T917-2009）的相关规定填报。路线编号只填写一位字母吗（G、S、X）加相应的编号。\n"+
					"3.列5-列6路段的起点、止点桩号：填写改造路段的起、止点桩号。按照数字型填写，以公里为单位，保留三位小数，如：K708+245填写为708.245。\n"+
					"4.列7隐患里程：填写带两位小数的阿拉伯数字。单位：公里。\n"+
					"5.列8建设性质：按照拟改造工程分类填写，中修、大修。\n"+
					"6.列9建设内容：详细填写项目实施内容。\n"+
					"7.列10计划完成：填写阿拉伯数字。单位：处。\n"+
					"8.列11-列14：上报年份、计划开工时间、计划完工时间、计划下达时间。\n"+
					"9.列15设计单位、列16设计批复单位：填写单位全称。\n"+
					"10.列17批复文号：填写设计批复文件文号。 \n"+
					"11.列18：批复时间。          \n"+
					"12.列19-列21：填写批复总投资额、拟申请的部投资额及地方自筹资金额。数值填写至个位数，如总投资为155.3万元填写为155。列19=列20+列21。\n"+    
					"13.列22是否申请按比例补助、列23按比例补助申请文号：根据《公路路网结构改造工程管理办法》（交公路发{2011}182号）第十九条有关规定，\n"+
					"总投资超过500万元的项目可按照项目投资比例进行补助。如第22列填写“是”，第23列需填写省级交通运输主管部门报交通运输部的申请文件文号。\n"+
					"14.列24：备注";
			}else if("Plan_Disaster".equals(moduleName)){
				list = zhfzServer.insertToSheet(map);
				descr = "填表说明: \n"+
					"1.列1行政区划代码、列2行政区划名称填写到县级，其中行政区划代码具体参照国家统计局网站最近一次公布《行政区划代码》（网址：http;//www.stats.gov.cn/tjbz/xzqhdm)。\n"+
					"2.列3路线编号、列4路线名称：按照《公路路线标识规则和过道编号》（GB/T917-2009）的相关规定填报。路线编号只填写一位字母吗（G、S、X）加相应的编号。\n"+
					"3.列5-列6路段的起点、止点桩号：填写改造路段的起、止点桩号。按照数字型填写，以公里为单位，保留三位小数，如：K708+245填写为708.245。\n"+
					"4.列7隐患里程：填写带两位小数的阿拉伯数字。单位：公里。\n"+
					"5.列8建设性质：按照拟改造工程分类填写，中修、大修。\n"+
					"6.列9建设内容：详细填写项目实施内容。\n"+
					"7.列10-列13：上报年份、计划开工时间、计划完工时间、计划下达时间。\n"+
					"8.列14设计单位、列15设计批复单位：填写单位全称。\n"+
					"9.列16批复文号：填写设计批复文件文号。 \n"+
					"10列17：批复时间。          \n"+
					"11.列18-列20：填写批复总投资额、拟申请的部投资额及地方自筹资金额。数值填写至个位数，如总投资为155.3万元填写为155。列18=列19+列20。\n"+    
					"12.列21是否申请按比例补助、列20按比例补助申请文号：根据《公路路网结构改造工程管理办法》（交公路发{2011}182号）第十九条有关规定，\n"+
					"总投资超过500万元的项目可按照项目投资比例进行补助。如第21列填写“是”，第22列需填写省级交通运输主管部门报交通运输部的申请文件文号。\n"+
					"13.列23：备注";
			}
			insertDataToSheet(wb, list, style,descr);
			wb.write(out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			HttpServletResponse response = getresponse();
			try {
				response.getWriter().write("该名称模板不存在！");
			} catch (IOException e1) {
			}
		}
	}
	public void insertDataToSheet(HSSFWorkbook wb, List<SjbbMessage> list,
			CellStyle style,String descr) throws Exception {
		HSSFSheet sheet = wb.getSheetAt(0);
		int colnum = sheet.getRow(3).getLastCellNum();
		for (int i = 0; i < list.size(); i++) {
			HSSFRow row = sheet.createRow(4 + i);
			SjbbMessage sjbb = list.get(i);
			for (int j = 0; j < colnum; j++) {
				HSSFCell cell = row.createCell(j);
				cell.setCellStyle(style);
				String value = (String) SjbbMessage.class
						.getMethod("getV_" + j).invoke(sjbb, null);
				cell.setCellValue(value);
			}
		}
		HSSFRow row = sheet.createRow(4 + list.size());
		row.isFormatted();
		row.setHeightInPoints(250);
		sheet.addMergedRegion(new Region((4+list.size()),(short)0,(4+list.size()),(short)(colnum-1)));
		HSSFCell cell = row.createCell(0);
		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setVerticalAlignment(CellStyle.VERTICAL_TOP);
		cellStyle.setWrapText(true);
		cell.setCellStyle(cellStyle);
		cell.setCellValue(descr);
		
	}

	public void getModule_jhfeiLw(){
		String filename=moduleName;
		System.out.println("文件名称："+moduleName);
		try {
			HttpServletResponse response = getresponse();
			response.setContentType("octets/stream");
			OutputStream out;
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			out = new BufferedOutputStream(response.getOutputStream());
			InputStream fi = ExcelModule.class.getClassLoader().getResourceAsStream("/excelModule/" + filename + ".xls");
			POIFSFileSystem ps = new POIFSFileSystem(fi);
			HSSFWorkbook wb = new HSSFWorkbook(ps);
			wb.write(out);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	

	public String getSck_sbthcd() {
		return sck_sbthcd;
	}

	public void setSck_sbthcd(String sck_sbthcd) {
		this.sck_sbthcd = sck_sbthcd;
	}

	public String getSbdw() {
		return sbdw;
	}

	public void setSbdw(String sbdw) {
		this.sbdw = sbdw;
	}

	public String getTbdw() {
		return tbdw;
	}

	public void setTbdw(String tbdw) {
		this.tbdw = tbdw;
	}
}
