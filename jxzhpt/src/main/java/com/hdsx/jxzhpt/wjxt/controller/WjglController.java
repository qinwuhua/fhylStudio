package com.hdsx.jxzhpt.wjxt.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.bean.Wjgl;
import com.hdsx.jxzhpt.wjxt.server.WjglServer;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 系统管理Controller层
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class WjglController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "wjglServerImpl")
	private WjglServer wjglServer;
	private Wjgl wjgl=new Wjgl();
	private String id;
	private String fileuploadFileName;
	private File fileupload;
	private String gydw;
	private String kssj;
	private String jssj;
	private String wjmc;
	
	
	
	public String getWjmc() {
		return wjmc;
	}
	public void setWjmc(String wjmc) {
		this.wjmc = wjmc;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getKssj() {
		return kssj;
	}
	public void setKssj(String kssj) {
		this.kssj = kssj;
	}
	public String getJssj() {
		return jssj;
	}
	public void setJssj(String jssj) {
		this.jssj = jssj;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Wjgl getWjgl() {
		return wjgl;
	}
	public void setWjgl(Wjgl wjgl) {
		this.wjgl = wjgl;
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
	
	public void uploadWjFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			InputStream inputStream = new FileInputStream(fileupload);
			String s = UUID.randomUUID().toString(); 
			String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
			wjgl.setId(s1);
			wjgl.setWjid(id);
			wjgl.setWjname(fileuploadFileName);
			wjgl.setWjfile(inputStreamToByte(inputStream));
			boolean bl=wjglServer.uploadWjFile(wjgl);
			if(bl)
			response.getWriter().print(fileuploadFileName+"    上传成功"+s1);
			else
			response.getWriter().print(fileuploadFileName+"    上传失败"+s1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deleteWjfile(){
		boolean bl=wjglServer.deleteWjfile(wjgl);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void deleteWjfile1(){
		boolean bl=wjglServer.deleteWjfile1(id);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void deleteQtWjfile1(){
		boolean bl=wjglServer.deleteQtWjfile1(id);
		ResponseUtils.write(getresponse(), bl+"");
	}
	
	public void insertZcwj(){
		wjgl.setFbdw(wjgl.getFbdw().replaceAll("0*$",""));
		boolean bl=wjglServer.insertZcwj(wjgl);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void insertQtwj(){
		boolean bl=wjglServer.insertQtwj(wjgl);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void insertJhwj(){
		boolean bl=wjglServer.insertJhwj(wjgl);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void updateZcwj(){
		wjgl.setFbdw(wjgl.getFbdw().replaceAll("0*$",""));
		boolean bl=wjglServer.updateZcwj(wjgl);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void updateQtwj(){
		boolean bl=wjglServer.updateQtwj(wjgl);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void updateJhwj(){
		boolean bl=wjglServer.updateJhwj(wjgl);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void deleteZcwj(){
		boolean bl=wjglServer.deleteZcwj(wjgl);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void deleteQtwj(){
		boolean bl=wjglServer.deleteQtwj(wjgl);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void deleteJhwj(){
		boolean bl=wjglServer.deleteJhwj(wjgl);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void selectzcwjlist(){
		wjgl.setJsdw(gydw);
		wjgl.setKssj(kssj);
		wjgl.setJssj(jssj);
		wjgl.setWjmc(wjmc);
		wjgl.setPage(page);
		wjgl.setRows(rows);
		List<Wjgl> list = wjglServer.selectzcwjlist(wjgl);
		int count = wjglServer.selectzcwjlistCount(wjgl);
		EasyUIPage<Wjgl> e=new EasyUIPage<Wjgl>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectqtwjlist(){
		wjgl.setJsdw(gydw);
		wjgl.setKssj(kssj);
		wjgl.setJssj(jssj);
		wjgl.setPage(page);
		wjgl.setRows(rows);
		List<Wjgl> list = wjglServer.selectqtwjlist(wjgl);
		int count = wjglServer.selectqtwjlistCount(wjgl);
		EasyUIPage<Wjgl> e=new EasyUIPage<Wjgl>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void selectjhwjlist(){
		wjgl.setJsdw(gydw);
		wjgl.setKssj(kssj);
		wjgl.setJssj(jssj);
		wjgl.setPage(page);
		wjgl.setRows(rows);
		List<Wjgl> list = wjglServer.selectjhwjlist(wjgl);
		int count = wjglServer.selectjhwjlistCount(wjgl);
		EasyUIPage<Wjgl> e=new EasyUIPage<Wjgl>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void selectWjfile(){
		wjgl.setWjid(id);
		List<Wjgl> list = wjglServer.selectWjfile(wjgl);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void downWjFile(){
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("multipart/form-data");
			wjgl.setId(id);
			Wjgl wjgl1=wjglServer.selectWjById(wjgl);
			byte[] data = wjgl1.getWjfile();
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename=wjgl1.getWjname();
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+wjgl1.getWjname());
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
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//
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
