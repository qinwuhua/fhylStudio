package com.hdsx.jxzhpt.jhgl.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_abgcController extends BaseActionSupport{
	private int page=1;
	private int rows=10;
	@Resource(name = "plan_abgcServerImpl")
	private Plan_abgcServer abgcServer;
	@Resource(name = "plan_wqgzServerImpl")
	private Plan_wqgzServer wqgzServer;
	@Resource(name = "plan_zhfzServerImpl")
	private Plan_zhfzServer zhfzServer;
	private Plan_abgc jh;
	private Jckabgc lx;
	private Plan_upload uploads;
	private String flag;//标记是哪个模块
	private String fileuploadFileName;
	private File fileupload;
	private Bzbz bzbz;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	
	public void querySumAbgc(){
		try {
			JsonUtils.write(abgcServer.querySumAbgc(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void importAbgc_jh(){
		System.out.println("进入数据处理");
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
				dataMapArray = ExcelReader.readExcelContent(4,24,fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			//将数据插入到数据库
			boolean b=abgcServer.importAbgc_jh(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * excel导出
	 * 通过flag来区分导出哪个excel
	 * 导出的excel将要设置sheet名，数据，表头，以及excel文件名
	 */
	public void exportExcel_jh_abgc(){
		List<SjbbMessage> list = new ArrayList<SjbbMessage>();
		ExportExcel_new ee = new ExportExcel_new();
		List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
		SheetBean sheetb = new SheetBean();
		String excelHtml="";
		String tableName="";
		list = abgcServer.exportExcel_jh(jh, lx);
		excelHtml="<tr><td>计划状态</td><td>上报年份</td><td>计划开工时间</td><td>计划完工时间</td><td>管养单位</td><td>行政区划名称</td><td>路线编码</td><td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>隐患里程</td><td>批复总投资</td></tr>";
		sheetb.setTableName("安保工程项目");
		sheetb.setHeader(excelHtml);
		sheetb.setSheetName("安保");
		tableName="安保工程项目";//excel 文件的名字
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
	 * 查询安保工程的列表信息
	 */
	public void queryAbgcList(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("total", abgcServer.queryAbgcCount(jh, lx));
		jsonMap.put("rows",abgcServer.queryAbgcList(page, rows, jh, lx));
		try {
			JsonUtils.write(jsonMap, getresponse().getWriter());
			String regex="^[0-9]*.[0-9]{3}$";
			boolean result="123.111".matches(regex);
			System.out.println("检验结果："+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询安保工程的年份列表
	 */
	public void queryAbgcNfs(){
		try {
			JsonUtils.write(abgcServer.queryAbgcNfs(), getresponse().getWriter()) ;
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据ID查询安保工程的相信信息
	 */
	public void queryAbgcById(){
		try {
			JsonUtils.write(abgcServer.queryAbgcById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据ID删除安保工程计划
	 */
	public void dropAbgcById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(abgcServer.dropAbgcById(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改安保工程的详细信息
	 */
	public void editAbgcById(){
		try {
			JsonUtils.write(abgcServer.editAbgcById(jh), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改安保工程的上报和审批状态
	 */
	public void editAbgcStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(abgcServer.editStatus(jh)).toString());
			JsonUtils.write(result,getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateLrztBySckid(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(abgcServer.updateLrztBySckid(jh.getSckid())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void lwBzbz(){
		try {
			JsonUtils.write(abgcServer.lwBzbz(bzbz), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void uploadAbgcFile() throws Exception{
		FileInputStream fs=null;
		byte[] data;
		try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("utf-8"); 		
				if((uploadGk!=null)){
						fs=new FileInputStream(this.uploadGk);
						data=new byte[(int) this.uploadGk.length()];
						fs.read(data);
					   uploads.setFilename(uploadGkFileName);
					   uploads.setFiledata(data);
					   if(abgcServer.updateGkbg(uploads))
						   response.getWriter().print(uploadGkFileName+"导入成功");
					   else response.getWriter().print(uploadGkFileName+"导入失败");
				}else{
					fs=new FileInputStream(this.uploadSjt);
					data=new byte[(int) this.uploadSjt.length()];
					fs.read(data);
					uploads.setFilename(uploadSjtFileName);
					uploads.setFiledata(data);
					if(abgcServer.updateSjsgt(uploads))
						response.getWriter().print(uploadSjtFileName+"导入成功");
					   else response.getWriter().print(uploadSjtFileName+"导入失败");
				}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			fs.close();
		}
	}
	public void downAbgcFile(){
        try {
        	Plan_abgc abgc = abgcServer.queryFjById(jh.getId());
        	HttpServletResponse response = getresponse();
        	response.setContentType("application/x-download"); 
        	if("gkbg".equals(jh.getGkbgmc())){
        		OutputStream out = response.getOutputStream();
        		response.addHeader("Content-Disposition", "attachment;filename="+new String(abgc.getGkbgmc().getBytes("GBK"),"ISO-8859-1"));
        		byte[]  buffer= abgc.getGkbgdata();
                out.write(buffer);
                out.flush();
                out.close();
        	}else{
        		OutputStream out= response.getOutputStream();
        		response.addHeader("Content-Disposition", "attachment;filename="+new String(abgc.getSjsgtmc().getBytes("GBK"),"ISO-8859-1"));
        		byte[]  buffer= abgc.getSjsgtdata();
                out.write(buffer);
                out.flush();
                out.close();
        	}
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryTsdq(){
		try {
			System.out.println("特殊地区："+abgcServer.queryTsdq().size());
			JsonUtils.write(abgcServer.queryTsdq(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// get set
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
	public Plan_abgcServer getAbgcServer() {
		return abgcServer;
	}
	public void setAbgcServer(Plan_abgcServer abgcServer) {
		this.abgcServer = abgcServer;
	}
	public Plan_abgc getJh() {
		return jh;
	}
	public void setJh(Plan_abgc jh) {
		this.jh = jh;
	}
	public Jckabgc getLx() {
		return lx;
	}
	public void setLx(Jckabgc lx) {
		this.lx = lx;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
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
	public Bzbz getBzbz() {
		return bzbz;
	}
	public void setBzbz(Bzbz bzbz) {
		this.bzbz = bzbz;
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
	public Plan_upload getUploads() {
		return uploads;
	}
	public void setUploads(Plan_upload uploads) {
		this.uploads = uploads;
	}
	
}
