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
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
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
public class GcglshController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglshServerImpl")
	private GcglshServer gcglshServer;
	
	private Gcglsh gcglsh = new Gcglsh();
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
	
	public Gcglsh getGcglsh() {
		return gcglsh;
	}
	public void setGcglsh(Gcglsh gcglsh) {
		this.gcglsh = gcglsh;
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
	public void insertshYb(){
		if("县级".equals(yhtype)){
			gcglsh.setSfsj(11);
		}
		if("市级".equals(yhtype)){
			gcglsh.setSfsj(9);
		}
		Boolean bl=gcglshServer.insertshYb(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectshYbByJhid(){
		gcglsh.setPage(page);
		gcglsh.setRows(rows);
		gcglsh.setJhid(jhid);
		gcglsh.setSfsj(sfsj);
		int count=gcglshServer.selectshYbByJhidCount(gcglsh);
		List<Gcglsh> list=gcglshServer.selectshYbByJhid(gcglsh);
		EasyUIPage<Gcglsh> e=new EasyUIPage<Gcglsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//查询月报
	public void selectshYbByJhid1(){
		gcglsh.setPage(page);
		gcglsh.setRows(rows);
		gcglsh.setJhid(jhid);
		int count=gcglshServer.selectshYbByJhidCount1(gcglsh);
		List<Gcglsh> list=gcglshServer.selectshYbByJhid1(gcglsh);
		EasyUIPage<Gcglsh> e=new EasyUIPage<Gcglsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//修改月报
	public void updateshYb(){
		Boolean bl=gcglshServer.updateshYb(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//删除月报
	public void deleteshYb(){
		Boolean bl=gcglshServer.deleteshYb(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//审核月报
	public void shShYb(){
		Boolean bl=gcglshServer.shShYb(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//添加车购税
	public void insertShCgs(){
		Boolean bl=gcglshServer.insertShCgs(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询cgs
	public void selectShCgsList(){
		gcglsh.setPage(page);
		gcglsh.setRows(rows);
		gcglsh.setJhid(jhid);
		int count=gcglshServer.selectShCgsListCount(gcglsh);
		List<Gcglsh> list=gcglshServer.selectShCgsList(gcglsh);
		EasyUIPage<Gcglsh> e=new EasyUIPage<Gcglsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//修改cgs
	public void updateShCgs(){
		Boolean bl=gcglshServer.updateShCgs(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deleteShCgs(){
		Boolean bl=gcglshServer.deleteShCgs(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}	
	//
	
	public void uploadShFile() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		String jhid1=jhid;
		String type1=type;
		gcglsh.setJhid(jhid);
		gcglsh.setTiaojian(type);
		Gcglsh gcglsh1=gcglshServer.downWqgzFile(gcglsh);
		System.out.println(gcglsh1);
		if(gcglsh1!=null)
		if(gcglsh1.getTiaojian()!=""||gcglsh1.getTiaojian()!=null){
			try {
				response.getWriter().print("附件已存在，导入失败");
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String tiaojian=fileuploadFileName;
		gcglsh.setTiaojian(tiaojian);
		gcglsh.setJhid(jhid1);
		InputStream inputStream = new FileInputStream(fileupload);
		boolean bl = false;
		if("sgxkwj".equals(type1)){
			gcglsh.setSgxkwjfile(inputStreamToByte(inputStream));
			bl=gcglshServer.uploadWqgzFilesgxk(gcglsh);
		}
		if("jgtcwj".equals(type1)){
			gcglsh.setJgtcwjfile(inputStreamToByte(inputStream));
			bl=gcglshServer.uploadWqgzFilejgtc(gcglsh);
		}
		if("jgyswj".equals(type1)){
			gcglsh.setJgyswjfile(inputStreamToByte(inputStream));
			bl=gcglshServer.uploadWqgzFilejgys(gcglsh);
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
	public void downShFile() throws IOException{
		try{
		HttpServletResponse response = getresponse();
		OutputStream out = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("octets/stream");
		gcglsh.setJhid(jhid);
		gcglsh.setTiaojian(type);
		gcglsh.setLxmc(type+"file");
		Gcglsh gcglsh1=gcglshServer.downWqgzFile(gcglsh);
		byte[] data = gcglsh1.getSgxkwjfile();
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglsh1.getTiaojian();
		
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
		File file=new File(realPath+"upload\\"+gcglsh1.getTiaojian());
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
	public void insertShkg(){
		Boolean bl=gcglshServer.insertWqgzkg(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertShwg(){
		Boolean bl=gcglshServer.insertWqgzwg(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertShwwg(){
		Boolean bl=gcglshServer.insertWqgzwwg(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询jihua
	public void selectShjhList(){
		Gcglsh gcglsh=new Gcglsh();
		gcglsh.setPage(page);
		gcglsh.setRows(rows);
		gcglsh.setJhid(jhid);
		gcglsh.setGydw(gydw.replaceAll("0*$",""));
		gcglsh.setKgzt(kgzt);
		gcglsh.setLxmc(lxmc);
		gcglsh.setJgzt(jgzt);
		int count=gcglshServer.selectWqgzjhListCount(gcglsh);
		List<Gcglsh> list=gcglshServer.selectWqgzjhList(gcglsh);
		EasyUIPage<Gcglsh> e=new EasyUIPage<Gcglsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}		
	public void selectShjhFile(){
		gcglsh.setJhid(jhid);
		Gcglsh g= gcglshServer.selectWqgzjhFile(gcglsh);
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
	public void deleteShFile(){
		
		gcglsh.setJhid(jhid);
		gcglsh.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type)){
			gcglsh.setSgxkwjfile(new byte[]{});
			bl=gcglshServer.uploadWqgzFilesgxk(gcglsh);
		}
		if("jgtcwj".equals(type)){
			gcglsh.setJgtcwjfile(new byte[]{});
			bl=gcglshServer.uploadWqgzFilejgtc(gcglsh);
		}
		if("jgyswj".equals(type)){
			gcglsh.setJgyswjfile(new byte[]{});
			bl=gcglshServer.uploadWqgzFilejgys(gcglsh);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	//修改月报状态
	public void sbShYb(){
		System.out.println(gcglsh);
		Boolean bl=gcglshServer.sbWqgzYb(gcglsh);
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
