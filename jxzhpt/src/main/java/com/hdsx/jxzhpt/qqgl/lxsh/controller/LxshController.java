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

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.server.LxshServer;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.XmsqServer;
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
public class LxshController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	private String xmtype;
	private String xzqh;
	private String nf;
	private Lxsh lxsh=new Lxsh();
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
	private String ghlxbh;
	private String jdbs;
	private String lsjl;
	
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl;
	}
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
	public String getGhlxbh() {
		return ghlxbh;
	}
	public void setGhlxbh(String ghlxbh) {
		this.ghlxbh = ghlxbh;
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
	@Resource(name = "lxshServerImpl")
	private LxshServer lxshServer;
	public void selectxmbm(){
		String str="";
		String xmbm = "";
		if("sjgz".equals(xmtype)){
			str=nf+xzqh+"1";
			String xmbm1 = lxshServer.selectXmbm(str);
			if(xmbm1==null){
				xmbm="";
			}else{
				xmbm=xmbm1;
			}
		}
		
		if("lmgz".equals(xmtype)){
			str=nf+xzqh+"2";
			String xmbm1 = lxshServer.selectlmgzXmbm(str);
			if(xmbm1==null){
				xmbm="";
			}else{
				xmbm=xmbm1;
			}
		}
		
		if("xj".equals(xmtype)){
			str=nf+xzqh+"3";
			String xmbm1 = lxshServer.selectxjXmbm(str);
			if(xmbm1==null){
				xmbm="";
			}else{
				xmbm=xmbm1;
			}
		}
		//生成项目编码
		if("".equals(xmbm)){
			xmbm = str+"001";
		}else{
			xmbm=Integer.parseInt(xmbm)+1+"";
			if(xmbm.length()==1)
				xmbm=str+"00"+xmbm;
			if(xmbm.length()==2)
				xmbm=str+"0"+xmbm;
			if(xmbm.length()==3)
				xmbm=str+xmbm;
		}
		System.out.println(xmbm);
		Lxsh l = new Lxsh();
		l.setXmbm(xmbm);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectbzcs(){
		Lxsh l = lxshServer.selectbzcs(lxsh);
		BigDecimal b1=new BigDecimal(l.getBzys());
		BigDecimal b2=new BigDecimal(lxsh.getLc());
		String bzys=b1.multiply(b2)+"";
		l.setBzys(bzys);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectSFCF(){
		boolean bl=false;
		if("sjgz".equals(lxsh.getXmlx())){
			bl=lxshServer.selectSFCF(lxsh);
		}
		if("lmgz".equals(lxsh.getXmlx())){
				bl=lxshServer.selectSFCF(lxsh);
		}
		if("xj".equals(lxsh.getXmlx())){
			bl=lxshServer.selectSFCF2(lxsh);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertSjgz(){
		try {
			Map<String, Object> result =new HashMap<String, Object>();
			Lx lx=new Lx();
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			JhshServer jhshServer=new JhshServerImpl();
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
			if(queryHaveLx==null){
				XmsqServer xmsqServer=new XmsqServerImpl();
				lxsh.setLsjl(xmsqServer.queryLsjl(lxsh.getGhlxbh(), lxsh.getQdzh(), lxsh.getZdzh(),lxsh.getXmbm())>0 ? "是" : "否");
				boolean bl=lxshServer.insertSjgz(lxsh);
				if(bl){
					result.put("result", "true");
				}else{
					result.put("result", "false");
				}
			}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertLmgz(){
		try {
			Map<String, Object> result =new HashMap<String, Object>();
			Lx lx=new Lx();
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			JhshServer jhshServer=new JhshServerImpl();
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
			if(queryHaveLx==null){
				XmsqServer xmsqServer=new XmsqServerImpl();
				lxsh.setLsjl(xmsqServer.queryLsjl(lxsh.getGhlxbh(), lxsh.getQdzh(), lxsh.getZdzh(),lxsh.getXmbm())>0 ? "是" : "否");
				boolean bl=lxshServer.insertLmgz(lxsh);
				if(bl){
					result.put("result", "true");
				}else{
					result.put("result", "false");
				}
			}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertXj(){
		try {
			Map<String, Object> result =new HashMap<String, Object>();
			Lx lx=new Lx();
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			JhshServer jhshServer=new JhshServerImpl();
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
			if(queryHaveLx==null){
				XmsqServer xmsqServer=new XmsqServerImpl();
				lxsh.setLsjl(xmsqServer.queryLsjl(lxsh.getGhlxbh(), lxsh.getQdzh(), lxsh.getZdzh(),lxsh.getXmbm())>0 ? "是" : "否");
				boolean bl=lxshServer.insertXj(lxsh);
				if(bl){
					result.put("result", "true");
				}else{
					result.put("result", "false");
				}
			}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectSjgzList(){
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
			lxsh.setXmmc(xmmc);
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(tsdq);
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setLsjl(lsjl);
			lxsh.setPage(page);
			lxsh.setRows(rows);
		List<Lxsh> list=lxshServer.selectSjgzList(lxsh);
		int count=lxshServer.selectSjgzListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectXjList(){
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
			tiaojian2="and xzqhdm in ("+xzqh+")";
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
		List<Lxsh> list=lxshServer.selectXjList(lxsh);
		int count=lxshServer.selectXjListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
}
	public void selectSjgzlxList(){
		lxsh.setXmbm(xmbm);
		lxsh.setJdbs(jdbs);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		List<Lxsh> list=lxshServer.selectSjgzlxList(lxsh);
		int count=lxshServer.selectSjgzlxListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void sbsjgzSbzt(){
		boolean bl=lxshServer.sbsjgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void sblmgzSbzt(){
		boolean bl=lxshServer.sblmgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void sbxjSbzt(){
		boolean bl=lxshServer.sbxjSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thSjgzSbzt(){
		boolean bl=lxshServer.thSjgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thSjgzSbzt1(){
		boolean bl=lxshServer.thSjgzSbzt1(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thLmgzSbzt(){
		boolean bl=lxshServer.thLmgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thLmgzSbzt1(){
		boolean bl=lxshServer.thLmgzSbzt1(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thXjSbzt(){
		boolean bl=lxshServer.thXjSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thXjSbzt1(){
		boolean bl=lxshServer.thXjSbzt1(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void Lmgzsfkxx(){
		boolean bl=lxshServer.Lmgzsfkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void sjgzsfkxx(){
		boolean bl=lxshServer.sjgzsfkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void Xjsfkxx(){
		boolean bl=lxshServer.Xjsfkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateSjgz(){
		boolean bl=lxshServer.updateSjgz(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateLmgz(){
		boolean bl=lxshServer.updateLmgz(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateXj(){
		boolean bl=lxshServer.updateXj(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSjgzshList(){
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
			tiaojian2="and xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(tiaojian2);
		lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setLsjl(lsjl);
		lxsh.setPage(page);
		lxsh.setRows(rows);
	List<Lxsh> list=lxshServer.selectSjgzshList(lxsh);
	int count=lxshServer.selectSjgzshListCount(lxsh);
	EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
	e.setRows(list);
	e.setTotal(count);
	try {
		JsonUtils.write(e, getresponse().getWriter());
	} catch (Exception e1) {
		e1.printStackTrace();
	}
	}
	public void selectLmgzshList(){
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
			tiaojian2="and xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(tiaojian2);
		lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setLsjl(lsjl);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		List<Lxsh> list=lxshServer.selectLmgzshList(lxsh);
		int count=lxshServer.selectLmgzshListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectXjshList(){
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
			tiaojian2="and xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(tiaojian2);
		lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		List<Lxsh> list=lxshServer.selectXjshList(lxsh);
		int count=lxshServer.selectXjshListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void delSjgz(){
		boolean bl=lxshServer.delSjgz(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void delLmgz(){
		boolean bl=lxshServer.delLmgz(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void delXj(){
		boolean bl=lxshServer.delXj(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void shsjgzSbzt(){
		boolean bl=lxshServer.shsjgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void shlmgzSbzt(){
		boolean bl=lxshServer.shlmgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void shxjSbzt(){
		boolean bl=lxshServer.shxjSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectLmgzList(){
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
			tiaojian2="and xzqhdm in ("+xzqh+")";
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
		lxsh.setLsjl(lsjl);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		List<Lxsh> list=lxshServer.selectLmgzList(lxsh);
		int count=lxshServer.selectLmgzListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void qqglGpsroad(){
		lxsh.setGhlxbh(ghlxbh);
		lxsh.setXzqh(xzqh);
		List<Lxsh> list=lxshServer.qqglGpsroad(lxsh);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void selectSFCFLX(){
		boolean bl=lxshServer.selectSFCFLX(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void insertLx1(){
		try {
			Map<String, Object> result =new HashMap<String, Object>();
			Lx lx=new Lx();
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			JhshServer jhshServer=new JhshServerImpl();
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
			if(queryHaveLx==null){
				boolean bl=lxshServer.insertLx(lxsh);
				if(bl){
					result.put("result", "true");
				}else{
					result.put("result", "false");
				}
			}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteLx(){
		boolean bl=lxshServer.deleteLx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void cxqdmc(){
		Lxsh l=lxshServer.cxqdmc(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void cxzdmc(){
		Lxsh l=lxshServer.cxzdmc(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void sfylx(){
		Lxsh l=lxshServer.sfylx(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void qqglGpszh(){
		Lxsh l=lxshServer.qqglGpszh(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectlxbyxmid(){
		List<Lxsh> l=lxshServer.selectlxbyxmid1(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void dcModule(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydw=(String) session.getAttribute("gydwbb");	
			xzqh=(String) session.getAttribute("xzqhbb");	
			String tiaojian1="";
			String tiaojian2="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and lx.gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and lx.gydwdm in ("+gydw+")";
			}
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and lx.xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="andx lx.zqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(tiaojian2);
			lxsh.setGydw(tiaojian1);
			String xmbt="";
			List<Excel_list> elist=new ArrayList<Excel_list>();
			if("sjgz".equals(lxsh.getXmlx())){
				xmbt="升级改造";
				elist=lxshServer.querylxshSjgz(lxsh);
			}
			if("lmgz".equals(lxsh.getXmlx())){
				xmbt="路面改造";
				elist=lxshServer.querylxshLmgz(lxsh);
			}
			if("xj".equals(lxsh.getXmlx())){
				xmbt="新建";
				elist=lxshServer.querylxshXj(lxsh);
			}
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName(xmbt+"工程项目立项审核信息表");//设置第一行 
			eldata.setSheetName("立项审核信息");//设置sheeet名
			eldata.setFileName(xmbt+"工程项目立项审核信息表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("项目编码",1,1,0,0));
			et.add(new Excel_tilte("路线编码",1,1,1,1));
			et.add(new Excel_tilte("路线名称",1,1,2,2));
			et.add(new Excel_tilte("项目名称",1,1,3,3));
			et.add(new Excel_tilte("起点桩号",1,1,4,4));
			et.add(new Excel_tilte("止点桩号",1,1,5,5));
			et.add(new Excel_tilte("起点名称",1,1,6,6));
			et.add(new Excel_tilte("止点名称",1,1,7,7));
			et.add(new Excel_tilte("建设性质",1,1,8,8));
			et.add(new Excel_tilte("管养单位",1,1,9,9));		
			et.add(new Excel_tilte("行政区划",1,1,10,10));
			et.add(new Excel_tilte("特殊地区",1,1,11,11));
			et.add(new Excel_tilte("建设技术等级",1,1,12,12));
			et.add(new Excel_tilte("现技术等级",1,1,13,13));
			et.add(new Excel_tilte("项目年份",1,1,14,14));
			et.add(new Excel_tilte("计划开工年",1,1,15,15));
			et.add(new Excel_tilte("计划完工年",1,1,16,16));
			et.add(new Excel_tilte("投资(万元)",1,1,17,17));
			et.add(new Excel_tilte("补助测算(万元)",1,1,18,18));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void dckxxModule(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydw=(String) session.getAttribute("gydwbb");	
			xzqh=(String) session.getAttribute("xzqhbb");	
			String tiaojian1="";
			String tiaojian2="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and lx.gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and lx.gydwdm in ("+gydw+")";
			}
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and lx.xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="andx lx.zqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(tiaojian2);
			lxsh.setGydw(tiaojian1);
			String xmbt="";
			List<Excel_list> elist=new ArrayList<Excel_list>();
			if("sjgz".equals(lxsh.getXmlx())){
				xmbt="升级改造";
				elist=lxshServer.querykxxSjgz(lxsh);
			}
			if("lmgz".equals(lxsh.getXmlx())){
				xmbt="路面改造";
				elist=lxshServer.querykxxLmgz(lxsh);
			}
			if("xj".equals(lxsh.getXmlx())){
				xmbt="新建";
				elist=lxshServer.querykxxXj(lxsh);
			}
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName(xmbt+"工程项目工可信息表");//设置第一行 
			eldata.setSheetName("工可信息");//设置sheeet名
			eldata.setFileName(xmbt+"工程项目工可信息表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("项目编码",1,1,0,0));
			et.add(new Excel_tilte("项目名称",1,1,1,1));
			et.add(new Excel_tilte("行政区划",1,1,2,2));
			et.add(new Excel_tilte("起点桩号",1,1,3,3));
			et.add(new Excel_tilte("止点桩号",1,1,4,4));
			et.add(new Excel_tilte("建设性质",1,1,5,5));
			et.add(new Excel_tilte("大桥(米)",1,1,6,6));
			et.add(new Excel_tilte("大桥(座)",1,1,7,7));
			et.add(new Excel_tilte("建设技术等级",1,1,8,8));
			et.add(new Excel_tilte("隧道(米)",1,1,9,9));		
			et.add(new Excel_tilte("隧道(座)",1,1,10,10));
			et.add(new Excel_tilte("建设单位",1,1,11,11));
			et.add(new Excel_tilte("开工年月",1,1,12,12));
			et.add(new Excel_tilte("完工年月",1,1,13,13));
			et.add(new Excel_tilte("编制单位",1,1,14,14));
			et.add(new Excel_tilte("投资估算",1,1,15,15));
			et.add(new Excel_tilte("工可批复文号",1,1,16,16));
			et.add(new Excel_tilte("批复时间",1,1,17,17));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

