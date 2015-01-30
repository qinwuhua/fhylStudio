package com.hdsx.jxzhpt.gcgl.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglaqybServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.webutil.struts.BaseActionSupport;



@Scope("prototype")
@Controller
public class GcglaqybController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	
	private String fileuploadFileName;
	private File fileupload;
	private String sendingunits;
	private String filename;
	private String wenhao;
	private String reportmonth;
	private String remark;
	private String gydw;
	private String gydw1;
	private String wjmc;
	private String ddlyear;
	private String ddlmonth;
	private String type;
	
	@Resource(name = "gcglaqybServerImpl")
	private GcglaqybServer gcglaqybServer;
	
	private Gcglaqyb gcglaqyb = new Gcglaqyb();
	private String jhid;
	
	public String getGydw1() {
		return gydw1;
	}
	public void setGydw1(String gydw1) {
		this.gydw1 = gydw1;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getWjmc() {
		return wjmc;
	}
	public void setWjmc(String wjmc) {
		this.wjmc = wjmc;
	}
	public String getDdlyear() {
		return ddlyear;
	}
	public void setDdlyear(String ddlyear) {
		this.ddlyear = ddlyear;
	}
	public String getDdlmonth() {
		return ddlmonth;
	}
	public void setDdlmonth(String ddlmonth) {
		this.ddlmonth = ddlmonth;
	}
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
	public Gcglaqyb getGcglaqyb() {
		return gcglaqyb;
	}
	public void setGcglaqyb(Gcglaqyb gcglaqyb) {
		this.gcglaqyb = gcglaqyb;
	}
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
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
	public String getSendingunits() {
		return sendingunits;
	}
	public void setSendingunits(String sendingunits) {
		this.sendingunits = sendingunits;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getWenhao() {
		return wenhao;
	}
	public void setWenhao(String wenhao) {
		this.wenhao = wenhao;
	}
	public String getReportmonth() {
		return reportmonth;
	}
	public void setReportmonth(String reportmonth) {
		this.reportmonth = reportmonth;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void uploadAqybFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		File dir = new File(realPath+"upload\\");
		fileuploadFileName=new Date().getTime()+"-"+fileuploadFileName;
		if (!dir.exists())
			dir.mkdir();//创建文件夹

		try {
			FileUtils.copyFile(fileupload, new File(realPath+"upload\\"+fileuploadFileName));
			response.getWriter().print(fileuploadFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public void insertAqybb(){
		gcglaqyb.setUploadtime(new Date());
		Boolean bl=gcglaqybServer.insertAqybb(gcglaqyb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectaqyblist(){
		gcglaqyb.setReportmonth(ddlyear+"-"+ddlmonth);
		gcglaqyb.setUploadepartment(gydw);
		gcglaqyb.setFilename(wjmc);
		gcglaqyb.setRows(rows);
		gcglaqyb.setPage(page);
		if("全部".equals(type)){}
		if("上传".equals(type)){}
		if("接收".equals(type)){
			gcglaqyb.setSendingunits(gydw1);
		}
		int count=gcglaqybServer.selectaqyblistCount(gcglaqyb);
		List<Gcglaqyb> list=gcglaqybServer.selectaqyblist(gcglaqyb);
		EasyUIPage<Gcglaqyb> e=new EasyUIPage<Gcglaqyb>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
}
