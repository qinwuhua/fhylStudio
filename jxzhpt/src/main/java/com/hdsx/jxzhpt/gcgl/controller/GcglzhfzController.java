package com.hdsx.jxzhpt.gcgl.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
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
public class GcglzhfzController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglzhfzServerImpl")
	private GcglzhfzServer gcglzhfzServer;
	
	private Gcglzhfz gcglzhfz = new Gcglzhfz();
	private String jhid;
	
	private String fileuploadFileName;
	private File fileupload;
	private String type;
	private String gydw;
	private String kgzt;
	private String lxmc;
	
	
	public GcglzhfzServer getGcglzhfzServer() {
		return gcglzhfzServer;
	}
	public void setGcglzhfzServer(GcglzhfzServer gcglzhfzServer) {
		this.gcglzhfzServer = gcglzhfzServer;
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
	public String getKgzt() {
		return kgzt;
	}
	public void setKgzt(String kgzt) {
		this.kgzt = kgzt;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	public Gcglzhfz getGcglzhfz() {
		return gcglzhfz;
	}
	public void setGcglzhfz(Gcglzhfz gcglzhfz) {
		this.gcglzhfz = gcglzhfz;
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
	//添加月报
	public void insertZhfzYb(){
		Boolean bl=gcglzhfzServer.insertZhfzYb(gcglzhfz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectZhfzYbByJhid(){
		Gcglzhfz gcglzhfz=new Gcglzhfz();
		gcglzhfz.setPage(page);
		gcglzhfz.setRows(rows);
		gcglzhfz.setJhid(jhid);
		int count=gcglzhfzServer.selectZhfzYbByJhidCount(gcglzhfz);
		List<Gcglzhfz> list=gcglzhfzServer.selectZhfzYbByJhid(gcglzhfz);
		EasyUIPage<Gcglzhfz> e=new EasyUIPage<Gcglzhfz>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
		//修改月报
		public void updateZhfzYb(){
			Boolean bl=gcglzhfzServer.updateZhfzYb(gcglzhfz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deleteZhfzYb(){
			Boolean bl=gcglzhfzServer.deleteZhfzYb(gcglzhfz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//审核月报
		public void shZhfzYb(){
			Boolean bl=gcglzhfzServer.shZhfzYb(gcglzhfz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}

	// 添加车购税
	public void insertZhfzCgs() {
		Boolean bl = gcglzhfzServer.insertZhfzCgs(gcglzhfz);
		if (bl) {
			ResponseUtils.write(getresponse(), "true");
		} else {
			ResponseUtils.write(getresponse(), "false");
		}
	}

	// 查询cgs
	public void selectZhfzCgsList() {
		gcglzhfz.setPage(page);
		gcglzhfz.setRows(rows);
		gcglzhfz.setJhid(jhid);
		int count = gcglzhfzServer.selectZhfzCgsListCount(gcglzhfz);
		List<Gcglabgc> list = gcglzhfzServer.selectZhfzCgsList(gcglzhfz);
		EasyUIPage<Gcglabgc> e = new EasyUIPage<Gcglabgc>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	// 修改cgs
	public void updateZhfzCgs() {
		Boolean bl = gcglzhfzServer.updateZhfzCgs(gcglzhfz);
		if (bl) {
			ResponseUtils.write(getresponse(), "true");
		} else {
			ResponseUtils.write(getresponse(), "false");
		}
	}

	public void deleteZhfzCgs() {
		Boolean bl = gcglzhfzServer.deleteZhfzCgs(gcglzhfz);
		if (bl) {
			ResponseUtils.write(getresponse(), "true");
		} else {
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//
	
	public void uploadZhfzFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		String jhid1=jhid;
		String type1=type;
		gcglzhfz.setJhid(jhid);
		gcglzhfz.setTiaojian(type);
		Gcglzhfz gcglzhfz1=gcglzhfzServer.downWqgzFile(gcglzhfz);
		System.out.println(gcglzhfz1);
		if(gcglzhfz1!=null)
		if(gcglzhfz1.getTiaojian()!=""||gcglzhfz1.getTiaojian()!=null){
			try {
				response.getWriter().print("附件已存在，导入失败");
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		File dir = new File(realPath+"upload\\");
		fileuploadFileName=new Date().getTime()+"-"+fileuploadFileName;
		if (!dir.exists())
			dir.mkdir();//创建文件夹

		try {
			FileUtils.copyFile(fileupload, new File(realPath+"upload\\"+fileuploadFileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String tiaojian=fileuploadFileName;
		
		gcglzhfz.setTiaojian(tiaojian);
		gcglzhfz.setJhid(jhid1);
		
		boolean bl = false;
		if("sgxkwj".equals(type1))
			bl=gcglzhfzServer.uploadWqgzFilesgxk(gcglzhfz);
		if("jgtcwj".equals(type1))
			bl=gcglzhfzServer.uploadWqgzFilejgtc(gcglzhfz);
		if("jgyswj".equals(type1))
			bl=gcglzhfzServer.uploadWqgzFilejgys(gcglzhfz);
		try {
			if(bl)
			response.getWriter().print(fileuploadFileName.substring(14, fileuploadFileName.length())+"导入成功");
			else
			response.getWriter().print(fileuploadFileName.substring(14, fileuploadFileName.length())+"导入失败");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void downZhfzFile() throws IOException{
		HttpServletResponse response = getresponse();
		OutputStream out = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("octets/stream");
		gcglzhfz.setJhid(jhid);
		gcglzhfz.setTiaojian(type);
		Gcglzhfz gcglzhfz1=gcglzhfzServer.downWqgzFile(gcglzhfz);
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglzhfz1.getTiaojian();
		
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.substring(14, filename.length()).getBytes("gb2312"), "ISO-8859-1"));
		File file=new File(realPath+"upload\\"+gcglzhfz1.getTiaojian());
		FileInputStream fis= new FileInputStream(file);
		//byte [] arr = new byte[1024*10];
		int i=0;
		while((i=fis.read())!=-1){
			out.write(i);
		}
		fis.close();
		out.flush();
		out.close();
	}
	public void insertZhfzkg(){
		Boolean bl=gcglzhfzServer.insertWqgzkg(gcglzhfz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertZhfzwg(){
		Boolean bl=gcglzhfzServer.insertWqgzwg(gcglzhfz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertZhfzwwg(){
		Boolean bl=gcglzhfzServer.insertWqgzwwg(gcglzhfz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询jihua
	public void selectZhfzjhList(){
		Gcglzhfz gcglzhfz=new Gcglzhfz();
		gcglzhfz.setPage(page);
		gcglzhfz.setRows(rows);
		gcglzhfz.setJhid(jhid);
		gcglzhfz.setGydw(gydw);
		gcglzhfz.setKgzt(kgzt);
		gcglzhfz.setLxmc(lxmc);
		int count=gcglzhfzServer.selectWqgzjhListCount(gcglzhfz);
		List<Gcglzhfz> list=gcglzhfzServer.selectWqgzjhList(gcglzhfz);
		EasyUIPage<Gcglzhfz> e=new EasyUIPage<Gcglzhfz>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}		
	public void selectZhfzjhFile(){
		gcglzhfz.setJhid(jhid);
		Gcglzhfz g= gcglzhfzServer.selectWqgzjhFile(gcglzhfz);
		try {
			JsonUtils.write(g, getresponse().getWriter());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deleteZhfzFile(){
		
		gcglzhfz.setJhid(jhid);
		gcglzhfz.setTiaojian(type);
		Gcglzhfz gcglzhfz1=gcglzhfzServer.downWqgzFile(gcglzhfz);
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglzhfz1.getTiaojian();
		gcglzhfz.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type))
			bl=gcglzhfzServer.uploadWqgzFilesgxk(gcglzhfz);
		if("jgtcwj".equals(type))
			bl=gcglzhfzServer.uploadWqgzFilejgtc(gcglzhfz);
		if("jgyswj".equals(type))
			bl=gcglzhfzServer.uploadWqgzFilejgys(gcglzhfz);
		if(bl){
			File file=new File(realPath+"upload\\"+filename);
			file.delete();
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	
}
