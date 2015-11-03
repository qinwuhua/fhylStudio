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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
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
	
	private String gydw;
	private String kgzt;
	private String lxmc;
	private String qlmc;
	private String jgzt;
	private String yhtype;
	private Integer sfsj;
	private String ybzt;
	private String bfzt;
	private String bfyf;
	private String xmnf;

	private String sfylrbwqk;
	private String gydwtj;
	
	public String getGydwtj() {
		return gydwtj;
	}
	public void setGydwtj(String gydwtj) {
		this.gydwtj = gydwtj;
	}
	public String getSfylrbwqk() {
		return sfylrbwqk;
	}
	public void setSfylrbwqk(String sfylrbwqk) {
		this.sfylrbwqk = sfylrbwqk;
	}
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getBfzt() {
		return bfzt;
	}
	public void setBfzt(String bfzt) {
		this.bfzt = bfzt;
	}
	public String getBfyf() {
		return bfyf;
	}
	public void setBfyf(String bfyf) {
		this.bfyf = bfyf;
	}
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
	
	public String getYhtype() {
		return yhtype;
	}
	public void setYhtype(String yhtype) {
		this.yhtype = yhtype;
	}
	//添加月报
	public void insertWqgzYb(){
		System.out.println(gcglwqgz);
		if("县级".equals(yhtype)){
			gcglwqgz.setSfsj(11);
		}
		if("市级".equals(yhtype)){
			gcglwqgz.setSfsj(9);
		}
		if("省级".equals(yhtype)){
			gcglwqgz.setSfsj(7);
		}
		Boolean bl=gcglwqgzServer.insertWqgzYb(gcglwqgz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//添加月报
		public void insertWqgzYb1(){
			System.out.println(gcglwqgz);
			if("县级".equals(yhtype)){
				gcglwqgz.setSfsj(11);
			}
			if("市级".equals(yhtype)){
				gcglwqgz.setSfsj(9);
			}
			if("省级".equals(yhtype)){
				gcglwqgz.setSfsj(7);
			}
			Boolean bl=gcglwqgzServer.insertWqgzYb1(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
	//查询月报
	public void selectWqgzYbByJhid(){
		gcglwqgz.setPage(page);
		gcglwqgz.setRows(rows);
		gcglwqgz.setJhid(jhid);
		gcglwqgz.setSfsj(sfsj);
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
	//查询月报1
	public void selectWqgzYbByJhid1(){
		gcglwqgz.setPage(page);
		gcglwqgz.setRows(rows);
		gcglwqgz.setJhid(jhid);
		int count=gcglwqgzServer.selectWqgzYbByJhidCount1(gcglwqgz);
		List<Gcglwqgz> list=gcglwqgzServer.selectWqgzYbByJhid1(gcglwqgz);
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
		
		public void uploadWqgzFile() throws Exception{
			HttpServletResponse response = ServletActionContext.getResponse();
			String jhid1=jhid;
			String type1=type;
			gcglwqgz.setJhid(jhid);
			gcglwqgz.setTiaojian(type);
			Gcglwqgz gcglwqgz1=gcglwqgzServer.downWqgzFile(gcglwqgz);
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
			String tiaojian=fileuploadFileName;
			gcglwqgz.setTiaojian(tiaojian);
			gcglwqgz.setJhid(jhid1);
			System.out.println(tiaojian+"------"+jhid1);
			 InputStream inputStream = new FileInputStream(fileupload);
			boolean bl = false;
			if("sgxkwj".equals(type1)){
				gcglwqgz.setSgxkwjfile(inputStreamToByte(inputStream));
				bl=gcglwqgzServer.uploadWqgzFilesgxk(gcglwqgz);
			}
			if("jgtcwj".equals(type1)){
				gcglwqgz.setJgtcwjfile(inputStreamToByte(inputStream));
				bl=gcglwqgzServer.uploadWqgzFilejgtc(gcglwqgz);
			}
			if("jgyswj".equals(type1)){
				gcglwqgz.setJgyswjfile(inputStreamToByte(inputStream));
				bl=gcglwqgzServer.uploadWqgzFilejgys(gcglwqgz);
			}
			try {
				if(bl)
				response.getWriter().print(fileuploadFileName+"导入成功");
				else
				response.getWriter().print(fileuploadFileName+"导入失败");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		@RequestMapping("file/download")  
		public void downWqgzFile() {
			try {
				HttpServletResponse response = getresponse();
				OutputStream out = new BufferedOutputStream(response.getOutputStream());
				response.setContentType("multipart/form-data");
				gcglwqgz.setJhid(jhid);
				gcglwqgz.setTiaojian(type);
				gcglwqgz.setLxmc(type+"file");
				Gcglwqgz gcglwqgz1=gcglwqgzServer.downWqgzFile(gcglwqgz);
				byte[] data = gcglwqgz1.getSgxkwjfile();
				String realPath = ServletActionContext.getServletContext().getRealPath("/");
				String filename=gcglwqgz1.getTiaojian();
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
				File file=new File(realPath+"upload\\"+gcglwqgz1.getTiaojian());
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
			String tiaojian="";
			if(gydw.indexOf(",")==-1){
				if(gydw.length()==9)
					tiaojian=("and (and t3.gydwbm='"+gydw+"'||'00' or and t3.gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else
				tiaojian="and t3.gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
			}else{
				tiaojian="and t3.gydwbm in ("+gydw+")";
			}
			gcglwqgz.setPage(page);
			gcglwqgz.setRows(rows);
			gcglwqgz.setJhid(jhid);
			gcglwqgz.setGydw(tiaojian);
			gcglwqgz.setKgzt(kgzt);
			gcglwqgz.setQlmc(qlmc);
			gcglwqgz.setLxmc(lxmc);
			gcglwqgz.setJgzt(jgzt);
			gcglwqgz.setShzt(ybzt);
			gcglwqgz.setXmnf(xmnf);
			gcglwqgz.setSfylrbwqk(sfylrbwqk);
			gcglwqgz.setGydwtj(gydwtj);
			if(sfsj==7){
				gcglwqgz.setTiaojian("sjsh");
			}
			if(sfsj==9){
				gcglwqgz.setTiaojian("sjzt");
			}
			if(sfsj==11){
				gcglwqgz.setTiaojian("xjzt");
			}
			System.out.println(gcglwqgz.getQlbh());
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
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deleteWqgzFile(){
		
		gcglwqgz.setJhid(jhid);
		gcglwqgz.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type)){
			gcglwqgz.setSgxkwjfile(new byte[] {});
			bl=gcglwqgzServer.uploadWqgzFilesgxk(gcglwqgz);
		}
		if("jgtcwj".equals(type)){
			gcglwqgz.setJgtcwjfile(new byte[] {});
			bl=gcglwqgzServer.uploadWqgzFilejgtc(gcglwqgz);
		}
		if("jgyswj".equals(type)){
			gcglwqgz.setJgyswjfile(new byte[] {});
			bl=gcglwqgzServer.uploadWqgzFilejgys(gcglwqgz);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	//修改月报状态
	public void sbWqgzYb(){
		System.out.println(gcglwqgz);
		Boolean bl=gcglwqgzServer.sbWqgzYb(gcglwqgz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectWqgzyf(){
		gcglwqgz.setJhid(jhid);
		List<Gcglwqgz> g= gcglwqgzServer.selectWqgzyf(gcglwqgz);
		try {
			JsonUtils.write(g, getresponse().getWriter());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectWqgzwcqk(){
		Gcglwqgz gcglwqgz1 = new Gcglwqgz();
		if("wqgz".equals(yhtype)){
			gcglwqgz1=gcglwqgzServer.selectWqgzwcqk(gcglwqgz);
		}
		try {
			JsonUtils.write(gcglwqgz1, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectWqgzbzzj(){
		Gcglwqgz gcglwqgz1 = new Gcglwqgz();
		gcglwqgz1=gcglwqgzServer.selectWqgzbzzj(gcglwqgz);
		try {
			JsonUtils.write(gcglwqgz1, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
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
	public void selectWqgzjhList1(){
		String tiaojian="";
		if(gydw.indexOf(",")==-1){
			tiaojian="and t3.gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
		}else{
			tiaojian="and t3.gydwbm in ("+gydw+")";
		}
		gcglwqgz.setPage(page);
		gcglwqgz.setRows(rows);
		gcglwqgz.setGydw(tiaojian);
		gcglwqgz.setKgzt(kgzt);
		gcglwqgz.setQlmc(qlmc);
		gcglwqgz.setLxmc(lxmc);
		gcglwqgz.setJgzt(jgzt);
		gcglwqgz.setTbyf(bfyf);
		gcglwqgz.setTiaojian(bfzt);
		gcglwqgz.setXmnf(xmnf);
		gcglwqgz.setSfylrbwqk(sfylrbwqk);
		gcglwqgz.setGydwtj(gydwtj);
		try{
		List<Gcglwqgz> list=gcglwqgzServer.selectWqgzjhList1(gcglwqgz);
		int count=gcglwqgzServer.selectWqgzjhListcount1(gcglwqgz);

		EasyUIPage<Gcglwqgz> e=new EasyUIPage<Gcglwqgz>();
		e.setRows(list);
		e.setTotal(count);
		
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//查询每个月的车购税，添加和编辑月报选择不同月份的下拉框、如果查询为空，返回0
	public void selectcgsyf(){
		gcglwqgz.setTbyf(bfyf);
		gcglwqgz.setJhid(jhid);
		Gcglwqgz g=gcglwqgzServer.selectcgsyf(gcglwqgz);
	try{
		JsonUtils.write(g, getresponse().getWriter());
	} catch (Exception e1) {
		e1.printStackTrace();
	}
	}
}
	
