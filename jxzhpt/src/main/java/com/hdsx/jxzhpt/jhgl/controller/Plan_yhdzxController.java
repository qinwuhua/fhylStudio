package com.hdsx.jxzhpt.jhgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_yhdzxServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.util.lang.JsonUtil;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_yhdzxController extends BaseActionSupport{
	private int page=1;
	private int rows=10;
	private Plan_yhdzx jh;
	private Plan_lx_yhdzx lx;
	private String gydwdm;
	@Resource(name = "plan_yhdzxServerImpl")
	private Plan_yhdzxServer yhdzxServer;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	private String fileuploadFileName;
	private File fileupload;
	
	public void querySumYhdzx(){
		try {
			JsonUtils.write(yhdzxServer.querySumYhdzx(jh,lx), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryYhdzxList(){
		try {
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			jsonMap.put("total", yhdzxServer.queryYhdzxCount(jh,lx));
			jsonMap.put("rows", yhdzxServer.queryYhdzxList(page,rows,jh,lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryYhdzxById(){
		try {
			JsonUtils.write(yhdzxServer.queryYhdzxById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropYhdzxById(){
		try {
			Map<String, Object> result=new HashMap<String, Object>();
			result.put("jh", new Boolean(yhdzxServer.dropYhdzxById(jh.getId())));
			result.put("lx", new Boolean(yhdzxServer.dropYhdzxLxByJhid(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editYhdzxStatus(){
		try {
			System.out.println("设计批复问好："+jh.getDevisenumbder());
			Map<String,String> result=new HashMap<String, String>();
			result.put("result", new Boolean(yhdzxServer.editYhdzxStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editYhdzxById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			System.out.println(""+lx.getAym());
			System.out.println("路面结构："+lx.getLmjg());
			result.put("result", new Boolean(yhdzxServer.editYhdzxById(jh, lx)).toString());
			result.put("lx", new Boolean(yhdzxServer.editYhdzxLxById(jh,lx)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void exportExcel_yhdzx(){
		try{
			List<Plan_yhdzx> queryYhdzxList = yhdzxServer.queryYhdzxList(jh,lx);
			List<Map<String,String>> excelData=new ArrayList<Map<String,String>>();
			for (Plan_yhdzx item : queryYhdzxList) {
				List<Plan_lx_yhdzx> lxlist = item.getPlan_lx_yhdzxs();
				for (Plan_lx_yhdzx itemlx : lxlist) {
					Map<String, String> lxmap=new HashMap<String, String>();
					lxmap.put("0", itemlx.getGydwmc());
					lxmap.put("1", itemlx.getXzqhmc());
					lxmap.put("2", itemlx.getLxbm());
					lxmap.put("3", itemlx.getLxmc());
					lxmap.put("4", itemlx.getQdzh());
					lxmap.put("5", itemlx.getZdzh());
					lxmap.put("6", itemlx.getQzlc());
					excelData.add(lxmap);
				}
			}
			List<String> excelTitle=new ArrayList<String>();
			excelTitle.add("管养单位");
			excelTitle.add("行政区划");
			excelTitle.add("路线编码");
			excelTitle.add("路线名称");
			excelTitle.add("起点桩号");
			excelTitle.add("止点桩号");
			excelTitle.add("隐患里程");
			String tableName="养护大中修项目";
			HttpServletResponse response= getresponse();
			ExcelUtil.excelWrite(excelData, excelTitle, tableName, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void importYhdzx_jh(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
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
				dataMapArray = ExcelReader.readExcelContent(3,40,fs,Plan_gcsj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			String strVerify=null;
			boolean boolJh=true,boolLx=true;
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			for (Map map : data) {
				UUID jhId = UUID.randomUUID(); 
				map.put("jhid", jhId.toString().replace("-", ""));
				map.put("gydwdm", getGydwdm());
				map.put("tbsj", new Date());
				map.put("1", map.get("1").toString().substring(0, map.get("1").toString().indexOf(".")));
				map.put("13", map.get("13").toString().substring(0, map.get("13").toString().indexOf(".")));
			}
			System.out.println(data);
			yhdzxServer.insertYhdzx_lx(data);
			yhdzxServer.insertYhdzx_jh(data);
			//将数据插入到数据库
			if(boolJh && boolLx)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void exportYhdzxZjxdExcel(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[9];
		title[0]=new ExcelTitleCell("路线信息",false, new ExcelCoordinate(0, (short)0), null,50);
		title[1]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)1), null,15);
		title[2]=new ExcelTitleCell("填报单位",false, new ExcelCoordinate(0, (short)2), null,15);
		title[3]=new ExcelTitleCell("下达年份",false, new ExcelCoordinate(0, (short)3), null,15);
		title[4]=new ExcelTitleCell("总投资",false, new ExcelCoordinate(0, (short)4), null,15);
		title[5]=new ExcelTitleCell("车购税",false, new ExcelCoordinate(0, (short)5), null,15);
		title[6]=new ExcelTitleCell("省投资",false, new ExcelCoordinate(0, (short)6), null,15);
		title[7]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)7), null,15);
		title[8]=new ExcelTitleCell("ID",true, new ExcelCoordinate(0, (short)8), null,20);
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
		//准备数据
		String gydwmc=zjxdServer.queryGydwmcById(lx.getGydwdm());
		List<Object> excelData = new ArrayList<Object>();
		if(lx.getGydwdm().equals("36")){
			lx.setGydwdm(null);
		}
		for (Plan_yhdzx item : yhdzxServer.queryYhdzxList(jh, lx)) {
			Plan_zjxd zjxd=new Plan_zjxd();
			String strLx="";
			for (int i = 0; i <item.getPlan_lx_yhdzxs().size(); i++) {
				strLx+=item.getPlan_lx_yhdzxs().get(i).getLxmc()+"-"+
						item.getPlan_lx_yhdzxs().get(i).getLxbm()+"("+
						item.getPlan_lx_yhdzxs().get(i).getQdzh()+"-"+
						item.getPlan_lx_yhdzxs().get(i).getZdzh()+")";
				if(i!=item.getPlan_lx_yhdzxs().size()-1){
					strLx+="\r\n";
				}
			}
			zjxd.setLxxx(strLx);
			zjxd.setPfztz(item.getTotalinvest());
			zjxd.setXmid(item.getId());
			zjxd.setTbdw(gydwmc);
			excelData.add(zjxd);
		}
		ExcelEntity excel=new ExcelEntity("养护大中修",title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, "养护大中修-资金下达", getresponse());
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
	public Plan_yhdzx getJh() {
		return jh;
	}
	public void setJh(Plan_yhdzx jh) {
		this.jh = jh;
	}
	public Plan_lx_yhdzx getLx() {
		return lx;
	}
	public void setLx(Plan_lx_yhdzx lx) {
		this.lx = lx;
	}
	public Plan_yhdzxServer getYhdzxServer() {
		return yhdzxServer;
	}
	public void setYhdzxServer(Plan_yhdzxServer yhdzxServer) {
		this.yhdzxServer = yhdzxServer;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
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
}
