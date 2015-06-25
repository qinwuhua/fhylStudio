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
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_yhdzx;
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
public class GcglyhdzxController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglyhdzxServerImpl")
	private GcglyhdzxServer gcglyhdzxServer;
	
	private Gcglyhdzx gcglyhdzx = new Gcglyhdzx();
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
	private String bfyf;
	private String bfzt;
	private String xmnf;
	
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getBfyf() {
		return bfyf;
	}
	public void setBfyf(String bfyf) {
		this.bfyf = bfyf;
	}
	public String getBfzt() {
		return bfzt;
	}
	public void setBfzt(String bfzt) {
		this.bfzt = bfzt;
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
	
	public Gcglyhdzx getGcglyhdzx() {
		return gcglyhdzx;
	}
	public void setGcglyhdzx(Gcglyhdzx gcglyhdzx) {
		this.gcglyhdzx = gcglyhdzx;
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
	public void insertYhdzxYb(){
		if("县级".equals(yhtype)){
			gcglyhdzx.setSfsj(11);
		}
		if("市级".equals(yhtype)){
			gcglyhdzx.setSfsj(9);
		}
		if("省级".equals(yhtype)){
			gcglyhdzx.setSfsj(7);
		}
		Boolean bl=gcglyhdzxServer.insertYhdzxYb(gcglyhdzx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectYhdzxYbByJhid(){
		Gcglyhdzx gcglyhdzx = new Gcglyhdzx();
		gcglyhdzx.setPage(page);
		gcglyhdzx.setRows(rows);
		gcglyhdzx.setJhid(jhid);
		gcglyhdzx.setSfsj(sfsj);
		int count=gcglyhdzxServer.selectYhdzxYbByJhidCount(gcglyhdzx);
		List<Gcglyhdzx> list=gcglyhdzxServer.selectYhdzxYbByJhid(gcglyhdzx);
		EasyUIPage<Gcglyhdzx> e=new EasyUIPage<Gcglyhdzx>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//查询月报
	public void selectYhdzxYbByJhid1(){
		Gcglyhdzx gcglyhdzx = new Gcglyhdzx();
		gcglyhdzx.setPage(page);
		gcglyhdzx.setRows(rows);
		gcglyhdzx.setJhid(jhid);
		int count=gcglyhdzxServer.selectYhdzxYbByJhidCount1(gcglyhdzx);
		List<Gcglyhdzx> list=gcglyhdzxServer.selectYhdzxYbByJhid1(gcglyhdzx);
		EasyUIPage<Gcglyhdzx> e=new EasyUIPage<Gcglyhdzx>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	//修改月报
	public void updateYhdzxYb(){
		Boolean bl=gcglyhdzxServer.updateYhdzxYb(gcglyhdzx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//删除月报
	public void deleteYhdzxYb(){
		Boolean bl=gcglyhdzxServer.deleteYhdzxYb(gcglyhdzx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//审核月报
	public void shYhdzxYb(){
		Boolean bl=gcglyhdzxServer.shYhdzxYb(gcglyhdzx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	// 添加车购税
	public void insertYhdzxCgs() {
		Boolean bl = gcglyhdzxServer.insertYhdzxCgs(gcglyhdzx);
		if (bl) {
			ResponseUtils.write(getresponse(), "true");
		} else {
			ResponseUtils.write(getresponse(), "false");
		}
	}

	// 查询cgs
	public void selectYhdzxCgsList() {
		gcglyhdzx.setPage(page);
		gcglyhdzx.setRows(rows);
		gcglyhdzx.setJhid(jhid);
		int count = gcglyhdzxServer.selectYhdzxCgsListCount(gcglyhdzx);
		List<Gcglabgc> list = gcglyhdzxServer.selectYhdzxCgsList(gcglyhdzx);
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
	public void updateYhdzxCgs() {
		Boolean bl = gcglyhdzxServer.updateYhdzxCgs(gcglyhdzx);
		if (bl) {
			ResponseUtils.write(getresponse(), "true");
		} else {
			ResponseUtils.write(getresponse(), "false");
		}
	}

	public void deleteYhdzxCgs() {
		Boolean bl = gcglyhdzxServer.deleteYhdzxCgs(gcglyhdzx);
		if (bl) {
			ResponseUtils.write(getresponse(), "true");
		} else {
			ResponseUtils.write(getresponse(), "false");
		}
	}		
	//
	
	public void uploadYhdzxFile() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		String jhid1=jhid;
		String type1=type;
		gcglyhdzx.setJhid(jhid);
		gcglyhdzx.setTiaojian(type);
		Gcglyhdzx gcglyhdzx1=gcglyhdzxServer.downWqgzFile(gcglyhdzx);
		System.out.println(gcglyhdzx1);
		if(gcglyhdzx1!=null)
		if(gcglyhdzx1.getTiaojian()!=""||gcglyhdzx1.getTiaojian()!=null){
			try {
				response.getWriter().print("附件已存在，导入失败");
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String tiaojian=fileuploadFileName;
		gcglyhdzx.setTiaojian(tiaojian);
		gcglyhdzx.setJhid(jhid1);
		InputStream inputStream = new FileInputStream(fileupload);
		boolean bl = false;
		if("sgxkwj".equals(type1)){
			gcglyhdzx.setSgxkwjfile(inputStreamToByte(inputStream));
			bl=gcglyhdzxServer.uploadWqgzFilesgxk(gcglyhdzx);
		}
		if("jgtcwj".equals(type1)){
			gcglyhdzx.setJgtcwjfile(inputStreamToByte(inputStream));
			bl=gcglyhdzxServer.uploadWqgzFilejgtc(gcglyhdzx);
		}
		if("jgyswj".equals(type1)){
			gcglyhdzx.setJgyswjfile(inputStreamToByte(inputStream));
			bl=gcglyhdzxServer.uploadWqgzFilejgys(gcglyhdzx);
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
	public void downYhdzxFile() throws IOException{
		try{
		HttpServletResponse response = getresponse();
		OutputStream out = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("octets/stream");
		gcglyhdzx.setJhid(jhid);
		gcglyhdzx.setTiaojian(type);
		gcglyhdzx.setLxmc(type+"file");
		Gcglyhdzx gcglyhdzx1=gcglyhdzxServer.downWqgzFile(gcglyhdzx);
		byte[] data = gcglyhdzx1.getSgxkwjfile();
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglyhdzx1.getTiaojian();
		
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
		File file=new File(realPath+"upload\\"+gcglyhdzx1.getTiaojian());
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
	public void insertYhdzxkg(){
		Boolean bl=gcglyhdzxServer.insertWqgzkg(gcglyhdzx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertYhdzxwg(){
		Boolean bl=gcglyhdzxServer.insertWqgzwg(gcglyhdzx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertYhdzxwwg(){
		Boolean bl=gcglyhdzxServer.insertWqgzwwg(gcglyhdzx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询jihua
	public void selectYhdzxjhList(){
		Gcglyhdzx gcglyhdzx=new Gcglyhdzx();
		try {
			String tiaojian1="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and xzqhdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and xzqhdm in ("+gydw+")";
			}
		gcglyhdzx.setPage(page);
		gcglyhdzx.setRows(rows);
		gcglyhdzx.setJhid(jhid);
		gcglyhdzx.setGydw(tiaojian1);
		gcglyhdzx.setKgzt(kgzt);
		gcglyhdzx.setLxmc(lxmc);
		gcglyhdzx.setJgzt(jgzt);
		gcglyhdzx.setShzt(ybzt);
		gcglyhdzx.setXmnf(xmnf);
		if(sfsj==7){
			gcglyhdzx.setTiaojian("sjsh");
		}
		if(sfsj==9){
			gcglyhdzx.setTiaojian("sjzt");
		}
		if(sfsj==11){
			gcglyhdzx.setTiaojian("xjzt");
		}
		List<Map<String, Object>> list=gcglyhdzxServer.queryGcgjList(gcglyhdzx);
		int count=gcglyhdzxServer.queryGcgjListCount(gcglyhdzx);
		EasyUIPage<Map<String, Object>> e=new EasyUIPage<Map<String, Object>>();
		e.setRows(list);
		e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}		
	public void selectYhdzxjhFile(){
		gcglyhdzx.setJhid(jhid);
		Gcglyhdzx g= gcglyhdzxServer.selectWqgzjhFile(gcglyhdzx);
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
	public void deleteYhdzxFile(){
		
		gcglyhdzx.setJhid(jhid);
		gcglyhdzx.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type)){
			gcglyhdzx.setSgxkwjfile(new byte[]{});
			bl=gcglyhdzxServer.uploadWqgzFilesgxk(gcglyhdzx);
		}
		if("jgtcwj".equals(type)){
			gcglyhdzx.setJgtcwjfile(new byte[]{});
			bl=gcglyhdzxServer.uploadWqgzFilejgtc(gcglyhdzx);
		}
		if("jgyswj".equals(type)){
			gcglyhdzx.setJgyswjfile(new byte[]{});
			bl=gcglyhdzxServer.uploadWqgzFilejgys(gcglyhdzx);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	//修改月报状态
	public void sbYhdzxYb(){
		System.out.println(gcglyhdzx);
		Boolean bl=gcglyhdzxServer.sbWqgzYb(gcglyhdzx);
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
	public void selectYhdzxjhList1(){
		gcglyhdzx.setPage(page);
		gcglyhdzx.setRows(rows);
		try {
				String tiaojian1="";
				if(gydw.indexOf(",")==-1){
					tiaojian1="and xzqhdm like '%"+gydw+"%'";
				}else{
					tiaojian1="and xzqhdm in ("+gydw+")";
				}
		gcglyhdzx.setGydw(tiaojian1);
		gcglyhdzx.setKgzt(kgzt);
		gcglyhdzx.setLxmc(lxmc);
		gcglyhdzx.setJgzt(jgzt);
		gcglyhdzx.setShzt(ybzt);
		gcglyhdzx.setTbyf(bfyf);
		gcglyhdzx.setSbnf(xmnf);
		gcglyhdzx.setTiaojian(bfzt);
		List<Map<String, Object>> list=gcglyhdzxServer.selectWqgzjhList2(gcglyhdzx);
		int count=gcglyhdzxServer.selectWqgzjhListcount1(gcglyhdzx);
		EasyUIPage<Map<String, Object>> e=new EasyUIPage<Map<String, Object>>();
		e.setRows(list);
		e.setTotal(count);
		
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
}
