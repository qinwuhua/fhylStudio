package com.hdsx.jxzhpt.jhgl.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.mapping.MappedStatement;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjzj;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_zhfzController  extends BaseActionSupport{
	private int page=1;
	private int rows=10;
	@Resource(name = "plan_zhfzServerImpl")
	private Plan_zhfzServer zhfzServer;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	private Plan_zhfz jh;
	private Jckzhfz lx;
	private Sckzhfz sc;
	private Plan_zjzj zjzj;
	private String fileuploadFileName;
	private File fileupload;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	//批量审批
	public void editZhfzStatusBatch(){
		try {
			lx.setGydwbm(gydwOrxzqhBm(lx.getGydwbm(),"gydwbm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			Map<String, String> result=new HashMap<String, String>();
			List<Plan_zhfz> splist = zhfzServer.queryZhfzByStatus(jh,lx);
			for (Plan_zhfz item : splist) {
				item.setJh_sbthcd(""+(new Integer(item.getJh_sbthcd())+2));
				item.setSpzt("1");
				item.setSpsj(new Date());
				item.setSpbmdm(lx.getXzqhdm());//这里行政区划代码保存的是管养单位编码
			}
			result.put("result", new Boolean(zhfzServer.updateStatusBatch(splist)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryZhfzByStatus(){
		try {
			lx.setGydwbm(gydwOrxzqhBm(lx.getGydwbm(),"gydwbm"));
//			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			JsonUtils.write(zhfzServer.queryZhfzByStatus(jh, lx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void querySumZhfz(){
		try {
			lx.setGydwbm(gydwOrxzqhBm(lx.getGydwbm(),"gydwbm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			JsonUtils.write(zhfzServer.querySumZhfz(jh,lx), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * excel导出
	 * 通过flag来区分导出哪个excel
	 * 导出的excel将要设置sheet名，数据，表头，以及excel文件名
	 */
	public void exportExcel_jh_zhfz(){
		List<SjbbMessage> list = new ArrayList<SjbbMessage>();
		ExportExcel_new ee = new ExportExcel_new();
		List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
		SheetBean sheetb = new SheetBean();
		String excelHtml="";
		String tableName="";
		list = zhfzServer.exportExcel_jh(jh, lx);
		excelHtml="<tr><td>计划状态</td><td>上报年份</td><td>计划开工时间</td><td>计划完工时间</td><td>管养单位</td><td>行政区划名称</td><td>路线编码</td><td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>建设规模</td><td>批复总投资</td></tr>";
		sheetb.setTableName("灾害防治项目");
		sheetb.setHeader(excelHtml);
		sheetb.setSheetName("灾害");
		tableName="灾害防治项目";//excel 文件的名字
		sheetb.setColnum((short)12);
		sheetb.setList(list);
		sheetb.setFooter(null);
		sheetBeans.add(sheetb);
		String stylefileName="module.xls";
		//导出excel
		ee.initStyle(ee.workbook, stylefileName);
		HttpServletResponse response= getresponse();
		ee.makeExcel(tableName, sheetBeans, response);
	}
	/**
	 * 导入灾害计划
	 */
	public void importZhfz_jh(){
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
				dataMapArray = ExcelReader.readExcelContent(4,23,fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			//将数据插入到数据库
			boolean b=zhfzServer.importZhfz_jh(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void queryZhfzList(){
		try {
			lx.setGydwbm(gydwOrxzqhBm(lx.getGydwbm(),"gydwbm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			List<Plan_zhfz> list = zhfzServer.queryZhfzList(page, rows, jh, lx);
			System.out.println("个数："+list.size());
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			jsonMap.put("rows", zhfzServer.queryZhfzList(page, rows, jh, lx));
			jsonMap.put("total", zhfzServer.queryZhfzCount(jh, lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryZhfaById(){
		try {
			JsonUtils.write(zhfzServer.queryZhfzById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 方法弃用
	 */
	public void queryZhfaNfs(){
		try {
			JsonUtils.write(zhfzServer.queryZhfaNfs(),getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropZhfzById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("edit", new Boolean(zhfzServer.updateLrztBySckid(jh.getId())).toString());
			result.put("drop", new Boolean(zhfzServer.dropZhfzById(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editZhfzById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("jh", new Boolean((zhfzServer.editZhfzById(jh)>0)).toString());
			result.put("sc", new Boolean(zhfzServer.editZhfzSckBysckid(sc)).toString());
			JsonUtils.write(result, getresponse().getWriter());
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editZhfzStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(zhfzServer.editZhfzStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void uploadZhfzFile() throws Exception{
		FileInputStream fs=null;
		byte[] data;
		try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("utf-8"); 		
				if((uploadGk!=null)){
						fs=new FileInputStream(this.uploadGk);
						data=new byte[(int) this.uploadGk.length()];
						fs.read(data);
					   jh.setGkbgmc(uploadGkFileName);
					   jh.setGkbgdata(data);
					   if(zhfzServer.updateGkbg(jh))
						   response.getWriter().print(uploadGkFileName+"导入成功");
					   else response.getWriter().print(uploadGkFileName+"导入失败");
				}else{
					fs=new FileInputStream(this.uploadSjt);
					data=new byte[(int) this.uploadSjt.length()];
					fs.read(data);
					jh.setSjsgtmc(uploadSjtFileName);
					jh.setSjsgtdata(data);
					if(zhfzServer.updateSjsgt(jh))
						response.getWriter().print(uploadSjtFileName+"导入成功");
					   else response.getWriter().print(uploadSjtFileName+"导入失败");
				}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			fs.close();
		}
	}
	public void downZhfzFile(){
        try {
        	Plan_zhfz zhfz =zhfzServer.queryZhfzFjById(jh.getId());
        	HttpServletResponse response = getresponse();
        	response.setContentType("application/x-download"); 
        	if("gkbg".equals(jh.getGkbgmc())){
        		OutputStream output = response.getOutputStream();
        		response.addHeader("Content-Disposition", "attachment;filename="+new String(zhfz.getGkbgmc().getBytes("gb2312"),"ISO-8859-1"));
        		byte[]  buffer= zhfz.getGkbgdata();
                output.write(buffer);
                output.flush();
                output.close();
        	}else{
        		OutputStream output = response.getOutputStream();
        		response.addHeader("Content-Disposition", "attachment;filename="+new String(zhfz.getSjsgtmc().getBytes("gb2312"),"ISO-8859-1"));
        		byte[]  buffer= zhfz.getSjsgtdata();
                output.write(buffer);
                output.flush();
                output.close();
        	}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void exportZhfzZjxdExcel(){
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
		//设置列与字段对应7
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
		//此处遍历查询资金下达模块的所有项目
		lx.setGydwbm(gydwOrxzqhBm(lx.getGydwbm(),"gydwbm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
		for (Plan_zhfz item : zhfzServer.queryZhfzList(jh, lx)) {
			Plan_zjxd zjxd=new Plan_zjxd();
			String strLx=item.getJckzhfz().getLxmc()+"-"+
					item.getJckzhfz().getLxbm()+"("+
					item.getJckzhfz().getQdzh()+"-"+
					item.getJckzhfz().getZdzh()+")";
			zjxd.setLxxx(strLx);
			zjxd.setPfztz(item.getPfztz());
			zjxd.setXmid(item.getId());
			zjxd.setTbdw(gydwmc);
			excelData.add(zjxd);
		}
		ExcelEntity excel=new ExcelEntity("灾害防治",title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, "灾害防治-资金下达", getresponse());
	}
	/**
	 * 管养单位或行政区划代码处理
	 * @param bh
	 * @param name
	 * @return
	 */
	public String gydwOrxzqhBm(String bh,String name){
		String result=null;
		if(bh!=null){
			if(bh.indexOf(",")==-1){
				int i=0;
				if(bh.matches("^[0-9]*[1-9]00$")){
					i=2;
				}else if(bh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				bh=bh.substring(0,bh.length()-i);
			}
			result= bh.indexOf(",")==-1 ? " lx."+name+" like '%"+bh+"%'": "lx."+name+" in ("+bh+")";
		}
		return result;
	}
	/**
	 * 资金追加修改计划金额
	 * @throws Exception 
	 */
	public void editZhZj() throws Exception {
		try {
			String Strresult="false";
			jh.setPfztz(new Double(new Double(jh.getPfztz()).doubleValue()+new Double(zjzj.getZtz()).doubleValue()).toString());
			jh.setJhsybzje(new Double(new Double(jh.getJhsybzje()).doubleValue()+new Double(zjzj.getBbzje()).doubleValue()).toString());
			jh.setJhsydfzcje(new Double(new Double(jh.getJhsydfzcje().equals("")?"0":jh.getJhsydfzcje()).doubleValue()-new Double(zjzj.getStz()).doubleValue()).toString());
			if(zhfzServer.editZjById(jh) && zjxdServer.insertZjzj(zjzj)){
				Strresult="true";
			}
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", Strresult);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	//set get
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
	public Plan_zhfzServer getZhfzServer() {
		return zhfzServer;
	}
	public void setZhfzServer(Plan_zhfzServer zhfzServer) {
		this.zhfzServer = zhfzServer;
	}
	public Plan_zhfz getJh() {
		return jh;
	}
	public void setJh(Plan_zhfz jh) {
		this.jh = jh;
	}
	public Jckzhfz getLx() {
		return lx;
	}
	public void setLx(Jckzhfz lx) {
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
	public Sckzhfz getSc() {
		return sc;
	}
	public void setSc(Sckzhfz sc) {
		this.sc = sc;
	}
	
}
