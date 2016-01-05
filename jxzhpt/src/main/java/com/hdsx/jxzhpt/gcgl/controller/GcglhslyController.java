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
import com.hdsx.jxzhpt.gcgl.bean.Gcglhsly;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglhslyServer;
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
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class GcglhslyController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglhslyServerImpl")
	private GcglhslyServer gcglhslyServer;
	
	private Gcglhsly gcglhsly = new Gcglhsly();
	private String jhid;
	
	private String fileuploadFileName;
	private File fileupload;
	private String type;
	private String xzqhdm;
	private String kgzt;
	private String lxmc;
	private String jgzt;
	private String yhtype;
	private Integer sfsj;
	private String ybzt;
	private String gydwdm;
	private String bfyf;
	private String bfzt;
	private String xmnf;
	private String id;
	private String xmlx;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXmlx() {
		return xmlx;
	}
	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
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
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
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
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
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
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
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
	public Gcglhsly getGcglhsly() {
		return gcglhsly;
	}
	public void setGcglhsly(Gcglhsly gcglhsly) {
		this.gcglhsly = gcglhsly;
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
	public void inserthslyYb(){
		if("县级".equals(yhtype)){
			gcglhsly.setSfsj(11);
		}
		if("市级".equals(yhtype)){
			gcglhsly.setSfsj(9);
		}
		if("省级".equals(yhtype)){
			gcglhsly.setSfsj(7);
		}
		Boolean bl=gcglhslyServer.inserthslyYb(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selecthslyYbByJhid(){
		gcglhsly.setPage(page);
		gcglhsly.setRows(rows);
		gcglhsly.setJhid(jhid);
		gcglhsly.setSfsj(sfsj);
		int count=gcglhslyServer.selecthslyYbByJhidCount(gcglhsly);
		List<Gcglhsly> list=gcglhslyServer.selecthslyYbByJhid(gcglhsly);
		EasyUIPage<Gcglhsly> e=new EasyUIPage<Gcglhsly>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//查询月报
		public void selecthslyYbByJhid1(){
			gcglhsly.setPage(page);
			gcglhsly.setRows(rows);
			gcglhsly.setJhid(jhid);
			int count=gcglhslyServer.selecthslyYbByJhidCount1(gcglhsly);
			List<Gcglhsly> list=gcglhslyServer.selecthslyYbByJhid1(gcglhsly);
			EasyUIPage<Gcglhsly> e=new EasyUIPage<Gcglhsly>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	//修改月报
	public void updatehslyYb(){
		Boolean bl=gcglhslyServer.updatehslyYb(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//删除月报
	public void deletehslyYb(){
		Boolean bl=gcglhslyServer.deletehslyYb(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//审核月报
	public void shhslyYb(){
		Boolean bl=gcglhslyServer.shhslyYb(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//添加车购税
	public void insertHslyCgs(){
		Boolean bl=gcglhslyServer.insertHslyCgs(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询cgs
	public void selectHslyCgsList(){
		gcglhsly.setPage(page);
		gcglhsly.setRows(rows);
		gcglhsly.setJhid(jhid);
		int count=gcglhslyServer.selectHslyCgsListCount(gcglhsly);
		List<Gcglhsly> list=gcglhslyServer.selectHslyCgsList(gcglhsly);
		EasyUIPage<Gcglhsly> e=new EasyUIPage<Gcglhsly>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//修改cgs
	public void updateHslyCgs(){
		Boolean bl=gcglhslyServer.updateHslyCgs(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deleteHslyCgs(){
		Boolean bl=gcglhslyServer.deleteHslyCgs(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	//
	
	public void uploadHslyFile() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		String jhid1=jhid;
		String type1=type;
		gcglhsly.setJhid(jhid);
		gcglhsly.setTiaojian(type);
		Gcglhsly gcglhsly1=gcglhslyServer.downWqgzFile(gcglhsly);
		System.out.println(gcglhsly1);
		if(gcglhsly1!=null)
		if(gcglhsly1.getTiaojian()!=""||gcglhsly1.getTiaojian()!=null){
			try {
				response.getWriter().print("附件已存在，导入失败");
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String tiaojian=fileuploadFileName;
		gcglhsly.setTiaojian(tiaojian);
		gcglhsly.setJhid(jhid1);
		InputStream inputStream = new FileInputStream(fileupload);
		boolean bl = false;
		if("sgxkwj".equals(type1)){
			gcglhsly.setSgxkwjfile(inputStreamToByte(inputStream));
			bl=gcglhslyServer.uploadWqgzFilesgxk(gcglhsly);
		}
		if("jgtcwj".equals(type1)){
			gcglhsly.setJgtcwjfile(inputStreamToByte(inputStream));
			bl=gcglhslyServer.uploadWqgzFilejgtc(gcglhsly);
		}
		if("jgyswj".equals(type1)){
			gcglhsly.setJgyswjfile(inputStreamToByte(inputStream));
			bl=gcglhslyServer.uploadWqgzFilejgys(gcglhsly);
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
	public void downHslyFile() throws IOException{
		try{
		HttpServletResponse response = getresponse();
		OutputStream out = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("octets/stream");
		gcglhsly.setJhid(jhid);
		gcglhsly.setTiaojian(type);
		gcglhsly.setXzqhmc(type+"file");
		Gcglhsly gcglhsly1=gcglhslyServer.downWqgzFile(gcglhsly);
		byte[] data = gcglhsly1.getSgxkwjfile();
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename=gcglhsly1.getTiaojian();
		
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
		File file=new File(realPath+"upload\\"+gcglhsly1.getTiaojian());
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
	public void insertHslykg(){
		Boolean bl=gcglhslyServer.insertWqgzkg(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertHslywg(){
		Boolean bl=gcglhslyServer.insertWqgzwg(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertHslywwg(){
		Boolean bl=gcglhslyServer.insertWqgzwwg(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询jihua
	public void selectHslyjhList(){
		Gcglhsly gcglhsly=new Gcglhsly();
		String tiaojian1="";
		String tiaojian2="";
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydwdm+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		gcglhsly.setPage(page);
		gcglhsly.setRows(rows);
		gcglhsly.setJhid(jhid);
		gcglhsly.setXzqhdm(tiaojian2);
		gcglhsly.setKgzt(kgzt);
		gcglhsly.setXmmc(lxmc);
		gcglhsly.setJgzt(jgzt);
		gcglhsly.setShzt(ybzt);
		gcglhsly.setJhnf(xmnf);
		gcglhsly.setGydwdm(tiaojian1);
		if(sfsj==7){
			gcglhsly.setTiaojian("sjsh");
		}
		if(sfsj==9){
			gcglhsly.setTiaojian("sjzt");
		}
		if(sfsj==11){
			gcglhsly.setTiaojian("xjzt");
		}
		int count=gcglhslyServer.selectWqgzjhListCount(gcglhsly);
		List<Gcglhsly> list=gcglhslyServer.selectWqgzjhList(gcglhsly);
		EasyUIPage<Gcglhsly> e=new EasyUIPage<Gcglhsly>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}		
	public void selectHslyjhFile(){
		gcglhsly.setJhid(jhid);
		Gcglhsly g= gcglhslyServer.selectWqgzjhFile(gcglhsly);
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
	public void deleteHslyFile(){
		
		gcglhsly.setJhid(jhid);
		gcglhsly.setTiaojian("");		
		boolean bl = false;
		if("sgxkwj".equals(type)){
			gcglhsly.setSgxkwjfile(new byte[]{});
			bl=gcglhslyServer.uploadWqgzFilesgxk(gcglhsly);
		}
		if("jgtcwj".equals(type)){
			gcglhsly.setJgtcwjfile(new byte[]{});
			bl=gcglhslyServer.uploadWqgzFilejgtc(gcglhsly);
		}
		if("jgyswj".equals(type)){
			gcglhsly.setJgyswjfile(new byte[]{});
			bl=gcglhslyServer.uploadWqgzFilejgys(gcglhsly);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
		
	}
	//修改月报状态
	public void sbHslyYb(){
		System.out.println(gcglhsly);
		Boolean bl=gcglhslyServer.sbWqgzYb(gcglhsly);
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
	//查询jihua1
		public void selectHslyjhList1(){
			Gcglhsly gcglhsly=new Gcglhsly();
			String tiaojian1="";
			String tiaojian2="";
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydwdm+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqhdm+")";
			}
			gcglhsly.setPage(page);
			gcglhsly.setRows(rows);
			gcglhsly.setXzqhdm(tiaojian2);
			gcglhsly.setKgzt(kgzt);
			gcglhsly.setXmmc(lxmc);
			gcglhsly.setJgzt(jgzt);
			gcglhsly.setShzt(ybzt);
			gcglhsly.setGydwdm(tiaojian1);
			gcglhsly.setShzt(ybzt);
			gcglhsly.setTbyf(bfyf);
			gcglhsly.setJhnf(xmnf);
			gcglhsly.setTiaojian(bfzt);
			
			int count=gcglhslyServer.selectWqgzjhListCount1(gcglhsly);
			List<Gcglhsly> list=gcglhslyServer.selectWqgzjhList1(gcglhsly);
			EasyUIPage<Gcglhsly> e=new EasyUIPage<Gcglhsly>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}	
		public void thxmwgtj(){
			String sql="";
			if("abgc".equals(xmlx)){
				sql="update plan_abgc set jgzt='0' where id='"+id+"'";
			}
			if("wqgz".equals(xmlx)){
				sql="update plan_wqgz set jgzt='0' where id='"+id+"'";
			}
			if("zhfz".equals(xmlx)){
				sql="update plan_zhfz set jgzt='0' where id='"+id+"'";
			}
			if("hsly".equals(xmlx)){
				sql="update plan_hsly set jgzt='0' where id='"+id+"'";
			}
			if("sjgz".equals(xmlx)){
				sql="update jhsh_sjgz set jgzt='0' where xmbm='"+id+"'";
			}
			if("lmgz".equals(xmlx)){
				sql="update jhsh_lmgz set jgzt='0' where xmbm='"+id+"'";
			}
			if("xj".equals(xmlx)){
				sql="update jhsh_xj set jgzt='0' where xmbm='"+id+"'";
			}
			if("sh".equals(xmlx)){
				sql="update jhsh_sh set jgzt='0' where xmbm='"+id+"'";
			}
			if("yhdzx".equals(xmlx)){
				sql="update jhsh_yhdzx set jgzt='0' where xmbm='"+id+"'";
			}
			if("bhsd".equals(xmlx)){
				sql="update plan_bhsd set jgzt='0' where id='"+id+"'";
			}
			boolean bl=gcglhslyServer.thxmwgtj(sql);
			ResponseUtils.write(getresponse(), bl+"");
		}
}
