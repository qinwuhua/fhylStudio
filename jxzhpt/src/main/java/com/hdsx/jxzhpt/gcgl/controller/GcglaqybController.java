package com.hdsx.jxzhpt.gcgl.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcgltz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglaqybServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.jxzhpt.xtgl.bean.Param;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.jxzhpt.xtgl.server.XtglServer;
import com.hdsx.webutil.struts.BaseActionSupport;



@Scope("prototype")
@Controller
public class GcglaqybController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	private Date kssj;
	private Date jssj;
	private String ckzt;
	private String fileuploadFileName;
	private File fileupload;
	private String sendingunits;
	private String filename;
	private String wenhao;
	private String reportmonth;
	private String remark;
	private String gydw;
	private String gydw1;
	private String wjmc;
	private String ddlyear;
	private String ddlmonth;
	private String type;
	private String yhdw;
	private String id;
	
	public String getCkzt() {
		return ckzt;
	}
	public void setCkzt(String ckzt) {
		this.ckzt = ckzt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getYhdw() {
		return yhdw;
	}
	public void setYhdw(String yhdw) {
		this.yhdw = yhdw;
	}

	@Resource(name = "gcglaqybServerImpl")
	private GcglaqybServer gcglaqybServer;
	private Gcgltz gcgltz=new Gcgltz();
	private Gcglaqyb gcglaqyb = new Gcglaqyb();
	private String jhid;
	
	public Date getKssj() {
		return kssj;
	}
	public void setKssj(Date kssj) {
		this.kssj = kssj;
	}
	public Date getJssj() {
		return jssj;
	}
	public void setJssj(Date jssj) {
		this.jssj = jssj;
	}
	public Gcgltz getGcgltz() {
		return gcgltz;
	}
	public void setGcgltz(Gcgltz gcgltz) {
		this.gcgltz = gcgltz;
	}
	public String getGydw1() {
		return gydw1;
	}
	public void setGydw1(String gydw1) {
		this.gydw1 = gydw1;
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
	public String getWjmc() {
		return wjmc;
	}
	public void setWjmc(String wjmc) {
		this.wjmc = wjmc;
	}
	public String getDdlyear() {
		return ddlyear;
	}
	public void setDdlyear(String ddlyear) {
		this.ddlyear = ddlyear;
	}
	public String getDdlmonth() {
		return ddlmonth;
	}
	public void setDdlmonth(String ddlmonth) {
		this.ddlmonth = ddlmonth;
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
	public Gcglaqyb getGcglaqyb() {
		return gcglaqyb;
	}
	public void setGcglaqyb(Gcglaqyb gcglaqyb) {
		this.gcglaqyb = gcglaqyb;
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
	public String getSendingunits() {
		return sendingunits;
	}
	public void setSendingunits(String sendingunits) {
		this.sendingunits = sendingunits;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getWenhao() {
		return wenhao;
	}
	public void setWenhao(String wenhao) {
		this.wenhao = wenhao;
	}
	public String getReportmonth() {
		return reportmonth;
	}
	public void setReportmonth(String reportmonth) {
		this.reportmonth = reportmonth;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void uploadAqybFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			InputStream inputStream = new FileInputStream(fileupload);
			String id=new Date().getTime()+"";
			gcglaqyb.setId(id);
			gcglaqyb.setXspath(fileuploadFileName);
			gcglaqyb.setYbfile(inputStreamToByte(inputStream));
			boolean bl=gcglaqybServer.uploadAqybFile(gcglaqyb);
			if(bl)
			response.getWriter().print(id);
			else
			response.getWriter().print("error");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void uploadAqybFile1(){
		System.out.println(fileuploadFileName);
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			InputStream inputStream = new FileInputStream(fileupload);
			gcglaqyb.setId(id);
			gcglaqyb.setXspath(fileuploadFileName);
			gcglaqyb.setYbfile(inputStreamToByte(inputStream));
			boolean bl=gcglaqybServer.uploadAqybFile1(gcglaqyb);
			if(bl)
			response.getWriter().print(id);
			else
			response.getWriter().print("error");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void insertAqybb(){
		gcglaqyb.setUploadtime(new Date());
		Boolean bl=gcglaqybServer.insertAqybb(gcglaqyb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertAqybb1(){
		gcglaqyb.setUploadtime(new Date());
		Boolean bl=gcglaqybServer.insertAqybb1(gcglaqyb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectaqyblist(){
		gcglaqyb.setReportmonth(ddlyear+"-"+ddlmonth);
		gcglaqyb.setUploadepartment(gydw);
		gcglaqyb.setFilename(wjmc);
		gcglaqyb.setRows(rows);
		gcglaqyb.setPage(page);
		if("全部".equals(type)){}
		if("上传".equals(type)){}
		if("接收".equals(type)){
			gcglaqyb.setSendingunits(gydw1);
		}
		int count=gcglaqybServer.selectaqyblistCount(gcglaqyb);
		List<Gcglaqyb> list=gcglaqybServer.selectaqyblist(gcglaqyb);
		EasyUIPage<Gcglaqyb> e=new EasyUIPage<Gcglaqyb>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	
	
	public void selAllBm3(){
		List<TreeNode> l=gcglaqybServer.selAllBm3(yhdw);
		TreeNode root = returnRoot(l,l.get(0));
		List<TreeNode> children = root.getChildren();
		try{
		    String s=JSONArray.fromObject(children).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private TreeNode returnRoot(List<TreeNode> list, TreeNode zzjgTree){

		for(TreeNode temp : list){
			if(temp!=zzjgTree){
				if(temp.getParent() != null &&temp.getParent() !="" && temp.getParent().equals(zzjgTree.getId())){
					zzjgTree.setState("closed");
					zzjgTree.getChildren().add(temp);
					returnRoot(list,temp);
				}
			}
		}
		return zzjgTree;
	}
	
	public void selAllBm4(){
		List<TreeNode> l=gcglaqybServer.selAllBm3(yhdw);
		gcglaqyb.setId(id);
		Gcglaqyb gcglaqyb1 = gcglaqybServer.selectAqybById(gcglaqyb);
		String [] dwbm=gcglaqyb1.getSendingunits().split(",");
		List<String> list=new ArrayList<String>();
		for (int i = 0; i < dwbm.length; i++) {
			list.add(dwbm[i]);
		}
		TreeNode root = returnRoot1(l,l.get(0),list);
		List<TreeNode> children = root.getChildren();
		try{
		    String s=JSONArray.fromObject(children).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private TreeNode returnRoot1(List<TreeNode> list, TreeNode zzjgTree,List<String> dwbm){
//		for (int i = 0; i < dwbm.length; i++) {
//			if(zzjgTree.getId().equals(dwbm[i])){
//				zzjgTree.setChecked("true");
//				
//			}
//		}
		for (String string : dwbm) {
			if(string.equals(zzjgTree.getId())){
				zzjgTree.setChecked("true");
				dwbm.remove(string);
				break;
			}
		}
		for(TreeNode temp : list){
			if(temp!=zzjgTree){
				if(temp.getParent() != null &&temp.getParent() !="" && temp.getParent().equals(zzjgTree.getId())){
					zzjgTree.setState("closed");
					zzjgTree.getChildren().add(temp);
					returnRoot1(list,temp,dwbm);
				}
			}
		}
		return zzjgTree;
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
	public void deleteAqybb(){
		gcglaqyb.setId(id);
		boolean bl = gcglaqybServer.deleteAqybb(gcglaqyb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	@RequestMapping("file/download")  
	public void downAqybbFile() {
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("multipart/form-data");
			gcglaqyb.setId(id);
			Gcglaqyb gcglwqgz1=gcglaqybServer.selectAqybById(gcglaqyb);
			byte[] data = gcglwqgz1.getYbfile();
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename=gcglwqgz1.getXspath();
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+"upload\\"+gcglwqgz1.getXspath());
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
	//下面是模板管理
	public void uploadMbglFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			InputStream inputStream = new FileInputStream(fileupload);
			String id=new Date().getTime()+"";
			gcglaqyb.setId(id);
			gcglaqyb.setXspath(fileuploadFileName);
			gcglaqyb.setYbfile(inputStreamToByte(inputStream));
			boolean bl=gcglaqybServer.uploadMbglFile(gcglaqyb);
			if(bl)
			response.getWriter().print(id);
			else
			response.getWriter().print("error");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void uploadMbglFile1(){
		System.out.println(fileuploadFileName);
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			InputStream inputStream = new FileInputStream(fileupload);
			gcglaqyb.setId(id);
			gcglaqyb.setXspath(fileuploadFileName);
			gcglaqyb.setYbfile(inputStreamToByte(inputStream));
			boolean bl=gcglaqybServer.uploadMbglFile1(gcglaqyb);
			if(bl)
			response.getWriter().print(id);
			else
			response.getWriter().print("error");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void insertMbgl(){
		gcglaqyb.setUploadtime(new Date());
		Boolean bl=gcglaqybServer.insertMbgl(gcglaqyb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertMbgl1(){
		gcglaqyb.setUploadtime(new Date());
		Boolean bl=gcglaqybServer.insertMbgl1(gcglaqyb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectmbgllist(){
		gcglaqyb.setReportmonth(ddlyear+"-"+ddlmonth);
		gcglaqyb.setFilename(wjmc);
		gcglaqyb.setRows(rows);
		gcglaqyb.setPage(page);
		int count=gcglaqybServer.selectmbgllistCount(gcglaqyb);
		List<Gcglaqyb> list=gcglaqybServer.selectmbgllist(gcglaqyb);
		EasyUIPage<Gcglaqyb> e=new EasyUIPage<Gcglaqyb>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	@RequestMapping("file/download")  
	public void downMbglFile() {
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("multipart/form-data");
			gcglaqyb.setId(id);
			Gcglaqyb gcglwqgz1=gcglaqybServer.selectMbglById(gcglaqyb);
			byte[] data = gcglwqgz1.getYbfile();
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename=gcglwqgz1.getXspath();
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+"upload\\"+gcglwqgz1.getXspath());
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
	public void deleteMbgl(){
		gcglaqyb.setId(id);
		boolean bl = gcglaqybServer.deleteMbgl(gcglaqyb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	//
	public void uploadTzFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			InputStream inputStream = new FileInputStream(fileupload);
			String s = UUID.randomUUID().toString(); 
			String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
			gcgltz.setId(s1);
			gcgltz.setTzid(id);
			gcgltz.setFilename(fileuploadFileName);
			gcgltz.setTzfile(inputStreamToByte(inputStream));
			boolean bl=gcglaqybServer.uploadTzFile(gcgltz);
			if(bl)
			response.getWriter().print(fileuploadFileName+"    上传成功"+s1);
			else
			response.getWriter().print(fileuploadFileName+"    上传失败"+s1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertTz(){
		;
		Date riqi = null;
		try {
			riqi = new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		gcgltz.setReporttime(riqi);
		Boolean bl=gcglaqybServer.insertTz(gcgltz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertTz1(){
		Boolean bl=gcglaqybServer.insertTz1(gcgltz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deleteTzfile(){
		Boolean bl=gcglaqybServer.deleteTzfile(gcgltz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deleteTzfile1(){
		gcgltz.setId(id);
		gcgltz.setTzid(id);
		Boolean bl=gcglaqybServer.deleteTzfile1(gcgltz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectxxtzlist(){
		gcgltz.setReportperuid(gydw);
		gcgltz.setKssj(kssj);
		gcgltz.setJssj(jssj);
		gcgltz.setRows(rows);
		gcgltz.setPage(page);
		int count=gcglaqybServer.selectxxtzlistCount(gcgltz);
		List<Gcgltz> list=gcglaqybServer.selectxxtzlist(gcgltz);
		EasyUIPage<Gcgltz> e=new EasyUIPage<Gcgltz>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void selAllBm5(){
		List<TreeNode> l=gcglaqybServer.selAllBm3(yhdw);
		gcgltz.setId(id);
		Gcgltz gcglaqyb1 = gcglaqybServer.selecttzById(gcgltz);
		String [] dwbm=gcglaqyb1.getTjdepartmentcode().split(",");
		List<String> list=new ArrayList<String>();
		for (int i = 0; i < dwbm.length; i++) {
			list.add(dwbm[i]);
		}
		TreeNode root = returnRoot1(l,l.get(0),list);
		List<TreeNode> children = root.getChildren();
		try{
		    String s=JSONArray.fromObject(children).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectTzfile(){
		gcgltz.setTzid(id);
		List<Gcgltz> list = gcglaqybServer.selectTzfile(gcgltz);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deleteTzByid(){
		Boolean bl=gcglaqybServer.deleteTzByid(gcgltz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deleteTzByid1(){
		Boolean bl=gcglaqybServer.deleteTzByid1(gcgltz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	//通知查看
	public void insertTzck(){
		Boolean bl=gcglaqybServer.insertTzck(gcgltz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectxxtzcxlist(){
		gcgltz.setTjdepartmentcode(gydw);
		gcgltz.setKssj(kssj);
		gcgltz.setJssj(jssj);
		gcgltz.setCkzt(ckzt);
		gcgltz.setRows(rows);
		gcgltz.setPage(page);
		int count=gcglaqybServer.selectxxtzlist1Count(gcgltz);
		List<Gcgltz> list=gcglaqybServer.selectxxtzlist1(gcgltz);
		EasyUIPage<Gcgltz> e=new EasyUIPage<Gcgltz>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void deleteTzckByid(){
		Boolean bl=gcglaqybServer.deleteTzckByid(gcgltz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void xgTzzt(){
		gcgltz.setId(id);
		Boolean bl=gcglaqybServer.xgTzzt(gcgltz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	@RequestMapping("file/download")  
	public void downXxtzFile(){
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("multipart/form-data");
			gcgltz.setId(id);
			Gcgltz gcglwqgz1=gcglaqybServer.selectxxtzById(gcgltz);
			byte[] data = gcglwqgz1.getTzfile();
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename=gcglwqgz1.getFilename();
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+"upload\\"+gcglwqgz1.getFilename());
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
}
