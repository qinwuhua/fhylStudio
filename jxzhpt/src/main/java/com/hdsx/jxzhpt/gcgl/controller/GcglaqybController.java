package com.hdsx.jxzhpt.gcgl.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

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


/**
 * 系统管理Controller层
 * @author xunq
 *
 */
@Scope("prototype")
@Controller
public class GcglaqybController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	
	private File upload; //获取client的文件
	private String uploadFileName; // 获取文件名
	
	@Resource(name = "gcglaqybServerImpl")
	private GcglaqybServer gcglaqybServer;
	
	private Gcglaqyb gcglaqyb = new Gcglaqyb();
	private String jhid;
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
	public GcglaqybServer getGcglaqybServer() {
		return gcglaqybServer;
	}
	public void setGcglaqybServer(GcglaqybServer gcglaqybServer) {
		this.gcglaqybServer = gcglaqybServer;
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
	
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public void addAqyb(){
		System.out.println("方法开始");
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		System.out.println("路径："+realPath);
		File dir = new File(realPath+"upload\\");
//		if (!dir.exists())
//			dir.mkdir();//创建文件夹
//		try {
//			System.out.println("11111");
//			FileUtils.copyFile(upload, new File(realPath+"upload\\"+uploadFileName));
//			System.out.println("22222");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		System.out.println(uploadFileName+"*------------------------------*");
//		ResponseUtils.write(getresponse(), "true");
	}
	
		
}
