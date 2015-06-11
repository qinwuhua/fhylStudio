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
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;
import com.hdsx.jxzhpt.gcgl.server.XjgcServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
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
public class XjgcController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "xjgcServerImpl")
	private XjgcServer xjgcServer;
	
	private Gcglgcgzgj gcglgcgzgj = new Gcglgcgzgj();
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
	private String bfzt;
	private String bfyf;
	private String xmnf;
	private String flag;
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
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
	public void insertxjYb(){
		if("县级".equals(yhtype)){
			gcglgcgzgj.setSfsj(11);
		}
		if("市级".equals(yhtype)){
			gcglgcgzgj.setSfsj(9);
		}
		if("省级".equals(yhtype)){
			gcglgcgzgj.setSfsj(7);
		}
		Boolean bl=xjgcServer.insertgcgzgjYb(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectxjgcYbByJhid(){
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		gcglgcgzgj.setSfsj(sfsj);
		int count=xjgcServer.selectgcgzgjYbByJhidCount(gcglgcgzgj);
		List<Gcglgcgzgj> list=xjgcServer.selectgcgzgjYbByJhid(gcglgcgzgj);
		EasyUIPage<Gcglgcgzgj> e=new EasyUIPage<Gcglgcgzgj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//查询月报
	public void selectxjgcYbByJhid1(){
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		int count=xjgcServer.selectgcgzgjYbByJhidCount1(gcglgcgzgj);
		List<Gcglgcgzgj> list=xjgcServer.selectgcgzgjYbByJhid1(gcglgcgzgj);
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
	public void updatexjgcYb(){
		Boolean bl=xjgcServer.updategcgzgjYb(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//删除月报
	public void deletexjYb(){
		Boolean bl=xjgcServer.deletegcgzgjYb(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//审核月报
	public void shxjYb(){
		Boolean bl=xjgcServer.shgcgzgjYb(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//添加车购税
	public void insertXjCgs(){
		Boolean bl=xjgcServer.insertGcgzgjCgs(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询cgs
	public void selectXjCgsList(){
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		int count=xjgcServer.selectGcgzgjCgsListCount(gcglgcgzgj);
		List<Gcglgcgzgj> list=xjgcServer.selectGcgzgjCgsList(gcglgcgzgj);
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
	public void updateXjCgs(){
		Boolean bl=xjgcServer.updateGcgzgjCgs(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deleteXjCgs(){
		Boolean bl=xjgcServer.deleteGcgzgjCgs(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	//
	
	public void uploadGcgzgjFile() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		String jhid1=jhid;
		String type1=type;
		gcglgcgzgj.setJhid(jhid);
		gcglgcgzgj.setTiaojian(type);
		Gcglgcgzgj gcglgcgzgj1=xjgcServer.downWqgzFile(gcglgcgzgj);
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
		String tiaojian=fileuploadFileName;
		
		gcglgcgzgj.setTiaojian(tiaojian);
		gcglgcgzgj.setJhid(jhid1);
		InputStream inputStream = new FileInputStream(fileupload);
		boolean bl = false;
		if("sgxkwj".equals(type1)){
			gcglgcgzgj.setSgxkwjfile(inputStreamToByte(inputStream));
			bl=xjgcServer.uploadWqgzFilesgxk(gcglgcgzgj);
		}
		if("jgtcwj".equals(type1)){
			gcglgcgzgj.setJgtcwjfile(inputStreamToByte(inputStream));
			bl=xjgcServer.uploadWqgzFilejgtc(gcglgcgzgj);
		}
		if("jgyswj".equals(type1)){
			gcglgcgzgj.setJgyswjfile(inputStreamToByte(inputStream));
			bl=xjgcServer.uploadWqgzFilejgys(gcglgcgzgj);
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
	public void downGcgzgjFile() throws IOException{
		try{
		HttpServletResponse response = getresponse();
		OutputStream out = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("octets/stream");
		gcglgcgzgj.setJhid(jhid);
		gcglgcgzgj.setTiaojian(type);
		gcglgcgzgj.setLxmc(type+"file");
		Gcglgcgzgj gcglgcgzgj1=xjgcServer.downWqgzFile(gcglgcgzgj);
		byte[] data = gcglgcgzgj1.getSgxkwjfile();
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglgcgzgj1.getTiaojian();
		
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
		File file=new File(realPath+"upload\\"+gcglgcgzgj1.getTiaojian());
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
	public void insertXjgckg(){
		Boolean bl=xjgcServer.insertWqgzkg(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertXjwg(){
		Boolean bl=xjgcServer.insertWqgzwg(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertXjwwg(){
		Boolean bl=xjgcServer.insertWqgzwwg(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询jihua
	public void selectGcgzgjjhList(){
		Gcglgcgzgj gcglgcgzgj=new Gcglgcgzgj();

		gcglgcgzgj.setJhid(jhid);

		List<Gcglgcgzgj> list=xjgcServer.selectWqgzjhList1(gcglgcgzgj);
		
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}		
	public void selectGcgzgjjhFile(){
		gcglgcgzgj.setJhid(jhid);
		Gcglgcgzgj g= xjgcServer.selectWqgzjhFile(gcglgcgzgj);
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
		gcglgcgzgj.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type)){
			gcglgcgzgj.setSgxkwjfile(new byte[] {});
			bl=xjgcServer.uploadWqgzFilesgxk(gcglgcgzgj);
		}
		if("jgtcwj".equals(type)){
			gcglgcgzgj.setJgtcwjfile(new byte[] {});
			bl=xjgcServer.uploadWqgzFilejgtc(gcglgcgzgj);
		}
		if("jgyswj".equals(type)){
			gcglgcgzgj.setJgyswjfile(new byte[] {});
			bl=xjgcServer.uploadWqgzFilejgys(gcglgcgzgj);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	//修改月报状态
	public void sbXjYb(){
		System.out.println(gcglgcgzgj);
		Boolean bl=xjgcServer.sbWqgzYb(gcglgcgzgj);
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
	
	
	//查询jihua
	public void selectXjgcjhList1(){
		//System.out.println("--------------------------------------------------");
		try {
		Gcglgcgzgj gcglgcgzgj=new Gcglgcgzgj();
		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and xzqhdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and xzqhdm in ("+gydw+")";
		}
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		gcglgcgzgj.setGydw(tiaojian1);
		gcglgcgzgj.setKgzt(kgzt);
		gcglgcgzgj.setLxmc(lxmc);
		gcglgcgzgj.setJgzt(jgzt);
		gcglgcgzgj.setShzt(ybzt);
		gcglgcgzgj.setSbnf(xmnf);
		if(sfsj==7){
			gcglgcgzgj.setTiaojian("sjsh");
		}
		if(sfsj==9){
			gcglgcgzgj.setTiaojian("sjzt");
		}
		if(sfsj==11){
			gcglgcgzgj.setTiaojian("xjzt");
		}
		List<Map<String,Object>> list=xjgcServer.queryGcgjList(gcglgcgzgj);
		
		int count=xjgcServer.queryGcgjListCount(gcglgcgzgj);
		
		EasyUIPage<Map<String,Object>> e=new EasyUIPage<Map<String,Object>>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}		
	
	//查询jihua2
		public void selectXjjhList2(){
			Gcglgcgzgj gcglgcgzgj=new Gcglgcgzgj();
			String tiaojian1="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and xzqhdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and xzqhdm in ("+gydw+")";
			}
			gcglgcgzgj.setPage(page);
			gcglgcgzgj.setRows(rows);
			gcglgcgzgj.setJhid(jhid);
			gcglgcgzgj.setGydw(tiaojian1);
			gcglgcgzgj.setKgzt(kgzt);
			gcglgcgzgj.setLxmc(lxmc);
			gcglgcgzgj.setJgzt(jgzt);
			gcglgcgzgj.setShzt(ybzt);
			gcglgcgzgj.setTbyf(bfyf);
			gcglgcgzgj.setSbnf(xmnf);
			gcglgcgzgj.setTiaojian(bfzt);
			try{
			List<Map<String,Object>> list=xjgcServer.selectWqgzjhList2(gcglgcgzgj);
			int count=xjgcServer.selectWqgzjhListcount1(gcglgcgzgj);
			EasyUIPage<Map<String,Object>> e=new EasyUIPage<Map<String,Object>>();
			e.setRows(list);
			e.setTotal(count);
			
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		public void updataSFQX(){
			boolean fanhui=false;
		try{
			if("gcgj".equals(flag)){
				fanhui = xjgcServer.updatagjSFQX(gcglgcgzgj);
			}
			if("gcsj".equals(flag)){
				fanhui = xjgcServer.updatasjSFQX(gcglgcgzgj);		
			}
			if("sh".equals(flag)){
				fanhui = xjgcServer.updatashSFQX(gcglgcgzgj);
			}
			if("hsly".equals(flag)){
				fanhui = xjgcServer.updatahslySFQX(gcglgcgzgj);
			}
			JsonUtils.write(fanhui, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		}
}
