package com.hdsx.jxzhpt.gcgl.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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
 * @author qwh
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
	private String jgzt;
	private String yhtype;
	private Integer sfsj;
	private String ybzt;
	
	public String getYbzt() {
		return ybzt;
	}
	public void setYbzt(String ybzt) {
		this.ybzt = ybzt;
	}
	public Integer getSfsj() {
		return sfsj;
	}
	public void setSfsj(Integer sfsj) {
		this.sfsj = sfsj;
	}
	public String getJgzt() {
		return jgzt;
	}
	public void setJgzt(String jgzt) {
		this.jgzt = jgzt;
	}
	public String getYhtype() {
		return yhtype;
	}
	public void setYhtype(String yhtype) {
		this.yhtype = yhtype;
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
		if("县级".equals(yhtype)){
			gcglzhfz.setSfsj(11);
		}
		if("市级".equals(yhtype)){
			gcglzhfz.setSfsj(9);
		}
		if("省级".equals(yhtype)){
			gcglzhfz.setSfsj(7);
		}
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
		gcglzhfz.setSfsj(sfsj);
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
	//查询月报
	public void selectZhfzYbByJhid1(){
		Gcglzhfz gcglzhfz=new Gcglzhfz();
		gcglzhfz.setPage(page);
		gcglzhfz.setRows(rows);
		gcglzhfz.setJhid(jhid);
		int count=gcglzhfzServer.selectZhfzYbByJhidCount1(gcglzhfz);
		List<Gcglzhfz> list=gcglzhfzServer.selectZhfzYbByJhid1(gcglzhfz);
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
	
	public void uploadZhfzFile() throws Exception{
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
		
		String tiaojian=fileuploadFileName;
		gcglzhfz.setTiaojian(tiaojian);
		gcglzhfz.setJhid(jhid1);
		InputStream inputStream = new FileInputStream(fileupload);
		boolean bl = false;
		if("sgxkwj".equals(type1)){
			gcglzhfz.setSgxkwjfile(inputStreamToByte(inputStream));
			bl=gcglzhfzServer.uploadWqgzFilesgxk(gcglzhfz);
		}
		if("jgtcwj".equals(type1)){
			gcglzhfz.setJgtcwjfile(inputStreamToByte(inputStream));
			bl=gcglzhfzServer.uploadWqgzFilejgtc(gcglzhfz);
		}
		if("jgyswj".equals(type1)){
			gcglzhfz.setJgyswjfile(inputStreamToByte(inputStream));
			bl=gcglzhfzServer.uploadWqgzFilejgys(gcglzhfz);
		}
		try {
			if(bl)
			response.getWriter().print(fileuploadFileName+"导入成功");
			else
			response.getWriter().print(fileuploadFileName+"导入失败");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void downZhfzFile() throws IOException{
		try{
		HttpServletResponse response = getresponse();
		OutputStream out = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("octets/stream");
		gcglzhfz.setJhid(jhid);
		gcglzhfz.setTiaojian(type);
		gcglzhfz.setLxmc(type+"file");
		Gcglzhfz gcglzhfz1=gcglzhfzServer.downWqgzFile(gcglzhfz);
		byte[] data = gcglzhfz1.getSgxkwjfile();
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglzhfz1.getTiaojian();
		
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
		File file=new File(realPath+"upload\\"+gcglzhfz1.getTiaojian());
		if (!file.exists()) { 
            file.createNewFile(); // 如果文件不存在，则创建 
        } 
		FileOutputStream fos = new FileOutputStream(file); 
		 InputStream in = new InputStream() {
			@Override
			public int read() throws IOException {
				// TODO Auto-generated method stub
				return 0;
			}
		}; 
	        int size = 0; 
	        if (data.length > 0) { 
	            fos.write(data, 0, data.length); 
	        } else { 
	            while ((size = in.read(data)) != -1) { 
	                fos.write(data, 0, size); 
	            }  
	        } 
		FileInputStream fis= new FileInputStream(file);
		byte [] arr = new byte[1024*10];
		int i;
		while((i=fis.read(arr))!=-1){
			out.write(arr,0,i);
			out.flush();
		}
		fis.close();
		out.close();
		fos.close();
		file.delete();
	} catch (Exception e) {
		e.printStackTrace();
	}
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
		gcglzhfz.setGydw(gydw.replaceAll("0*$",""));
		gcglzhfz.setKgzt(kgzt);
		gcglzhfz.setLxmc(lxmc);
		gcglzhfz.setJgzt(jgzt);
		gcglzhfz.setShzt(ybzt);
		if(sfsj==7){
			gcglzhfz.setTiaojian("sjsh");
		}
		if(sfsj==9){
			gcglzhfz.setTiaojian("sjzt");
		}
		if(sfsj==11){
			gcglzhfz.setTiaojian("xjzt");
		}
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
		gcglzhfz.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type)){
			gcglzhfz.setSgxkwjfile(new byte[]{});
			bl=gcglzhfzServer.uploadWqgzFilesgxk(gcglzhfz);
		}
		if("jgtcwj".equals(type)){
			gcglzhfz.setJgtcwjfile(new byte[]{});
			bl=gcglzhfzServer.uploadWqgzFilejgtc(gcglzhfz);
		}
		if("jgyswj".equals(type)){
			gcglzhfz.setJgyswjfile(new byte[]{});
			bl=gcglzhfzServer.uploadWqgzFilejgys(gcglzhfz);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	//修改月报状态
	public void sbZhfzYb(){
		System.out.println(gcglzhfz);
		Boolean bl=gcglzhfzServer.sbWqgzYb(gcglzhfz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	private byte [] inputStreamToByte(InputStream is) throws IOException { 
	    ByteArrayOutputStream bAOutputStream = new ByteArrayOutputStream(); 
	    byte [] arr = new byte[1024*10];
	    int ch; 
	    while((ch = is.read(arr) ) != -1){ 
	        bAOutputStream.write(arr,0,ch); 
	    } 
	    byte data [] =bAOutputStream.toByteArray(); 
	    bAOutputStream.close(); 
	    return data; 
	}
}
