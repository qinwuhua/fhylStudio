package com.hdsx.jxzhpt.qqgl.lxsh.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsx.jxzhpt.gcgl.bean.Gcgl_jgys;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.server.KxxyjServer;
import com.hdsx.jxzhpt.qqgl.lxsh.server.LxshServer;
import com.hdsx.jxzhpt.qqgl.lxsh.server.WnjhServer;
import com.hdsx.jxzhpt.qqgl.lxsh.server.impl.LxshServerImpl;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.XmsqServer;
import com.hdsx.jxzhpt.qqgl.server.impl.CbsjServerImpl;
import com.hdsx.jxzhpt.qqgl.server.impl.JhshServerImpl;
import com.hdsx.jxzhpt.qqgl.server.impl.XmsqServerImpl;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader1;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.jxzhpt.wjxt.server.DbyhServer;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.ZdxxServer;
import com.hdsx.jxzhpt.wjxt.server.ZhqkServer;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.ibm.icu.text.SimpleDateFormat;


/**
 * 
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class WnjhController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource(name = "wnjhServerImpl")
	private WnjhServer wnjhServer;
	private int page = 1;
	private int rows = 10;
	private String xmtype;
	private String xzqh;
	private String nf;
	private Lxsh lxsh=new Lxsh();
	private Kxxyj kxxyj=new Kxxyj();
	private String gydw;
	private String xmmc;
	private String xmnf;
	private String sbzt;
	private int shzt;
	private String tsdq;
	private String jsdj;
	private String gldj;
	private int sbthcd;
	private String xmbm;
	private File uploadGkpf;
	private String uploadGkpfFileName;
	private String lsjl;
	private String fileuploadFileName;
	private File fileupload;
	private Lx lx;
	private String name;
	
	private Gcgl_jgys gcgl_jgys = new Gcgl_jgys();
	private File uploadSGXK;
	private File uploadJGTC;
	private File uploadWGYS;
	private String uploadSGXKFileName;
	private String uploadJGTCFileName;
	private String uploadWGYSFileName;
	private String lxbm;
	
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Lx getLx() {
		return lx;
	}
	public void setLx(Lx lx) {
		this.lx = lx;
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
	public Gcgl_jgys getGcgl_jgys() {
		return gcgl_jgys;
	}
	public void setGcgl_jgys(Gcgl_jgys gcgl_jgys) {
		this.gcgl_jgys = gcgl_jgys;
	}
	public File getUploadSGXK() {
		return uploadSGXK;
	}
	public void setUploadSGXK(File uploadSGXK) {
		this.uploadSGXK = uploadSGXK;
	}
	public File getUploadJGTC() {
		return uploadJGTC;
	}
	public void setUploadJGTC(File uploadJGTC) {
		this.uploadJGTC = uploadJGTC;
	}
	public File getUploadWGYS() {
		return uploadWGYS;
	}
	public void setUploadWGYS(File uploadWGYS) {
		this.uploadWGYS = uploadWGYS;
	}
	public String getUploadSGXKFileName() {
		return uploadSGXKFileName;
	}
	public void setUploadSGXKFileName(String uploadSGXKFileName) {
		this.uploadSGXKFileName = uploadSGXKFileName;
	}
	public String getUploadJGTCFileName() {
		return uploadJGTCFileName;
	}
	public void setUploadJGTCFileName(String uploadJGTCFileName) {
		this.uploadJGTCFileName = uploadJGTCFileName;
	}
	public String getUploadWGYSFileName() {
		return uploadWGYSFileName;
	}
	public void setUploadWGYSFileName(String uploadWGYSFileName) {
		this.uploadWGYSFileName = uploadWGYSFileName;
	}
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl;
	}
	public File getUploadGkpf() {
		return uploadGkpf;
	}
	public void setUploadGkpf(File uploadGkpf) {
		this.uploadGkpf = uploadGkpf;
	}
	public String getUploadGkpfFileName() {
		return uploadGkpfFileName;
	}
	public void setUploadGkpfFileName(String uploadGkpfFileName) {
		this.uploadGkpfFileName = uploadGkpfFileName;
	}
	public Kxxyj getKxxyj() {
		return kxxyj;
	}
	public void setKxxyj(Kxxyj kxxyj) {
		this.kxxyj = kxxyj;
	}
	public String getXmbm() {
		return xmbm;
	}
	public void setXmbm(String xmbm) {
		this.xmbm = xmbm;
	}
	public String getSbzt() {
		return sbzt;
	}
	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}
	public int getShzt() {
		return shzt;
	}
	public void setShzt(int shzt) {
		this.shzt = shzt;
	}
	public int getSbthcd() {
		return sbthcd;
	}
	public void setSbthcd(int sbthcd) {
		this.sbthcd = sbthcd;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}

	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}
	public String getGldj() {
		return gldj;
	}
	public void setGldj(String gldj) {
		this.gldj = gldj;
	}

	public Lxsh getLxsh() {
		return lxsh;
	}
	public void setLxsh(Lxsh lxsh) {
		this.lxsh = lxsh;
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
	public String getXmtype() {
		return xmtype;
	}
	public void setXmtype(String xmtype) {
		this.xmtype = xmtype;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	public String getNf() {
		return nf;
	}
	public void setNf(String nf) {
		this.nf = nf;
	}
	//------------------------------------------gj
	public void selectGjwnjh(){
		try {
		String tiaojian1="";
		String tiaojian2="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="andx zqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(tiaojian2);
		lxsh.setGydw(tiaojian1);
		lxsh.setXmnf(xmnf);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		List<Lxsh> list=wnjhServer.selectGjwnjh(lxsh);
		int count=wnjhServer.selectGjwnjhCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectLmwnjh(){
		try {
		String tiaojian1="";
		String tiaojian2="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="andx zqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(tiaojian2);
		lxsh.setGydw(tiaojian1);
		lxsh.setXmnf(xmnf);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		List<Lxsh> list=wnjhServer.selectLmwnjh(lxsh);
		int count=wnjhServer.selectLmwnjhCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectXjwnjh(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="andx zqhdm in ("+xzqh+")";
			}
			System.out.println(xmnf);
			lxsh.setXzqh(tiaojian2);
			lxsh.setGydw(tiaojian1);
			lxsh.setXmnf(xmnf);
			lxsh.setTsdq(tsdq);
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			List<Lxsh> list=wnjhServer.selectXjwnjh(lxsh);
			int count=wnjhServer.selectXjwnjhCount(lxsh);
			EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
	}
	
	public void wnjhGpsroad(){
		lxsh.setGhlxbh(lxbm);
		lxsh.setXzqh(xzqh);
		List<Lxsh> list=wnjhServer.wnjhGpsroad(lxsh);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void qqglGpszh1(){
		Lxsh l=wnjhServer.qqglGpszh(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void insertGjwnjh(){
		try {
			boolean bl=wnjhServer.insertGjwnjh(lxsh);
			ResponseUtils.write(getresponse(), bl+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertLmwnjh(){
		try {
			boolean bl=wnjhServer.insertLmwnjh(lxsh);
			ResponseUtils.write(getresponse(), bl+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertXjwnjh(){
		try {
			boolean bl=wnjhServer.insertXjwnjh(lxsh);
			ResponseUtils.write(getresponse(), bl+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void delwnjhSjgz(){
		boolean bl=wnjhServer.delwnjhSjgz(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void delwnjhLmgz(){
		boolean bl=wnjhServer.delwnjhLmgz(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void delwnjhXj(){
		boolean bl=wnjhServer.delwnjhXj(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void cxwnghsjByid(){
		Lxsh l=null;
		if("1".equals(lxsh.getXmlx())){
			l=wnjhServer.cxwnghsjByid(lxsh);
		}
		if("2".equals(lxsh.getXmlx())){
			l=wnjhServer.cxwnghlmByid(lxsh);
		}
		if("3".equals(lxsh.getXmlx())){
			l=wnjhServer.cxwnghxjByid(lxsh);
		}
		try {
			JsonUtils.write(l, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updatewnjhsj(){
		boolean bl=wnjhServer.updatewnjhsj(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updatewnjhlm(){
		boolean bl=wnjhServer.updatewnjhlm(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updatewnjhxj(){
		boolean bl=wnjhServer.updatewnjhxj(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void importsjgzwnjh(){
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
				dataMapArray = ExcelReader1.readExcelContent(2,29,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			//获取项目编码
			for (Map map : data) {
				LxshServer lxshServer=new LxshServerImpl();
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				map.put("xmbm", s1);
				
				//计算补助测算
				double bzcs=0;
				Lxsh ll=new Lxsh();
				ll.setXmlx("升级改造工程项目");
				ll.setGldj(map.get("1").toString().substring(0, 1));
				if(map.get("13").toString()!=null && !map.get("13").toString().equals("")){
					ll.setJsdj("一级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs= new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("14").toString()!=null && !map.get("14").toString().equals("")){
					ll.setJsdj("二级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("15").toString()!=null && !map.get("15").toString().equals("")){
					ll.setJsdj("三级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("16").toString()!=null && !map.get("16").toString().equals("")){
					ll.setJsdj("四级");

					bzcs=bzcs+ 0;
				}
				if(map.get("17").toString()!=null && !map.get("17").toString().equals("")){
					ll.setJsdj("等外");

					bzcs=bzcs+ 0;
				}
				if(map.get("18").toString()!=null && !map.get("18").toString().equals("")){
					ll.setJsdj("无路");

					bzcs=bzcs+0;
				}
				ll.setJsdj("一级");
				Lxsh l = lxshServer.selectbzcs(ll);
				
				if(l==null){
					response.getWriter().print(map.get("2").toString()+"  项目路线编码、建设技术等级有误");
					return;
				}
				BigDecimal b1=new BigDecimal(bzcs);
				BigDecimal b2=new BigDecimal(map.get("4").toString().trim()).subtract(new BigDecimal(map.get("3").toString().trim()));
				String bzys=b1.multiply(b2)+"";
				map.put("bzys", bzys);
			}
			boolean sfcg=true;
			sfcg=wnjhServer.importsjgzwnjh(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void importlmgzwnjh(){
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
				dataMapArray = ExcelReader1.readExcelContent(2,29,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			//获取项目编码
			for (Map map : data) {
				LxshServer lxshServer=new LxshServerImpl();
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				map.put("xmbm", s1);
				
				//计算补助测算
				double bzcs=0;
				Lxsh ll=new Lxsh();
				ll.setXmlx("路面改造工程项目");
				ll.setGldj(map.get("1").toString().substring(0, 1));
				if(map.get("7").toString()!=null && !map.get("7").toString().equals("")){
					ll.setJsdj("一级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs= new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("8").toString()!=null && !map.get("8").toString().equals("")){
					ll.setJsdj("二级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("9").toString()!=null && !map.get("9").toString().equals("")){
					ll.setJsdj("三级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("10").toString()!=null && !map.get("10").toString().equals("")){
					ll.setJsdj("四级");
					bzcs=bzcs+ 0;
				}
				if(map.get("11").toString()!=null && !map.get("11").toString().equals("")){
					ll.setJsdj("等外");
					bzcs=bzcs+ 0;
				}
				if(map.get("12").toString()!=null && !map.get("12").toString().equals("")){
					ll.setJsdj("无路");
					bzcs=bzcs+0;
				}
				ll.setJsdj("一级");
				Lxsh l = lxshServer.selectbzcs(ll);
				
				if(l==null){
					response.getWriter().print(map.get("2").toString()+"  项目路线编码、建设技术等级有误");
					return;
				}
				BigDecimal b1=new BigDecimal(bzcs);
				BigDecimal b2=new BigDecimal(map.get("4").toString().trim()).subtract(new BigDecimal(map.get("3").toString().trim()));
				String bzys=b1.multiply(b2)+"";
				map.put("bzys", bzys);
			}
			boolean sfcg=true;
			sfcg=wnjhServer.importlmgzwnjh(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void importxjwnjh(){
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
				dataMapArray = ExcelReader1.readExcelContent(2,29,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			//获取项目编码
			for (Map map : data) {
				LxshServer lxshServer=new LxshServerImpl();
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				map.put("xmbm", s1);
			}
				boolean sfcg=true;
				sfcg=wnjhServer.importxjwnjh(data);
				if(sfcg)
					response.getWriter().print(fileuploadFileName+"导入成功");
				else 
					response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	//---导出
	public void dcwnjhExcel(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydw=(String) session.getAttribute("gydwbb");	
			xzqh=(String) session.getAttribute("xzqhbb");	
			String tiaojian1="";
			String tiaojian2="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and t.gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1=" and t.gydwdm in ("+gydw+")";
			}
			if(xzqh.indexOf(",")==-1){
				tiaojian2=" and t.xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2=" and t.xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(tiaojian2);
			lxsh.setGydw(tiaojian1);
			String xmbt="";
			List<Excel_list> elist=new ArrayList<Excel_list>();
			if("sjgz".equals(lxsh.getXmlx())){
				xmbt="改建";
				elist=wnjhServer.querywnjhSjgz(lxsh);
			}
			if("lmgz".equals(lxsh.getXmlx())){
				xmbt="路面改造";
				elist=wnjhServer.querywnjhLmgz(lxsh);
			}
			if("xj".equals(lxsh.getXmlx())){
				xmbt="新建";
				elist=wnjhServer.querywnjhXj(lxsh);
			}
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName(xmbt+"工程项目五年规划信息表");//设置第一行 
			eldata.setSheetName("五年规划信息");//设置sheeet名
			eldata.setFileName(xmbt+"工程项目五年规划信息表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("路线编码",1,1,0,0));
			et.add(new Excel_tilte("路线名称",1,1,1,1));
			et.add(new Excel_tilte("起点桩号",1,1,2,2));
			et.add(new Excel_tilte("止点桩号",1,1,3,3));
			et.add(new Excel_tilte("起点名称",1,1,4,4));
			et.add(new Excel_tilte("止点名称",1,1,5,5));
			et.add(new Excel_tilte("建设性质",1,1,6,6));
			et.add(new Excel_tilte("管养单位",1,1,7,7));		
			et.add(new Excel_tilte("行政区划",1,1,8,8));
			et.add(new Excel_tilte("特殊地区",1,1,9,9));
			et.add(new Excel_tilte("建设技术等级",1,1,10,10));
			et.add(new Excel_tilte("现技术等级",1,1,11,11));
			et.add(new Excel_tilte("项目年份",1,1,12,12));
			et.add(new Excel_tilte("计划开工年",1,1,13,13));
			et.add(new Excel_tilte("计划完工年",1,1,14,14));
			et.add(new Excel_tilte("投资(万元)",1,1,15,15));
			et.add(new Excel_tilte("补助测算(万元)",1,1,16,16));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectwnlxbyxmid(){
		List<Lxsh> l=wnjhServer.selectlxbyxmid1(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void sfywnlx(){
		Lxsh l=wnjhServer.sfylx(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectwnSjlxList(){
			lxsh.setXmbm(xmbm);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			List<Lxsh> list=wnjhServer.selectSjgzlxList(lxsh);
			int count=wnjhServer.selectSjgzlxListCount(lxsh);
			EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
	}
}

