package com.hdsx.jxzhpt.wjxt.controller;

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
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;
import com.hdsx.jxzhpt.jhgl.controller.ImportVerify;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExcelReader1;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Wjgl;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class LkpdController extends BaseActionSupport{
	private int page = 1;
	private int rows = 10;
	@Resource(name = "trqkServerImpl")
	private TrqkServer trqkServer;
	private String gydw;
	private String tiaojian;
	private Trqk trqk=new Trqk();
	private Lkmxb lkmxb=new Lkmxb();
	private File fileupload;
	private String fileuploadFileName;
	private String id;
	private Lktjb lktjb=new Lktjb();
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Lkmxb getLkmxb() {
		return lkmxb;
	}

	public void setLkmxb(Lkmxb lkmxb) {
		this.lkmxb = lkmxb;
	}

	public String getGydw() {
		return gydw;
	}

	public void setGydw(String gydw) {
		this.gydw = gydw;
	}

	public String getTiaojian() {
		return tiaojian;
	}

	public void setTiaojian(String tiaojian) {
		this.tiaojian = tiaojian;
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

	public Trqk getTrqk() {
		return trqk;
	}

	public void setTrqk(Trqk trqk) {
		this.trqk = trqk;
	}
	
	
	public File getFileupload() {
		return fileupload;
	}

	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}

	public String getFileuploadFileName() {
		return fileuploadFileName;
	}

	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}

	public Lktjb getLktjb() {
		return lktjb;
	}

	public void setLktjb(Lktjb lktjb) {
		this.lktjb = lktjb;
	}

	public void insertLkpdData(){
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
				dataMapArray = ExcelReader1.readExcelContent(1,17,fs,Plan_gcgj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			
			String strVerify="";
			boolean booltb=false,booldata=false;
			Lkmxb lkmxb1=new Lkmxb();
			String s = UUID.randomUUID().toString(); 
			String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
			String[] ss=data.get(0).get("13").toString().split("\n");
			lkmxb1.setBt1(ss[0]);
			lkmxb1.setBt2(ss[1]);
			lkmxb1.setBt3(ss[2]);
			lkmxb1.setBt4(ss[3]);
			lkmxb1.setBt5(ss[4]);
			data.remove(0);
			lkmxb1.setTbdw(data.get(0).get("1").toString());
			lkmxb1.setTbnf(data.get(0).get("7").toString());
			if(data.get(data.size()-2).get("0").toString().split("：").length>1)
			lkmxb1.setDwfzr(data.get(data.size()-2).get("0").toString().split("：")[1]);
			else lkmxb1.setDwfzr("");
			if(data.get(data.size()-2).get("4").toString().split("：").length>1)
			lkmxb1.setTjfzr(data.get(data.size()-2).get("4").toString().split("：")[1]);
			else lkmxb1.setTjfzr("");
			if(data.get(data.size()-2).get("8").toString().split("：").length>1)
			lkmxb1.setTjf(data.get(data.size()-2).get("8").toString().split("：")[1]);
			else lkmxb1.setTjf("");
			if(data.get(data.size()-2).get("12").toString().split("：").length>1)
			lkmxb1.setTbrq(data.get(data.size()-2).get("12").toString().split("：")[1]);
			else lkmxb1.setTbrq("");
			lkmxb1.setId(s1);
			InputStream inputStream = new FileInputStream(fileupload);
			lkmxb1.setWjfile(inputStreamToByte(inputStream));
			try {
				Integer.parseInt(lkmxb1.getTbnf().substring(0,4));
			} catch (Exception e) {
				response.getWriter().print("数据错误，导入失败\r");
				return;
			}
			Lkmxb l=trqkServer.selectLqpdmxbdata(lkmxb1);
			if(l!=null){
				response.getWriter().print("该单位在该年数据已存在，导入失败\r");
				return;
			}
			booltb=trqkServer.insertLqpdmxb(lkmxb1);
			
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(data.size()-1);
			data.remove(data.size()-1);
			int i=1;
			for (Map map : data) {
				map.put("id", i);
				i++;
				map.put("mxb_id", s1);
			}
			
			booldata=trqkServer.insertLqpdmxbdata(data);
			if(booltb && booldata)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void insertLkpdData1(){
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
				dataMapArray = ExcelReader1.readExcelContent(1,19,fs,Plan_gcgj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			
			String strVerify="";
			boolean booltb=false,booldata=false;
			Lkmxb lkmxb1=new Lkmxb();
			String s = UUID.randomUUID().toString(); 
			String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
			String[] ss=data.get(0).get("17").toString().split("\n");
			lkmxb1.setBt1(ss[0]);
			lkmxb1.setBt2(ss[1]);
			lkmxb1.setBt3(ss[2]);
			lkmxb1.setBt4(ss[3]);
			lkmxb1.setBt5(ss[4]);
			data.remove(0);
			String nf = data.get(0).get("0").toString();
			System.out.println(nf.substring(nf.lastIndexOf("年")-10, nf.lastIndexOf("年")).replaceAll(" ", ""));
			System.out.println(nf.substring(nf.indexOf("：")+1, nf.indexOf("：")+40).replaceAll(" ", ""));
			
			lkmxb1.setTbdw(nf.substring(nf.indexOf("：")+1, nf.indexOf("：")+40).replaceAll(" ", ""));
			lkmxb1.setTbnf(nf.substring(nf.lastIndexOf("年")-10, nf.lastIndexOf("年")).replaceAll(" ", ""));
			lkmxb1.setBw(data.get(data.size()-1).get("0").toString());
			lkmxb1.setId(s1);
			InputStream inputStream = new FileInputStream(fileupload);
			lkmxb1.setWjfile(inputStreamToByte(inputStream));
			try {
				Integer.parseInt(lkmxb1.getTbnf().substring(0,4));
			} catch (Exception e) {
				response.getWriter().print("数据错误，导入失败\r");
				return;
			}
			Lkmxb l=trqkServer.selectLqpdmxbdata1(lkmxb1);
			if(l!=null){
				response.getWriter().print("该单位在该年数据已存在，导入失败\r");
				return;
			}
			booltb=trqkServer.insertLqpdmxb1(lkmxb1);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(data.size()-1);
			int i=1;
			for (Map map : data) {
				map.put("id", i);
				i++;
				map.put("mxb_id", s1);
				System.out.println(map);
			}
			
			booldata=trqkServer.insertLqpdmxbdata1(data);
			if(booltb && booldata)
				response.getWriter().print(fileuploadFileName+"导入成功");
		else 
			response.getWriter().print(fileuploadFileName+"导入失败\r"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void selectMxbList(){
		List<Lkmxb> list = trqkServer.selectMxbList(lkmxb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectMxbList1(){
		List<Lkmxb> list = trqkServer.selectMxbList1(lkmxb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void downjtqkhzbsdFile(){
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("multipart/form-data");
			lkmxb.setId(id);
			Wjgl wjgl1=trqkServer.downjtqkhzbsdFile(lkmxb);
			byte[] data = wjgl1.getWjfile();
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename="公路交通情况调查汇总表(省道).xls";
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+wjgl1.getWjname());
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
	public void downjtqkhzbgdFile(){
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("multipart/form-data");
			lkmxb.setId(id);
			Wjgl wjgl1=trqkServer.downjtqkhzbgdFile(lkmxb);
			byte[] data = wjgl1.getWjfile();
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename="公路交通情况调查汇总表(国道).xls";
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+wjgl1.getWjname());
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
	public void downjtqkhzbFile(){
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("multipart/form-data");
			lkmxb.setId(id);
			Wjgl wjgl1=trqkServer.downjtqkhzbFile(lkmxb);
			byte[] data = wjgl1.getWjfile();
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename="公路交通情况调查汇总表.xls";
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+wjgl1.getWjname());
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
	public void downLkpdtjbFile(){
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("multipart/form-data");
			lkmxb.setId(id);
			Wjgl wjgl1=trqkServer.downLkpdtjbFile(lkmxb);
			byte[] data = wjgl1.getWjfile();
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename="公路技术状况评定统计表.xls";
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+wjgl1.getWjname());
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
	public void downLkpdmxbFile(){
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("multipart/form-data");
			lkmxb.setId(id);
			Wjgl wjgl1=trqkServer.downLkpdmxbFile(lkmxb);
			byte[] data = wjgl1.getWjfile();
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename="公路技术状况评定明细表.xls";
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+wjgl1.getWjname());
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
	public void downLkpdmxb2014File(){
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("multipart/form-data");
			lkmxb.setId(id);
			Wjgl wjgl1=trqkServer.downLkpdmxbFile1(lkmxb);
			byte[] data = wjgl1.getWjfile();
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String filename="公路技术状况评定明细表.xls";
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
			File file=new File(realPath+wjgl1.getWjname());
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
	
	public void getMxbDataList(){
		System.out.println("开始"+id);
		lkmxb.setId(id);
		List<Lkmxb> list = trqkServer.getMxbDataList(lkmxb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void getMxbDataList1(){
		lkmxb.setId(id);
		Lkmxb lkmxb1 = trqkServer.getMxbDataList1(lkmxb);
		try {
			JsonUtils.write(lkmxb1, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void getMxbDataList2(){
		System.out.println("开始"+id);
		lkmxb.setId(id);
		List<Lkmxb> list = trqkServer.getMxbDataList2(lkmxb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void getMxbDataList3(){
		lkmxb.setId(id);
		Lkmxb lkmxb1 = trqkServer.getMxbDataList3(lkmxb);
		try {
			JsonUtils.write(lkmxb1, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void deletemxb(){
		Boolean bl=trqkServer.deletemxb(lkmxb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deletemxb1(){
		Boolean bl=trqkServer.deletemxb1(lkmxb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//
	public void insertLkpdtjData(){
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
				dataMapArray = ExcelReader1.readExcelContent(1,11,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);

			
			String s = UUID.randomUUID().toString(); 
			String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
			Lktjb lktjb1=new Lktjb();
			InputStream inputStream = new FileInputStream(fileupload);
			lktjb1.setWjfile(inputStreamToByte(inputStream));
			String[] bt=data.get(0).get("8").toString().split("\n");
			lktjb1.setBt1(bt[0]);
			lktjb1.setBt2(bt[1]);
			lktjb1.setBt3(bt[2]);
			lktjb1.setBt4(bt[3]);
			lktjb1.setBt5(bt[4]);
			data.remove(0);
			lktjb1.setId(s1);
			lktjb1.setTbdw(data.get(0).get("1").toString());
			lktjb1.setTbnf(data.get(0).get("4").toString());
			if(data.get(data.size()-2).get("0").toString().split("：").length>1)
			lktjb1.setDwfzr(data.get(data.size()-2).get("0").toString().split("：")[1]);
			else lktjb1.setDwfzr("");
			if(data.get(data.size()-2).get("2").toString().split("：").length>1)
			lktjb1.setFzr(data.get(data.size()-2).get("2").toString().split("：")[1]);
			else lktjb1.setFzr("");
			if(data.get(data.size()-2).get("5").toString().split("：").length>1)
			lktjb1.setTbr(data.get(data.size()-2).get("5").toString().split("：")[1]);
			else lktjb1.setTbr("");
			if(data.get(data.size()-2).get("8").toString().split("：").length>1)
			lktjb1.setTbrq(data.get(data.size()-2).get("8").toString().split("：")[1]);
			else lktjb1.setTbrq("");
			boolean booltb=false,booldata=false;
			try {
				Integer.parseInt(lktjb1.getTbnf().substring(0,4));
			} catch (Exception e) {
				response.getWriter().print("数据错误，导入失败\r");
				return;
			}
			Lktjb l=trqkServer.selectLktjbdata(lktjb1);
			if(l!=null){
				response.getWriter().print("该单位在该年数据已存在，导入失败\r");
				return;
			}
			booltb=trqkServer.insertLktjb(lktjb1);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(data.size()-1);
			data.remove(data.size()-1);
			int i=1;
			for (Map map : data) {
				map.put("id", i);
				map.put("bh", i);
				i++;
				map.put("tjb_id", s1);
			}
			booldata=trqkServer.insertLktjbData(data);
			if(booltb && booldata)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void selectTjbList(){
		List<Lktjb> list = trqkServer.selectTjbList(lktjb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void getTjbDataList(){
		System.out.println("开始"+id);
		lktjb.setId(id);
		List<Lktjb> list = trqkServer.getTjbDataList(lktjb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void getTjbDataList1(){
		lktjb.setId(id);
		Lktjb lkmxb1 = trqkServer.getTjbDataList1(lktjb);
		try {
			JsonUtils.write(lkmxb1, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void deletetjb(){
		Boolean bl=trqkServer.deletetjb(lktjb);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void getPqiList(){
		String[] lxbh=lkmxb.getLxbh().split(",");
		String[] qdzh = lkmxb.getQdzh().split(","); 
		String[] zdzh = lkmxb.getZdzh().split(",");
		String tiaojian="and (";
		if(qdzh.length>1){
			for (int i = 0; i < qdzh.length; i++) {
				if(i!=qdzh.length-1)
				tiaojian=tiaojian+"( lxbh="+lxbh[i]+"and to_number(qdzh)<="+qdzh[i]+" and to_number(zdzh) >="+zdzh[i]+") or ";
				else
					tiaojian=tiaojian+"( lxbh="+lxbh[i]+"and to_number(qdzh)<="+qdzh[i]+" and to_number(zdzh) >="+zdzh[i]+") )";
			}
		}else{
			for (int i = 0; i < qdzh.length; i++) {
				tiaojian=tiaojian+" lxbh="+lxbh[i]+"and to_number(qdzh)<="+qdzh[i]+" and to_number(zdzh) >="+zdzh[i]+") ";
			}
		}	
		lkmxb.setTiaojian(tiaojian);
		List<Lkmxb> list = trqkServer.getPqiList(lkmxb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	
	//
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
	
	
//	zyy add 路况汇总表
	
	public void selectHzbList(){
		List<Lkmxb> list = trqkServer.selectHzbList(lkmxb);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void insertLkpdHzData(){
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
				dataMapArray = ExcelReader1.readExcelContent(1,19,fs,Plan_gcgj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			
			String strVerify="";
			boolean booltb=false,booldata=false;
			Lkmxb lkmxb1=new Lkmxb();
			String s = UUID.randomUUID().toString(); 
			String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
			String[] ss=data.get(0).get("15").toString().split("\n");
			lkmxb1.setBt1(ss[0]);
			lkmxb1.setBt2(ss[1]);
			lkmxb1.setBt3(ss[2]);
			lkmxb1.setBt4(ss[3]);
			lkmxb1.setBt5(ss[4]);
			data.remove(0);
			String nf = data.get(0).get("0").toString();
			System.out.println(nf.substring(nf.lastIndexOf("年")-10, nf.lastIndexOf("年")).replaceAll(" ", ""));
			System.out.println(nf.substring(nf.indexOf("：")+1, nf.indexOf("：")+40).replaceAll(" ", ""));
			
			lkmxb1.setTbdw(nf.substring(nf.indexOf("：")+1, nf.indexOf("：")+40).replaceAll(" ", ""));
			lkmxb1.setTbnf(nf.substring(nf.lastIndexOf("年")-10, nf.lastIndexOf("年")).replaceAll(" ", "")+"年");
			lkmxb1.setBw(data.get(data.size()-1).get("0").toString());
			lkmxb1.setId(s1);
			InputStream inputStream = new FileInputStream(fileupload);
			lkmxb1.setWjfile(inputStreamToByte(inputStream));
			try {
				Integer.parseInt(lkmxb1.getTbnf().substring(0,4));
			} catch (Exception e) {
				response.getWriter().print("数据错误，导入失败\r");
				return;
			}
			Lkmxb l=trqkServer.selectLkhzmxbdata(lkmxb1);
			if(l!=null){
				response.getWriter().print("该单位在该年数据已存在，导入失败\r");
				return;
			}
			booltb=trqkServer.insertLkhzmxb(lkmxb1);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(0);
			data.remove(data.size()-1);
			int i=1;
			for (Map map : data) {
				map.put("id", i);
				i++;
				map.put("hzb_id", s1);
				System.out.println(map);
			}
			
			booldata=trqkServer.insertLkhzmxbdata(data);
			if(booltb && booldata)
				response.getWriter().print(fileuploadFileName+"导入成功");
		else 
			response.getWriter().print(fileuploadFileName+"导入失败\r"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}


public void downLkhzmxbFile(){
	try {
		HttpServletResponse response = getresponse();
		OutputStream out = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("multipart/form-data");
		lkmxb.setId(id);
		Wjgl wjgl1=trqkServer.downLkhzmxbFile(lkmxb);
		byte[] data = wjgl1.getWjfile();
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		String filename="公路技术状况汇总明细表.xls";
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1"));
		File file=new File(realPath+wjgl1.getWjname());
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


public void deletehzb(){
	Boolean bl=trqkServer.deletehzb(lkmxb);
	if(bl){
		ResponseUtils.write(getresponse(), "true");
	}else{
		ResponseUtils.write(getresponse(), "false");
	}
}

public void getHzmxbDataList(){
	System.out.println("开始"+id);
	lkmxb.setId(id);
	List<Lkmxb> list = trqkServer.getHzmxbDataList(lkmxb);
	try {
		JsonUtils.write(list, getresponse().getWriter());
	} catch (Exception e1) {
		e1.printStackTrace();
	}
}
public void getHzbDataList(){
	lkmxb.setId(id);
	Lkmxb lkmxb1 = trqkServer.getHzbDataList(lkmxb);
	try {
		JsonUtils.write(lkmxb1, getresponse().getWriter());
	} catch (Exception e1) {
		e1.printStackTrace();
	}
}
}