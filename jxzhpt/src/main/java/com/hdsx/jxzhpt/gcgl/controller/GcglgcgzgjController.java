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
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglgcgzgjServer;
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
public class GcglgcgzgjController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglgcgzgjServerImpl")
	private GcglgcgzgjServer gcglgcgzgjServer;
	
	private Gcglgcgzgj gcglgcgzgj = new Gcglgcgzgj();
	private String jhid;
	private String fileuploadFileName;
	private File fileupload;
	private String type;
	private String gydw;
	private String kgzt;
	private String lxmc;
	
	
	public GcglgcgzgjServer getGcglgcgzgjServer() {
		return gcglgcgzgjServer;
	}
	public void setGcglgcgzgjServer(GcglgcgzgjServer gcglgcgzgjServer) {
		this.gcglgcgzgjServer = gcglgcgzgjServer;
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

	public Gcglgcgzgj getGcglgcgzgj() {
		return gcglgcgzgj;
	}
	public void setGcglgcgzgj(Gcglgcgzgj gcglgcgzgj) {
		this.gcglgcgzgj = gcglgcgzgj;
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
	public void insertgcgzgjYb(){
		Boolean bl=gcglgcgzgjServer.insertgcgzgjYb(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectgcgzgjYbByJhid(){
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		int count=gcglgcgzgjServer.selectgcgzgjYbByJhidCount(gcglgcgzgj);
		List<Gcglgcgzgj> list=gcglgcgzgjServer.selectgcgzgjYbByJhid(gcglgcgzgj);
		EasyUIPage<Gcglgcgzgj> e=new EasyUIPage<Gcglgcgzgj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//修改月报
	public void updategcgzgjYb(){
		Boolean bl=gcglgcgzgjServer.updategcgzgjYb(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//删除月报
	public void deletegcgzgjYb(){
		Boolean bl=gcglgcgzgjServer.deletegcgzgjYb(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//审核月报
	public void shgcgzgjYb(){
		Boolean bl=gcglgcgzgjServer.shgcgzgjYb(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//添加车购税
	public void insertGcgzgjCgs(){
		Boolean bl=gcglgcgzgjServer.insertGcgzgjCgs(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询cgs
	public void selectGcgzgjCgsList(){
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		int count=gcglgcgzgjServer.selectGcgzgjCgsListCount(gcglgcgzgj);
		List<Gcglgcgzgj> list=gcglgcgzgjServer.selectGcgzgjCgsList(gcglgcgzgj);
		EasyUIPage<Gcglgcgzgj> e=new EasyUIPage<Gcglgcgzgj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//修改cgs
	public void updateGcgzgjCgs(){
		Boolean bl=gcglgcgzgjServer.updateGcgzgjCgs(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deleteGcgzgjCgs(){
		Boolean bl=gcglgcgzgjServer.deleteGcgzgjCgs(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	//
	
	public void uploadGcgzgjFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		String jhid1=jhid;
		String type1=type;
		gcglgcgzgj.setJhid(jhid);
		gcglgcgzgj.setTiaojian(type);
		Gcglgcgzgj gcglgcgzgj1=gcglgcgzgjServer.downWqgzFile(gcglgcgzgj);
		System.out.println(gcglgcgzgj1);
		if(gcglgcgzgj1!=null)
		if(gcglgcgzgj1.getTiaojian()!=""||gcglgcgzgj1.getTiaojian()!=null){
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
		
		gcglgcgzgj.setTiaojian(tiaojian);
		gcglgcgzgj.setJhid(jhid1);
		
		boolean bl = false;
		if("sgxkwj".equals(type1))
			bl=gcglgcgzgjServer.uploadWqgzFilesgxk(gcglgcgzgj);
		if("jgtcwj".equals(type1))
			bl=gcglgcgzgjServer.uploadWqgzFilejgtc(gcglgcgzgj);
		if("jgyswj".equals(type1))
			bl=gcglgcgzgjServer.uploadWqgzFilejgys(gcglgcgzgj);
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
	public void downGcgzgjFile() throws IOException{
		HttpServletResponse response = getresponse();
		OutputStream out = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("octets/stream");
		gcglgcgzgj.setJhid(jhid);
		gcglgcgzgj.setTiaojian(type);
		Gcglgcgzgj gcglgcgzgj1=gcglgcgzgjServer.downWqgzFile(gcglgcgzgj);
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglgcgzgj1.getTiaojian();
		
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.substring(14, filename.length()).getBytes("gb2312"), "ISO-8859-1"));
		File file=new File(realPath+"upload\\"+gcglgcgzgj1.getTiaojian());
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
	public void insertGcgzgjkg(){
		Boolean bl=gcglgcgzgjServer.insertWqgzkg(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertGcgzgjwg(){
		Boolean bl=gcglgcgzgjServer.insertWqgzwg(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertGcgzgjwwg(){
		Boolean bl=gcglgcgzgjServer.insertWqgzwwg(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询jihua
	public void selectGcgzgjjhList(){
		Gcglgcgzgj gcglgcgzgj=new Gcglgcgzgj();
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		gcglgcgzgj.setGydw(gydw);
		gcglgcgzgj.setKgzt(kgzt);
		gcglgcgzgj.setLxmc(lxmc);
		int count=gcglgcgzgjServer.selectWqgzjhListCount(gcglgcgzgj);
		List<Gcglgcgzgj> list=gcglgcgzgjServer.selectWqgzjhList(gcglgcgzgj);
		EasyUIPage<Gcglgcgzgj> e=new EasyUIPage<Gcglgcgzgj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}		
	public void selectGcgzgjjhFile(){
		gcglgcgzgj.setJhid(jhid);
		Gcglgcgzgj g= gcglgcgzgjServer.selectWqgzjhFile(gcglgcgzgj);
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
	public void deleteGcgzgjFile(){
		
		gcglgcgzgj.setJhid(jhid);
		gcglgcgzgj.setTiaojian(type);
		Gcglgcgzgj gcglgcgzgj1=gcglgcgzgjServer.downWqgzFile(gcglgcgzgj);
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglgcgzgj1.getTiaojian();
		gcglgcgzgj.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type))
			bl=gcglgcgzgjServer.uploadWqgzFilesgxk(gcglgcgzgj);
		if("jgtcwj".equals(type))
			bl=gcglgcgzgjServer.uploadWqgzFilejgtc(gcglgcgzgj);
		if("jgyswj".equals(type))
			bl=gcglgcgzgjServer.uploadWqgzFilejgys(gcglgcgzgj);
		if(bl){
			File file=new File(realPath+"upload\\"+filename);
			file.delete();
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
}
