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
import javax.servlet.http.HttpServletResponse;

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
			Boolean bl=gcglabgcServer.insertWqgzkg(gcglabgc);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void insertAbgcwg(){
			Boolean bl=gcglabgcServer.insertWqgzwg(gcglabgc);
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
			Gcglabgc gcglabgc=new Gcglabgc();
			gcglabgc.setPage(page);
			gcglabgc.setRows(rows);
			gcglabgc.setJhid(jhid);
			gcglabgc.setGydw(gydw.replaceAll("0*$",""));
			gcglabgc.setKgzt(kgzt);
			gcglabgc.setLxmc(lxmc);
			gcglabgc.setJgzt(jgzt);
			gcglabgc.setShzt(ybzt);
			if(sfsj==7){
				gcglabgc.setTiaojian("sjsh");
			}
			if(sfsj==9){
				gcglabgc.setTiaojian("sjzt");
			}
			if(sfsj==11){
				gcglabgc.setTiaojian("xjzt");
			}
			System.out.println(gcglabgc.getTiaojian());
			int count=gcglabgcServer.selectWqgzjhListCount(gcglabgc);
			List<Gcglabgc> list=gcglabgcServer.selectWqgzjhList(gcglabgc);
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
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		List<Excel_list> list=gcglabgcServer.exportAbyb(gcglabgc);
		List<Excel_list> list1=new ArrayList<Excel_list>();
		for (Excel_list excel_list : list) {
			gcglabgc.setJhid(excel_list.getV_0());
			Gcglabgc gcglabgc1 = gcglabgcServer.queryCGSByYf(gcglabgc);
			if(gcglabgc1==null)
			list1.add(excel_list);
		}
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("安保工程车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("安保工程车购税拨付信息导入表");//设置文件名
		eldata.setEl(list1);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("管养单位",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("路线编号",1,1,3,3));
		et.add(new Excel_tilte("路线名称",1,1,4,4));
		et.add(new Excel_tilte("起点桩号",1,1,5,5));
		et.add(new Excel_tilte("止点桩号",1,1,6,6));
		et.add(new Excel_tilte("拨付资金(万元)",1,1,7,7));
		et.add(new Excel_tilte("填报月份",1,1,8,8));
		et.add(new Excel_tilte("填报时间",1,1,9,9));
		et.add(new Excel_tilte("填报人",1,1,10,10));
		
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
				dataMapArray = ExcelReader1.readExcelContent(2,11,fs,Plan_gcgj.class);

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
				} catch (Exception e) {
					flag1=flag1+map.get("0").toString()+"  ";
					break;
				}
				gcglabgc.setJhid(map.get("0").toString());
				gcglabgc.setCgsdwzj(map.get("7").toString());
				gcglabgc.setTbsj(map.get("9").toString());
				gcglabgc.setTbyf(map.get("8").toString());
				gcglabgc.setTbr(map.get("10").toString());
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
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		List<Gcglgcgzgj> list1=gcglabgcServer.selectWqgzjhListid1(gcglabgc);
		String tiaojian="";
		for (Gcglgcgzgj gcglgcgzgj2 : list1) {
			tiaojian=tiaojian+"'"+gcglgcgzgj2.getId()+"'"+",";
		}
		gcglabgc.setTiaojian(tiaojian.substring(0, tiaojian.length()-1));
		List<Excel_list> list=gcglabgcServer.exportgjyb(gcglabgc);
		List<Excel_list> list2=new ArrayList<Excel_list>();
		for (Excel_list excel_list : list) {
			gcglabgc.setJhid(excel_list.getV_0());
			Gcglabgc gcglabgc1 = gcglabgcServer.queryCGSByYf(gcglabgc);
			if(gcglabgc1==null)
			list2.add(excel_list);
		}
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("工程改造路面改建车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("工程改造路面改建车购税拨付信息导入表");//设置文件名
		eldata.setEl(list2);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("项目名称",1,1,1,1));
		et.add(new Excel_tilte("计划年份",1,1,2,2));
		et.add(new Excel_tilte("计划开工时间",1,1,3,3));
		et.add(new Excel_tilte("计划完工时间",1,1,4,4));
		et.add(new Excel_tilte("批复总投资(万元) ",1,1,5,5));
		et.add(new Excel_tilte("部补助金额(万元) ",1,1,6,6));
		et.add(new Excel_tilte("拨付资金(万元)",1,1,7,7));
		et.add(new Excel_tilte("填报月份",1,1,8,8));
		et.add(new Excel_tilte("填报时间",1,1,9,9));
		et.add(new Excel_tilte("填报人",1,1,10,10));
		
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
	public void exportsjyb(){
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		List<Excel_list> list=gcglabgcServer.exportsjyb(gcglabgc);
		
		List<Excel_list> list1=new ArrayList<Excel_list>();
		for (Excel_list excel_list : list) {
			gcglabgc.setJhid(excel_list.getV_0());
			Gcglabgc gcglabgc1 = gcglabgcServer.queryCGSByYf(gcglabgc);
			if(gcglabgc1==null)
			list1.add(excel_list);
		}
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("工程改造路面升级车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("工程改造路面升级车购税拨付信息导入表");//设置文件名
		eldata.setEl(list1);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("管养单位",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("路线编号",1,1,3,3));
		et.add(new Excel_tilte("路线名称",1,1,4,4));
		et.add(new Excel_tilte("起点桩号",1,1,5,5));
		et.add(new Excel_tilte("止点桩号",1,1,6,6));
		et.add(new Excel_tilte("拨付资金(万元)",1,1,7,7));
		et.add(new Excel_tilte("填报月份",1,1,8,8));
		et.add(new Excel_tilte("填报时间",1,1,9,9));
		et.add(new Excel_tilte("填报人",1,1,10,10));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel		
		
	}
	//红色
	public void exporthsyb(){
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		List<Excel_list> list=gcglabgcServer.exporthsyb(gcglabgc);
		
		List<Excel_list> list1=new ArrayList<Excel_list>();
		for (Excel_list excel_list : list) {
			gcglabgc.setJhid(excel_list.getV_0());
			Gcglabgc gcglabgc1 = gcglabgcServer.queryCGSByYf(gcglabgc);
			if(gcglabgc1==null)
			list1.add(excel_list);
		}
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("红色旅游车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("红色旅游车购税拨付信息导入表");//设置文件名
		eldata.setEl(list1);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("新政区划",1,1,1,1));
		et.add(new Excel_tilte("计划年份",1,1,2,2));
		et.add(new Excel_tilte("项目名称",1,1,3,3));
		et.add(new Excel_tilte("建设性质",1,1,4,4));
		et.add(new Excel_tilte("开工年",1,1,5,5));
		et.add(new Excel_tilte("完工年",1,1,6,6));
		et.add(new Excel_tilte("拨付资金(万元)",1,1,7,7));
		et.add(new Excel_tilte("填报月份",1,1,8,8));
		et.add(new Excel_tilte("填报时间",1,1,9,9));
		et.add(new Excel_tilte("填报人",1,1,10,10));
		
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
		gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		List<Excel_list> list=gcglabgcServer.exportshyb(gcglabgc);
		
		List<Excel_list> list1=new ArrayList<Excel_list>();
		for (Excel_list excel_list : list) {
			gcglabgc.setJhid(excel_list.getV_0());
			Gcglabgc gcglabgc1 = gcglabgcServer.queryCGSByYf(gcglabgc);
			if(gcglabgc1==null)
			list1.add(excel_list);
		}
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("水毁车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("水毁车购税拨付信息导入表");//设置文件名
		eldata.setEl(list1);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("管养单位",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("路线编号",1,1,3,3));
		et.add(new Excel_tilte("路线名称",1,1,4,4));
		et.add(new Excel_tilte("起点桩号",1,1,5,5));
		et.add(new Excel_tilte("止点桩号",1,1,6,6));
		et.add(new Excel_tilte("拨付资金(万元)",1,1,7,7));
		et.add(new Excel_tilte("填报月份",1,1,8,8));
		et.add(new Excel_tilte("填报时间",1,1,9,9));
		et.add(new Excel_tilte("填报人",1,1,10,10));
		
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
	public void exportyhyb(){
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		List<Excel_list> list=gcglabgcServer.exportyhyb(gcglabgc);
		
		List<Excel_list> list1=new ArrayList<Excel_list>();
		for (Excel_list excel_list : list) {
			gcglabgc.setJhid(excel_list.getV_0());
			Gcglabgc gcglabgc1 = gcglabgcServer.queryCGSByYf(gcglabgc);
			if(gcglabgc1==null)
			list1.add(excel_list);
		}
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("养护大中修车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("养护大中修车购税拨付信息导入表");//设置文件名 
		eldata.setEl(list1);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("管养单位",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("路线编号",1,1,3,3));
		et.add(new Excel_tilte("路线名称",1,1,4,4));
		et.add(new Excel_tilte("起点桩号",1,1,5,5));
		et.add(new Excel_tilte("止点桩号",1,1,6,6));
		et.add(new Excel_tilte("拨付资金(万元)",1,1,7,7));
		et.add(new Excel_tilte("填报月份",1,1,8,8));
		et.add(new Excel_tilte("填报时间",1,1,9,9));
		et.add(new Excel_tilte("填报人",1,1,10,10));
		
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
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		List<Excel_list> list=gcglabgcServer.exportzhyb(gcglabgc);
		List<Excel_list> list1=new ArrayList<Excel_list>();
		for (Excel_list excel_list : list) {
			gcglabgc.setJhid(excel_list.getV_0());
			Gcglabgc gcglabgc1 = gcglabgcServer.queryCGSByYf(gcglabgc);
			if(gcglabgc1==null)
			list1.add(excel_list);
		}
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("灾害防治车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("灾害防治车购税拨付信息导入表");//设置文件名
		eldata.setEl(list1);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("管养单位",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("路线编号",1,1,3,3));
		et.add(new Excel_tilte("路线名称",1,1,4,4));
		et.add(new Excel_tilte("起点桩号",1,1,5,5));
		et.add(new Excel_tilte("止点桩号",1,1,6,6));
		et.add(new Excel_tilte("拨付资金(万元)",1,1,7,7));
		et.add(new Excel_tilte("填报月份",1,1,8,8));
		et.add(new Excel_tilte("填报时间",1,1,9,9));
		et.add(new Excel_tilte("填报人",1,1,10,10));
		
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
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(sbyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setTiaojian(qlmc);
		List<Excel_list> list=gcglabgcServer.exportwqyb(gcglabgc);
		List<Excel_list> list1=new ArrayList<Excel_list>();
		for (Excel_list excel_list : list) {
			gcglabgc.setJhid(excel_list.getV_0());
			Gcglabgc gcglabgc1 = gcglabgcServer.queryCGSByYf(gcglabgc);
			if(gcglabgc1==null)
			list1.add(excel_list);
		}
		//到报表
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("危桥改造车购税拨付信息导入表");//设置第一行
		eldata.setSheetName("车购税拨付");//设置sheeet名
		eldata.setFileName("危桥改造车购税拨付信息导入表");//设置文件名
		eldata.setEl(list1);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("计划编码",1,1,0,0));
		et.add(new Excel_tilte("管养单位",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("桥梁编号",1,1,3,3));
		et.add(new Excel_tilte("桥梁名称",1,1,4,4));
		et.add(new Excel_tilte("技术等级",1,1,5,5));
		et.add(new Excel_tilte("桥梁中心桩号",1,1,6,6));
		et.add(new Excel_tilte("拨付资金(万元)",1,1,7,7));
		et.add(new Excel_tilte("填报月份",1,1,8,8));
		et.add(new Excel_tilte("填报时间",1,1,9,9));
		et.add(new Excel_tilte("填报人",1,1,10,10));
		
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
		Gcglabgc gcglabgc=new Gcglabgc();
		gcglabgc.setPage(page);
		gcglabgc.setRows(rows);
		try {
		gcglabgc.setGydw(gydw.replaceAll("0*$",""));
		gcglabgc.setKgzt(kgzt);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setJgzt(jgzt);
		gcglabgc.setTbyf(bfyf);
		gcglabgc.setTbr(tbr);
		gcglabgc.setTiaojian(bfzt);
		gcglabgc.setXmnf(xmnf);
		List<Gcglabgc> list=gcglabgcServer.selectWqgzjhList1(gcglabgc);
		int count=gcglabgcServer.selectWqgzjhListcount1(gcglabgc);
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
}
