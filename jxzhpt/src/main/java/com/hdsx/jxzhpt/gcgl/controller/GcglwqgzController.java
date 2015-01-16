package com.hdsx.jxzhpt.gcgl.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 
 *
 */
@Scope("prototype")
@Controller
public class GcglwqgzController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	private String fileuploadFileName;
	private File fileupload;
	private String type;
	@Resource(name = "gcglwqgzServerImpl")
	private GcglwqgzServer gcglwqgzServer;
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	private Gcglwqgz gcglwqgz=new Gcglwqgz();
	private String jhid;
	
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	public Gcglwqgz getGcglwqgz() {
		return gcglwqgz;
	}
	public void setGcglwqgz(Gcglwqgz gcglwqgz) {
		this.gcglwqgz = gcglwqgz;
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
	public void insertWqgzYb(){
		System.out.println(gcglwqgz);
		Boolean bl=gcglwqgzServer.insertWqgzYb(gcglwqgz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectWqgzYbByJhid(){
		Gcglwqgz gcglwqgz=new Gcglwqgz();
		gcglwqgz.setPage(page);
		gcglwqgz.setRows(rows);
		gcglwqgz.setJhid(jhid);
		int count=gcglwqgzServer.selectWqgzYbByJhidCount(gcglwqgz);
		List<Gcglwqgz> list=gcglwqgzServer.selectWqgzYbByJhid(gcglwqgz);
		EasyUIPage<Gcglwqgz> e=new EasyUIPage<Gcglwqgz>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
		//修改月报
		public void updateWqgzYb(){
			System.out.println(gcglwqgz);
			Boolean bl=gcglwqgzServer.updateWqgzYb(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deleteWqgzYb(){
			Boolean bl=gcglwqgzServer.deleteWqgzYb(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//审核月报
		public void shWqgzYb(){
			System.out.println(gcglwqgz);
			Boolean bl=gcglwqgzServer.shwqgzyb(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//添加车购税
		public void insertWqgzCgs(){
			Boolean bl=gcglwqgzServer.insertWqgzCgs(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//查询cgs
		public void selectWqgzCgsList(){
			Gcglwqgz gcglwqgz=new Gcglwqgz();
			gcglwqgz.setPage(page);
			gcglwqgz.setRows(rows);
			gcglwqgz.setJhid(jhid);
			int count=gcglwqgzServer.selectWqgzCgsListCount(gcglwqgz);
			List<Gcglwqgz> list=gcglwqgzServer.selectWqgzCgsList(gcglwqgz);
			EasyUIPage<Gcglwqgz> e=new EasyUIPage<Gcglwqgz>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		//修改cgs
		public void updateWqgzCgs(){
			Boolean bl=gcglwqgzServer.updateWqgzCgs(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void deletewqgzCgs(){
			Boolean bl=gcglwqgzServer.deletewqgzCgs(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		
		public void uploadWqgzFile(){
			HttpServletResponse response = ServletActionContext.getResponse();
			String jhid1=jhid;
			String type1=type;
			gcglwqgz.setJhid(jhid);
			gcglwqgz.setTiaojian(type);
			Gcglwqgz gcglwqgz1=gcglwqgzServer.downWqgzFile(gcglwqgz);
			System.out.println(gcglwqgz1);
			if(gcglwqgz1!=null)
			if(gcglwqgz1.getTiaojian()!=""||gcglwqgz1.getTiaojian()!=null){
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
			
			gcglwqgz.setTiaojian(tiaojian);
			gcglwqgz.setJhid(jhid1);
			
			boolean bl = false;
			if("sgxkwj".equals(type1))
				bl=gcglwqgzServer.uploadWqgzFilesgxk(gcglwqgz);
			if("jgtcwj".equals(type1))
				bl=gcglwqgzServer.uploadWqgzFilejgtc(gcglwqgz);
			if("jgyswj".equals(type1))
				bl=gcglwqgzServer.uploadWqgzFilejgys(gcglwqgz);
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
		public void downWqgzFile() throws IOException{
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("octets/stream");
			gcglwqgz.setJhid(jhid);
			gcglwqgz.setTiaojian(type);
			Gcglwqgz gcglwqgz1=gcglwqgzServer.downWqgzFile(gcglwqgz);
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename=gcglwqgz1.getTiaojian();
			
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.substring(14, filename.length()).getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+"upload\\"+gcglwqgz1.getTiaojian());
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
		public void insertWqgzkg(){
			Boolean bl=gcglwqgzServer.insertWqgzkg(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void insertWqgzwg(){
			Boolean bl=gcglwqgzServer.insertWqgzwg(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void insertWqgzwwg(){
			Boolean bl=gcglwqgzServer.insertWqgzwwg(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//查询jihua
		public void selectWqgzjhList(){
			Gcglwqgz gcglwqgz=new Gcglwqgz();
			gcglwqgz.setPage(page);
			gcglwqgz.setRows(rows);
			gcglwqgz.setJhid(jhid);
			int count=gcglwqgzServer.selectWqgzjhListCount(gcglwqgz);
			List<Gcglwqgz> list=gcglwqgzServer.selectWqgzjhList(gcglwqgz);
			EasyUIPage<Gcglwqgz> e=new EasyUIPage<Gcglwqgz>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}		
	public void selectWqgzjhFile(){
		gcglwqgz.setJhid(jhid);
		Gcglwqgz g= gcglwqgzServer.selectWqgzjhFile(gcglwqgz);
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
	public void deleteWqgzFile(){
		
		gcglwqgz.setJhid(jhid);
		gcglwqgz.setTiaojian(type);
		Gcglwqgz gcglwqgz1=gcglwqgzServer.downWqgzFile(gcglwqgz);
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglwqgz1.getTiaojian();
		gcglwqgz.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type))
			bl=gcglwqgzServer.uploadWqgzFilesgxk(gcglwqgz);
		if("jgtcwj".equals(type))
			bl=gcglwqgzServer.uploadWqgzFilejgtc(gcglwqgz);
		if("jgyswj".equals(type))
			bl=gcglwqgzServer.uploadWqgzFilejgys(gcglwqgz);
		if(bl){
			File file=new File(realPath+"upload\\"+filename);
			file.delete();
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
}
