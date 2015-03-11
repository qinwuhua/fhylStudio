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
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_wqgzController extends BaseActionSupport {
	private int page=1;
	private int rows=10;
	@Resource(name = "plan_wqgzServerImpl")
	private Plan_wqgzServer wqgzServer;
	private Plan_wqgz jh;
	private Jckwqgz lx;
	private String fileuploadFileName;
	private File fileupload;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	
	public void editWqgzStatusBatch(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			List<Plan_wqgz> splist = wqgzServer.queryWqgzByStatus(jh,lx);
			for (Plan_wqgz item : splist) {
				System.out.println(item.getId());
				item.setJh_sbthcd(""+(Integer.parseInt(item.getJh_sbthcd())+2));
				item.setSpzt("1");
				item.setSpsj(new Date());
				item.setSpbmdm(lx.getXzqhdm());//这里行政区划代码保存的是管养单位编码
			}
			result.put("result", new Boolean(wqgzServer.updateStatusBatch(splist)).toString());
			System.out.println("结果："+result.get("result"));
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void querySumWqgz(){
		try {
			JsonUtils.write(wqgzServer.querySumWqgz(jh,lx), getresponse().getWriter());
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
	public void exportExcel_jh_wqgz(){
		System.out.println("******************");
		List<SjbbMessage> list = new ArrayList<SjbbMessage>();
		ExportExcel_new ee = new ExportExcel_new();
		List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
		SheetBean sheetb = new SheetBean();
		String excelHtml="";
		String tableName="";
		list = wqgzServer.exportExcel_jh(jh, lx);
		excelHtml="<tr><td>计划状态</td><td>上报年份</td><td>计划开工时间</td><td>计划完工时间</td><td>管养单位</td><td>行政区划名称</td><td>路线编码</td><td>路线名称</td><td>桥梁编码</td><td>桥梁名称</td><td>批复总投资</td></tr>";
		sheetb.setTableName("危桥改造项目");
		sheetb.setHeader(excelHtml);
		sheetb.setSheetName("危桥");
		tableName="危桥改造项目";//excel 文件的名字
		sheetb.setColnum((short)11);
		sheetb.setList(list);
		sheetb.setFooter(null);
		sheetBeans.add(sheetb);
		String stylefileName="module.xls";
		//导出excel
		ee.initStyle(ee.workbook, stylefileName);
		HttpServletResponse response= getresponse();
		ee.makeExcel(tableName, sheetBeans, response);
	}
	public void importWqgz_jh(){
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
			System.out.println(data);
			//将数据插入到数据库
			boolean b=wqgzServer.importWqgz_jh(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void queryWqgzNfs(){
		try {
			JsonUtils.write(wqgzServer.queryWqgzNfs(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryWqgzList(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("total", wqgzServer.queryWqgzCount(jh, lx));
		jsonMap.put("rows", wqgzServer.queryWqgzList(page, rows, jh, lx));
		try {
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryWqgzById(){
		try {
			JsonUtils.write(wqgzServer.queryWqgzById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropWqgzById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			System.out.println("ID："+jh.getId()+" 审查ID："+jh.getSckid());
			result.put("drop", new Boolean(wqgzServer.dropWqgzById(jh.getId())).toString());
			result.put("edit", new Boolean(wqgzServer.updateLrztBySckid(jh.getSckid())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editWqgzById(){
		try {
			JsonUtils.write(wqgzServer.editWqgzById(jh), getresponse().getWriter());
			wqgzServer.editWqgzSckxx(jh);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editWqgzStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(wqgzServer.editWqgzStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void uploadWqgzFile() throws Exception{
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
					   if(wqgzServer.updateGkbg(jh))
						   response.getWriter().print(uploadGkFileName+"导入成功");
					   else response.getWriter().print(uploadGkFileName+"导入失败");
				}else{
					fs=new FileInputStream(this.uploadSjt);
					data=new byte[(int) this.uploadSjt.length()];
					fs.read(data);
					jh.setSjsgtmc(uploadSjtFileName);
					jh.setSjsgtdata(data);
					if(wqgzServer.updateSjsgt(jh))
						response.getWriter().print(uploadSjtFileName+"导入成功");
					   else response.getWriter().print(uploadSjtFileName+"导入失败");
				}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			fs.close();
		}
	}
	public void downWqgzFile(){
        try {
        	Plan_wqgz wqgz = wqgzServer.queryWqgzFjById(jh.getId());
        	HttpServletResponse response = getresponse();
        	response.setContentType("application/x-download"); 
        	if("gkbg".equals(jh.getGkbgmc())){
        		OutputStream out = response.getOutputStream();
        		response.addHeader("Content-Disposition", "attachment;filename="+new String(wqgz.getGkbgmc().getBytes("GBK"),"ISO-8859-1"));
        		byte[]  buffer= wqgz.getGkbgdata();
                out.write(buffer);
                out.flush();
                out.close();
        	}else{
        		OutputStream out= response.getOutputStream();
        		response.addHeader("Content-Disposition", "attachment;filename="+new String(wqgz.getSjsgtmc().getBytes("GBK"),"ISO-8859-1"));
        		byte[]  buffer= wqgz.getSjsgtdata();
                out.write(buffer);
                out.flush();
                out.close();
        	}
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
	
}
