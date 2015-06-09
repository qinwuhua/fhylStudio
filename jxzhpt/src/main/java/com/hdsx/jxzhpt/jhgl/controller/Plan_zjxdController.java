package com.hdsx.jxzhpt.jhgl.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.crypto.Data;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_zjzj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.server.XtglServer;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.ibm.icu.text.SimpleDateFormat;
import com.opensymphony.xwork2.ModelDriven;

@Scope("prototype")
@Controller
public class Plan_zjxdController extends BaseActionSupport implements ModelDriven<Plan_zjxd> {
	private int page=1;
	private int rows=3;
	private String gydwdm;
	private String fileuploadFileName;
	private File fileupload;
	private Plan_zjxd zjxd=new Plan_zjxd();
	private Plan_zjzj zjzj;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	public void queryZjxdByXmId(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		try {
			jsonMap.put("total", zjxdServer.queryZjxdCount(zjxd.getXmid()));
			jsonMap.put("rows", zjxdServer.queryZjxdByXmId(zjxd.getXmid()));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryZjxdSumByXmid(){
		try {
			JsonUtils.write(zjxdServer.queryZjxdSumByXmid(zjxd.getXmid()), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryZjxdById(){
		try {
			JsonUtils.write(zjxdServer.queryZjxdById(zjxd.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void editZjxdById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(zjxdServer.editZjxd(zjxd)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryZjxdExistById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("count", new Integer(zjxdServer.queryZjxdExistById(zjxd.getXmid())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void addZjxd(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result",  new Boolean(zjxdServer.addZjxd(zjxd)).toString());
			JsonUtils.write(result,getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void dropZjxdById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(zjxdServer.dropZjxd(zjxd.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertZjzj(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(zjxdServer.insertZjzj(zjzj)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryZjzjByXmid(){
		List<Plan_zjzj> list = zjxdServer.queryZjzjByXmid(zjzj);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void importGcsj_zjxd(){
		ExcelEntity excel=new ExcelEntity();
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//第一列项目名称
		attribute.put("1", "lxxx");//路线信息
		attribute.put("2", "pfztz");//批复总投资
		attribute.put("3", "tbdw");//填报单位-即导出单位
		attribute.put("4", "xdnf");//下达年份
		attribute.put("5", "xdzj");//下达的总投资
		attribute.put("6", "btzzj");//下达的部投资
		attribute.put("7", "stz");//省投资
		attribute.put("8", "jhxdwh");//省投资
		attribute.put("9", "xmid");
		excel.setAttributes(attribute);
		try {
			@SuppressWarnings("unchecked")
			List<Plan_zjxd> readerExcel = ExcelImportUtil.readerExcel(fileupload, Plan_zjxd.class, 1, excel);
			eachPlanZjxdSfzj(readerExcel);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void importGcgj_zjxd(){
		ExcelEntity excel=new ExcelEntity();
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//第一列项目名称
		attribute.put("1", "lxxx");//路线信息
		attribute.put("2", "pfztz");//批复总投资
		attribute.put("3", "tbdw");//填报单位-即导出单位
		attribute.put("4", "xdnf");//下达年份
		attribute.put("5", "xdzj");//下达的总投资
		attribute.put("6", "btzzj");//下达的部投资
		attribute.put("7", "stz");//下达的部投资
		attribute.put("8", "jhxdwh");//下达的部投资
		attribute.put("9", "xmid");
		excel.setAttributes(attribute);
		try {
			List<Plan_zjxd> readerExcel = ExcelImportUtil.readerExcel(fileupload, Plan_zjxd.class, 1, excel);
			eachPlanZjxdSfzj(readerExcel);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void importShuih_zjxd(){
		ExcelEntity excel=new ExcelEntity();
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//第一列项目名称
		attribute.put("1", "lxxx");//路线信息
		attribute.put("2", "pfztz");//批复总投资
		attribute.put("3", "tbdw");//填报单位-即导出单位
		attribute.put("4", "xdnf");//下达年份
		attribute.put("5", "xdzj");//下达的总投资
		attribute.put("6", "btzzj");//下达的部投资
		attribute.put("7", "stz");//省投资
		attribute.put("8", "jhxdwh");//计划下达文号
		attribute.put("9", "xmid");
		excel.setAttributes(attribute);
		try {
			List<Plan_zjxd> readerExcel = ExcelImportUtil.readerExcel(fileupload, Plan_zjxd.class, 1, excel);
			eachPlanZjxdSfzj(readerExcel);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void importYhdzx_zjxd(){
		ExcelEntity excel=new ExcelEntity();
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "lxxx");//路线信息
		attribute.put("1", "pfztz");//批复总投资
		attribute.put("2", "tbdw");//填报单位-即导出单位
		attribute.put("3", "xdnf");//下达年份
		attribute.put("4", "xdzj");//下达的总投资
		attribute.put("5", "btzzj");//下达的部投资
		attribute.put("6", "stz");//省投资
		attribute.put("7", "jhxdwh");//计划下达文号
		attribute.put("8", "xmid");
		excel.setAttributes(attribute);
		try {
			List<Plan_zjxd> readerExcel = ExcelImportUtil.readerExcel(fileupload, Plan_zjxd.class, 1, excel);
			eachPlanZjxdSfzj(readerExcel);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void importAbgc_zjxd(){
		ExcelEntity excel=new ExcelEntity();
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "lxxx");//路线信息
		attribute.put("1", "pfztz");//批复总投资
		attribute.put("2", "tbdw");//填报单位-即导出单位
		attribute.put("3", "xdnf");//下达年份
		attribute.put("4", "xdzj");//下达的总投资
		attribute.put("5", "btzzj");//下达的部投资
		attribute.put("6", "stz");//下达的部投资
		attribute.put("7", "jhxdwh");//下达的部投资
		attribute.put("8", "xmid");
		excel.setAttributes(attribute);
		try {
			List<Plan_zjxd> readerExcel = ExcelImportUtil.readerExcel(fileupload, Plan_zjxd.class, 1, excel);
			eachPlanZjxdSfzj(readerExcel);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void importWqgz_zjxd(){
		ExcelEntity excel=new ExcelEntity();
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "lxxx");//路线信息
		attribute.put("1", "pfztz");//批复总投资
		attribute.put("2", "tbdw");//填报单位-即导出单位
		attribute.put("3", "xdnf");//下达年份
		attribute.put("4", "xdzj");//下达的总投资
		attribute.put("5", "btzzj");//下达的部投资
		attribute.put("6", "stz");//省投资
		attribute.put("7", "jhxdwh");//计划下达文号
		attribute.put("8", "xmid");
		excel.setAttributes(attribute);
		try {
			List<Plan_zjxd> readerExcel = ExcelImportUtil.readerExcel(fileupload, Plan_zjxd.class, 1, excel);
			eachPlanZjxdSfzj(readerExcel);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void importZhfz_zjxd(){
		ExcelEntity excel=new ExcelEntity();
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "lxxx");//路线信息
		attribute.put("1", "pfztz");//批复总投资
		attribute.put("2", "tbdw");//填报单位-即导出单位
		attribute.put("3", "xdnf");//下达年份
		attribute.put("4", "xdzj");//下达的总投资
		attribute.put("5", "btzzj");//下达的部投资
		attribute.put("6", "stz");//省投资
		attribute.put("7", "jhxdwh");//计划下达文号
		attribute.put("8", "xmid");
		excel.setAttributes(attribute);
		try {
			List<Plan_zjxd> readerExcel = ExcelImportUtil.readerExcel(fileupload, Plan_zjxd.class, 1, excel);
			eachPlanZjxdSfzj(readerExcel);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void importHsly_zjxd(){
		ExcelEntity excel=new ExcelEntity();
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "tbdw");//填报单位-即导出单位
		attribute.put("2", "xdnf");//下达年份
		attribute.put("3", "xdzj");//下达的总投资
		attribute.put("4", "btzzj");//下达的部投资
		attribute.put("5", "stz");//下达的部投资
		attribute.put("6", "jhxdwh");//下达的部投资
		attribute.put("7", "xmid");
		excel.setAttributes(attribute);
		try {
			List<Plan_zjxd> readerExcel = ExcelImportUtil.readerExcel(fileupload, Plan_zjxd.class, 1, excel);
			eachPlanZjxdSfzj(readerExcel);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 遍历资金下达集合是否追加
	 * @param readerExcel
	 * @throws IOException 
	 */
	private void eachPlanZjxdSfzj(List<Plan_zjxd> readerExcel) throws IOException {
		for (Plan_zjxd item : readerExcel) {
			System.out.println("项目ID："+item.getXmid()+"   计划文号:"+item.getJhxdwh());
			int sfzj = zjxdServer.queryZjxdExistById(item.getXmid());
			item.setSfzj(sfzj>0? "1" : "0");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			item.setTbtime(df.format(new Date()));
		}
		if(zjxdServer.insertBatch(readerExcel)){
			getresponse().getWriter().print(fileuploadFileName+"导入成功");
		}
	}
	public void queryGydwmcById(){
		String gydwmc = zjxdServer.queryGydwmcById(gydwdm);
		Map<String,String> result=new HashMap<String, String>();
		result.put("gydwmc", gydwmc);
		try {
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//set get
	public int getPage() {
		return page;
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
	public Plan_zjxd getZjxd() {
		return zjxd;
	}
	public void setZjxd(Plan_zjxd zjxd) {
		this.zjxd = zjxd;
	}
	public Plan_zjxdServer getZjxdServer() {
		return zjxdServer;
	}
	public void setZjxdServer(Plan_zjxdServer zjxdServer) {
		this.zjxdServer = zjxdServer;
	}
	public Plan_zjzj getZjzj() {
		return zjzj;
	}
	public void setZjzj(Plan_zjzj zjzj) {
		this.zjzj = zjzj;
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
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
	@Override
	public Plan_zjxd getModel() {
		return zjxd;
	}
}
