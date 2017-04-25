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
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
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
		if("县级".equals(yhtype)){
			gcglgcgzsj.setSfsj(11);
		}
		if("市级".equals(yhtype)){
			gcglgcgzsj.setSfsj(9);
		}
		if("省级".equals(yhtype)){
			gcglgcgzsj.setSfsj(7);
		}
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
		gcglgcgzsj.setSfsj(sfsj);
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
	//查询月报
	public void selectgcgzsjYbByJhid1(){
		gcglgcgzsj.setPage(page);
		gcglgcgzsj.setRows(rows);
		gcglgcgzsj.setJhid(jhid);
		int count=gcglgcgzsjServer.selectgcgzsjYbByJhidCount1(gcglgcgzsj);
		List<Gcglgcgzsj> list=gcglgcgzsjServer.selectgcgzsjYbByJhid1(gcglgcgzsj);
		EasyUIPage<Gcglgcgzsj> e=new EasyUIPage<Gcglgcgzsj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//查询已审核月报
	public void selgcgzsjZgYbByJhid(){
		gcglgcgzsj.setPage(page);
		gcglgcgzsj.setRows(rows);
		gcglgcgzsj.setJhid(jhid);
		int count=gcglgcgzsjServer.selgcgzsjZgYbByJhidCount(gcglgcgzsj);
		List<Gcglgcgzsj> list=gcglgcgzsjServer.selgcgzsjZgYbByJhid(gcglgcgzsj);
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
	//综规审核月报
	public void zgshgcgzsjyb(){
		Boolean bl=gcglgcgzsjServer.zgshgcgzsjyb(gcglgcgzsj);
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
	
	public void uploadGcgzsjFile() throws Exception{
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
		String tiaojian=fileuploadFileName;
		
		gcglgcgzsj.setTiaojian(tiaojian);
		gcglgcgzsj.setJhid(jhid1);
		InputStream inputStream = new FileInputStream(fileupload);
		boolean bl = false;
		if("sgxkwj".equals(type1)){
			gcglgcgzsj.setSgxkwjfile(inputStreamToByte(inputStream));
			bl=gcglgcgzsjServer.uploadWqgzFilesgxk(gcglgcgzsj);
		}
		if("jgtcwj".equals(type1)){
			gcglgcgzsj.setJgtcwjfile(inputStreamToByte(inputStream));
			bl=gcglgcgzsjServer.uploadWqgzFilejgtc(gcglgcgzsj);
		}
		if("jgyswj".equals(type1)){
			gcglgcgzsj.setJgyswjfile(inputStreamToByte(inputStream));
			bl=gcglgcgzsjServer.uploadWqgzFilejgys(gcglgcgzsj);
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
	public void downGcgzsjFile() throws IOException{
		try{
		HttpServletResponse response = getresponse();
		OutputStream out = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("octets/stream");
		gcglgcgzsj.setJhid(jhid);
		gcglgcgzsj.setTiaojian(type);
		gcglgcgzsj.setLxmc(type+"file");
		Gcglgcgzsj gcglgcgzsj1=gcglgcgzsjServer.downWqgzFile(gcglgcgzsj);
		byte[] data = gcglgcgzsj1.getSgxkwjfile();
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglgcgzsj1.getTiaojian();
		
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
		File file=new File(realPath+"upload\\"+gcglgcgzsj1.getTiaojian());
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
		String tiaojian1="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and xzqhdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and xzqhdm in ("+gydw+")";
		}
		gcglgcgzsj.setPage(page);
		gcglgcgzsj.setRows(rows);
		gcglgcgzsj.setJhid(jhid);
		gcglgcgzsj.setGydw(xzqhBm2(gydw,"xzqhdm2"));
		gcglgcgzsj.setKgzt(kgzt);
		gcglgcgzsj.setLxmc(lxmc);
		gcglgcgzsj.setJgzt(jgzt);
		gcglgcgzsj.setShzt(ybzt);
		gcglgcgzsj.setSbnf(xmnf);
		if(sfsj==7){
			gcglgcgzsj.setTiaojian("sjsh");
		}
		if(sfsj==9){
			gcglgcgzsj.setTiaojian("sjzt");
		}
		if(sfsj==11){
			gcglgcgzsj.setTiaojian("xjzt");
		}
		List<Map<String,Object>> list=gcglgcgzsjServer.queryGcgjList(gcglgcgzsj);
		int count=gcglgcgzsjServer.queryGcgjListCount(gcglgcgzsj);
		EasyUIPage<Map<String,Object>> e=new EasyUIPage<Map<String,Object>>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}		
	
	//gsdgz
	public void selectgsdgzList(){
		
		gcglgcgzsj.setPage(page);
		gcglgcgzsj.setRows(rows);
		gcglgcgzsj.setJhid(jhid);
		gcglgcgzsj.setGydw(xzqhBm2(gydw,"xzqhdm2"));
		gcglgcgzsj.setKgzt(kgzt);
		gcglgcgzsj.setLxmc(lxmc);
		gcglgcgzsj.setJgzt(jgzt);
		gcglgcgzsj.setShzt("");
		if(ybzt.length()>1){
		if("已".equals(ybzt.substring(0, 1))){
			gcglgcgzsj.setShzt(" = '"+ybzt+"'");
		}
		if("未".equals(ybzt.substring(0, 1))){
			gcglgcgzsj.setShzt(" like '%"+ybzt+"%'");
		}
		}
		gcglgcgzsj.setSbnf(xmnf);
		if(gcglgcgzsj.getXmlx1()!=null)
			if(gcglgcgzsj.getXmlx1().length()>0){
				String[] tsdqs=gcglgcgzsj.getXmlx1().split(",");
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
				gcglgcgzsj.setXmlx1(tsdq);
			}
		
		List<Map<String,Object>> list=gcglgcgzsjServer.queryGsdList(gcglgcgzsj);
		int count=gcglgcgzsjServer.queryGsdListCount(gcglgcgzsj);
		EasyUIPage<Map<String,Object>> e=new EasyUIPage<Map<String,Object>>();
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
		gcglgcgzsj.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type)){
			gcglgcgzsj.setSgxkwjfile(new byte[]{});
			bl=gcglgcgzsjServer.uploadWqgzFilesgxk(gcglgcgzsj);
		}
		if("jgtcwj".equals(type)){
			gcglgcgzsj.setJgtcwjfile(new byte[]{});
			bl=gcglgcgzsjServer.uploadWqgzFilejgtc(gcglgcgzsj);
		}
		if("jgyswj".equals(type)){
			gcglgcgzsj.setJgyswjfile(new byte[]{});
			bl=gcglgcgzsjServer.uploadWqgzFilejgys(gcglgcgzsj);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	//修改月报状态
	public void sbGcgzsjYb(){
		System.out.println(gcglgcgzsj);
		Boolean bl=gcglgcgzsjServer.sbWqgzYb(gcglgcgzsj);
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

	public void selectGcgzsjjhList1(){
		
		gcglgcgzsj.setPage(page);
		gcglgcgzsj.setRows(rows);
		try {
			String tiaojian1="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}
		gcglgcgzsj.setGydw(xzqhBm2(gydw,"xzqhdm2"));
		gcglgcgzsj.setKgzt(kgzt);
		gcglgcgzsj.setLxmc(lxmc);
		gcglgcgzsj.setJgzt(jgzt);
		gcglgcgzsj.setShzt(ybzt);
		gcglgcgzsj.setTbyf(bfyf);
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
		gcglgcgzsj.setSbnf(tj);
		gcglgcgzsj.setTiaojian(bfzt);
		List<Map<String,Object>> list=gcglgcgzsjServer.selectWqgzjhList2(gcglgcgzsj);
		int count=gcglgcgzsjServer.selectWqgzjhListcount1(gcglgcgzsj);
		EasyUIPage<Map<String,Object>> e=new EasyUIPage<Map<String,Object>>();
		e.setRows(list);
		e.setTotal(count);
		
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void selectgsdgzListbf(){
		
		gcglgcgzsj.setPage(page);
		gcglgcgzsj.setRows(rows);
		try {
			String tiaojian1="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}
		gcglgcgzsj.setGydw(xzqhBm2(gydw,"xzqhdm2"));
		gcglgcgzsj.setKgzt(kgzt);
		gcglgcgzsj.setLxmc(lxmc);
		gcglgcgzsj.setJgzt(jgzt);
		gcglgcgzsj.setShzt(ybzt);
		gcglgcgzsj.setTbyf(bfyf);
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
		gcglgcgzsj.setSbnf(tj);
		gcglgcgzsj.setTiaojian(bfzt);
		if(gcglgcgzsj.getXmlx1()!=null)
			if(gcglgcgzsj.getXmlx1().length()>0){
				String[] tsdqs=gcglgcgzsj.getXmlx1().split(",");
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
				gcglgcgzsj.setXmlx1(tsdq);
			}
		List<Map<String,Object>> list=gcglgcgzsjServer.selectgsdgzListbf(gcglgcgzsj);
		int count=gcglgcgzsjServer.selectgsdgzListbfcount(gcglgcgzsj);
		EasyUIPage<Map<String,Object>> e=new EasyUIPage<Map<String,Object>>();
		e.setRows(list);
		e.setTotal(count);
		
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
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
	
}
