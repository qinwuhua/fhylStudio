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
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzsj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglgcgzsjServer;
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
 *
 */
@Scope("prototype")
@Controller
public class GcglgcgzsjController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglgcgzsjServerImpl")
	private GcglgcgzsjServer gcglgcgzsjServer;
	
	private Gcglgcgzsj gcglgcgzsj = new Gcglgcgzsj();
	private String jhid;
	private String fileuploadFileName;
	private File fileupload;
	private String type;
	private String gydw;
	private String kgzt;
	private String lxmc;
	
	public String getJhid() {
		return jhid;
	}
	public GcglgcgzsjServer getGcglgcgzsjServer() {
		return gcglgcgzsjServer;
	}
	public void setGcglgcgzsjServer(GcglgcgzsjServer gcglgcgzsjServer) {
		this.gcglgcgzsjServer = gcglgcgzsjServer;
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
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	
	public Gcglgcgzsj getGcglgcgzsj() {
		return gcglgcgzsj;
	}
	public void setGcglgcgzsj(Gcglgcgzsj gcglgcgzsj) {
		this.gcglgcgzsj = gcglgcgzsj;
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
	public void insertgcgzsjYb(){
		Boolean bl=gcglgcgzsjServer.insertgcgzsjYb(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectgcgzsjYbByJhid(){
		gcglgcgzsj.setPage(page);
		gcglgcgzsj.setRows(rows);
		gcglgcgzsj.setJhid(jhid);
		int count=gcglgcgzsjServer.selectgcgzsjYbByJhidCount(gcglgcgzsj);
		List<Gcglgcgzsj> list=gcglgcgzsjServer.selectgcgzsjYbByJhid(gcglgcgzsj);
		EasyUIPage<Gcglgcgzsj> e=new EasyUIPage<Gcglgcgzsj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//修改月报
	public void updategcgzsjYb(){
		Boolean bl=gcglgcgzsjServer.updategcgzsjYb(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//删除月报
	public void deletegcgzsjYb(){
		Boolean bl=gcglgcgzsjServer.deletegcgzsjYb(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//审核月报
	public void shgcgzsjyb(){
		Boolean bl=gcglgcgzsjServer.shgcgzsjyb(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//添加车购税
	public void insertGcgzsjCgs(){
		Boolean bl=gcglgcgzsjServer.insertGcgzsjCgs(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询cgs
	public void selectGcgzsjCgsList(){
		gcglgcgzsj.setPage(page);
		gcglgcgzsj.setRows(rows);
		gcglgcgzsj.setJhid(jhid);
		int count=gcglgcgzsjServer.selectGcgzsjCgsListCount(gcglgcgzsj);
		List<Gcglgcgzsj> list=gcglgcgzsjServer.selectGcgzsjCgsList(gcglgcgzsj);
		EasyUIPage<Gcglgcgzsj> e=new EasyUIPage<Gcglgcgzsj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//修改cgs
	public void updateGcgzsjCgs(){
		Boolean bl=gcglgcgzsjServer.updateGcgzsjCgs(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deleteGcgzsjCgs(){
		Boolean bl=gcglgcgzsjServer.deleteGcgzsjCgs(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//
	
	public void uploadGcgzsjFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		String jhid1=jhid;
		String type1=type;
		gcglgcgzsj.setJhid(jhid);
		gcglgcgzsj.setTiaojian(type);
		Gcglgcgzsj gcglgcgzsj1=gcglgcgzsjServer.downWqgzFile(gcglgcgzsj);
		System.out.println(gcglgcgzsj1);
		if(gcglgcgzsj1!=null)
		if(gcglgcgzsj1.getTiaojian()!=""||gcglgcgzsj1.getTiaojian()!=null){
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
		
		gcglgcgzsj.setTiaojian(tiaojian);
		gcglgcgzsj.setJhid(jhid1);
		
		boolean bl = false;
		if("sgxkwj".equals(type1))
			bl=gcglgcgzsjServer.uploadWqgzFilesgxk(gcglgcgzsj);
		if("jgtcwj".equals(type1))
			bl=gcglgcgzsjServer.uploadWqgzFilejgtc(gcglgcgzsj);
		if("jgyswj".equals(type1))
			bl=gcglgcgzsjServer.uploadWqgzFilejgys(gcglgcgzsj);
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
	public void downGcgzsjFile() throws IOException{
		HttpServletResponse response = getresponse();
		OutputStream out = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("octets/stream");
		gcglgcgzsj.setJhid(jhid);
		gcglgcgzsj.setTiaojian(type);
		Gcglgcgzsj gcglgcgzsj1=gcglgcgzsjServer.downWqgzFile(gcglgcgzsj);
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglgcgzsj1.getTiaojian();
		
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.substring(14, filename.length()).getBytes("gb2312"), "ISO-8859-1"));
		File file=new File(realPath+"upload\\"+gcglgcgzsj1.getTiaojian());
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
	public void insertGcgzsjkg(){
		Boolean bl=gcglgcgzsjServer.insertWqgzkg(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertGcgzsjwg(){
		Boolean bl=gcglgcgzsjServer.insertWqgzwg(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertGcgzsjwwg(){
		Boolean bl=gcglgcgzsjServer.insertWqgzwwg(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询jihua
	public void selectGcgzsjjhList(){
		Gcglgcgzsj gcglgcgzsj=new Gcglgcgzsj();
		gcglgcgzsj.setPage(page);
		gcglgcgzsj.setRows(rows);
		gcglgcgzsj.setJhid(jhid);
		gcglgcgzsj.setGydw(gydw.replaceAll("0*$",""));
		gcglgcgzsj.setKgzt(kgzt);
		gcglgcgzsj.setLxmc(lxmc);
		int count=gcglgcgzsjServer.selectWqgzjhListCount(gcglgcgzsj);
		List<Gcglgcgzsj> list=gcglgcgzsjServer.selectWqgzjhList(gcglgcgzsj);
		EasyUIPage<Gcglgcgzsj> e=new EasyUIPage<Gcglgcgzsj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}		
	public void selectGcgzsjjhFile(){
		gcglgcgzsj.setJhid(jhid);
		Gcglgcgzsj g= gcglgcgzsjServer.selectWqgzjhFile(gcglgcgzsj);
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
	public void deleteGcgzsjFile(){
		
		gcglgcgzsj.setJhid(jhid);
		gcglgcgzsj.setTiaojian(type);
		Gcglgcgzsj gcglgcgzsj1=gcglgcgzsjServer.downWqgzFile(gcglgcgzsj);
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglgcgzsj1.getTiaojian();
		gcglgcgzsj.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type))
			bl=gcglgcgzsjServer.uploadWqgzFilesgxk(gcglgcgzsj);
		if("jgtcwj".equals(type))
			bl=gcglgcgzsjServer.uploadWqgzFilejgtc(gcglgcgzsj);
		if("jgyswj".equals(type))
			bl=gcglgcgzsjServer.uploadWqgzFilejgys(gcglgcgzsj);
		if(bl){
			File file=new File(realPath+"upload\\"+filename);
			file.delete();
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
}
