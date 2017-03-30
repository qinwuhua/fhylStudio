package com.hdsx.jxzhpt.qqgl.lxsh.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcgl_jgys;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.server.KxxyjServer;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.impl.CbsjServerImpl;
import com.hdsx.jxzhpt.qqgl.server.impl.JhshServerImpl;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader1;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class KxxyjController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource(name = "kxxyjServerImpl")
	private KxxyjServer kxxyjServer;
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
	private String shzt;
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
	
	private String ghlxbm;
	private String ghlxmc;
	private String jsjsdj;
	
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
	public String getGhlxbm() {
		return ghlxbm;
	}
	public void setGhlxbm(String ghlxbm) {
		this.ghlxbm = ghlxbm;
	}
	public String getGhlxmc() {
		return ghlxmc;
	}
	public void setGhlxmc(String ghlxmc) {
		this.ghlxmc = ghlxmc;
	}
	public String getJsjsdj() {
		return jsjsdj;
	}
	public void setJsjsdj(String jsjsdj) {
		this.jsjsdj = jsjsdj;
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
	public KxxyjServer getKxxyjServer() {
		return kxxyjServer;
	}
	public void setKxxyjServer(KxxyjServer kxxyjServer) {
		this.kxxyjServer = kxxyjServer;
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
	public String getShzt() {
		return shzt;
	}
	public void setShzt(String shzt) {
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
		if(gldj!=null && !gldj.equals("")){
			String[] split1 = gldj.split(",");
			gldj="";
			for (int i = 0; i < split1.length; i++) {
				gldj+=i==split1.length-1 ? "lxbm like '"+split1[i]+"%'" : "lxbm like '"+split1[i]+"%' or ";
			}
			gldj = "("+gldj+")";
		}
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
	public void selectSjgzkxList(){
		try {
			//String tiaojian1="";
			String tiaojian2="";
			/*if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}*/
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and t.xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and t.xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			//lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")>-1){
				xmnf = "t1.xmnf in ("+xmnf+")";
			}else{
				xmnf = "t1.xmnf = '"+xmnf+"'";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			
			if(jsjsdj.indexOf(",")>-1){
				String[] split = jsjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsjsdj = "(xjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsjsdj += " or xjsdj like '%"+split[i]+"%')";
					}else{
						jsjsdj += " or xjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsjsdj)||jsjsdj==null)
					jsjsdj = "xjsdj like '%"+jsjsdj+"%'";
				else{
					jsjsdj = "";
				}
			}
			lxsh.setLsxmlx(MyUtil.getQueryTJ(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(tsdq);
			lxsh.setGldj(gldj);
			jsdjHandle();
			lxsh.setJsdj(jsdj);
			lxsh.setJsjsdj(jsjsdj);
			//lxsh.setGhlxbm(ghlxbm);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(lxsh.getGhlxbh(), "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
			lxsh.setGhlxmc(ghlxmc);
			lxsh.setLsjl(lsjl);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			//System.out.println(gldj);
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
			List<Kxxyj> list=kxxyjServer.selectSjgzList(lxsh);
			int count=kxxyjServer.selectSjgzListCount(lxsh);
			EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void selectgsdkxList(){
		try {
			//String tiaojian1="";
			String tiaojian2="";
			/*if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}*/
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and t.xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and t.xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			//lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			String newXmnf = null;
			//int ss = xmnf.indexOf(",");
			if(xmnf.indexOf(",")==0){
				newXmnf = xmnf.substring(1);
				//System.out.println("sssssssssssss"+newXmnf);
			}else{
				newXmnf = xmnf;
			}
			if(xmnf.indexOf(",")>-1){
				xmnf = "t1.xmnf in ("+newXmnf+")";
			}else{
				xmnf = "t1.xmnf = '"+newXmnf+"'";
			}
			
			
			//技术等级
			if(jsjsdj.indexOf(",")>-1){
				String[] split = jsjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsjsdj = "(xjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsjsdj += " or xjsdj like '%"+split[i]+"%')";
					}else{
						jsjsdj += " or xjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsjsdj)||jsjsdj==null)
					jsjsdj = "xjsdj like '%"+jsjsdj+"%'";
				else{
					jsjsdj = "";
				}
			}
			lxsh.setLsxmlx(MyUtil.getQueryTJ(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(tsdq);
			lxsh.setGldj(gldj);
			jsdjHandle();
			lxsh.setJsdj(jsdj);
			lxsh.setLsjl(lsjl);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(lxsh.getGhlxbh(), "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
			lxsh.setGhlxmc(ghlxmc);
			lxsh.setJsjsdj(jsjsdj);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			System.out.println(gldj);
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
							tsdq+="and(t.xmlx1 like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or t.xmlx1 like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					lxsh.setXmlx1(tsdq);
				}
			
			List<Kxxyj> list=kxxyjServer.selectgsdkxList(lxsh);
			int count=kxxyjServer.selectgsdkxListCount(lxsh);
			EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	
	
	
	public void selectSjgzkxbgList(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and t.xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and t.xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")>-1){
				xmnf = "t1.xmnf in ("+xmnf+")";
			}else{
				xmnf = "t1.xmnf = '"+xmnf+"'";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(tsdq);
			lxsh.setGldj(gldj);
			jsdjHandle();
			lxsh.setJsdj(jsdj);
			lxsh.setLsjl(lsjl);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			System.out.println(gldj);
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
			lxsh.setLsxmlx(MyUtil.getQueryTJ(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			List<Kxxyj> list=kxxyjServer.selectSjgzkxbgList(lxsh);
			int count=kxxyjServer.selectSjgzkxbgListCount(lxsh);
			EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	private void jsdjHandle() {
		//建设技术等级
		if(jsdj!=null && !jsdj.equals("")){
			if(jsdj.indexOf(",")>-1){
				String[] split = jsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsdj = "(t.jsjsdj like '"+split[i]+"'";
					}else if(i==split.length-1){
						jsdj += " or t.jsjsdj like '"+split[i]+"')";
					}else{
						jsdj += " or t.jsjsdj like '"+split[i]+"'";
					}
				}
			}else{
				jsdj = "t.jsjsdj like '"+jsdj+"'";
			}
			lxsh.setJsdj(jsdj);
		}
	}
	public void selectLmgzkxList(){
		//String tiaojian1="";
		String tiaojian2="";
		/*if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}*/
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and t.xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and t.xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		//lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		if(xmnf.indexOf(",")>-1){
			xmnf = "t1.xmnf in ("+xmnf+")";
		}else{
			xmnf = "t1.xmnf = '"+xmnf+"'";
		}
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		
		
		//技术等级
		if(jsjsdj.indexOf(",")>-1){
			String[] split = jsjsdj.split(",");
			for (int i = 0; i < split.length; i++) {
				if(i==0){
					jsjsdj = "(xjsdj like '%"+split[i]+"%'";
				}else if(i==split.length-1){
					jsjsdj += " or xjsdj like '%"+split[i]+"%')";
				}else{
					jsjsdj += " or xjsdj like '%"+split[i]+"%'";
				}
			}
		}else{
			if(!"".equals(jsjsdj)||jsjsdj==null)
				jsjsdj = "xjsdj like '%"+jsjsdj+"%'";
			else{
				jsjsdj = "";
			}
		}
		lxsh.setLsxmlx(MyUtil.getQueryTJ(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setSbthcd(sbthcd);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		jsdjHandle();
		lxsh.setJsdj(jsdj);
		lxsh.setJsjsdj(jsjsdj);
		lxsh.setGhlxbh(MyUtil.getQueryTJ(lxsh.getGhlxbh(), "lxbm"));
		lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
		lxsh.setGhlxmc(ghlxmc);
		lxsh.setLsjl(lsjl);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		System.out.println(gldj);
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
		List<Kxxyj> list=kxxyjServer.selectLmgzkxList(lxsh);
		int count=kxxyjServer.selectLmgzkxListCount(lxsh);
		EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectLmgzkxbgList(){
		String tiaojian1="";
		String tiaojian2="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and t.xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and t.xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		if(xmnf.indexOf(",")>-1){
			xmnf = "t1.xmnf in ("+xmnf+")";
		}else{
			xmnf = "t1.xmnf = '"+xmnf+"'";
		}
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setLsxmlx(MyUtil.getQueryTJ(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
		lxsh.setSbthcd(sbthcd);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		jsdjHandle();
		lxsh.setJsdj(jsdj);
		lxsh.setLsjl(lsjl);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		System.out.println(gldj);
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
		List<Kxxyj> list=kxxyjServer.selectLmgzkxbgList(lxsh);
		int count=kxxyjServer.selectLmgzkxbgListCount(lxsh);
		EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void selectXjkxList(){
		String tiaojian1="";
		String tiaojian2="";
		/*if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}*/
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and t.xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and t.xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		//lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		if(xmnf.indexOf(",")>-1){
			xmnf = "t1.xmnf in ("+xmnf+")";
		}else{
			xmnf = "t1.xmnf = '"+xmnf+"'";
		}
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		

		//技术等级
		if(jsjsdj.indexOf(",")>-1){
			String[] split = jsjsdj.split(",");
			for (int i = 0; i < split.length; i++) {
				if(i==0){
					jsjsdj = "(xjsdj like '%"+split[i]+"%'";
				}else if(i==split.length-1){
					jsjsdj += " or xjsdj like '%"+split[i]+"%')";
				}else{
					jsjsdj += " or xjsdj like '%"+split[i]+"%'";
				}
			}
		}else{
			if(!"".equals(jsjsdj)||jsjsdj==null)
				jsjsdj = "xjsdj like '%"+jsjsdj+"%'";
			else{
				jsjsdj = "";
			}
		}
		lxsh.setLsxmlx(MyUtil.getQueryTJ(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setSbthcd(sbthcd);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		jsdjHandle();
		lxsh.setJsdj(jsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		lxsh.setJsjsdj(jsjsdj);
		lxsh.setGhlxbh(MyUtil.getQueryTJ(lxsh.getGhlxbh(), "lxbm"));
		lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
		lxsh.setGhlxmc(ghlxmc);
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
		List<Kxxyj> list=kxxyjServer.selectXjkxList(lxsh);
		int count=kxxyjServer.selectXjkxListCount(lxsh);
		EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void selectXjkxbgList(){
		String tiaojian1="";
		String tiaojian2="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and t.xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and t.xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		if(xmnf.indexOf(",")>-1){
			xmnf = "t1.xmnf in ("+xmnf+")";
		}else{
			xmnf = "t1.xmnf = '"+xmnf+"'";
		}
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setSbthcd(sbthcd);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		jsdjHandle();
		lxsh.setJsdj(jsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		lxsh.setLsxmlx(MyUtil.getQueryTJ(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
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
		List<Kxxyj> list=kxxyjServer.selectXjkxbgList(lxsh);
		int count=kxxyjServer.selectXjkxbgListCount(lxsh);
		EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//
	public void uploadGkpf() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			String fileurl="E:\\江西综合平台上传文件\\gkpfwj\\";
			File file =new File(fileurl);
			if(uploadGkpf!=null){
				String fid=UUID.randomUUID().toString();
				Plan_upload uploads =new Plan_upload(fid,uploadGkpfFileName, "工可批复文件", kxxyj.getXmbm(), 
						"E:\\江西综合平台上传文件/gkpfwj/"+uploadGkpfFileName, kxxyj.getGkpfwh());
				CbsjServer cbsjServer =new CbsjServerImpl();
				uploads.setFid(fid);
				Plan_upload result = cbsjServer.queryFileByWh(uploads);
				if(result==null && cbsjServer.insertFile(uploads) && cbsjServer.insertFileJl(uploads)){
					uploadFile(file,uploadGkpfFileName);
					response.getWriter().print(uploadGkpfFileName+"上传成功！");
				}else{
					uploads.setFid(result.getId());
					cbsjServer.insertFileJl(uploads);
					response.getWriter().print(uploadGkpfFileName+"上传成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(uploadGkpfFileName+"上传失败！");
			throw e;
		}
	}
	private void uploadFile(File file,String fileName) throws FileNotFoundException,IOException {
		if(!file.exists()){
			file.mkdirs();
		}
		InputStream is = new FileInputStream(uploadGkpf); 
		File saveFile =new File(file, fileName);
		OutputStream os = new FileOutputStream(saveFile);
		//设置缓存  
		byte[] buffer = new byte[1024]; 
		int length = 0;
		while((length= is.read(buffer))>0){
			os.write(buffer,0,length);
		}
		is.close();
		os.flush();
		os.close();
	}
	//
	public void uploadJGYSFile() throws Exception{
		FileInputStream fs=null;
		byte[] data;
		System.out.println(gcgl_jgys);
		if("qlzmwj".equals(gcgl_jgys.getName()))
			gcgl_jgys.setFiletype("桥梁正面文件");
		if("qlcmwj".equals(gcgl_jgys.getName()))
			gcgl_jgys.setFiletype("桥梁侧面文件");
		if("wgqlzmwj".equals(gcgl_jgys.getName()))
			gcgl_jgys.setFiletype("完工桥梁正面文件");
		if("wgqlcmwj".equals(gcgl_jgys.getName()))
			gcgl_jgys.setFiletype("完工桥梁侧面文件");
		if("wgqlzsgxk".equals(gcgl_jgys.getName()))
			gcgl_jgys.setFiletype("施工许可");
		try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("utf-8"); 		
				if((uploadJGTC!=null)){
					fs=new FileInputStream(this.uploadJGTC);
					data=new byte[(int) this.uploadJGTC.length()];
					fs.read(data);
					gcgl_jgys.setFilename(uploadJGTCFileName);
					gcgl_jgys.setFiledata(data);
				   if(kxxyjServer.updateJGTC(gcgl_jgys))
					   response.getWriter().print(uploadJGTCFileName+"导入成功");
				   else response.getWriter().print(uploadJGTCFileName+"导入失败");
			}else{
					fs=new FileInputStream(this.uploadWGYS);
					data=new byte[(int) this.uploadWGYS.length()];
					fs.read(data);
					gcgl_jgys.setFilename(uploadWGYSFileName);
					gcgl_jgys.setFiledata(data);
					if(kxxyjServer.updateWGYS(gcgl_jgys))
						response.getWriter().print(uploadWGYSFileName+"导入成功");
					   else response.getWriter().print(uploadWGYSFileName+"导入失败");
				}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			fs.close();
		}
	}
	
	public void updateSjgzkxx(){
		boolean bl=kxxyjServer.updateSjgzkxx(kxxyj);
		if(bl){
			lx.setXmid(kxxyj.getXmbm());
			lx.setLxbm(kxxyj.getLxbh());
			lx.setQdzh(kxxyj.getQdzh());
			lx.setZdzh(kxxyj.getZdzh());
			lx.setXzqh(kxxyj.getXzqh());
			lx.setXzqhdm(kxxyj.getXzqhdm());
			lx.setGhlxbm(kxxyj.getGhlxbm());
			lx.setGhqdzh(kxxyj.getGhqdzh());
			lx.setGhzdzh(kxxyj.getGhzdzh());
			lx.setGxlxbm(kxxyj.getGxlxbm());
			lx.setGxqdzh(kxxyj.getGxqdzh());
			lx.setGxzdzh(kxxyj.getGxzdzh());
			lx.setGhlxmc(kxxyj.getGhlxmc());
			lx.setSffirst("1");
			lx.setJdbs("1");
			lx.setLc(kxxyj.getLc());
			lx.setJszlc(kxxyj.getJszlc());
			System.out.println("路线编码："+lx.getLxbm());
			JhshServer jhshServer = new JhshServerImpl();
			jhshServer.updateLx(lx);
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateLmgzkxx(){
		boolean bl=kxxyjServer.updateLmgzkxx(kxxyj);
		if(bl){
			lx.setXmid(kxxyj.getXmbm());
			lx.setLxbm(kxxyj.getLxbh());
			lx.setQdzh(kxxyj.getQdzh());
			lx.setZdzh(kxxyj.getZdzh());
			lx.setGhlxbm(kxxyj.getGhlxbm());
			lx.setGhqdzh(kxxyj.getGhqdzh());
			lx.setGhzdzh(kxxyj.getGhzdzh());
			lx.setGxlxbm(kxxyj.getGxlxbm());
			lx.setGxqdzh(kxxyj.getGxqdzh());
			lx.setGxzdzh(kxxyj.getGxzdzh());
			lx.setGhlxmc(kxxyj.getGhlxmc());
			lx.setSffirst("1");
			lx.setJdbs("1");
			JhshServer jhshServer = new JhshServerImpl();
			jhshServer.updateLx(lx);
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateShkxx(){
		boolean bl=kxxyjServer.updateShkxx(kxxyj);
		if(bl){
			lx.setXmid(kxxyj.getXmbm());
			lx.setLxbm(kxxyj.getLxbh());
			lx.setQdzh(kxxyj.getQdzh());
			lx.setZdzh(kxxyj.getZdzh());
			lx.setGhlxbm(kxxyj.getGhlxbm());
			lx.setGhqdzh(kxxyj.getGhqdzh());
			lx.setGhzdzh(kxxyj.getGhzdzh());
			lx.setGxlxbm(kxxyj.getGxlxbm());
			lx.setGxqdzh(kxxyj.getGxqdzh());
			lx.setGxzdzh(kxxyj.getGxzdzh());
			lx.setGhlxmc(kxxyj.getGhlxmc());
			lx.setSffirst("1");
			lx.setJdbs("1");
			JhshServer jhshServer = new JhshServerImpl();
			jhshServer.updateLx(lx);
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateXjkxx(){
		boolean bl=kxxyjServer.updateXjkxx(kxxyj);
		if(bl){
			lx.setXmid(kxxyj.getXmbm());
			lx.setLxbm(kxxyj.getLxbh());
			lx.setQdzh(kxxyj.getQdzh());
			lx.setZdzh(kxxyj.getZdzh());
			lx.setSffirst("1");
			lx.setJdbs("1");
			JhshServer jhshServer = new JhshServerImpl();
			jhshServer.updateLx(lx);
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void sbsjgzkxx(){
		boolean bl=kxxyjServer.sbsjgzkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void sblmgzkxx(){
		boolean bl=kxxyjServer.sblmgzkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void sbxjkxx(){
		boolean bl=kxxyjServer.sbxjkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thSjgzkxx(){
		boolean bl=kxxyjServer.thSjgzkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thLmgzkxx(){
		boolean bl=kxxyjServer.thLmgzkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thXjkxx(){
		boolean bl=kxxyjServer.thXjkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSjgzkxshList(){
		String tiaojian1="";
		String tiaojian2="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and t.xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and t.xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setSbthcd(sbthcd);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		System.out.println(gldj);
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
		List<Kxxyj> list=kxxyjServer.selectSjgzkxshList(lxsh);
		int count=kxxyjServer.selectSjgzkxshListCount(lxsh);
		EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectLmgzkxshList(){
		String tiaojian1="";
		String tiaojian2="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and t.xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and t.xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setSbthcd(sbthcd);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		System.out.println(gldj);
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
		List<Kxxyj> list=kxxyjServer.selectLmgzkxshList(lxsh);
		int count=kxxyjServer.selectLmgzkxshListCount(lxsh);
		EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void selectXjkxshList(){
		String tiaojian1="";
		String tiaojian2="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and t.xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and t.xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setSbthcd(sbthcd);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		System.out.println(gldj);
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
		List<Kxxyj> list=kxxyjServer.selectXjkxshList(lxsh);
		int count=kxxyjServer.selectXjkxshListCount(lxsh);
		EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void shlmgzkxx(){
		boolean bl=kxxyjServer.shlmgzkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void shxjkxx(){
		boolean bl=kxxyjServer.shxjkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void shsjgzkxx(){
		boolean bl=kxxyjServer.shsjgzkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void shshkxx(){
		boolean bl=kxxyjServer.shshkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void sjgzsfcb(){
		boolean bl=kxxyjServer.sjgzsfcb(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thSjgzkxx1(){
		boolean bl=kxxyjServer.thSjgzkxx1(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void lmgzsfcb(){
		boolean bl=kxxyjServer.lmgzsfcb(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thLmgzkxx1(){
		boolean bl=kxxyjServer.thLmgzkxx1(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void xjsfcb(){
		boolean bl=kxxyjServer.xjsfcb(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thXjkxx1(){
		boolean bl=kxxyjServer.thXjkxx1(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unused" })
	public void importsjgzkxx(){
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
				dataMapArray = ExcelReader1.readExcelContent(2,34,fs,Plan_gcgj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			List<Lx> lxlist=new ArrayList<Lx>();
			int i=1;
			for (Map map : data) {
			}
			boolean sfcg=true;
			sfcg=kxxyjServer.importsjgzkxx(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void importlmgzkxx(){
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
				dataMapArray = ExcelReader1.readExcelContent(2,28,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			boolean sfcg=true;
			sfcg=kxxyjServer.importlmgzkxx(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void importxjkxx(){
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
				dataMapArray = ExcelReader1.readExcelContent(2,32,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			boolean sfcg=true;
			sfcg=kxxyjServer.importxjkxx(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void showkxxTjxx(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			/*if(lxsh.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+lxsh.getGydw()+"%'";
			}else{
				tiaojian1="and gydwdm in ("+lxsh.getGydw()+")";
			}*/
			String ss = lxsh.getXzqh();
			if(lxsh.getXzqh().indexOf(",")==-1){
				tiaojian2="and t.xzqhdm like '%"+lxsh.getXzqh()+"%'";
			}else{
				tiaojian2="and t.xzqhdm in ("+lxsh.getXzqh()+")";
			}
			lxsh.setXzqh(xzqhBm(ss, "xzqhdm2"));
			//lxsh.setGydw(tiaojian1);
			String xmnf1 = lxsh.getXmnf();
			if(xmnf1.indexOf(",")>-1){
				xmnf = "t1.xmnf in ("+xmnf1+")";
			}else{
				xmnf = "t1.xmnf = '"+xmnf1+"'";
			}
		lxsh.setXmnf(xmnf);
		lxsh.setLsxmlx(MyUtil.getQueryTJ(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			Lxsh l=null;
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
								tsdq+="and(t.xmlx1 like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or t.xmlx1 like '%"+tsdqs[i]+"%'";
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						lxsh.setXmlx1(tsdq);
					}

				l=kxxyjServer.showgsdkxxTjxx(lxsh);
			}
			
			if("sjgz".equals(lxsh.getXmlx())){
				l=kxxyjServer.showsjkxxTjxx(lxsh);
			}
			if("lmgz".equals(lxsh.getXmlx())){
				l=kxxyjServer.showlmkxxTjxx(lxsh);
			}
			if("xj".equals(lxsh.getXmlx())){
				l=kxxyjServer.showxjkxxTjxx(lxsh);
			}
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void showkxxtzTjxx(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			if(lxsh.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+lxsh.getGydw()+"%'";
			}else{
				tiaojian1="and gydwdm in ("+lxsh.getGydw()+")";
			}
			if(lxsh.getXzqh().indexOf(",")==-1){
				tiaojian2="and t.xzqhdm like '%"+lxsh.getXzqh()+"%'";
			}else{
				tiaojian2="and t.xzqhdm in ("+lxsh.getXzqh()+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			lxsh.setGydw(tiaojian1);
			Lxsh l=null;
			if("sjgz".equals(lxsh.getXmlx())){
				l=kxxyjServer.showsjkxxbgTjxx(lxsh);
			}
			if("lmgz".equals(lxsh.getXmlx())){
				l=kxxyjServer.showlmkxxbgTjxx(lxsh);
			}
			if("xj".equals(lxsh.getXmlx())){
				l=kxxyjServer.showxjkxxbgTjxx(lxsh);
			}
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void querygkxmXX() throws IOException, Exception{
		JsonUtils.write(kxxyjServer.querygkxmXX(lxsh), getresponse().getWriter());
	}
	
	
	public void tzxm(){
		ResponseUtils.write(getresponse(),kxxyjServer.tzxm(lxsh)+"");
	}
	public void thtzxm(){
		ResponseUtils.write(getresponse(),kxxyjServer.thtzxm(lxsh)+"");
	}
	public void thtzxm1(){
		ResponseUtils.write(getresponse(),kxxyjServer.thtzxm1(lxsh)+"");
	}
	private void tsdqtj(){
		if(lxsh.getTsdq()!=null)
			if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="and(tsdq like '%"+tsdqs[i]+"%'";
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
	}
	private void xzdjtj() {
		String ylxbh = lxsh.getGldj()==null ? "" : lxsh.getGldj();
		if(ylxbh!=null && !ylxbh.equals("")){
			if(ylxbh.indexOf(",")>-1){
				String[] split = ylxbh.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						ylxbh = "(lxbmtj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						ylxbh += " or lxbmtj like '%"+split[i]+"%')";
					}else{
						ylxbh += " or lxbmtj like '%"+split[i]+"%'";
					}
				}
			}else{
				ylxbh = " lxbmtj like '%"+ylxbh+"%'";
			}
			lxsh.setGldj(ylxbh);
		}
	}
	private void jsdjtj(String jsdj) {
		if(jsdj!=null && !jsdj.equals("")){
			if(jsdj.indexOf(",")>-1){
				String[] split = jsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsdj = "(jsdjtj like '"+split[i]+"'";
					}else if(i==split.length-1){
						jsdj += " or jsdjtj like '"+split[i]+"')";
					}else{
						jsdj += " or jsdjtj like '"+split[i]+"'";
					}
				}
			}else{
				jsdj = "jsdjtj like '"+jsdj+"'";
			}
			lxsh.setJsdj(jsdj);
		}
	}
	public void selectShkxList(){
		try {
			
			String tiaojian2="";
			
			if(lxsh.getXzqh().indexOf(",")==-1){
				tiaojian2="and t.xzqhdm like '%"+lxsh.getXzqh()+"%'";
			}else{
				tiaojian2="and t.xzqhdm in ("+lxsh.getXzqh()+")";
			}
			lxsh.setXzqh(xzqhBm(lxsh.getXzqh(), "xzqhdm2"));
			if(!"".equals(lxsh.getSbzt())){
				lxsh.setSbzt1(lxsh.getSbzt());
			}
			jsdjtj(lxsh.getJsdj());
			xzdjtj();
			tsdqtj();
			lxsh.setPage(page);
			lxsh.setRows(rows);
			List<Kxxyj> list=kxxyjServer.selectShkxList(lxsh);
			int count=kxxyjServer.selectShkxListCount(lxsh);
			EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void showkxxShxx(){
		try {
			String tiaojian2="";
			
			if(lxsh.getXzqh().indexOf(",")==-1){
				tiaojian2="and t.xzqhdm like '%"+lxsh.getXzqh()+"%'";
			}else{
				tiaojian2="and t.xzqhdm in ("+lxsh.getXzqh()+")";
			}
			if(!"".equals(lxsh.getSbzt())){
				lxsh.setSbzt1(lxsh.getSbzt());
			}
			lxsh.setXzqh(xzqhBm(lxsh.getXzqh(), "xzqhdm2"));
			jsdjtj(lxsh.getJsdj());
			xzdjtj();
			tsdqtj();
			Lxsh l=null;
			l=kxxyjServer.showkxxShxx(lxsh);
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void sbgcxmkxx(){
		ResponseUtils.write(getresponse(), ""+kxxyjServer.sbgcxmkxx(lxsh));
		
	}
	public void thkxxyjsb(){
		ResponseUtils.write(getresponse(), ""+kxxyjServer.thkxxyjsbzt(lxsh));
	}
	public void thjhshsb(){
		ResponseUtils.write(getresponse(), ""+kxxyjServer.thjhshsb(lxsh));
	}
	
	public void thwshkxxyj(){
		ResponseUtils.write(getresponse(), ""+kxxyjServer.thwshkxxyj(lxsh));
	}
	
}

