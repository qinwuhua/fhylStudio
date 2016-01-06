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

import com.hdsx.jxzhpt.gcgl.bean.Gcglbhsd;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglbhsd;
import com.hdsx.jxzhpt.gcgl.server.GcglbhsdServer;
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
public class GcglbhsdController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	private String fileuploadFileName;
	private File fileupload;
	private String type;
	@Resource(name = "gcglbhsdServerImpl")
	private GcglbhsdServer gcglbhsdServer;
	
	private String gydw;
	private String kgzt;
	private String lxmc;
	private String sdmc;
	private String sddm;
	private String jgzt;
	private String yhtype;
	private Integer sfsj;
	private String ybzt;
	private String bfzt;
	private String bfyf;
	private String xmnf;
	private String tbbmbm;//
	private String xtType;//系统类型
	
	public String getSdmc() {
		return sdmc;
	}
	public void setSdmc(String sdmc) {
		this.sdmc = sdmc;
	}
	public String getSddm() {
		return sddm;
	}
	public void setSddm(String sddm) {
		this.sddm = sddm;
	}
	public String getXtType() {
		return xtType;
	}
	public void setXtType(String xtType) {
		this.xtType = xtType;
	}
	public String getTbbmbm() {
		return tbbmbm;
	}
	public void setTbbmbm(String tbbmbm) {
		this.tbbmbm = tbbmbm;
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
	private Gcglbhsd gcglbhsd=new Gcglbhsd();
	private String jhid;
	
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	
	
	public Gcglbhsd getGcglbhsd() {
		return gcglbhsd;
	}
	public void setGcglbhsd(Gcglbhsd gcglbhsd) {
		this.gcglbhsd = gcglbhsd;
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
	public void insertBhsdYb(){
		System.out.println(gcglbhsd);
		if("县级".equals(yhtype)){
			gcglbhsd.setSfsj(11);
		}
		if("市级".equals(yhtype)){
			gcglbhsd.setSfsj(9);
		}
		if("省级".equals(yhtype)){
			gcglbhsd.setSfsj(7);
		}
		Boolean bl=gcglbhsdServer.insertWqgzYb(gcglbhsd);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectBhsdYbByJhid(){
		Gcglbhsd Gcglbhsd=new Gcglbhsd();
		Gcglbhsd.setPage(page);
		Gcglbhsd.setRows(rows);
		Gcglbhsd.setJhid(jhid);
		Gcglbhsd.setSfsj(sfsj);
		int count=gcglbhsdServer.selectWqgzYbByJhidCount(Gcglbhsd);
		List<Gcglbhsd> list=gcglbhsdServer.selectWqgzYbByJhid(Gcglbhsd);
		EasyUIPage<Gcglbhsd> e=new EasyUIPage<Gcglbhsd>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//查询月报1
	public void selectBhsdYbByJhid1(){
		Gcglbhsd Gcglbhsd=new Gcglbhsd();
		Gcglbhsd.setPage(page);
		Gcglbhsd.setRows(rows);
		Gcglbhsd.setJhid(jhid);
		int count=gcglbhsdServer.selectWqgzYbByJhidCount1(Gcglbhsd);
		List<Gcglbhsd> list=gcglbhsdServer.selectWqgzYbByJhid1(Gcglbhsd);
		EasyUIPage<Gcglbhsd> e=new EasyUIPage<Gcglbhsd>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
		//修改月报
		public void updateBhsdYb(){
			System.out.println(gcglbhsd);
			Boolean bl=gcglbhsdServer.updateWqgzYb(gcglbhsd);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deleteBhsdYb(){
			Boolean bl=gcglbhsdServer.deleteWqgzYb(gcglbhsd);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//审核月报
		public void shBhsdYb(){
			System.out.println(gcglbhsd);
			Boolean bl=gcglbhsdServer.shwqgzyb(gcglbhsd);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//添加车购税
		public void insertBhsdCgs(){
			Boolean bl=gcglbhsdServer.insertWqgzCgs(gcglbhsd);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//查询cgs
		public void selectBhsdCgsList(){
			Gcglbhsd Gcglbhsd=new Gcglbhsd();
			Gcglbhsd.setPage(page);
			Gcglbhsd.setRows(rows);
			Gcglbhsd.setJhid(jhid);
			int count=gcglbhsdServer.selectWqgzCgsListCount(Gcglbhsd);
			List<Gcglbhsd> list=gcglbhsdServer.selectWqgzCgsList(Gcglbhsd);
			EasyUIPage<Gcglbhsd> e=new EasyUIPage<Gcglbhsd>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		//修改cgs
		public void updateBhsdCgs(){
			Boolean bl=gcglbhsdServer.updateWqgzCgs(gcglbhsd);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void deleteBhsdCgs(){
			Boolean bl=gcglbhsdServer.deletewqgzCgs(gcglbhsd);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		
		public void uploadBhsdFile() throws Exception{
			HttpServletResponse response = ServletActionContext.getResponse();
			String jhid1=jhid;
			String type1=type;
			gcglbhsd.setJhid(jhid);
			gcglbhsd.setTiaojian(type);
			Gcglbhsd Gcglbhsd1=gcglbhsdServer.downWqgzFile(gcglbhsd);
			if(Gcglbhsd1!=null)
			if(Gcglbhsd1.getTiaojian()!=""||Gcglbhsd1.getTiaojian()!=null){
				try {
					response.getWriter().print("附件已存在，导入失败");
					return;
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			String tiaojian=fileuploadFileName;
			gcglbhsd.setTiaojian(tiaojian);
			gcglbhsd.setJhid(jhid1);
			System.out.println(tiaojian+"------"+jhid1);
			 InputStream inputStream = new FileInputStream(fileupload);
			boolean bl = false;
			if("sgxkwj".equals(type1)){
				gcglbhsd.setSgxkwjfile(inputStreamToByte(inputStream));
				bl=gcglbhsdServer.uploadWqgzFilesgxk(gcglbhsd);
			}
			if("jgtcwj".equals(type1)){
				gcglbhsd.setJgtcwjfile(inputStreamToByte(inputStream));
				bl=gcglbhsdServer.uploadWqgzFilejgtc(gcglbhsd);
			}
			if("jgyswj".equals(type1)){
				gcglbhsd.setJgyswjfile(inputStreamToByte(inputStream));
				bl=gcglbhsdServer.uploadWqgzFilejgys(gcglbhsd);
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
		public void downBhsdFile() {
			try {
				HttpServletResponse response = getresponse();
				OutputStream out = new BufferedOutputStream(response.getOutputStream());
				response.setContentType("multipart/form-data");
				gcglbhsd.setJhid(jhid);
				gcglbhsd.setTiaojian(type);
				gcglbhsd.setLxmc(type+"file");
				Gcglbhsd Gcglbhsd1=gcglbhsdServer.downWqgzFile(gcglbhsd);
				byte[] data = Gcglbhsd1.getSgxkwjfile();
				String realPath = ServletActionContext.getServletContext().getRealPath("/");
				String filename=Gcglbhsd1.getTiaojian();
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
				File file=new File(realPath+"upload\\"+Gcglbhsd1.getTiaojian());
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
		public void insertBhsdkg(){
			Boolean bl=gcglbhsdServer.insertWqgzkg(gcglbhsd);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void insertBhsdwg(){
			Boolean bl=gcglbhsdServer.insertWqgzwg(gcglbhsd);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void insertBhsdwwg(){
			Boolean bl=gcglbhsdServer.insertWqgzwwg(gcglbhsd);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//查询jihua
		public void selectBhsdjhList(){
			Gcglbhsd Gcglbhsd=new Gcglbhsd();
			String tiaojian="";
			if(gydw.indexOf(",")==-1){
//				if(gydw.length()==9)
//					tiaojian=("and (t3.gydwbm='"+gydw+"'||'00' or t3.gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else
				tiaojian="and t3.gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
			}else{
				tiaojian="and t3.gydwbm in ("+gydw+")";
			}
			Gcglbhsd.setPage(page);
			Gcglbhsd.setRows(rows);
			Gcglbhsd.setJhid(jhid);
			Gcglbhsd.setGydw(tiaojian);
			Gcglbhsd.setKgzt(kgzt);
			Gcglbhsd.setSdmc(sdmc);
			Gcglbhsd.setSddm(sddm);
			Gcglbhsd.setLxmc(lxmc);
			Gcglbhsd.setJgzt(jgzt);
			Gcglbhsd.setShzt(ybzt);
			Gcglbhsd.setXmnf(xmnf);
			Gcglbhsd.setTbbmbm(tbbmbm);
			if(sfsj==7){
				Gcglbhsd.setTiaojian("sjsh");
			}
			if(sfsj==9){
				Gcglbhsd.setTiaojian("sjzt");
			}
			if(sfsj==11){
				Gcglbhsd.setTiaojian("xjzt");
			}
//			if (xtType!=null && !xtType.equals("")&&xtType.equals("nc")) {
//				Gcglbhsd.setXtType("and substr(t3.lxbm,1,1) not in('G','S')");
//			}else {
//				Gcglbhsd.setXtType("and substr(t3.lxbm,1,1) in('G','S')");
//			}
			int count=gcglbhsdServer.selectWqgzjhListCount(Gcglbhsd);
			List<Gcglbhsd> list=gcglbhsdServer.selectWqgzjhList(Gcglbhsd);
			EasyUIPage<Gcglbhsd> e=new EasyUIPage<Gcglbhsd>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}		
	public void selectBhsdjhFile(){
		gcglbhsd.setJhid(jhid);
		Gcglbhsd g= gcglbhsdServer.selectWqgzjhFile(gcglbhsd);
		try {
			JsonUtils.write(g, getresponse().getWriter());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deleteBhsdFile(){
		
		gcglbhsd.setJhid(jhid);
		gcglbhsd.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type)){
			gcglbhsd.setSgxkwjfile(new byte[] {});
			bl=gcglbhsdServer.uploadWqgzFilesgxk(gcglbhsd);
		}
		if("jgtcwj".equals(type)){
			gcglbhsd.setJgtcwjfile(new byte[] {});
			bl=gcglbhsdServer.uploadWqgzFilejgtc(gcglbhsd);
		}
		if("jgyswj".equals(type)){
			gcglbhsd.setJgyswjfile(new byte[] {});
			bl=gcglbhsdServer.uploadWqgzFilejgys(gcglbhsd);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	//修改月报状态
	public void sbBhsdYb(){
		System.out.println(gcglbhsd);
		Boolean bl=gcglbhsdServer.sbWqgzYb(gcglbhsd);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectBhsdyf(){
		gcglbhsd.setJhid(jhid);
		List<Gcglbhsd> g= gcglbhsdServer.selectWqgzyf(gcglbhsd);
		try {
			JsonUtils.write(g, getresponse().getWriter());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectBhsdwcqk(){
		Gcglbhsd Gcglbhsd1 = new Gcglbhsd();
		if("wqgz".equals(yhtype)){
			Gcglbhsd1=gcglbhsdServer.selectWqgzwcqk(gcglbhsd);
		}
		try {
			JsonUtils.write(Gcglbhsd1, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectBhsdbzzj(){
		Gcglbhsd Gcglbhsd1 = new Gcglbhsd();
		Gcglbhsd1=gcglbhsdServer.selectWqgzbzzj(gcglbhsd);
		try {
			JsonUtils.write(Gcglbhsd1, getresponse().getWriter());
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
	public void selectBhsdjhList1(){
		String tiaojian="";
		if(gydw.indexOf(",")==-1){
			tiaojian="and t3.gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
		}else{
			tiaojian="and t3.gydwbm in ("+gydw+")";
		}
		String tiaojian2="";
		if(gcglbhsd.getXzqhdm().indexOf(",")==-1){
			tiaojian2="and t3.xzqhdm like '%'||'"+gcglbhsd.getXzqhdm()+"'||'%'";
		}else{
			tiaojian2="and t3.xzqhdm in ("+gcglbhsd.getXzqhdm()+")";
		}
		gcglbhsd.setXzqhdm(tiaojian2);
		gcglbhsd.setPage(page);
		gcglbhsd.setRows(rows);
		gcglbhsd.setGydw(tiaojian);
		gcglbhsd.setKgzt(kgzt);
		gcglbhsd.setSdmc(sdmc);
		gcglbhsd.setSddm(sddm);
		gcglbhsd.setLxmc(lxmc);
		gcglbhsd.setJgzt(jgzt);
		gcglbhsd.setTbyf(bfyf);
		gcglbhsd.setTiaojian(bfzt);
		gcglbhsd.setXmnf(xmnf);
		try{
		List<Gcglbhsd> list=gcglbhsdServer.selectWqgzjhList1(gcglbhsd);
		int count=gcglbhsdServer.selectWqgzjhListcount1(gcglbhsd);

		EasyUIPage<Gcglbhsd> e=new EasyUIPage<Gcglbhsd>();
		e.setRows(list);
		e.setTotal(count);
		
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//查询每个月的车购税，添加和编辑月报选择不同月份的下拉框、如果查询为空，返回0
	public void selectcgsyf(){
		gcglbhsd.setTbyf(bfyf);
		gcglbhsd.setJhid(jhid);
		Gcglbhsd g=gcglbhsdServer.selectcgsyf(gcglbhsd);
	try{
		JsonUtils.write(g, getresponse().getWriter());
	} catch (Exception e1) {
		e1.printStackTrace();
	}
	}
}
	
