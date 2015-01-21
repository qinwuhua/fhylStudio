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
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
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
public class GcglabgcController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglabgcServerImpl")
	private GcglabgcServer gcglabgcServer;
	
	private Gcglabgc gcglabgc = new Gcglabgc();
	private String jhid;
	
	private String fileuploadFileName;
	private File fileupload;
	private String type;
	private String gydw;
	private String kgzt;
	private String lxmc;
	private String qlmc;
	
	
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
	public String getQlmc() {
		return qlmc;
	}
	public void setQlmc(String qlmc) {
		this.qlmc = qlmc;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	
	public Gcglabgc getGcglabgc() {
		return gcglabgc;
	}
	public void setGcglabgc(Gcglabgc gcglabgc) {
		this.gcglabgc = gcglabgc;
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
	public void insertAbgcYb(){
		System.out.println(gcglabgc);
		Boolean bl=gcglabgcServer.insertAbgcYb(gcglabgc);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectAbgcYbByJhid(){
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setPage(page);
		gcglabgc.setRows(rows);
		gcglabgc.setJhid(jhid);
		int count=gcglabgcServer.selectAbgcYbByJhidCount(gcglabgc);
		List<Gcglabgc> list=gcglabgcServer.selectAbgcYbByJhid(gcglabgc);
		EasyUIPage<Gcglabgc> e=new EasyUIPage<Gcglabgc>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
		//修改月报
		public void updateAbgcYb(){
			System.out.println(gcglabgc);
			Boolean bl=gcglabgcServer.updateAbgcYb(gcglabgc);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deleteAbgcYb(){
			Boolean bl=gcglabgcServer.deleteAbgcYb(gcglabgc);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//审核月报
		public void shAbgcYb(){
			Boolean bl=gcglabgcServer.shAbgcYb(gcglabgc);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//添加车购税
		public void insertAbgcCgs(){
			Boolean bl=gcglabgcServer.insertAbgcCgs(gcglabgc);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//查询cgs
		public void selectAbgcCgsList(){
			gcglabgc.setPage(page);
			gcglabgc.setRows(rows);
			gcglabgc.setJhid(jhid);
			int count=gcglabgcServer.selectAbgcCgsListCount(gcglabgc);
			List<Gcglabgc> list=gcglabgcServer.selectAbgcCgsList(gcglabgc);
			EasyUIPage<Gcglabgc> e=new EasyUIPage<Gcglabgc>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		//修改cgs
		public void updateAbgcCgs(){
			Boolean bl=gcglabgcServer.updateAbgcCgs(gcglabgc);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void deleteabgcCgs(){
			Boolean bl=gcglabgcServer.deleteabgcCgs(gcglabgc);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		
		public void uploadAbgcFile(){
			HttpServletResponse response = ServletActionContext.getResponse();
			String jhid1=jhid;
			String type1=type;
			gcglabgc.setJhid(jhid);
			gcglabgc.setTiaojian(type);
			Gcglabgc gcglabgc1=gcglabgcServer.downWqgzFile(gcglabgc);
			System.out.println(gcglabgc1);
			if(gcglabgc1!=null)
			if(gcglabgc1.getTiaojian()!=""||gcglabgc1.getTiaojian()!=null){
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
			
			gcglabgc.setTiaojian(tiaojian);
			gcglabgc.setJhid(jhid1);
			
			boolean bl = false;
			if("sgxkwj".equals(type1))
				bl=gcglabgcServer.uploadWqgzFilesgxk(gcglabgc);
			if("jgtcwj".equals(type1))
				bl=gcglabgcServer.uploadWqgzFilejgtc(gcglabgc);
			if("jgyswj".equals(type1))
				bl=gcglabgcServer.uploadWqgzFilejgys(gcglabgc);
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
		public void downAbgcFile() throws IOException{
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("octets/stream");
			gcglabgc.setJhid(jhid);
			gcglabgc.setTiaojian(type);
			Gcglabgc gcglabgc1=gcglabgcServer.downWqgzFile(gcglabgc);
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename=gcglabgc1.getTiaojian();
			
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.substring(14, filename.length()).getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+"upload\\"+gcglabgc1.getTiaojian());
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
		public void insertAbgckg(){
			Boolean bl=gcglabgcServer.insertWqgzkg(gcglabgc);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void insertAbgcwg(){
			Boolean bl=gcglabgcServer.insertWqgzwg(gcglabgc);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void insertAbgcwwg(){
			Boolean bl=gcglabgcServer.insertWqgzwwg(gcglabgc);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//查询jihua
		public void selectAbgcjhList(){
			Gcglabgc gcglabgc=new Gcglabgc();
			gcglabgc.setPage(page);
			gcglabgc.setRows(rows);
			gcglabgc.setJhid(jhid);
			gcglabgc.setGydw(gydw.replaceAll("0*$",""));
			gcglabgc.setKgzt(kgzt);
			gcglabgc.setLxmc(lxmc);
			int count=gcglabgcServer.selectWqgzjhListCount(gcglabgc);
			List<Gcglabgc> list=gcglabgcServer.selectWqgzjhList(gcglabgc);
			EasyUIPage<Gcglabgc> e=new EasyUIPage<Gcglabgc>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}		
	public void selectAbgcjhFile(){
		gcglabgc.setJhid(jhid);
		Gcglabgc g= gcglabgcServer.selectWqgzjhFile(gcglabgc);
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
	public void deleteAbgcFile(){
		
		gcglabgc.setJhid(jhid);
		gcglabgc.setTiaojian(type);
		Gcglabgc gcglabgc1=gcglabgcServer.downWqgzFile(gcglabgc);
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglabgc1.getTiaojian();
		gcglabgc.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type))
			bl=gcglabgcServer.uploadWqgzFilesgxk(gcglabgc);
		if("jgtcwj".equals(type))
			bl=gcglabgcServer.uploadWqgzFilejgtc(gcglabgc);
		if("jgyswj".equals(type))
			bl=gcglabgcServer.uploadWqgzFilejgys(gcglabgc);
		if(bl){
			File file=new File(realPath+"upload\\"+filename);
			file.delete();
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
}
