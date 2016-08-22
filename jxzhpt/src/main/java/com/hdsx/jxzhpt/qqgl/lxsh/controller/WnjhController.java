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
import java.util.Calendar;
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
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzsjServer;
import com.hdsx.jxzhpt.lwxm.xmjck.server.impl.JckwqgzServerImpl;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
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
	private Lx lx=new Lx();
	private String name;
	
	private Gcgl_jgys gcgl_jgys = new Gcgl_jgys();
	private File uploadSGXK;
	private File uploadJGTC;
	private File uploadWGYS;
	private String uploadSGXKFileName;
	private String uploadJGTCFileName;
	private String uploadWGYSFileName;
	private String lxbm;
	private String xmlx;

	public String xzqhBm(String bh,String name){
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
	public void setXmlx1(String str){
		if(str!=null)
			if(str.length()>0){
				String[] tsdqs=str.split(",");
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
				lxsh.setXmlx1(tsdq);
			}
	}
	public String getXmlx() {
		return xmlx;
	}
	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}
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
		String tiaojian2="";
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		if(xmnf.indexOf(",")>-1){
			xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
		}
		lxsh.setXmnf(xmnf);
		lxsh.setTsdq(tsdq);
		String gldjtj="";
		if((!"".equals(gldj))&&gldj!=null){
			String[] jsdjs = gldj.split(",");
			for (int i = 0; i < jsdjs.length; i++) {
				if(i==0)
					gldjtj=gldjtj+"and (ghlxbmtj like '"+jsdjs[i]+"'||'%' ";
				else
					gldjtj=gldjtj+"or ghlxbmtj like '"+jsdjs[i]+"'||'%' ";
			}
			gldjtj=gldjtj+")";
		}
		lxsh.setGldj(gldjtj);
		String jsdjtj="";
		if((!"".equals(jsdj))&&jsdj!=null){
			String[] jsdjs = jsdj.split(",");
			for (int i = 0; i < jsdjs.length; i++) {
				if(i==0)
					jsdjtj=jsdjtj+"and (xjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
				else
					jsdjtj=jsdjtj+"or xjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
			}
			jsdjtj=jsdjtj+")";
		}
		lxsh.setJsdj(jsdjtj);
		String jsjsdj="";
		if((!"".equals(jsdj))&&jsdj!=null){
			String[] jsdjs = jsdj.split(",");
			for (int i = 0; i < jsdjs.length; i++) {
				if(i==0)
					jsjsdj=jsjsdj+"and (jsjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
				else
					jsjsdj=jsjsdj+"or jsjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
			}
			jsjsdj=jsjsdj+")";
		}
		lxsh.setJsjsdj(jsjsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		if(lxsh.getTsdq().length()>0){
			String[] tsdqs=lxsh.getTsdq().split(",");
			String tsdq="and(";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="tsdq like '%"+tsdqs[i]+"%'";
				else
					tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			lxsh.setTsdq(tsdq);
		}
		setXmlx1(lxsh.getXmlx1());
		
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
	
	public void selectGsdwnjh(){
		try {
			String tiaojian2="";
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			if(xmnf.indexOf(",")>-1){
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
			}
			lxsh.setXmnf(xmnf);
			lxsh.setTsdq(tsdq);
			String gldjtj="";
			if((!"".equals(gldj))&&gldj!=null){
				String[] jsdjs = gldj.split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						gldjtj=gldjtj+"and (ghlxbmtj like '"+jsdjs[i]+"'||'%' ";
					else
						gldjtj=gldjtj+"or ghlxbmtj like '"+jsdjs[i]+"'||'%' ";
				}
				gldjtj=gldjtj+")";
			}
			lxsh.setGldj(gldjtj);
			String jsdjtj="";
			if((!"".equals(jsdj))&&jsdj!=null){
				String[] jsdjs = jsdj.split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						jsdjtj=jsdjtj+"and (xjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
					else
						jsdjtj=jsdjtj+"or xjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
				}
				jsdjtj=jsdjtj+")";
			}
			lxsh.setJsdj(jsdjtj);
			String jsjsdj="";
			if((!"".equals(jsdj))&&jsdj!=null){
				String[] jsdjs = jsdj.split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						jsjsdj=jsjsdj+"and (jsjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
					else
						jsjsdj=jsjsdj+"or jsjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
				}
				jsjsdj=jsjsdj+")";
			}
			lxsh.setJsjsdj(jsjsdj);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}
			setXmlx1(lxsh.getXmlx1());
			System.out.println(lxsh.getXmklx());
		List<Lxsh> list=wnjhServer.selectGsdwnjh(lxsh);
		int count=wnjhServer.selectGsdwnjhCount(lxsh);
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
			String tiaojian2="";
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			if(xmnf.indexOf(",")>-1){
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
			}
			lxsh.setXmnf(xmnf);
			lxsh.setTsdq(tsdq);
			String gldjtj="";
			if((!"".equals(gldj))&&gldj!=null){
				String[] jsdjs = gldj.split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						gldjtj=gldjtj+"and (ghlxbmtj like '"+jsdjs[i]+"'||'%' ";
					else
						gldjtj=gldjtj+"or ghlxbmtj like '"+jsdjs[i]+"'||'%' ";
				}
				gldjtj=gldjtj+")";
			}
			lxsh.setGldj(gldjtj);
			String jsdjtj="";
			if((!"".equals(jsdj))&&jsdj!=null){
				String[] jsdjs = jsdj.split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						jsdjtj=jsdjtj+"and (xjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
					else
						jsdjtj=jsdjtj+"or xjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
				}
				jsdjtj=jsdjtj+")";
			}
			lxsh.setJsdj(jsdjtj);
			String jsjsdj="";
			if((!"".equals(jsdj))&&jsdj!=null){
				String[] jsdjs = jsdj.split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						jsjsdj=jsjsdj+"and (jsjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
					else
						jsjsdj=jsjsdj+"or jsjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
				}
				jsjsdj=jsjsdj+")";
			}
			lxsh.setJsjsdj(jsjsdj);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}
			setXmlx1(lxsh.getXmlx1());
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
			String tiaojian2="";
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			if(xmnf.indexOf(",")>-1){
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
			}
			lxsh.setXmnf(xmnf);
			lxsh.setTsdq(tsdq);
			String gldjtj="";
			if((!"".equals(gldj))&&gldj!=null){
				String[] jsdjs = gldj.split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						gldjtj=gldjtj+"and (ghlxbmtj like '"+jsdjs[i]+"'||'%' ";
					else
						gldjtj=gldjtj+"or ghlxbmtj like '"+jsdjs[i]+"'||'%' ";
				}
				gldjtj=gldjtj+")";
			}
			lxsh.setGldj(gldjtj);
			String jsdjtj="";
			if((!"".equals(jsdj))&&jsdj!=null){
				String[] jsdjs = jsdj.split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						jsdjtj=jsdjtj+"and (xjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
					else
						jsdjtj=jsdjtj+"or xjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
				}
				jsdjtj=jsdjtj+")";
			}
			lxsh.setJsdj(jsdjtj);
			String jsjsdj="";
			if((!"".equals(jsdj))&&jsdj!=null){
				String[] jsdjs = jsdj.split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						jsjsdj=jsjsdj+"and (jsjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
					else
						jsjsdj=jsjsdj+"or jsjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
				}
				jsjsdj=jsjsdj+")";
			}
			lxsh.setJsjsdj(jsjsdj);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}
			setXmlx1(lxsh.getXmlx1());
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
		try {
			lxsh.setGhlxbh(lxbm);
			lxsh.setXzqh(xzqh);
			List<Lxsh> list=wnjhServer.wnjhGpsroad(lxsh);
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
			XmsqServer xmsqServer=new XmsqServerImpl();
			Xmsq xmsq=new Xmsq();
			xmsq.setXmbm(lxsh.getXmbm());
			xmsq.setYlxbh(lxsh.getGhlxbh());
			xmsq.setQdzh(lxsh.getQdzh());
			lxsh.setZdzh(lxsh.getZdzh());
			List<Lx> lxs=xmsqServer.queryLslist(xmsq);
			lxsh.setLsjl(lxs.size()>0 ? "是" : "否");
			boolean bl=wnjhServer.insertGjwnjh(lxsh);
			ResponseUtils.write(getresponse(), bl+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertLmwnjh(){
		try {
			XmsqServer xmsqServer=new XmsqServerImpl();
			Xmsq xmsq=new Xmsq();
			xmsq.setXmbm(lxsh.getXmbm());
			xmsq.setYlxbh(lxsh.getGhlxbh());
			xmsq.setQdzh(lxsh.getQdzh());
			lxsh.setZdzh(lxsh.getZdzh());
			List<Lx> lxs=xmsqServer.queryLslist(xmsq);
			lxsh.setLsjl(lxs.size()>0 ? "是" : "否");
			boolean bl=wnjhServer.insertLmwnjh(lxsh);
			ResponseUtils.write(getresponse(), bl+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertXjwnjh(){
		try {
			XmsqServer xmsqServer=new XmsqServerImpl();
			Xmsq xmsq=new Xmsq();
			xmsq.setXmbm(lxsh.getXmbm());
			xmsq.setYlxbh(lxsh.getXjlxbm());
			xmsq.setQdzh(lxsh.getXjqdzh());
			lxsh.setZdzh(lxsh.getXjzdzh());
			List<Lx> lxs=xmsqServer.queryLslist(xmsq);
			lxsh.setLsjl(lxs.size()>0 ? "是" : "否");	
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
		JhshServer jhsh = new JhshServerImpl();
		Jhsh j = new Jhsh();
		j.setXmbm(lxsh.getXmbm());
		List<Lx> ls = jhsh.queryLsxx1(j);
		lxsh.setLsjl(ls.size()>0 ? "是" : "否");
		boolean bl=wnjhServer.updatewnjhsj(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updatewnjhlm(){
		JhshServer jhsh = new JhshServerImpl();
		Jhsh j = new Jhsh();
		j.setXmbm(lxsh.getXmbm());
		List<Lx> ls = jhsh.queryLsxx1(j);
		lxsh.setLsjl(ls.size()>0 ? "是" : "否");
		boolean bl=wnjhServer.updatewnjhlm(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updatewnjhxj(){
		JhshServer jhsh = new JhshServerImpl();
		Jhsh j = new Jhsh();
		j.setXmbm(lxsh.getXmbm());
		//List<Lx> ls = jhsh.queryLsxx1(j);
		//lxsh.setLsjl(ls.size()>0 ? "是" : "否");
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
				dataMapArray = ExcelReader1.readExcelContent(2,31,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			//获取项目编码
			for (Map map : data) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				map.put("xmbm", s1);
				Jckwqgz jckwqgz=new Jckwqgz();
				lxsh.setGhlxbh(map.get("2").toString().trim());
				lx.setLxbm(map.get("2").toString().trim());
				jckwqgz.setLxbm(map.get("2").toString().trim());
				lxsh.setXzqh(map.get("12").toString().trim());
				lxsh.setQdzh(map.get("3").toString().trim());
				lx.setQdzh(map.get("3").toString().trim());
				jckwqgz.setQdzh(map.get("3").toString().trim());
				lxsh.setZdzh(map.get("4").toString().trim());
				lx.setZdzh(map.get("4").toString().trim());
				jckwqgz.setZdzh(map.get("4").toString().trim());
				Lxsh l=wnjhServer.wnjhGpsroad1(lxsh);
				map.put("lxmc", l.getLxmc());
				LxshServer lxshServer=new LxshServerImpl();
				Lxsh qdmc=lxshServer.cxqdmc(lxsh);
				Lxsh zdmc=lxshServer.cxzdmc(lxsh);
				map.put("qdmc", qdmc.getQdmc());
				map.put("zdmc", zdmc.getZdmc());
				JckwqgzServer wqgzServer=new JckwqgzServerImpl();
				JhshServer jhshServer=new JhshServerImpl();
				Lx result = jhshServer.queryJsdjAndLcByStartAndEnd(lx);
				List<String> tsdqstr=wqgzServer.selectTSDQ(jckwqgz);
				String tsdq=" ";
				if(tsdqstr.size()>0){
				for (String string : tsdqstr) {
					tsdq=tsdq+"、"+string;
				}
				tsdq=tsdq.substring(2);
				}
				map.put("tsdq",tsdq);
				map.put("yilc", result.getYilc());
				map.put("erlc", result.getErlc());
				map.put("sanlc", result.getSanlc());
				map.put("silc", result.getSilc());
				map.put("dwlc", result.getDwlc());
				map.put("wllc", result.getWllc());
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
				dataMapArray = ExcelReader1.readExcelContent(2,25,fs,Plan_gcgj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			//获取项目编码
			for (Map map : data) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				map.put("xmbm", s1);
				Jckwqgz jckwqgz=new Jckwqgz();
				lxsh.setGhlxbh(map.get("2").toString().trim());
				lx.setLxbm(map.get("2").toString().trim());
				jckwqgz.setLxbm(map.get("2").toString().trim());
				lxsh.setXzqh(map.get("7").toString().trim());
				lxsh.setQdzh(map.get("3").toString().trim());
				lx.setQdzh(map.get("3").toString().trim());
				jckwqgz.setQdzh(map.get("3").toString().trim());
				lxsh.setZdzh(map.get("4").toString().trim());
				lx.setZdzh(map.get("4").toString().trim());
				jckwqgz.setZdzh(map.get("4").toString().trim());
				Lxsh l=wnjhServer.wnjhGpsroad1(lxsh);
				map.put("lxmc", l.getLxmc());
				LxshServer lxshServer=new LxshServerImpl();
				Lxsh qdmc=lxshServer.cxqdmc(lxsh);
				Lxsh zdmc=lxshServer.cxzdmc(lxsh);
				map.put("qdmc", qdmc.getQdmc());
				map.put("zdmc", zdmc.getZdmc());
				JckwqgzServer wqgzServer=new JckwqgzServerImpl();
				JhshServer jhshServer=new JhshServerImpl();
				Lx result = jhshServer.queryJsdjAndLcByStartAndEnd(lx);
				List<String> tsdqstr=wqgzServer.selectTSDQ(jckwqgz);
				String tsdq=" ";
				if(tsdqstr.size()>0){
				for (String string : tsdqstr) {
					tsdq=tsdq+"、"+string;
				}
				tsdq=tsdq.substring(2);
				}
				map.put("tsdq",tsdq);
				map.put("yilc", result.getYilc());
				map.put("erlc", result.getErlc());
				map.put("sanlc", result.getSanlc());
				map.put("silc", result.getSilc());
				map.put("dwlc", result.getDwlc());
				map.put("wllc", result.getWllc());
			}
			boolean sfcg=true;
			sfcg=wnjhServer.importlmgzwnjh(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
			try {
				response.getWriter().print(fileuploadFileName+"导入失败，请检查路线编码、起点桩号、止点桩号和行政区划\r");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
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
			System.out.println(lxsh.getXmklx());
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
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			lxsh.setGydw(tiaojian1);
			String gldjtj="";
			if((!"".equals(lxsh.getGldj()))&&lxsh.getGldj()!=null){
				String[] jsdjs = lxsh.getGldj().split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						gldjtj=gldjtj+"and (ghlxbh like '"+jsdjs[i]+"'||'%' ";
					else
						gldjtj=gldjtj+"or ghlxbh like '"+jsdjs[i]+"'||'%' ";
				}
				gldjtj=gldjtj+")";
			}
			lxsh.setGldj(gldjtj);
			String jsdjtj="";
			if((!"".equals(lxsh.getJsdj()))&&lxsh.getJsdj()!=null){
				String[] jsdjs = lxsh.getJsdj().split(",");
				for (int i = 0; i < jsdjs.length; i++) {
					if(i==0)
						jsdjtj=jsdjtj+"and (xjsdj like '%'||'"+jsdjs[i]+"'||'%' ";
					else
						jsdjtj=jsdjtj+"or xjsdj like '%'||'"+jsdjs[i]+"'||'%' ";
				}
				jsdjtj=jsdjtj+")";
			}
			
			lxsh.setJsdj(jsdjtj);
			String xmbt="";
			if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}
			List<Excel_list> elist=new ArrayList<Excel_list>();
			if("gsdgz".equals(lxsh.getXmlx())){
				if(lxsh.getXmlx1()!=null)
					if(lxsh.getXmlx1().length()>0){
						String[] tsdqs=lxsh.getXmlx1().split(",");
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
						lxsh.setXmlx1(tsdq);
					}
				xmbt="国省道改造";
				elist=wnjhServer.querywnjhGsdgz(lxsh);
			}
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
			et.add(new Excel_tilte("项目名称",1,1,0,0));
			et.add(new Excel_tilte("原路线编码",1,1,1,1));
			et.add(new Excel_tilte("原路线名称",1,1,2,2));
			et.add(new Excel_tilte("原起点桩号",1,1,3,3));
			et.add(new Excel_tilte("原止点桩号",1,1,4,4));
			et.add(new Excel_tilte("规划路线编码",1,1,5,5));
			et.add(new Excel_tilte("规划路线名称",1,1,6,6));
			et.add(new Excel_tilte("规划起点桩号",1,1,7,7));
			et.add(new Excel_tilte("规划止点桩号",1,1,8,8));
			et.add(new Excel_tilte("共线路线编码",1,1,9,9));
			et.add(new Excel_tilte("共线起点桩号",1,1,10,10));
			et.add(new Excel_tilte("共线止点桩号",1,1,11,11));
			et.add(new Excel_tilte("里程",1,1,12,12));
			et.add(new Excel_tilte("起点名称",1,1,13,13));
			et.add(new Excel_tilte("止点名称",1,1,14,14));
			et.add(new Excel_tilte("建设性质",1,1,15,15));
			et.add(new Excel_tilte("管养单位",1,1,16,16));		
			et.add(new Excel_tilte("行政区划",1,1,17,17));
			et.add(new Excel_tilte("特殊地区",1,1,18,18));
			et.add(new Excel_tilte("建设技术等级",1,1,19,19));
			et.add(new Excel_tilte("现技术等级",1,1,20,20));
			et.add(new Excel_tilte("项目年份",1,1,21,21));
			et.add(new Excel_tilte("计划开工年",1,1,22,22));
			et.add(new Excel_tilte("计划完工年",1,1,23,23));
			et.add(new Excel_tilte("投资(万元)",1,1,24,24));
			et.add(new Excel_tilte("补助测算(万元)",1,1,25,25));
			et.add(new Excel_tilte("项目库类型",1,1,26,26));
			et.add(new Excel_tilte("备注",1,1,27,27));
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
	public void setJsdj(){
		String json="";
		String json1="[";
				json=json+"{id:"+"'一级'"+",text:"+"'一级'"+",iconCls:'icon-none'},"
				+"{id:"+"'二级'"+",text:"+"'二级'"+",iconCls:'icon-none'},"
				+"{id:"+"'三级'"+",text:"+"'三级'"+",iconCls:'icon-none'},"		
				+"{id:"+"'四级'"+",text:"+"'四级'"+",iconCls:'icon-none'},"
				+"{id:"+"'等外'"+",text:"+"'等外'"+",iconCls:'icon-none'},"
				+"{id:"+"'高速'"+",text:"+"'高速'"+",iconCls:'icon-none'}";
		try {
			JsonUtils.write(json1+json+"]", getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void setXmnf(){
		Calendar a=Calendar.getInstance();
		int nian=a.get(Calendar.YEAR);
		int nian1=nian-10;
		String json="";
		String json1="[";
		for (int i = 2015; i <= 2020; i++) {
			if(i==nian)
				json=json+"{id:"+i+",text:"+i+",iconCls:'icon-none',checked:'true'},";
			else if(i==nian1)
				json=json+"{id:"+i+",text:"+i+",iconCls:'icon-none'}";
			else
				json=json+"{id:"+i+",text:"+i+",iconCls:'icon-none'},";
		}
		try {
			JsonUtils.write(json1+json+"]", getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void selectGjwnjhcf(){
		Lxsh l=wnjhServer.selectGjwnjhcf(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectLmwnjhcf(){
		Lxsh l=wnjhServer.selectLmwnjhcf(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectXjwnjhcf(){
		Lxsh l=wnjhServer.selectXjwnjhcf(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertGjlxwnjh(){
		XmsqServer xmsqServer=new XmsqServerImpl();
		lxsh.setLsjl(xmsqServer.queryLsjl(lxsh.getGhlxbh(), lxsh.getQdzh(), lxsh.getZdzh(),lxsh.getXmnf())>0 ? "是" : "否");
		ResponseUtils.write(getresponse(), wnjhServer.insertGjlxwnjh(lxsh)+"");
	}
	public void updatewnjhsjlx(){
		ResponseUtils.write(getresponse(), wnjhServer.updatewnjhsjlx(lxsh)+"");
	}
	public void deleteWnlx(){
		ResponseUtils.write(getresponse(), wnjhServer.deleteWnlx(lxsh)+"");
	}
	public void showgjtj(){
	try {
		String tiaojian2="";
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		if(xmnf.indexOf(",")>-1){
			xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
		}
		lxsh.setXmnf(xmnf);
		lxsh.setTsdq(tsdq);
		String gldjtj="";
		if((!"".equals(gldj))&&gldj!=null){
			String[] jsdjs = gldj.split(",");
			for (int i = 0; i < jsdjs.length; i++) {
				if(i==0)
					gldjtj=gldjtj+"and (ghlxbmtj like '"+jsdjs[i]+"'||'%' ";
				else
					gldjtj=gldjtj+"or ghlxbmtj like '"+jsdjs[i]+"'||'%' ";
			}
			gldjtj=gldjtj+")";
		}
		lxsh.setGldj(gldjtj);
		String jsdjtj="";
		if((!"".equals(jsdj))&&jsdj!=null){
			String[] jsdjs = jsdj.split(",");
			for (int i = 0; i < jsdjs.length; i++) {
				if(i==0)
					jsdjtj=jsdjtj+"and (xjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
				else
					jsdjtj=jsdjtj+"or xjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
			}
			jsdjtj=jsdjtj+")";
		}
		lxsh.setJsdj(jsdjtj);
		String jsjsdj="";
		if((!"".equals(jsdj))&&jsdj!=null){
			String[] jsdjs = jsdj.split(",");
			for (int i = 0; i < jsdjs.length; i++) {
				if(i==0)
					jsjsdj=jsjsdj+"and (jsjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
				else
					jsjsdj=jsjsdj+"or jsjsdjtj like '%'||'"+jsdjs[i]+"'||'%' ";
			}
			jsjsdj=jsjsdj+")";
		}
		lxsh.setJsjsdj(jsjsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		if(lxsh.getTsdq().length()>0){
			String[] tsdqs=lxsh.getTsdq().split(",");
			String tsdq="and(";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="tsdq like '%"+tsdqs[i]+"%'";
				else
					tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			lxsh.setTsdq(tsdq);
		}
		setXmlx1(lxsh.getXmlx1());
		
		Lxsh l=new Lxsh();
		if("gsdgz".equals(xmlx)){
			l=wnjhServer.showgsdtj(lxsh);}
		if("sjgz".equals(xmlx))
			
			l=wnjhServer.showgjtj(lxsh);
		if("lmgz".equals(xmlx))
			l=wnjhServer.showlmtj(lxsh);
		if("xj".equals(xmlx))
			l=wnjhServer.showxjtj(lxsh);
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 规划库数据分析中查询弹窗列表数据
	 */
	public void ghksjfxXjAndGj(){
		try {
			String xzqhdm=null;
			if(xzqh!=null){
				if(xzqh.indexOf(",")==-1){
					int i=0;
					if(xzqh.matches("^[0-9]*[1-9]00$")){
						i=2;
					}else if(xzqh.matches("^[0-9]*[1-9]0000$")){
						i=4;
					}
					xzqh=xzqh.substring(0,xzqh.length()-i);
				}
				xzqhdm= xzqh.indexOf(",")==-1 ? "and xzqhdm like '%"+xzqh+"%'" : "and xzqhdm in ("+xzqh+")";
			}
			System.out.println(xzqhdm);
			lxsh.setXzqh(xzqhdm);
			lxsh.setLxbm(lx.getLxbm());
			List<Lxsh> result = wnjhServer.selectJxAndGj(lxsh);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void ghkfxSelect(){
		Map<String, Object> result = new HashMap<String, Object>();
		//查询选中的规划库项目
		lxsh.setId(lx.getId());
		List<Lxsh> selectJxAndGj = wnjhServer.selectJxAndGj(lxsh);
		result.put("ghkXm", selectJxAndGj);
		
		//查询原路线信息
		lxsh.setLxbm(lx.getLxbm());
		List<Map<String, Object>> ylx = wnjhServer.selectYlx(lxsh);
		result.put("ylx", ylx);
		//计算完工后的路线里程信息
		List<Map<String, Object>> wgh = new ArrayList<Map<String,Object>>(ylx);
		for (Map<String, Object> wgitem : wgh) {
			for (Lxsh ghitem : selectJxAndGj) {
				double yi = Double.valueOf(String.valueOf(wgitem.get("YJ"))).doubleValue() + Double.valueOf(String.valueOf(ghitem.getJhyilc() )).doubleValue() - Double.valueOf(String.valueOf(ghitem.getYilc())).doubleValue();
				double er = Double.valueOf(String.valueOf(wgitem.get("EJ"))).doubleValue() + Double.valueOf(String.valueOf(ghitem.getJherlc())).doubleValue() - Double.valueOf(String.valueOf(ghitem.getErlc())).doubleValue();
				double san = Double.valueOf(String.valueOf(wgitem.get("SJ"))).doubleValue() + Double.valueOf(String.valueOf(ghitem.getJhsanlc())).doubleValue() - Double.valueOf(String.valueOf(ghitem.getSanlc())).doubleValue();
				double si = Double.valueOf(String.valueOf(wgitem.get("SIJ"))).doubleValue() + Double.valueOf(String.valueOf(ghitem.getJhsilc())).doubleValue() - Double.valueOf(String.valueOf(ghitem.getSilc())).doubleValue();
				double wl = Double.valueOf(String.valueOf(wgitem.get("WL"))).doubleValue() + Double.valueOf(String.valueOf(ghitem.getJhwllc())).doubleValue() - Double.valueOf(String.valueOf(ghitem.getWllc())).doubleValue();
				wgitem.put("YJ", String.format("%.3f", yi));
				wgitem.put("ER", String.format("%.3f", er));
				wgitem.put("SJ", String.format("%.3f", san));
				wgitem.put("SIJ", String.format("%.3f", si));
				wgitem.put("WL", String.format("%.3f", wl));
				break;
			}
		}
		result.put("wghlx", wgh);
		//查询市级统计信息
		String[] xzqhdms = lx.getXzqhdm().split(",");
		String[] xzqhs = lx.getXzqh().split(",");
		List<Map<String, Object>> wghtj = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> ytj = new ArrayList<Map<String,Object>>();
		for (int i=0;i<xzqhdms.length;i++) {
			if(xzqhdms[i].indexOf(",")==-1){
				int j=0;
				if(xzqhdms[i].matches("^[0-9]*[1-9]00$")){
					j=2;
				}else if(xzqhdms[i].matches("^[0-9]*[1-9]0000$")){
					j=4;
				}
				xzqhdms[i]=xzqhdms[i].substring(0,xzqhdms[i].length()-j);
			}
			List<Map<String, Object>> yMap = wnjhServer.selectYSj(xzqhdms[i],xzqhs[i]);
			List<Map<String, Object>> wghMap =wnjhServer.selectGhSj(xzqhdms[i],false);
			for (Map<String, Object> wgitem : wghMap) {
				for (Map<String, Object> yitem : yMap) {
					double yi = Double.valueOf(String.valueOf(yitem.get("YJ"))).doubleValue() + Double.valueOf(String.valueOf(wgitem.get("JHYILC"))) - Double.valueOf(String.valueOf(wgitem.get("YILC")));
					double er = Double.valueOf(String.valueOf(yitem.get("EJ"))).doubleValue() + Double.valueOf(String.valueOf(wgitem.get("JHERLC"))) - Double.valueOf(String.valueOf(wgitem.get("ERLC")));
					double san = Double.valueOf(String.valueOf(yitem.get("SJ"))).doubleValue() + Double.valueOf(String.valueOf(wgitem.get("JHSANLC"))) - Double.valueOf(String.valueOf(wgitem.get("SANLC")));
					double si = Double.valueOf(String.valueOf(yitem.get("SIJ"))).doubleValue() + Double.valueOf(String.valueOf(wgitem.get("JHSILC"))) - Double.valueOf(String.valueOf(wgitem.get("SILC")));
					double wl = Double.valueOf(String.valueOf(yitem.get("WL"))).doubleValue() + Double.valueOf(String.valueOf(wgitem.get("JHWLLC"))) - Double.valueOf(String.valueOf(wgitem.get("WLLC")));
					wgitem.put("JHYILC", String.valueOf(String.format("%.3f", yi)));
					wgitem.put("JHERLC", String.valueOf(String.format("%.3f", er)));
					wgitem.put("JHSANLC", String.valueOf(String.format("%.3f", san)));
					wgitem.put("JHSILC", String.valueOf(String.format("%.3f", si)));
					wgitem.put("JHWLLC", String.valueOf(String.format("%.3f", wl)));
					wgitem.put("XZQHMC", yitem.get("XZQHMC"));
					break;
				}
			}
			ytj.addAll(yMap);
			wghtj.addAll(wghMap);
		}
		List<Map<String, Object>> yMap = wnjhServer.selectYSj("36","江西省");
		ytj.addAll(yMap);
		List<Map<String, Object>> wghMap =wnjhServer.selectGhSj("36",true);
		wghtj.addAll(wghMap);
		result.put("ytj", ytj);
		result.put("wgtj", wghtj);
		try {
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getWninfobyid(){
		try {
			Lxsh l = null;
			if ("改建".equals(xmlx)) {
				l = wnjhServer.getWngjinfobyid(xmbm);
			}
			if ("路面改造".equals(xmlx)) {
				l = wnjhServer.getWnlminfobyid(xmbm);
			}
			if ("新建".equals(xmlx)) {
				l = wnjhServer.getWnxjinfobyid(xmbm);
			}
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

