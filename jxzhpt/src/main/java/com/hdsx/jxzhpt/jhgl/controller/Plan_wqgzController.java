package com.hdsx.jxzhpt.jhgl.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjzj;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.impl.CbsjServerImpl;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_wqgzController extends BaseActionSupport {
	private int page = 1;
	private int rows = 10;
	@Resource(name = "plan_wqgzServerImpl")
	private Plan_wqgzServer wqgzServer;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	private Plan_zjzj zjzj;
	private Plan_wqgz jh;
	private Jckwqgz lx;
	private Sckwqgz sc;
	private Plan_upload uploads;
	private String fileuploadFileName;
	private File fileupload;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;

	/**
	 * 修改危桥状态
	 */
	public void editWqgzStatusBatch() {
		try {
			Map<String, String> result = new HashMap<String, String>();
			lx.setGydwbm(gydwBm(lx.getGydwbm(), "gydwbm"));
			List<Plan_wqgz> splist = wqgzServer.queryWqgzByStatus(jh, lx);
			for (Plan_wqgz item : splist) {
				System.out.println(item.getId());
				item.setJh_sbthcd(""
						+ (Integer.parseInt(item.getJh_sbthcd()) + 2));
				item.setSpzt("1");
				item.setSpsj(new Date());
				item.setSpbmdm(lx.getXzqhdm());// 这里行政区划代码保存的是管养单位编码
			}
			result.put("result",
					new Boolean(wqgzServer.updateStatusBatch(splist))
							.toString());
			System.out.println("结果：" + result.get("result"));
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据状态查询危桥列表，在计划上报时用来查询出所有未上报的计划，并修改状态
	 */
	public void queryWqgzByStatus() {
		try {
			lx.setGydwbm(gydwBm(lx.getGydwbm(), "gydwbm"));
			JsonUtils.write(wqgzServer.queryWqgzByStatus(jh, lx), getresponse()
					.getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 查询危桥列表
	 */
	public void queryWqgzList() {
		try {
			lx.setGydwbm(gydwBm(lx.getGydwbm(), "gydwbm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(), "xzqhdm"));
			if (lx.getTsdq() != null)
				if (lx.getTsdq().length() > 0) {
					String[] tsdqs = lx.getTsdq().split(",");
					String tsdq = "and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if ("全部".equals(tsdqs[i])) {
							tsdq = "";
							break;
						}
						if (i == 0)
							tsdq += "lx.tsdq like '%" + tsdqs[i] + "%'";
						else
							tsdq += "or lx.tsdq like '%" + tsdqs[i] + "%'";
					}
					if (tsdq == "") {
						tsdq = "";
					} else {
						tsdq += ")";
					}
					lx.setTsdq(tsdq);
				}
			if (lx.getGldj() != null)
				if (lx.getGldj().length() > 0) {
					String[] tsdqs = lx.getGldj().split(",");
					String tsdq = "and substr(sck_qlbh,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if ("全部".equals(tsdqs[i])) {
							tsdq = "";
							break;
						}
						if (i == 0)
							tsdq += "'" + tsdqs[i] + "'";
						else
							tsdq += ",'" + tsdqs[i] + "'";
					}
					if (tsdq == "") {
						tsdq = "";
					} else {
						tsdq += ")";
					}
					lx.setGldj(tsdq);
				}
			if (lx.getAkjfl() != null)
				if (lx.getAkjfl().length() > 0) {
					String[] tsdqs = lx.getAkjfl().split(",");
					String tsdq = "and lx.akjfl in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if ("全部".equals(tsdqs[i])) {
							tsdq = "";
							break;
						}
						if (i == 0)
							tsdq += "'" + tsdqs[i] + "'";
						else
							tsdq += ",'" + tsdqs[i] + "'";
					}
					if (tsdq == "") {
						tsdq = "";
					} else {
						tsdq += ")";
					}
					lx.setAkjfl(tsdq);
				}
			if (lx.getJsdj() != null)
				if (lx.getJsdj().length() > 0) {
					String[] tsdqs = lx.getJsdj().split(",");
					String tsdq = "and substr(lx.jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if ("全部".equals(tsdqs[i])) {
							tsdq = "";
							break;
						}
						if (i == 0)
							tsdq += "'"
									+ tsdqs[i].substring(0, 1).replaceAll("等",
											"五") + "'";
						else
							tsdq += ",'"
									+ tsdqs[i].substring(0, 1).replaceAll("等",
											"五") + "'";

					}
					if (tsdq == "") {
						tsdq = "";
					} else {
						tsdq += ")";
					}
					lx.setJsdj(tsdq);
				}
			if (lx.getGydwlx() != null && !"".equals(lx.getGydwlx())) {
				lx.setGydwbm(lx.getGydwbm() + "  and lx.gydwbm like '"
						+ lx.getGydwlx() + "%'");
			}
			System.out.println(lx.getGydwlx());
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("total", wqgzServer.queryWqgzCount(jh, lx));
			jsonMap.put("rows", wqgzServer.queryWqgzList(page, rows, jh, lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 查询危桥总计信息
	 */
	public void querySumWqgz() {
		try {
			lx.setGydwbm(gydwBm(lx.getGydwbm(), "gydwbm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(), "xzqhdm"));
			if (lx.getTsdq() != null)
				if (lx.getTsdq().length() > 0) {
					String[] tsdqs = lx.getTsdq().split(",");
					String tsdq = "and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if ("全部".equals(tsdqs[i])) {
							tsdq = "";
							break;
						}
						if (i == 0)
							tsdq += "lx.tsdq like '%" + tsdqs[i] + "%'";
						else
							tsdq += "or lx.tsdq like '%" + tsdqs[i] + "%'";
					}
					if (tsdq == "") {
						tsdq = "";
					} else {
						tsdq += ")";
					}
					lx.setTsdq(tsdq);
				}
			if (lx.getGldj() != null)
				if (lx.getGldj().length() > 0) {
					String[] tsdqs = lx.getGldj().split(",");
					String tsdq = "and substr(sck_qlbh,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if ("全部".equals(tsdqs[i])) {
							tsdq = "";
							break;
						}
						if (i == 0)
							tsdq += "'" + tsdqs[i] + "'";
						else
							tsdq += ",'" + tsdqs[i] + "'";
					}
					if (tsdq == "") {
						tsdq = "";
					} else {
						tsdq += ")";
					}
					lx.setGldj(tsdq);
				}
			if (lx.getAkjfl() != null)
				if (lx.getAkjfl().length() > 0) {
					String[] tsdqs = lx.getAkjfl().split(",");
					String tsdq = "and lx.akjfl in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if ("全部".equals(tsdqs[i])) {
							tsdq = "";
							break;
						}
						if (i == 0)
							tsdq += "'" + tsdqs[i] + "'";
						else
							tsdq += ",'" + tsdqs[i] + "'";
					}
					if (tsdq == "") {
						tsdq = "";
					} else {
						tsdq += ")";
					}
					lx.setAkjfl(tsdq);
				}
			if (lx.getJsdj() != null)
				if (lx.getJsdj().length() > 0) {
					String[] tsdqs = lx.getJsdj().split(",");
					String tsdq = "and substr(lx.jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if ("全部".equals(tsdqs[i])) {
							tsdq = "";
							break;
						}
						if (i == 0)
							tsdq += "'"
									+ tsdqs[i].substring(0, 1).replaceAll("等",
											"五") + "'";
						else
							tsdq += ",'"
									+ tsdqs[i].substring(0, 1).replaceAll("等",
											"五") + "'";

					}
					if (tsdq == "") {
						tsdq = "";
					} else {
						tsdq += ")";
					}
					lx.setJsdj(tsdq);
				}
			if (lx.getGydwlx() != null && !"".equals(lx.getGydwlx())) {
				lx.setGydwbm(lx.getGydwbm() + "  and lx.gydwbm like '"
						+ lx.getGydwlx() + "%'");
			}
			System.out.println(lx.getTsdq());
			JsonUtils.write(wqgzServer.querySumWqgz(jh, lx), getresponse()
					.getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * excel导出 通过flag来区分导出哪个excel 导出的excel将要设置sheet名，数据，表头，以及excel文件名
	 */
	public void exportExcel_jh_wqgz() {
		lx.setGydwbm(gydwBm(lx.getGydwbm(), "gydwbm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(), "xzqhdm"));
		if (lx.getTsdq() != null)
			if (lx.getTsdq().length() > 0) {
				String[] tsdqs = lx.getTsdq().split(",");
				String tsdq = "and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "lx.tsdq like '%" + tsdqs[i] + "%'";
					else
						tsdq += "or lx.tsdq like '%" + tsdqs[i] + "%'";
				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setTsdq(tsdq);
			}
		if (lx.getGldj() != null)
			if (lx.getGldj().length() > 0) {
				String[] tsdqs = lx.getGldj().split(",");
				String tsdq = "and substr(sck_qlbh,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "'" + tsdqs[i] + "'";
					else
						tsdq += ",'" + tsdqs[i] + "'";
				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setGldj(tsdq);
			}
		if (lx.getAkjfl() != null)
			if (lx.getAkjfl().length() > 0) {
				String[] tsdqs = lx.getAkjfl().split(",");
				String tsdq = "and lx.akjfl in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "'" + tsdqs[i] + "'";
					else
						tsdq += ",'" + tsdqs[i] + "'";
				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setAkjfl(tsdq);
			}
		if (lx.getJsdj() != null)
			if (lx.getJsdj().length() > 0) {
				String[] tsdqs = lx.getJsdj().split(",");
				String tsdq = "and substr(lx.jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "'"
								+ tsdqs[i].substring(0, 1).replaceAll("等", "五")
								+ "'";
					else
						tsdq += ",'"
								+ tsdqs[i].substring(0, 1).replaceAll("等", "五")
								+ "'";

				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setJsdj(tsdq);
			}
		System.out.println("******************");
		List<Excel_list> list = new ArrayList<Excel_list>();
		ExportExcel_new ee = new ExportExcel_new();
		List<SheetBean> sheetBeans = new ArrayList<SheetBean>();
		SheetBean sheetb = new SheetBean();
		String excelHtml = "";
		String tableName = "";
		list = wqgzServer.exportExcel_jh(jh, lx);

		ExcelData eldata = new ExcelData();// 创建一个类
		eldata.setTitleName("普通公路路网结构改造工程计划表（危桥改造）");// 设置第一行
		eldata.setSheetName("危桥改造工程");// 设置sheeet名
		eldata.setFileName("普通公路路网结构改造工程计划表（危桥改造）");// 设置文件名

		eldata.setEl(list);// 将实体list放入类中
		List<Excel_tilte> et = new ArrayList<Excel_tilte>();// 创建一个list存放表头
		et.add(new Excel_tilte("序号", 1, 2, 0, 0));
		et.add(new Excel_tilte("设区市", 1, 2, 1, 1));
		et.add(new Excel_tilte("县（市、区）", 1, 2, 2, 2));
		et.add(new Excel_tilte("最新年报桩号", 1, 1, 3, 6));
		et.add(new Excel_tilte("路网规划前", 1, 1, 7, 10));
		et.add(new Excel_tilte("桥梁全长（米）", 1, 2, 11, 11));
		et.add(new Excel_tilte("桥梁全宽（ 米 ）", 1, 2, 12, 12));
		et.add(new Excel_tilte("建设性质", 1, 2, 13, 13));
		et.add(new Excel_tilte("总投资（万元）", 1, 2, 14, 14));
		et.add(new Excel_tilte("中央车购税资金（万元）", 1, 2, 15, 15));	
		et.add(new Excel_tilte("省级补助（万元）", 1, 2, 16, 16));		
		et.add(new Excel_tilte("地方自筹资金（万元）", 1, 2, 17, 17));
		et.add(new Excel_tilte("建设内容", 1, 2, 18, 18));
		et.add(new Excel_tilte("开工年", 1, 2, 19, 19));
		et.add(new Excel_tilte("完工年", 1, 2, 20, 20));
		et.add(new Excel_tilte("批复文号", 1, 2, 21, 21));
		et.add(new Excel_tilte("管养单位", 1, 2, 22, 22));
		et.add(new Excel_tilte("项目年份", 1, 2, 23, 23));
		et.add(new Excel_tilte("备注", 1, 2, 24, 24));
		et.add(new Excel_tilte("特殊地区", 1, 2, 25, 25));
		et.add(new Excel_tilte("规划路线编码", 2, 2, 3, 3));
		et.add(new Excel_tilte("规划桥梁编码", 2, 2, 4, 4));
		et.add(new Excel_tilte("规划桥梁名称", 2, 2, 5, 5));
		et.add(new Excel_tilte("规划中心桩号", 2, 2, 6, 6));	
		et.add(new Excel_tilte("原路线编码", 2, 2, 7, 7));
		et.add(new Excel_tilte("原桥梁编码", 2, 2, 8, 8));
		et.add(new Excel_tilte("原桥梁名称", 2, 2, 9, 9));
		et.add(new Excel_tilte("原中心桩号", 2, 2, 10, 10));

		eldata.setEt(et);// 将表头内容设置到类里面
		HttpServletResponse response = getresponse();// 获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * excelHtml=
		 * "<tr><td>计划状态</td><td>上报年份</td><td>计划开工时间</td><td>计划完工时间</td><td>管养单位</td><td>行政区划名称</td><td>路线编码</td><td>路线名称</td><td>桥梁编码</td><td>桥梁名称</td><td>批复总投资</td></tr>"
		 * ; sheetb.setTableName("危桥改造项目"); sheetb.setHeader(excelHtml);
		 * sheetb.setSheetName("危桥"); tableName="危桥改造项目";//excel 文件的名字
		 * sheetb.setColnum((short)11); sheetb.setList(list);
		 * sheetb.setFooter(null); sheetBeans.add(sheetb); String
		 * stylefileName="module.xls"; //导出excel ee.initStyle(ee.workbook,
		 * stylefileName); HttpServletResponse response= getresponse();
		 * ee.makeExcel(tableName, sheetBeans, response);
		 */
	}

	/**
	 * 计划库审核导出Excel
	 */
	public void exportExcelWqgzJhSh() {
		lx.setGydwbm(gydwBm(lx.getGydwbm(), "gydwbm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(), "xzqhdm"));
		String fileTitle = "<title=行政区划,fieid=xzqhmc>,<title=管养单位,fieid=gydw>,<title=路线编码,fieid=lxbm>,<title=路线名称,fieid=lxmc>,<title=桥梁编号,fieid=qlbh>,<title=桥梁名称,fieid=qlmc>,<title=桥梁中心桩号,fieid=qlzxzh>,<title=审查桥梁全长,fieid=scqlqc>,<title=审查桥梁全宽,fieid=scqlqk>,<title=方案评估单位,fieid=fapgdw>,<title=方案审查单位,fieid=fascdw>,<title=方案审批时间,fieid=faspsj>,<title=审批文号,fieid=spwh>,<title=投资估算,fieid=tzgs>,<title=建设性质,fieid=jsxz>,<title=建设内容,fieid=jsnr>,<title=审查备注,fieid=scbz>,<title=上报年份,fieid=sbnf>,<title=计划开工时间,fieid=jhkgsj1>,<title=计划完工时间,fieid=jhwgsj1>,<title=设计单位,fieid=sjdw>,<title=设计批复文号,fieid=sjpfdw>,<title=批复文号,fieid=pfwh>,<title=批复时间,fieid=pfsj1>,<title=是否申请按比例补助,fieid=sfsqablbz>,<title=按比例补助文号,fieid=ablbzsqwh>,<title=批复总投资,fieid=pfztz>,<title=部补助资金,fieid=jhsybzje>,<title=地方自筹,fieid=jhsydfzcje>,<title=计划备注,fieid=bz>,<title=计划ID,fieid=id,hidden=true>,<title=审查库ID,fieid=sckid,hidden=true>";
		String fileName = "危桥改造工程计划库审核";
		List<Object> excelData = new ArrayList<Object>();
		excelData = wqgzServer.exportExcelWqgzJhSh(jh, lx);
		ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,
				getresponse());
	}

	/**
	 * 计划库上报导出Excel
	 */
	public void exportExcelWqgzJhSb() {
		lx.setGydwbm(gydwBm(lx.getGydwbm(), "gydwbm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(), "xzqhdm"));
		if (lx.getTsdq() != null)
			if (lx.getTsdq().length() > 0) {
				String[] tsdqs = lx.getTsdq().split(",");
				String tsdq = "and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "lx.tsdq like '%" + tsdqs[i] + "%'";
					else
						tsdq += "or lx.tsdq like '%" + tsdqs[i] + "%'";
				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setTsdq(tsdq);
			}
		if (lx.getGldj() != null)
			if (lx.getGldj().length() > 0) {
				String[] tsdqs = lx.getGldj().split(",");
				String tsdq = "and substr(sck_qlbh,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "'" + tsdqs[i] + "'";
					else
						tsdq += ",'" + tsdqs[i] + "'";
				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setGldj(tsdq);
			}
		if (lx.getAkjfl() != null)
			if (lx.getAkjfl().length() > 0) {
				String[] tsdqs = lx.getAkjfl().split(",");
				String tsdq = "and lx.akjfl in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "'" + tsdqs[i] + "'";
					else
						tsdq += ",'" + tsdqs[i] + "'";
				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setAkjfl(tsdq);
			}
		if (lx.getJsdj() != null)
			if (lx.getJsdj().length() > 0) {
				String[] tsdqs = lx.getJsdj().split(",");
				String tsdq = "and substr(lx.jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "'"
								+ tsdqs[i].substring(0, 1).replaceAll("等", "五")
								+ "'";
					else
						tsdq += ",'"
								+ tsdqs[i].substring(0, 1).replaceAll("等", "五")
								+ "'";

				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setJsdj(tsdq);
			}

		System.out.println(lx.getJsdj());

		String fileTitle = "<title=行政区划,fieid=xzqhmc>,<title=管养单位,fieid=gydw>,<title=路线编码,fieid=lxbm>,<title=路线名称,fieid=lxmc>,<title=桥梁编号,fieid=qlbh>,<title=桥梁名称,fieid=qlmc>,<title=桥梁中心桩号,fieid=qlzxzh>,<title=审查桥梁全长,fieid=scqlqc>,<title=审查桥梁全宽,fieid=scqlqk>,<title=计划开工时间,fieid=jhkgsj>,<title=计划完工时间,fieid=jhwgsj>,<title=批复总投资,fieid=pfztz>";
		String fileName = "危桥改造工程计划库上报";
		List<Object> excelData = new ArrayList<Object>();
		excelData = wqgzServer.queryWqgzList1(jh, lx);
		ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,
				getresponse());
	}

	/**
	 * 导入计划库审核Excel
	 */
	public void importWqgzJhSh() {
		String str = "xzqhmc,gydw,lxbm,lxmc,qlbh,qlmc,qlzxzh,scqlqc,scqlqk,fapgdw,fascdw,faspsj,spwh,tzgs,jsxz,jsnr,scbz,sbnf,jhkgsj1,jhwgsj1,sjdw,sjpfdw,pfwh,pfsj1,sfsqablbz,ablbzsqwh,pfztz,jhsybzje,jhsydfzcje,bz,id,sckid";
		try {
			List<Plan_wqgz> list = ExcelImportUtil.readExcel(str, 0,
					Plan_wqgz.class, fileupload);
			if (wqgzServer.updateImportWqgzJh(list)) {
				getresponse().getWriter().print(fileuploadFileName + "导入成功！");
			} else {
				getresponse().getWriter().print(fileuploadFileName + "导入失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 导入危桥计划Excel
	 */
	public void importWqgz_jh() {
		String fileType = fileuploadFileName.substring(
				fileuploadFileName.length() - 3, fileuploadFileName.length());
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			if (!"xls".equals(fileType)) {
				response.getWriter().print(fileuploadFileName + "不是excel文件");
				return;
			}
			response.setCharacterEncoding("utf-8");
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try {
				dataMapArray = ExcelReader.readExcelContent(4, 23, fs,
						Jckwqgz.class);
			} catch (Exception e) {
				response.getWriter().print(fileuploadFileName + "数据有误");
				return;
			}
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			System.out.println(data);
			// 将数据插入到数据库
			boolean b = wqgzServer.importWqgz_jh(data);
			if (b)
				response.getWriter().print(fileuploadFileName + "导入成功");
			else
				response.getWriter().print(fileuploadFileName + "导入失败");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 此方法弃用
	 */
	public void queryWqgzNfs() {
		try {
			JsonUtils.write(wqgzServer.queryWqgzNfs(), getresponse()
					.getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据ID查询危桥信息
	 */
	public void queryWqgzById() {
		try {
			JsonUtils.write(wqgzServer.queryWqgzById(jh.getId()), getresponse()
					.getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除危桥计划信息
	 */
	public void dropWqgzById() {
		try {
			Map<String, String> result = new HashMap<String, String>();
			System.out.println("ID：" + jh.getId() + " 审查ID：" + jh.getSckid());
			result.put("edit",
					new Boolean(wqgzServer.updateLrztBySckid(jh.getSckid()))
							.toString());
			result.put("drop",
					new Boolean(wqgzServer.dropWqgzById(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 修改危桥计划信息
	 */
	public void editWqgzById() {
		try {
			JsonUtils.write(wqgzServer.editWqgzById(jh), getresponse()
					.getWriter());
			wqgzServer.editWqgzSckxx(sc);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 修改危桥状态
	 */
	public void editWqgzStatus() {
		try {
			Map<String, String> result = new HashMap<String, String>();
			result.put("result",
					new Boolean(wqgzServer.editWqgzStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 上传文件
	 * 
	 * @throws Exception
	 */
	public void uploadWqgzFile() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			response.setCharacterEncoding("utf-8");
			String fid = UUID.randomUUID().toString();
			if ((uploadGk != null)) {
				String fileurl = "E:\\江西综合平台上传文件\\kgbg\\" + jh.getSbnf() + "\\";
				File file = new File(fileurl);
				Plan_upload upload = new Plan_upload(fid, uploadGkFileName,
						"工可报告", uploads.getParentid(), fileurl
								+ uploadGkFileName, null);
				CbsjServer cbsjServer = new CbsjServerImpl();
				upload.setFid(fid);
				if (cbsjServer.insertFile(upload)
						&& cbsjServer.insertFileJl(upload)) {
					uploadFile(file, uploadGkFileName, uploadGk);
					response.getWriter().print(uploadGkFileName + "上传成功！");
				}
			} else {
				String fileurl = "E:\\江西综合平台上传文件\\sjsgt\\" + jh.getSbnf()
						+ "\\";
				File file = new File(fileurl);
				Plan_upload upload = new Plan_upload(fid, uploadSjtFileName,
						"设计施工图", uploads.getParentid(), fileurl
								+ uploadSjtFileName, null);
				CbsjServer cbsjServer = new CbsjServerImpl();
				upload.setFid(fid);
				if (cbsjServer.insertFile(upload)
						&& cbsjServer.insertFileJl(upload)) {
					uploadFile(file, uploadSjtFileName, uploadSjt);
					response.getWriter().print(uploadSjtFileName + "上传成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(
					(uploadSjtFileName == null ? uploadGkFileName
							: uploadSjtFileName) + "上传成功！");
		}
	}

	private void uploadFile(File file, String fileName, File filewj)
			throws FileNotFoundException, IOException {
		if (!file.exists()) {
			file.mkdirs();
		}
		InputStream is = new FileInputStream(filewj);
		File saveFile = new File(file, fileName);
		OutputStream os = new FileOutputStream(saveFile);
		// 设置缓存
		byte[] buffer = new byte[1024];
		int length = 0;
		while ((length = is.read(buffer)) > 0) {
			os.write(buffer, 0, length);
		}
		is.close();
		os.flush();
		os.close();
	}

	/**
	 * 下载危桥的文件
	 */
	public void downWqgzFile() {
		try {
			Plan_wqgz wqgz = wqgzServer.queryWqgzFjById(jh.getId());
			HttpServletResponse response = getresponse();
			response.setContentType("application/x-download");
			if ("gkbg".equals(jh.getGkbgmc())) {
				OutputStream out = response.getOutputStream();
				response.addHeader("Content-Disposition",
						"attachment;filename="
								+ new String(wqgz.getGkbgmc().getBytes("GBK"),
										"ISO-8859-1"));
				byte[] buffer = wqgz.getGkbgdata();
				out.write(buffer);
				out.flush();
				out.close();
			} else {
				OutputStream out = response.getOutputStream();
				response.addHeader("Content-Disposition",
						"attachment;filename="
								+ new String(wqgz.getSjsgtmc().getBytes("GBK"),
										"ISO-8859-1"));
				byte[] buffer = wqgz.getSjsgtdata();
				out.write(buffer);
				out.flush();
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 导出危桥计划资金下达Excel
	 */
	public void exportWqgzZjxdExcel() {
		// 设置表头
		ExcelTitleCell[] title = new ExcelTitleCell[10];
		title[0] = new ExcelTitleCell("桥梁信息", false, new ExcelCoordinate(0,
				(short) 0), null, 50);
		title[1] = new ExcelTitleCell("批复总投资", false, new ExcelCoordinate(0,
				(short) 1), null, 15);
		title[2] = new ExcelTitleCell("填报单位", false, new ExcelCoordinate(0,
				(short) 2), null, 15);
		title[3] = new ExcelTitleCell("下达年份", false, new ExcelCoordinate(0,
				(short) 3), null, 15);
		title[4] = new ExcelTitleCell("总补助资金", false, new ExcelCoordinate(0,
				(short) 4), null, 15);
		title[5] = new ExcelTitleCell("车购税", false, new ExcelCoordinate(0,
				(short) 5), null, 15);
		title[6] = new ExcelTitleCell("省投资", false, new ExcelCoordinate(0,
				(short) 6), null, 15);
		title[7] = new ExcelTitleCell("计划下达文号", false, new ExcelCoordinate(0,
				(short) 7), null, 15);
		title[8] = new ExcelTitleCell("总投资", false, new ExcelCoordinate(0,
				(short) 8), null, 20);
		title[9] = new ExcelTitleCell("ID", true, new ExcelCoordinate(0,
				(short) 9), null, 20);
		// 设置列与字段对应
		Map<String, String> attribute = new HashMap<String, String>();
		attribute.put("0", "lxxx");// 路线信息
		attribute.put("1", "pfztz");// 批复总投资
		attribute.put("2", "tbdw");// 填报单位-即导出单位
		attribute.put("3", "xdnf");// 下达年份
		attribute.put("4", "xdzj");// 下达的总投资
		attribute.put("5", "btzzj");// 下达的部投资
		attribute.put("6", "stz");// 省投资
		attribute.put("7", "jhxdwh");// 计划下达文号
		attribute.put("8", "ztz");// 下达的部投资
		attribute.put("9", "xmid");
		// 准备数据
		String gydwmc = zjxdServer.queryGydwmcById(lx.getGydwdm());
		List<Object> excelData = new ArrayList<Object>();
		if (lx.getGydwdm().equals("36")) {
			lx.setGydwdm(null);
		}
		// 此处遍历查询计划资金下达模块的所有项目
		if (lx.getTsdq() != null)
			if (lx.getTsdq().length() > 0) {
				String[] tsdqs = lx.getTsdq().split(",");
				String tsdq = "and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "lx.tsdq like '%" + tsdqs[i] + "%'";
					else
						tsdq += "or lx.tsdq like '%" + tsdqs[i] + "%'";
				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setTsdq(tsdq);
			}
		if (lx.getGldj() != null)
			if (lx.getGldj().length() > 0) {
				String[] tsdqs = lx.getGldj().split(",");
				String tsdq = "and substr(sck_qlbh,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "'" + tsdqs[i] + "'";
					else
						tsdq += ",'" + tsdqs[i] + "'";
				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setGldj(tsdq);
			}
		if (lx.getAkjfl() != null)
			if (lx.getAkjfl().length() > 0) {
				String[] tsdqs = lx.getAkjfl().split(",");
				String tsdq = "and lx.akjfl in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "'" + tsdqs[i] + "'";
					else
						tsdq += ",'" + tsdqs[i] + "'";
				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setAkjfl(tsdq);
			}
		if (lx.getJsdj() != null)
			if (lx.getJsdj().length() > 0) {
				String[] tsdqs = lx.getJsdj().split(",");
				String tsdq = "and substr(lx.jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if ("全部".equals(tsdqs[i])) {
						tsdq = "";
						break;
					}
					if (i == 0)
						tsdq += "'"
								+ tsdqs[i].substring(0, 1).replaceAll("等", "五")
								+ "'";
					else
						tsdq += ",'"
								+ tsdqs[i].substring(0, 1).replaceAll("等", "五")
								+ "'";

				}
				if (tsdq == "") {
					tsdq = "";
				} else {
					tsdq += ")";
				}
				lx.setJsdj(tsdq);
			}
		lx.setGydwbm(gydwBm(lx.getGydwbm(), "gydwbm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(), "xzqhdm"));
		for (Plan_wqgz item : wqgzServer.queryWqgzList(jh, lx)) {
			Plan_zjxd zjxd = new Plan_zjxd();
			String strLx = (item.getJckwqgz().getLxmc() == null ? "" : item
					.getJckwqgz().getLxmc() + "-")
					+ (item.getJckwqgz().getQlmc() == null ? "" : item
							.getJckwqgz().getQlmc() + "-")
					+ item.getJckwqgz().getQlbh()
					+ "("
					+ item.getJckwqgz().getQlzxzh() + ")";
			zjxd.setLxxx(strLx);
			zjxd.setPfztz(item.getPfztz());
			zjxd.setXmid(item.getId());
			zjxd.setTbdw(gydwmc);
			excelData.add(zjxd);
		}
		ExcelEntity excel = new ExcelEntity("危桥改造", title, attribute, excelData);
		ExcelExportUtil.excelWrite(excel, "危桥改造-计划资金下达", getresponse());
	}

	/**
	 * 查询危桥自己
	 * 
	 * @throws IOException
	 * @throws Exception
	 */
	public void queryWqLs() throws IOException, Exception {
		List<Plan_wqgz> ls = wqgzServer.queryWqLs(lx);
		JsonUtils.write(ls, getresponse().getWriter());
	}

	/**
	 * 管养单位或行政区划代码处理
	 * 
	 * @param bh
	 * @param name
	 * @return
	 */
	public String gydwOrxzqhBm(String bh, String name) {
		String result = null;
		if (bh != null) {
			if (bh.indexOf(",") == -1) {
				int i = 0;
				if (bh.matches("^[0-9]*[1-9]00$")) {
					i = 2;
				} else if (bh.matches("^[0-9]*[1-9]0000$")) {
					i = 4;
				}
				bh = bh.substring(0, bh.length() - i);
			}
			result = bh.indexOf(",") == -1 ? " lx." + name + " like '%" + bh
					+ "%'" : "lx." + name + " in (" + bh + ")";
		}
		return result;
	}

	public String gydwBm(String bh, String name) {
		String result = null;
		if (bh != null) {
			if (bh.indexOf(",") == -1) {
				int i = 0;
				if (bh.matches("^[0-9]*[1-9]00$")
						|| bh.matches("^[0-9]*[1-9][0-9]00$")) {
					i = 2;
				} else if (bh.matches("^[0-9]*[1-9]0000$")) {
					i = 4;
				}
				bh = bh.substring(0, bh.length() - i);
			}
			result = bh.indexOf(",") == -1 ? " lx." + name
					+ " like '%'||substr('" + bh + "',0,4)||'_'||substr('" + bh
					+ "',6)||'%'" : "lx." + name + " in (" + bh + ")";
		}
		return result;
	}

	public void editWqZj() {
		try {
			String Strresult = "false";
			jh.setPfztz(new Double(new Double(jh.getPfztz()).doubleValue()
					+ new Integer(zjzj.getZtz()).doubleValue()).toString());
			jh.setJhsybzje(new Double(new Double(jh.getJhsybzje())
					.doubleValue() + new Double(zjzj.getBbzje()).doubleValue())
					.toString());
			jh.setJhsydfzcje(new Double(new Double(jh.getJhsydfzcje())
					.doubleValue() + new Double(zjzj.getStz()).doubleValue())
					.toString());
			if (wqgzServer.editZjById(jh) && zjxdServer.insertZjzj(zjzj)) {
				Strresult = "true";
			}
			Map<String, String> result = new HashMap<String, String>();
			result.put("result", Strresult);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// set get
	public int getPage() {
		return page;
	}

	public Plan_zjzj getZjzj() {
		return zjzj;
	}

	public void setZjzj(Plan_zjzj zjzj) {
		this.zjzj = zjzj;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public Plan_wqgzServer getWqgzServer() {
		return wqgzServer;
	}

	public void setWqgzServer(Plan_wqgzServer wqgzServer) {
		this.wqgzServer = wqgzServer;
	}

	public Plan_wqgz getJh() {
		return jh;
	}

	public void setJh(Plan_wqgz jh) {
		this.jh = jh;
	}

	public Jckwqgz getLx() {
		return lx;
	}

	public void setLx(Jckwqgz lx) {
		this.lx = lx;
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

	public File getUploadGk() {
		return uploadGk;
	}

	public void setUploadGk(File uploadGk) {
		this.uploadGk = uploadGk;
	}

	public String getUploadGkFileName() {
		return uploadGkFileName;
	}

	public void setUploadGkFileName(String uploadGkFileName) {
		this.uploadGkFileName = uploadGkFileName;
	}

	public File getUploadSjt() {
		return uploadSjt;
	}

	public void setUploadSjt(File uploadSjt) {
		this.uploadSjt = uploadSjt;
	}

	public String getUploadSjtFileName() {
		return uploadSjtFileName;
	}

	public void setUploadSjtFileName(String uploadSjtFileName) {
		this.uploadSjtFileName = uploadSjtFileName;
	}

	public Sckwqgz getSc() {
		return sc;
	}

	public void setSc(Sckwqgz sc) {
		this.sc = sc;
	}

	public Plan_upload getUploads() {
		return uploads;
	}

	public void setUploads(Plan_upload uploads) {
		this.uploads = uploads;
	}

}
