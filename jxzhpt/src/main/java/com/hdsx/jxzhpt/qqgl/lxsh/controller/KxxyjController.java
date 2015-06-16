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
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.server.KxxyjServer;
import com.hdsx.jxzhpt.qqgl.lxsh.server.LxshServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader1;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
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
	private int shzt;
	private String tsdq;
	private String jsdj;
	private String gldj;
	private int sbthcd;
	private String xmbm;
	private File uploadGkpf;
	private String uploadGkpfFileName;
	
	
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
	public void selectSjgzkxList(){
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
			lxsh.setXzqh(tiaojian2);
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
			List<Kxxyj> list=kxxyjServer.selectSjgzList(lxsh);
			int count=kxxyjServer.selectSjgzListCount(lxsh);
			EasyUIPage<Kxxyj> e=new EasyUIPage<Kxxyj>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	public void selectLmgzkxList(){
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
		lxsh.setXzqh(tiaojian2);
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
	public void selectXjkxList(){
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
		lxsh.setXzqh(tiaojian2);
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
	//
	public void uploadGkpf() throws IOException{
		System.out.println("jinru");
		HttpServletResponse response = ServletActionContext.getResponse();
		Plan_upload uploads;
		response.setCharacterEncoding("utf-8"); 
		FileInputStream inputStream = null;
		byte [] file=new byte[(int)uploadGkpf.length()];
		try {
			inputStream=new FileInputStream(uploadGkpf);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw e;
		}
		ByteArrayOutputStream byteOutpu=new ByteArrayOutputStream();
		int index=0;
		try {
			while((index=inputStream.read(file))!=-1){
				byteOutpu.write(file, 0, index);
			}
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		}
		uploads=new Plan_upload();
		uploads.setParentid(lxsh.getXmbm());
		uploads.setFiledata(file);
		uploads.setFiletype("工可批复文件");
		uploads.setFilename(uploadGkpfFileName);
		boolean result = kxxyjServer.insertFile(uploads);
		if(result){
			response.getWriter().print(uploadGkpfFileName+"导入成功");
		}else{
			response.getWriter().print(uploadGkpfFileName+"导入成功");
		}
	}
	public void updateSjgzkxx(){
		boolean bl=kxxyjServer.updateSjgzkxx(kxxyj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateLmgzkxx(){
		boolean bl=kxxyjServer.updateLmgzkxx(kxxyj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateXjkxx(){
		boolean bl=kxxyjServer.updateXjkxx(kxxyj);
		if(bl){
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
		lxsh.setXzqh(tiaojian2);
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
		lxsh.setXzqh(tiaojian2);
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
		lxsh.setXzqh(tiaojian2);
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
}

