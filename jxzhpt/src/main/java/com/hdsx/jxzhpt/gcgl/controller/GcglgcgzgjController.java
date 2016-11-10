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
import com.hdsx.jxzhpt.gcgl.server.GcglgcgzgjServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;
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
	public void insertgcgzgjYb(){
		if("县级".equals(yhtype)){
			gcglgcgzgj.setSfsj(11);
		}
		if("市级".equals(yhtype)){
			gcglgcgzgj.setSfsj(9);
		}
		if("省级".equals(yhtype)){
			gcglgcgzgj.setSfsj(7);
		}
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
		gcglgcgzgj.setSfsj(sfsj);
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
	//查询月报
	public void selectgcgzgjYbByJhid1(){
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		int count=gcglgcgzgjServer.selectgcgzgjYbByJhidCount1(gcglgcgzgj);
		List<Gcglgcgzgj> list=gcglgcgzgjServer.selectgcgzgjYbByJhid1(gcglgcgzgj);
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
	public void selgcgzgjZgYbByJhid(){
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		int count=gcglgcgzgjServer.selgcgzgjZgYbByJhidCount(gcglgcgzgj);
		List<Gcglgcgzgj> list=gcglgcgzgjServer.selgcgzgjZgYbByJhid(gcglgcgzgj);
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
	//综规审核月报
	public void zgshYb(){
		Boolean bl=gcglgcgzgjServer.zgshYb(gcglgcgzgj);
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
	
	public void uploadGcgzgjFile() throws Exception{
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
		String tiaojian=fileuploadFileName;
		
		gcglgcgzgj.setTiaojian(tiaojian);
		gcglgcgzgj.setJhid(jhid1);
		InputStream inputStream = new FileInputStream(fileupload);
		boolean bl = false;
		if("sgxkwj".equals(type1)){
			gcglgcgzgj.setSgxkwjfile(inputStreamToByte(inputStream));
			bl=gcglgcgzgjServer.uploadWqgzFilesgxk(gcglgcgzgj);
		}
		if("jgtcwj".equals(type1)){
			gcglgcgzgj.setJgtcwjfile(inputStreamToByte(inputStream));
			bl=gcglgcgzgjServer.uploadWqgzFilejgtc(gcglgcgzgj);
		}
		if("jgyswj".equals(type1)){
			gcglgcgzgj.setJgyswjfile(inputStreamToByte(inputStream));
			bl=gcglgcgzgjServer.uploadWqgzFilejgys(gcglgcgzgj);
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
		Gcglgcgzgj gcglgcgzgj1=gcglgcgzgjServer.downWqgzFile(gcglgcgzgj);
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

		gcglgcgzgj.setJhid(jhid);

		List<Gcglgcgzgj> list=gcglgcgzgjServer.selectWqgzjhList1(gcglgcgzgj);
		
		try {
			JsonUtils.write(list, getresponse().getWriter());
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
		gcglgcgzgj.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type)){
			gcglgcgzgj.setSgxkwjfile(new byte[] {});
			bl=gcglgcgzgjServer.uploadWqgzFilesgxk(gcglgcgzgj);
		}
		if("jgtcwj".equals(type)){
			gcglgcgzgj.setJgtcwjfile(new byte[] {});
			bl=gcglgcgzgjServer.uploadWqgzFilejgtc(gcglgcgzgj);
		}
		if("jgyswj".equals(type)){
			gcglgcgzgj.setJgyswjfile(new byte[] {});
			bl=gcglgcgzgjServer.uploadWqgzFilejgys(gcglgcgzgj);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	//修改月报状态
	public void sbGcgzgjYb(){
		System.out.println(gcglgcgzgj);
		Boolean bl=gcglgcgzgjServer.sbWqgzYb(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//综规退回月报
	public void zgthYb(){
		System.out.println(gcglgcgzgj);
		Boolean bl=gcglgcgzgjServer.zgthYb(gcglgcgzgj);
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
	
	public String xzqhBm2(String bh,String name){
		String result="";
		if(bh!=null){
			if(bh.indexOf(",")==-1){
				int i=0;
				if(bh.matches("^[0-9]*[1-9]00$")){
					i=2;
				}else if(bh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				bh=bh.substring(0,bh.length()-i);
			}
			String[] s = bh.split(",");
			for (int i = 0; i < s.length; i++) {
				if(i==0)
					result+=" and ("+name+" like '%"+s[i]+"%'";
				else
					result+=" or "+name+" like '%"+s[i]+"%'";
			}
			result+=")";
			//System.out.println(result);
			//result= bh.indexOf(",")==-1 ? " x."+name+" like '%"+bh+"%'": "x."+name+" in ("+bh+")";
		}
		return result;
	}
	
	//查询jihua
	public void selectGcgzgjjhList1(){
		try {
		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and xzqhdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and xzqhdm in ("+gydw+")";
		}
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		gcglgcgzgj.setGydw(xzqhBm2(gydw,"xzqhdm2"));
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
		System.out.println(gcglgcgzgj.getXmmc()+"---------------------");
		List<Map<String,Object>> list=gcglgcgzgjServer.queryGcgjList(gcglgcgzgj);
		
		int count=gcglgcgzgjServer.queryGcgjListCount(gcglgcgzgj);
		
		EasyUIPage<Map<String,Object>> e=new EasyUIPage<Map<String,Object>>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}		
	
	//查询jihua2
		public void selectGcgzgjjhList2(){
			
			String tiaojian1="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and xzqhdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and xzqhdm in ("+gydw+")";
			}
			gcglgcgzgj.setPage(page);
			gcglgcgzgj.setRows(rows);
			gcglgcgzgj.setJhid(jhid);
			gcglgcgzgj.setGydw(xzqhBm2(gydw,"xzqhdm2"));
			gcglgcgzgj.setKgzt(kgzt);
			gcglgcgzgj.setLxmc(lxmc);
			gcglgcgzgj.setJgzt(jgzt);
			gcglgcgzgj.setShzt(ybzt);
			gcglgcgzgj.setTbyf(bfyf);
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
			gcglgcgzgj.setSbnf(tj);
			gcglgcgzgj.setTiaojian(bfzt);
			try{
			List<Map<String,Object>> list=gcglgcgzgjServer.selectWqgzjhList2(gcglgcgzgj);
			int count=gcglgcgzgjServer.selectWqgzjhListcount1(gcglgcgzgj);
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
				fanhui = gcglgcgzgjServer.updatagjSFQX(gcglgcgzgj);
			}
			if("xjgc".equals(flag)){
				fanhui = gcglgcgzgjServer.updataxjSFQX(gcglgcgzgj);
			}
			if("gcsj".equals(flag)){
				fanhui = gcglgcgzgjServer.updatasjSFQX(gcglgcgzgj);		
			}
			if("sh".equals(flag)){
				fanhui = gcglgcgzgjServer.updatashSFQX(gcglgcgzgj);
			}
			if("hsly".equals(flag)){
				fanhui = gcglgcgzgjServer.updatahslySFQX(gcglgcgzgj);
			}
			JsonUtils.write(fanhui, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		}
		
}
