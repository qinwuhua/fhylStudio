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
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader1;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 系统管理Controller层
 * @author qwh
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
	private String jgzt;
	private String yhtype;
	private Integer sfsj;
	private String ybzt;
	private String sbyf;
	private String tbr;
	private String bfzt;
	private String bfyf;
	private String xmnf;
	private String sfylrbwqk;
	private String xzqh;
	private String wgnf;
	public String getWgnf() {
		return wgnf;
	}
	public void setWgnf(String wgnf) {
		this.wgnf = wgnf;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
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
	public String getTbr() {
		return tbr;
	}
	public void setTbr(String tbr) {
		this.tbr = tbr;
	}
	public String getSbyf() {
		return sbyf;
	}
	public void setSbyf(String sbyf) {
		this.sbyf = sbyf;
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
		if("县级".equals(yhtype)){
			gcglabgc.setSfsj(11);
		}
		if("市级".equals(yhtype)){
			gcglabgc.setSfsj(9);
		}
		if("省级".equals(yhtype)){
			gcglabgc.setSfsj(7);
		}
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
		gcglabgc.setSfsj(sfsj);
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
//查询月报1
	public void selectAbgcYbByJhid1(){
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setPage(page);
		gcglabgc.setRows(rows);
		gcglabgc.setJhid(jhid);
		int count=gcglabgcServer.selectAbgcYbByJhidCount1(gcglabgc);
		List<Gcglabgc> list=gcglabgcServer.selectAbgcYbByJhid1(gcglabgc);
		EasyUIPage<Gcglabgc> e=new EasyUIPage<Gcglabgc>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
//查询月报1
	public void selAbgcZgYbByJhid(){
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setPage(page);
		gcglabgc.setRows(rows);
		gcglabgc.setJhid(jhid);
		int count=gcglabgcServer.selAbgcZgYbByJhidCount(gcglabgc);
		List<Gcglabgc> list=gcglabgcServer.selAbgcZgYbByJhid(gcglabgc);
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
		
		public void uploadAbgcFile() throws Exception{
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
			String tiaojian=fileuploadFileName;
			
			gcglabgc.setTiaojian(tiaojian);
			gcglabgc.setJhid(jhid1);
			InputStream inputStream = new FileInputStream(fileupload);
			boolean bl = false;
			if("sgxkwj".equals(type1)){
				gcglabgc.setSgxkwjfile(inputStreamToByte(inputStream));
				bl=gcglabgcServer.uploadWqgzFilesgxk(gcglabgc);
			}
			if("jgtcwj".equals(type1)){
				gcglabgc.setJgtcwjfile(inputStreamToByte(inputStream));
				bl=gcglabgcServer.uploadWqgzFilejgtc(gcglabgc);
			}
			if("jgyswj".equals(type1)){
				gcglabgc.setJgyswjfile(inputStreamToByte(inputStream));
				bl=gcglabgcServer.uploadWqgzFilejgys(gcglabgc);
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
		public void downAbgcFile() throws IOException{
			try {
				HttpServletResponse response = getresponse();
				OutputStream out = new BufferedOutputStream(response.getOutputStream());
				response.setContentType("octets/stream");
				gcglabgc.setJhid(jhid);
				gcglabgc.setTiaojian(type);
				gcglabgc.setLxmc(type+"file");
				Gcglabgc gcglabgc1=gcglabgcServer.downWqgzFile(gcglabgc);
				byte[] data = gcglabgc1.getSgxkwjfile();
				String realPath = ServletActionContext.getServletContext().getRealPath("/");
				String filename=gcglabgc1.getTiaojian();
				
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
				File file=new File(realPath+"upload\\"+gcglabgc1.getTiaojian());
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
		public void insertAbgckg(){
			
			Boolean bl=false;
			if("af".equals(gcglabgc.getXmlx())){
				bl=gcglabgcServer.insertafkg(gcglabgc);
			}
			else {
				bl=gcglabgcServer.insertWqgzkg(gcglabgc);
			}
			
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void insertAbgcwg(){
			Boolean bl=false;
			if("af".equals(gcglabgc.getXmlx())){
				bl=gcglabgcServer.insertafwg(gcglabgc);
			}else{
				bl=gcglabgcServer.insertWqgzwg(gcglabgc);
			}
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
			String tiaojian1="";
			if("af".equals(gcglabgc.getXmlx())){
				if(gydw.indexOf(",")==-1){
					tiaojian1="and t3.gydwdm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
				}else{
					tiaojian1="and t3.gydwdm in ("+gydw+")";
				}
			}
			else{
				if(gydw.indexOf(",")==-1){
					tiaojian1="and t3.gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
				}else{
					tiaojian1="and t3.gydwbm in ("+gydw+")";
				}
			}
			String tiaojian2="";
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and t3.xzqhdm like '%'||'"+xzqh+"'||'%'";
			}else{
				tiaojian2="and t3.xzqhdm in ("+xzqh+")";
			}
			gcglabgc.setGldj(MyUtil.getQueryTJ(gcglabgc.getGldj(), "substr(t3.lxbm,0,1)"));
			gcglabgc.setXzqhdm(tiaojian2);	
			gcglabgc.setPage(page);
			gcglabgc.setRows(rows);
			gcglabgc.setJhid(jhid);
			gcglabgc.setGydw(tiaojian1);
			gcglabgc.setKgzt(kgzt);
			gcglabgc.setLxmc(lxmc);
			gcglabgc.setJgzt(jgzt);
			gcglabgc.setShzt(ybzt);
			gcglabgc.setXmnf(xmnf);
			if(sfsj==7){
				gcglabgc.setTiaojian("sjsh");
			}
			if(sfsj==9){
				gcglabgc.setTiaojian("sjzt");
			}
			if(sfsj==11){
				gcglabgc.setTiaojian("xjzt");
			}
			//System.out.println(gcglabgc.getJgys());
			int count=0;
			List<Gcglabgc> list=null;
			if("af".equals(gcglabgc.getXmlx())){
				count=gcglabgcServer.selectafjhListCount(gcglabgc);
				list=gcglabgcServer.selectafjhList(gcglabgc);
			}else{
				count=gcglabgcServer.selectWqgzjhListCount(gcglabgc);
				list=gcglabgcServer.selectWqgzjhList(gcglabgc);
			}
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
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteAbgcFile(){
		
		gcglabgc.setJhid(jhid);
		gcglabgc.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type)){
			gcglabgc.setSgxkwjfile(new byte[] {});
			bl=gcglabgcServer.uploadWqgzFilesgxk(gcglabgc);
		}
		if("jgtcwj".equals(type)){
			gcglabgc.setJgtcwjfile(new byte[] {});
			bl=gcglabgcServer.uploadWqgzFilejgtc(gcglabgc);
		}
		if("jgyswj".equals(type)){
			gcglabgc.setJgyswjfile(new byte[] {});
			bl=gcglabgcServer.uploadWqgzFilejgys(gcglabgc);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	//修改月报状态
	public void sbAbgcYb(){
		System.out.println(gcglabgc);
		Boolean bl=gcglabgcServer.sbWqgzYb(gcglabgc);
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

	public void exportAbyb(){
		List<Excel_list> list;
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydw = (String) session.getAttribute("gydw");
			xzqh = (String) session.getAttribute("xzqh");
			System.out.println(xzqh);
			String tiaojian1 = "";
			if ("af".equals(gcglabgc.getXmlx())) {
				if (gydw.indexOf(",") == -1) {
					tiaojian1 = "and t3.gydwdm like '%'||substr('" + gydw
							+ "',0,4)||'_'||substr('" + gydw + "',6)||'%'";
				} else {
					tiaojian1 = "and t3.gydwdm in (" + gydw + ")";
				}
			} else {
				if (gydw.indexOf(",") == -1) {
					tiaojian1 = "and t3.gydwbm like '%'||substr('" + gydw
							+ "',0,4)||'_'||substr('" + gydw + "',6)||'%'";
				} else {
					tiaojian1 = "and t3.gydwbm in (" + gydw + ")";
				}
			}
			String tiaojian2 = "";
			if (xzqh.indexOf(",") == -1) {
				tiaojian2 = "and t3.xzqhdm like '%'||'" + xzqh + "'||'%'";
			} else {
				tiaojian2 = "and t3.xzqhdm in (" + xzqh + ")";
			}
			gcglabgc.setXzqhdm(tiaojian2);
			gcglabgc.setGydw(tiaojian1);
			gcglabgc.setKgzt(kgzt);
			gcglabgc.setLxmc(lxmc);
			gcglabgc.setJgzt(jgzt);
			gcglabgc.setTbyf(bfyf);
			gcglabgc.setTbr(tbr);
			gcglabgc.setTiaojian(bfzt);
			gcglabgc.setXmnf(xmnf);
			gcglabgc.setGydw(tiaojian1);
			gcglabgc.setKgzt(kgzt);
			gcglabgc.setLxmc(lxmc);
			gcglabgc.setJgzt(jgzt);
			gcglabgc.setTbyf(sbyf);
			gcglabgc.setJhnf(xmnf);
			gcglabgc.setTbr(tbr);
			list = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		ExcelData eldata=new ExcelData();//创建一个类
		if("af".equals(gcglabgc.getXmlx())){
			list=gcglabgcServer.exportAfyb(gcglabgc);
			eldata.setTitleName("安防工程车购税拨付信息导入表");//设置第一行
			eldata.setSheetName("车购税拨付");//设置sheeet名
			eldata.setFileName("安防工程车购税拨付信息导入表");//设置文件名
		}else{
			list=gcglabgcServer.exportAbyb(gcglabgc);
			eldata.setTitleName("安保工程车购税拨付信息导入表");//设置第一行
			eldata.setSheetName("车购税拨付");//设置sheeet名
			eldata.setFileName("安保工程车购税拨付信息导入表");//设置文件名
		}
	
		//到报表
		
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("管养单位",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("路线编码",1,1,3,3));
		et.add(new Excel_tilte("路线名称",1,1,4,4));
		et.add(new Excel_tilte("起点桩号",1,1,5,5));
		et.add(new Excel_tilte("止点桩号",1,1,6,6));
		et.add(new Excel_tilte("批复总投资(万元)",1,1,7,7));
		et.add(new Excel_tilte("计划部投资(万元)",1,1,8,8));
		et.add(new Excel_tilte("计划地方自筹(万元)",1,1,9,9));
		et.add(new Excel_tilte("拨付中央车购税(万元)",1,1,10,10));
		et.add(new Excel_tilte("拨付省投资(万元)",1,1,11,11));
		et.add(new Excel_tilte("财审处意见",1,1,12,12));
		et.add(new Excel_tilte("填报月份",1,1,13,13));
		et.add(new Excel_tilte("填报时间",1,1,14,14));
		et.add(new Excel_tilte("填报人",1,1,15,15));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel		
		
	}
	
	//
	public void insertCGS(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader1.readExcelContent(2,13,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			if(data.size()<1){
				response.getWriter().print("文件中没有可导入数据");
			}
			String flag1="";
			boolean booltb=false,booldata=false;
			for (Map map : data) {
				System.out.println(map);
				try {
					Double.parseDouble(map.get("7").toString());
					Double.parseDouble(map.get("8").toString());
				} catch (Exception e) {
					flag1=flag1+map.get("0").toString()+"  ";
					break;
				}
				gcglabgc.setJhid(map.get("0").toString());
				gcglabgc.setCgsdwzj(map.get("7").toString());
				gcglabgc.setStz(map.get("8").toString());
				gcglabgc.setTbsj(map.get("11").toString());
				gcglabgc.setTbyf(map.get("10").toString());
				gcglabgc.setTbr(map.get("12").toString());
				gcglabgc.setCscyj(map.get("9").toString());
				Boolean bl=gcglabgcServer.insertAbgcCgs(gcglabgc);
				if(!bl){
					flag1=flag1+map.get("0").toString()+"  ";
					booltb=true;
				};
			}
			if(booltb==false){
				booldata=true;
			}
			if(booltb){
				response.getWriter().print("计划编码为"+flag1+"导入失败，其他导入成功");
			}
			if(booldata){
				response.getWriter().print("全部数据导入成功");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void insertCGS2(){
			String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
			System.out.println("文件类型："+fileType);
			HttpServletResponse response = ServletActionContext.getResponse();
			try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader1.readExcelContent(2,15,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			if(data.size()<1){
				response.getWriter().print("文件中没有可导入数据");
			}
			String flag1="";
			boolean booltb=false,booldata=false;
			for (Map map : data) {
				System.out.println(map);
				try {
					Double.parseDouble(map.get("7").toString());
					Double.parseDouble(map.get("8").toString());
				} catch (Exception e) {
					flag1=flag1+map.get("0").toString()+"  ";
					break;
				}
				gcglabgc.setJhid(map.get("0").toString());
				gcglabgc.setCgsdwzj(map.get("7").toString());
				gcglabgc.setYhdk(map.get("8").toString());
				gcglabgc.setGz(map.get("9").toString());
				gcglabgc.setSz(map.get("10").toString());
				gcglabgc.setTbsj(map.get("13").toString());
				gcglabgc.setTbyf(map.get("12").toString());
				gcglabgc.setTbr(map.get("14").toString());
				gcglabgc.setCscyj(map.get("11").toString());
				Boolean bl=gcglabgcServer.insertAbgcCgs(gcglabgc);
				if(!bl){
					flag1=flag1+map.get("0").toString()+"  ";
					booltb=true;
				};
			}
			if(booltb==false){
				booldata=true;
			}
			if(booltb){
				response.getWriter().print("计划编码为"+flag1+"导入失败，其他导入成功");
			}
			if(booldata){
				response.getWriter().print("全部数据导入成功");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void insertCGS1(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader1.readExcelContent(2,16,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			if(data.size()<1){
				response.getWriter().print("文件中没有可导入数据");
			}
			String flag1="";
			boolean booltb=false,booldata=false;
			for (Map map : data) {
				System.out.println(map);
				try {
					Double.parseDouble(map.get("10").toString());
					Double.parseDouble(map.get("11").toString());
				} catch (Exception e) {
					flag1=flag1+map.get("0").toString()+"  ";
					break;
				}
				gcglabgc.setJhid(map.get("0").toString());
				gcglabgc.setCgsdwzj(map.get("10").toString());
				gcglabgc.setStz(map.get("11").toString());
				gcglabgc.setTbsj(map.get("14").toString());
				gcglabgc.setTbyf(map.get("13").toString());
				gcglabgc.setTbr(map.get("15").toString());
				gcglabgc.setCscyj(map.get("12").toString());
				Boolean bl=gcglabgcServer.insertAbgcCgs(gcglabgc);
				if(!bl){
					flag1=flag1+map.get("0").toString()+"  ";
					booltb=true;
				};
			}
			if(booltb==false){
				booldata=true;
			}
			if(booltb){
				response.getWriter().print("计划编码为"+flag1+"导入失败，其他导入成功");
			}
			if(booldata){
				response.getWriter().print("全部数据导入成功");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//改建
	public void exportgjyb(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		gydw=(String) session.getAttribute("gydw");	
		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and xzqhdm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
		}else{
			tiaojian1="and xzqhdm in ("+gydw+")";
		}
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setShzt(ybzt);
		gcglabgc.setTbyf(bfyf);
		gcglabgc.setSbnf(xmnf);
		gcglabgc.setTiaojian(bfzt);
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setJhnf(xmnf);
		List<Excel_list> list=gcglabgcServer.exportgjyb(gcglabgc);
		
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("路面改造工程项目车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("路面改造工程项目车购税拨付信息导入表");//设置文件名
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("项目编码",1,1,0,0));
		et.add(new Excel_tilte("项目名称",1,1,1,1));
		et.add(new Excel_tilte("项目年份",1,1,2,2));
		et.add(new Excel_tilte("计划开工时间",1,1,3,3));
		et.add(new Excel_tilte("计划完工时间",1,1,4,4));
		et.add(new Excel_tilte("批复总投资(万元) ",1,1,5,5));
		et.add(new Excel_tilte("部补助总金额(万元) ",1,1,6,6));
		et.add(new Excel_tilte("拨付中央车购税(万元)",1,1,7,7));
		et.add(new Excel_tilte("银行贷款(万元)",1,1,8,8));
		et.add(new Excel_tilte("国债(万元)",1,1,9,9));
		et.add(new Excel_tilte("省债(万元)",1,1,10,10));
		et.add(new Excel_tilte("财审处意见",1,1,11,11));
		et.add(new Excel_tilte("填报月份",1,1,12,12));
		et.add(new Excel_tilte("填报时间",1,1,13,13));
		et.add(new Excel_tilte("填报人",1,1,14,14));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel		
		
	}
	//新建
		public void exportxjyb(){
			Gcglabgc gcglabgc=new Gcglabgc();
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydw=(String) session.getAttribute("gydw");	
			String tiaojian1="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and xzqhdm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
			}else{
				tiaojian1="and xzqhdm in ("+gydw+")";
			}
			gcglabgc.setGydw(tiaojian1);
			gcglabgc.setKgzt(kgzt);
			gcglabgc.setLxmc(lxmc);
			gcglabgc.setJgzt(jgzt);
			gcglabgc.setShzt(ybzt);
			gcglabgc.setTbyf(bfyf);
			gcglabgc.setSbnf(xmnf);
			gcglabgc.setGydw(tiaojian1);
			gcglabgc.setKgzt(kgzt);
			gcglabgc.setLxmc(lxmc);
			gcglabgc.setJgzt(jgzt);
			gcglabgc.setTbyf(sbyf);
			gcglabgc.setTbr(tbr);
			gcglabgc.setJhnf(xmnf);
			List<Excel_list> list=gcglabgcServer.exportxjyb(gcglabgc);
			
			//到报表
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("新建工程项目车购税拨付信息导入表");//设置第一行
			eldata.setSheetName("车购税拨付");//设置sheeet名
			eldata.setFileName("新建工程项目车购税拨付信息导入表");//设置文件名
			eldata.setEl(list);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("项目编码",1,1,0,0));
			et.add(new Excel_tilte("项目名称",1,1,1,1));
			et.add(new Excel_tilte("项目年份",1,1,2,2));
			et.add(new Excel_tilte("计划开工时间",1,1,3,3));
			et.add(new Excel_tilte("计划完工时间",1,1,4,4));
			et.add(new Excel_tilte("批复总投资(万元) ",1,1,5,5));
			et.add(new Excel_tilte("部补助总金额(万元) ",1,1,6,6));
			et.add(new Excel_tilte("拨付中央车购税(万元)",1,1,7,7));
			et.add(new Excel_tilte("银行贷款(万元)",1,1,8,8));
			et.add(new Excel_tilte("国债(万元)",1,1,9,9));
			et.add(new Excel_tilte("省债(万元)",1,1,10,10));
			et.add(new Excel_tilte("财审处意见",1,1,11,11));
			et.add(new Excel_tilte("填报月份",1,1,12,12));
			et.add(new Excel_tilte("填报时间",1,1,13,13));
			et.add(new Excel_tilte("填报人",1,1,14,14));
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			try {
				Excel_export.excel_export(eldata,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block 
				e.printStackTrace();
			}//将类和参数HttpServletResponse传入即可实现导出excel		
			
		}
	//升级
	
	public void exportsjyb_set(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("gydw", gydw);
		session.setAttribute("xzqh", xzqh);
	}
	public void exportsjyb(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		gydw=(String) session.getAttribute("gydw");	
		Gcglabgc gcglabgc=new Gcglabgc();
		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and xzqhdm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
		}else{
			tiaojian1="and xzqhdm in ("+gydw+")";
		}
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setShzt(ybzt);
		gcglabgc.setTbyf(bfyf);
		gcglabgc.setSbnf(xmnf);
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setJhnf(xmnf);
		List<Excel_list> list=gcglabgcServer.exportsjyb(gcglabgc);
		
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("改建工程项目车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("改建工程项目车购税拨付信息导入表");//设置文件名
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("项目编码",1,1,0,0));
		et.add(new Excel_tilte("项目名称",1,1,1,1));
		et.add(new Excel_tilte("项目年份",1,1,2,2));
		et.add(new Excel_tilte("计划开工时间",1,1,3,3));
		et.add(new Excel_tilte("计划完工时间",1,1,4,4));
		et.add(new Excel_tilte("批复总投资(万元) ",1,1,5,5));
		et.add(new Excel_tilte("部补助总金额(万元) ",1,1,6,6));
		et.add(new Excel_tilte("拨付中央车购税(万元)",1,1,7,7));
		et.add(new Excel_tilte("银行贷款(万元)",1,1,8,8));
		et.add(new Excel_tilte("国债(万元)",1,1,9,9));
		et.add(new Excel_tilte("省债(万元)",1,1,10,10));
		et.add(new Excel_tilte("财审处意见",1,1,11,11));
		et.add(new Excel_tilte("填报月份",1,1,12,12));
		et.add(new Excel_tilte("填报时间",1,1,13,13));
		et.add(new Excel_tilte("填报人",1,1,14,14));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel		
		
	}
	
	public void exportgsdyb(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		gydw=(String) session.getAttribute("gydw");	

		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and xzqhdm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
		}else{
			tiaojian1="and xzqhdm in ("+gydw+")";
		}
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setShzt(ybzt);
		gcglabgc.setTbyf(bfyf);
		gcglabgc.setSbnf(xmnf);
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setJhnf(xmnf);
		if(gcglabgc.getXmlx1()!=null)
			if(gcglabgc.getXmlx1().length()>0){
				String[] tsdqs=gcglabgc.getXmlx1().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="and(xmlx1 like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or xmlx1 like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				gcglabgc.setXmlx1(tsdq);
			}
		System.out.println(gcglabgc.getXmlx1());
		List<Excel_list> list=gcglabgcServer.exportgsdyb(gcglabgc);
		
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("国省道改造项目车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("国省道改造项目车购税拨付信息导入表");//设置文件名
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("项目编码",1,1,0,0));
		et.add(new Excel_tilte("项目名称",1,1,1,1));
		et.add(new Excel_tilte("项目年份",1,1,2,2));
		et.add(new Excel_tilte("计划开工时间",1,1,3,3));
		et.add(new Excel_tilte("计划完工时间",1,1,4,4));
		et.add(new Excel_tilte("批复总投资(万元) ",1,1,5,5));
		et.add(new Excel_tilte("部补助总金额(万元) ",1,1,6,6));
		et.add(new Excel_tilte("拨付中央车购税(万元)",1,1,7,7));
		et.add(new Excel_tilte("银行贷款(万元)",1,1,8,8));
		et.add(new Excel_tilte("国债(万元)",1,1,9,9));
		et.add(new Excel_tilte("省债(万元)",1,1,10,10));
		et.add(new Excel_tilte("财审处意见",1,1,11,11));
		et.add(new Excel_tilte("填报月份",1,1,12,12));
		et.add(new Excel_tilte("填报时间",1,1,13,13));
		et.add(new Excel_tilte("填报人",1,1,14,14));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel		
		
	}
	
	
	//红色
	public void exporthsyb(){
		Gcglabgc gcglabgc=new Gcglabgc();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		gydw=(String) session.getAttribute("gydw");	
		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and t2.gydwdm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
		}else{
			tiaojian1="and t2.gydwdm in ("+gydw+")";
		}
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setJhnf(xmnf);
		List<Excel_list> list=gcglabgcServer.exporthsyb(gcglabgc);
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("红色旅游车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("红色旅游车购税拨付信息导入表");//设置文件名
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("新政区划",1,1,1,1));
		et.add(new Excel_tilte("计划年份",1,1,2,2));
		et.add(new Excel_tilte("项目名称",1,1,3,3));
		et.add(new Excel_tilte("建设性质",1,1,4,4));
		et.add(new Excel_tilte("开工年",1,1,5,5));
		et.add(new Excel_tilte("完工年",1,1,6,6));
		et.add(new Excel_tilte("批复总投资(万元)",1,1,7,7));
		et.add(new Excel_tilte("计划部投资(万元)",1,1,8,8));
		et.add(new Excel_tilte("计划地方自筹(万元)",1,1,9,9));
		et.add(new Excel_tilte("拨付中央车购税(万元)",1,1,10,10));
		et.add(new Excel_tilte("拨付省投资(万元)",1,1,11,11));
		et.add(new Excel_tilte("财审处意见",1,1,12,12));
		et.add(new Excel_tilte("填报月份",1,1,13,13));
		et.add(new Excel_tilte("填报时间",1,1,14,14));
		et.add(new Excel_tilte("填报人",1,1,15,15));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel		
		
	}
	//水毁
	public void exportshyb(){
		Gcglabgc gcglabgc=new Gcglabgc();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		gydw=(String) session.getAttribute("gydw");	
		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and xzqhdm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
		}else{
			tiaojian1="and xzqhdm in ("+gydw+")";
		}
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setShzt(ybzt);
		gcglabgc.setTbyf(bfyf);
		gcglabgc.setSbnf(xmnf);
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setJhnf(xmnf);
		List<Excel_list> list=gcglabgcServer.exportshyb(gcglabgc);

		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("灾毁重建车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("灾毁重建车购税拨付信息导入表");//设置文件名
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("项目编码",1,1,0,0));
		et.add(new Excel_tilte("项目名称",1,1,1,1));
		et.add(new Excel_tilte("项目年份",1,1,2,2));
		et.add(new Excel_tilte("计划开工时间",1,1,3,3));
		et.add(new Excel_tilte("计划完工时间",1,1,4,4));
		et.add(new Excel_tilte("批复总投资(万元) ",1,1,5,5));
		et.add(new Excel_tilte("部补助总金额(万元) ",1,1,6,6));
		et.add(new Excel_tilte("拨付中央车购税(万元)",1,1,7,7));
		et.add(new Excel_tilte("银行贷款(万元)",1,1,8,8));
		et.add(new Excel_tilte("国债(万元)",1,1,9,9));
		et.add(new Excel_tilte("省债(万元)",1,1,10,10));
		et.add(new Excel_tilte("财审处意见",1,1,11,11));
		et.add(new Excel_tilte("填报月份",1,1,12,12));
		et.add(new Excel_tilte("填报时间",1,1,13,13));
		et.add(new Excel_tilte("填报人",1,1,14,14));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel		
		
	}
	//养护
	public void exportyhyb(){
		Gcglabgc gcglabgc=new Gcglabgc();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		gydw=(String) session.getAttribute("gydw");	
		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and xzqhdm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
		}else{
			tiaojian1="and xzqhdm in ("+gydw+")";
		}
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setShzt(ybzt);
		gcglabgc.setTbyf(bfyf);
		gcglabgc.setSbnf(xmnf);
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setJhnf(xmnf);
		List<Excel_list> list=gcglabgcServer.exportyhyb(gcglabgc);
		
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("养护大中修车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("养护大中修车购税拨付信息导入表");//设置文件名 
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("项目编码",1,1,0,0));
		et.add(new Excel_tilte("项目名称",1,1,1,1));
		et.add(new Excel_tilte("项目年份",1,1,2,2));
		et.add(new Excel_tilte("计划开工时间",1,1,3,3));
		et.add(new Excel_tilte("计划完工时间",1,1,4,4));
		et.add(new Excel_tilte("批复总投资(万元) ",1,1,5,5));
		et.add(new Excel_tilte("部补助总金额(万元) ",1,1,6,6));
		et.add(new Excel_tilte("拨付中央车购税(万元)",1,1,7,7));
		et.add(new Excel_tilte("拨付省投资(万元)",1,1,8,8));
		et.add(new Excel_tilte("财审处意见",1,1,9,9));
		et.add(new Excel_tilte("填报月份",1,1,10,10));
		et.add(new Excel_tilte("填报时间",1,1,11,11));
		et.add(new Excel_tilte("填报人",1,1,12,12));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel		
		
	}
	public void exportzhyb(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		gydw=(String) session.getAttribute("gydw");	
		xzqh=(String) session.getAttribute("xzqh");	
		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and t3.gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
		}else{
			tiaojian1="and t3.gydwbm in ("+gydw+")";
		}
		String tiaojian2 = "";
		if (xzqh.indexOf(",") == -1) {
			tiaojian2 = "and t3.xzqhdm like '%'||'" + xzqh + "'||'%'";
		} else {
			tiaojian2 = "and t3.xzqhdm in (" + xzqh + ")";
		}
		gcglabgc.setXzqhdm(tiaojian2);
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(bfyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setTiaojian(bfzt);
		gcglabgc.setXmnf(xmnf);
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setJhnf(xmnf);
		gcglabgc.setTbr(tbr);
		List<Excel_list> list=gcglabgcServer.exportzhyb(gcglabgc);
		
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("灾害防治车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("灾害防治车购税拨付信息导入表");//设置文件名
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("管养单位",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("路线编码",1,1,3,3));
		et.add(new Excel_tilte("路线名称",1,1,4,4));
		et.add(new Excel_tilte("起点桩号",1,1,5,5));
		et.add(new Excel_tilte("止点桩号",1,1,6,6));
		et.add(new Excel_tilte("批复总投资(万元)",1,1,7,7));
		et.add(new Excel_tilte("计划部投资(万元)",1,1,8,8));
		et.add(new Excel_tilte("计划地方自筹(万元)",1,1,9,9));
		et.add(new Excel_tilte("拨付中央车购税(万元)",1,1,10,10));
		et.add(new Excel_tilte("拨付省投资(万元)",1,1,11,11));
		et.add(new Excel_tilte("财审处意见",1,1,12,12));
		et.add(new Excel_tilte("填报月份",1,1,13,13));
		et.add(new Excel_tilte("填报时间",1,1,14,14));
		et.add(new Excel_tilte("填报人",1,1,15,15));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel		
		
	}
	
	public void exportwqyb(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		gydw=(String) session.getAttribute("gydw");	
		xzqh=(String) session.getAttribute("xzqh");	
		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and t3.gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
		}else{
			tiaojian1="and t3.gydwbm in ("+gydw+")";
		}
		String tiaojian2 = "";
		if (xzqh.indexOf(",") == -1) {
			tiaojian2 = "and t3.xzqhdm like '%'||'" + xzqh + "'||'%'";
		} else {
			tiaojian2 = "and t3.xzqhdm in (" + xzqh + ")";
		}
		gcglabgc.setXzqhdm(tiaojian2);	
		gcglabgc.setPage(page);
		gcglabgc.setRows(rows);
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setQlmc(qlmc);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTiaojian(bfzt);
		gcglabgc.setXmnf(xmnf);
		gcglabgc.setSfylrbwqk(sfylrbwqk);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setTiaojian(bfzt);
		gcglabgc.setJhnf(xmnf);
		System.out.println(gcglabgc.getTbyf()+"----"+gcglabgc.getTbr());
		List<Excel_list> list=gcglabgcServer.exportwqyb(gcglabgc);

		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("危桥改造车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("危桥改造车购税拨付信息导入表");//设置文件名
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("管养单位",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("桥梁编号",1,1,3,3));
		et.add(new Excel_tilte("桥梁名称",1,1,4,4));
		et.add(new Excel_tilte("技术等级",1,1,5,5));
		et.add(new Excel_tilte("桥梁中心桩号",1,1,6,6));
		et.add(new Excel_tilte("批复总投资(万元)",1,1,7,7));
		et.add(new Excel_tilte("计划部投资(万元)",1,1,8,8));
		et.add(new Excel_tilte("计划地方自筹(万元)",1,1,9,9));
		et.add(new Excel_tilte("拨付中央车购税(万元)",1,1,10,10));
		et.add(new Excel_tilte("拨付省投资(万元)",1,1,11,11));
		et.add(new Excel_tilte("财审处意见",1,1,12,12));
		et.add(new Excel_tilte("填报月份",1,1,13,13));
		et.add(new Excel_tilte("填报时间",1,1,14,14));
		et.add(new Excel_tilte("填报人",1,1,15,15));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel		
		
	}
	public void selectAbgcjhList1(){
		gcglabgc.setPage(page);
		gcglabgc.setRows(rows);
		try {
			String tiaojian1="";
			if("af".equals(gcglabgc.getXmlx())){
				if(gydw.indexOf(",")==-1){
					tiaojian1="and t3.gydwdm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
				}else{
					tiaojian1="and t3.gydwdm in ("+gydw+")";
				}
			}else{
				if(gydw.indexOf(",")==-1){
					tiaojian1="and t3.gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
				}else{
					tiaojian1="and t3.gydwbm in ("+gydw+")";
				}
			}

			String tiaojian2="";
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and t3.xzqhdm like '%'||'"+xzqh+"'||'%'";
			}else{
				tiaojian2="and t3.xzqhdm in ("+xzqh+")";
			}
		gcglabgc.setXzqhdm(tiaojian2);	
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(bfyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setTiaojian(bfzt);
		String[] nfs=xmnf.split(",");
		String tj="";
		for (int i = 0; i < nfs.length; i++) {
			if(i==0)
				tj+=" and ( xdjh.xdsj like '%"+nfs[i]+"%'";
			else 
				tj+="or xdjh.xdsj like '%"+nfs[i]+"%'";
		}
		tj+=")";
		System.out.println(tj);
		gcglabgc.setXmnf(tj);
		List<Gcglabgc> list=null;
		int count=0;
		if("af".equals(gcglabgc.getXmlx())){
			list=gcglabgcServer.selectafjhList1(gcglabgc);
			count=gcglabgcServer.selectafjhListcount1(gcglabgc);
		}else{
			list=gcglabgcServer.selectWqgzjhList1(gcglabgc);
			count=gcglabgcServer.selectWqgzjhListcount1(gcglabgc);
		}
		EasyUIPage<Gcglabgc> e=new EasyUIPage<Gcglabgc>();
		e.setRows(list);
		e.setTotal(count);
		
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectabgcxx(){
		gcglabgc.setJhid(jhid);
		Gcglabgc gcglabgc1=gcglabgcServer.selectabgcxx(gcglabgc);
		try {
			JsonUtils.write(gcglabgc1, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dcabgcExcel(){
		System.out.println(gcglabgc.getWgnf());
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if("af".equals(gcglabgc.getXmlx())){
			if(gydws.indexOf(",")==-1){
				gcglabgc.setGydw("and xm.gydwdm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
			}else{
				gcglabgc.setGydw("and xm.gydwdm in ("+gydws+")");
			}
		}else{
			if(gydws.indexOf(",")==-1){
				gcglabgc.setGydw("and xm.gydwbm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
			}else{
				gcglabgc.setGydw("and xm.gydwbm in ("+gydws+")");
			}
		}
		
		String tiaojian2="";
		if(xzqhs.indexOf(",")==-1){
			tiaojian2="and xm.xzqhdm like '%'||'"+xzqhs+"'||'%'";
		}else{
			tiaojian2="and xm.xzqhdm in ("+xzqhs+")";
		}
		gcglabgc.setXzqhdm(tiaojian2);
		if(gcglabgc.getSfsj()==7){
			gcglabgc.setTiaojian("sjsh");
		}
		if(gcglabgc.getSfsj()==9){
			gcglabgc.setTiaojian("sjzt");
		}
		if(gcglabgc.getSfsj()==11){
			gcglabgc.setTiaojian("xjzt");
		}
		String xmnfStr = gcglabgc.getXmnf();
		if(xmnfStr.indexOf(",") == -1){
			xmnf="and pl.jhnf="+xmnfStr;
		}else{
			xmnf="and pl.jhnf in ("+xmnfStr+")";
		}
		gcglabgc.setXmnf(xmnf);
		
		List<Excel_list> l =new ArrayList<Excel_list>();
		ExcelData eldata=new ExcelData();//创建一个类
		if("af".equals(gcglabgc.getXmlx())){
			l = gcglabgcServer.dcafgcExcel(gcglabgc);
			eldata.setTitleName("市农村公路安防工程项目建设表");//设置第一行
			eldata.setSheetName("安防工程");//设置sheeet名
			eldata.setFileName("市农村公路安防工程项目建设表");//设置文件名
		}else{
			l = gcglabgcServer.dcabgcExcel(gcglabgc);
			eldata.setTitleName("市农村公路安保工程项目建设表");//设置第一行
			eldata.setSheetName("安保工程");//设置sheeet名
			eldata.setFileName("市农村公路安保工程项目建设表");//设置文件名
		}
		
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,3,0,0));
		et.add(new Excel_tilte("县(市、区)",1,3,1,1));
		et.add(new Excel_tilte("是否17个罗宵山区连片特困县",1,3,2,2));
		et.add(new Excel_tilte("是否38个原中央苏区和特困片区县",1,3,3,3));
		et.add(new Excel_tilte("是否54个赣南等原中央苏区县",1,3,4,4));
		et.add(new Excel_tilte("是否21个国家贫困县",1,3,5,5));
		et.add(new Excel_tilte("计划情况",1,1,6,19));
		et.add(new Excel_tilte("建设进展情况",1,1,20,32));
		et.add(new Excel_tilte("资金落实情况",1,1,33,38));
		et.add(new Excel_tilte("备注",1,3,39,39));
		et.add(new Excel_tilte("行政区划代码",2,3,6,6));
		et.add(new Excel_tilte("行政区划名称",2,3,7,7));
		et.add(new Excel_tilte("路线编码",2,3,8,8));
		et.add(new Excel_tilte("路线名称",2,3,9,9));
		et.add(new Excel_tilte("起点桩号",2,3,10,10));
		et.add(new Excel_tilte("止点桩号",2,3,11,11));
		et.add(new Excel_tilte("处理隐患里程（公里）",2,3,12,12));
		et.add(new Excel_tilte("建设性质",2,3,13,13));
		et.add(new Excel_tilte("计划下达时间",2,3,14,14));
		et.add(new Excel_tilte("计划开工时间",2,3,15,15));
		et.add(new Excel_tilte("计划完成时间",2,3,16,16));
		et.add(new Excel_tilte("预计竣工时间",2,3,17,17));
		et.add(new Excel_tilte("总投资（万元）",2,3,18,18));
		et.add(new Excel_tilte("其中中央投资(万元)",2,3,19,19));
		et.add(new Excel_tilte("实际开工时间",2,3,20,20));
		et.add(new Excel_tilte("工程竣工时间",2,3,21,21));
		et.add(new Excel_tilte("建设单位",2,3,22,22));
		et.add(new Excel_tilte("设计单位",2,3,23,23));
		et.add(new Excel_tilte("施工单位",2,3,24,24));
		et.add(new Excel_tilte("监理单位",2,3,25,25));
		et.add(new Excel_tilte("完成总投资（万元）",2,3,26,26));
		et.add(new Excel_tilte("本年完成里程（公里）",2,3,27,27));
		et.add(new Excel_tilte("完成总投资（万元）",2,3,28,28));
		et.add(new Excel_tilte("完成中央投资(万元)",2,3,29,29));
		et.add(new Excel_tilte("完成地方自筹(万元)",2,3,30,30));
		et.add(new Excel_tilte("本年完成投资（万元）",2,3,31,31));
		et.add(new Excel_tilte("项目验收里程(公里)",2,3,32,32));
		et.add(new Excel_tilte("车购税补助资金",2,2,33,35));
		et.add(new Excel_tilte("地方配套资金",2,2,36,38));
		et.add(new Excel_tilte("计划补助资金(万元)",3,3,33,33));
		et.add(new Excel_tilte("到位金额(万元) ",3,3,34,34));
		et.add(new Excel_tilte("到位率(%)",3,3,35,35));
		et.add(new Excel_tilte("应配套资金(万元)",3,3,36,36));
		et.add(new Excel_tilte("到位金额(万元) ",3,3,37,37));
		et.add(new Excel_tilte("到位率(%)",3,3,38,38));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectAbtj(){
		try{
		String tiaojian1="";
		if("af".equals(gcglabgc.getXmlx())){
			if(gydw.indexOf(",")==-1){
				tiaojian1="and t3.gydwdm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
			}else{
				tiaojian1="and t3.gydwdm in ("+gydw+")";
			}
		}
		else{
			if(gydw.indexOf(",")==-1){
				tiaojian1="and t3.gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'";
			}else{
				tiaojian1="and t3.gydwbm in ("+gydw+")";
			}
		}
		String tiaojian2="";
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and t3.xzqhdm like '%'||'"+xzqh+"'||'%'";
		}else{
			tiaojian2="and t3.xzqhdm in ("+xzqh+")";
		}
		gcglabgc.setGldj(MyUtil.getQueryTJ(gcglabgc.getGldj(), "substr(t3.lxbm,0,1)"));

		gcglabgc.setXzqhdm(tiaojian2);	
		gcglabgc.setPage(page);
		gcglabgc.setRows(rows);
		gcglabgc.setJhid(jhid);
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setShzt(ybzt);
		gcglabgc.setXmnf(xmnf);
		gcglabgc.setWgnf(wgnf);
		if(sfsj==7){
			gcglabgc.setTiaojian("sjsh");
		}
		if(sfsj==9){
			gcglabgc.setTiaojian("sjzt");
		}
		if(sfsj==11){
			gcglabgc.setTiaojian("xjzt");
		}
		Gcglwqgz tjs=null;
		if("af".equals(gcglabgc.getXmlx())){
			tjs=gcglabgcServer.selectafTJ(gcglabgc);
		}else{
			tjs=gcglabgcServer.selectabTJ(gcglabgc);
		}
		
		JsonUtils.write(tjs, getresponse().getWriter());
	} catch (Exception e1) {
		e1.printStackTrace();
	}
	}
//wdd查询工程管理安保项目月报页面内的那行统计  start
	public void queryAbxmYb(){
		System.out.println(jhid+"========");
		try {
			Gcglabgc ga=gcglabgcServer.queryAbxmYb(jhid);
			System.out.println(ga+"-------------");
			JsonUtils.write(gcglabgcServer.queryAbxmYb(jhid), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
//wdd查询工程管理安保项目月报页面内的那行统计	end	
	}
	
	
	//资金拨付上报审核退回三合一
	public void zjbf_sbshth(){
		try {
			ResponseUtils.write(getresponse(), ""+gcglabgcServer.zjbf_sbshth(gcglabgc));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
