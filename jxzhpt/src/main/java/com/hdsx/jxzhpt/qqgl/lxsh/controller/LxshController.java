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
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Wqbzbz;
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
	private String fileuploadFileName;
	private File fileupload;
	private Lx lx;
	private Wqbzbz wqbzbz=new Wqbzbz();
	@Resource(name="jhshServerImpl")
	private JhshServer jhshServer;
	
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
	public Wqbzbz getWqbzbz() {
		return wqbzbz;
	}
	public void setWqbzbz(Wqbzbz wqbzbz) {
		this.wqbzbz = wqbzbz;
	}
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
		try {
			Lxsh l = lxshServer.selectbzcs(lxsh);
			BigDecimal b1=new BigDecimal(l==null ? "0" : l.getBzys());
			BigDecimal b2=new BigDecimal(lxsh.getLc());
			String bzys=b1.multiply(b2)+"";
			lxsh.setBzys(bzys);
			JsonUtils.write(lxsh, getresponse().getWriter());
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
		//准备路线桩号信息
		lx.setXmid(lxsh.getXmbm());
		lx.setLxbm(lxsh.getGhlxbh());
		lx.setQdzh(lxsh.getQdzh());
		lx.setZdzh(lxsh.getZdzh());
		lx.setQdmc(lxsh.getQdmc());
		lx.setZdmc(lxsh.getZdmc());
		lx.setSffirst("1");
		lx.setJdbs("0");
		if(bl){
			jhshServer.updateLx(lx);
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateLmgz(){
		boolean bl=lxshServer.updateLmgz(lxsh);
		if(bl){
			//准备路线桩号信息
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			lx.setQdmc(lxsh.getQdmc());
			lx.setZdmc(lxsh.getZdmc());
			lx.setSffirst("1");
			lx.setJdbs("0");
			jhshServer.updateLx(lx);
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateXj(){
		try{
			boolean bl=lxshServer.updateXj(lxsh);
			//准备路线桩号信息
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			lx.setQdmc(lxsh.getQdmc());
			lx.setZdmc(lxsh.getZdmc());
			lx.setSffirst("1");
			lx.setJdbs("0");
			jhshServer.updateLx(lx);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}catch(Exception e){
			e.printStackTrace();
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
				tiaojian2="and lx.xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(tiaojian2);
			lxsh.setGydw(tiaojian1);
			String xmbt="";
			List<Excel_list> elist=new ArrayList<Excel_list>();
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			if("sjgz".equals(lxsh.getXmlx())){
				xmbt="升级改造";
				elist=lxshServer.querykxxSjgz(lxsh);
				et.clear();
				et.add(new Excel_tilte("项目编码",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("行政区划",1,1,2,2));
				et.add(new Excel_tilte("路线编码",1,1,3,3));
				et.add(new Excel_tilte("起点桩号",1,1,4,4));
				et.add(new Excel_tilte("止点桩号",1,1,5,5));
				et.add(new Excel_tilte("里程",1,1,6,6));
				et.add(new Excel_tilte("一级公路",1,1,7,7));
				et.add(new Excel_tilte("二级公路",1,1,8,8));
				et.add(new Excel_tilte("三级公路",1,1,9,9));
				et.add(new Excel_tilte("四级公路",1,1,10,10));
				et.add(new Excel_tilte("等外公路",1,1,11,11));
				et.add(new Excel_tilte("无路",1,1,12,12));
				et.add(new Excel_tilte("建设后一级公路",1,1,13,13));
				et.add(new Excel_tilte("建设后二级公路",1,1,14,14));
				et.add(new Excel_tilte("建设后三级公路",1,1,15,15));
				et.add(new Excel_tilte("建设后四级公路",1,1,16,16));
				et.add(new Excel_tilte("建设后等外公路",1,1,17,17));
				et.add(new Excel_tilte("建设后无路",1,1,18,18));
				et.add(new Excel_tilte("建设性质",1,1,19,19));
				et.add(new Excel_tilte("大桥(米)",1,1,20,20));
				et.add(new Excel_tilte("大桥(座)",1,1,21,21));
				et.add(new Excel_tilte("建设技术等级",1,1,22,22));
				et.add(new Excel_tilte("隧道(米)",1,1,23,23));		
				et.add(new Excel_tilte("隧道(座)",1,1,24,24));
				et.add(new Excel_tilte("建设单位",1,1,25,25));
				et.add(new Excel_tilte("开工年月",1,1,26,26));
				et.add(new Excel_tilte("完工年月",1,1,27,27));
				et.add(new Excel_tilte("编制单位",1,1,28,28));
				et.add(new Excel_tilte("投资估算",1,1,29,29));
				et.add(new Excel_tilte("地方自筹",1,1,30,30));
				et.add(new Excel_tilte("银行贷款",1,1,31,31));
				et.add(new Excel_tilte("工可批复文号",1,1,32,32));
				et.add(new Excel_tilte("批复时间",1,1,33,33));
			}
			if("lmgz".equals(lxsh.getXmlx())){
				et.add(new Excel_tilte("项目编码",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("行政区划",1,1,2,2));
				et.add(new Excel_tilte("路线编码",1,1,3,3));
				et.add(new Excel_tilte("起点桩号",1,1,4,4));
				et.add(new Excel_tilte("止点桩号",1,1,5,5));
				et.add(new Excel_tilte("里程",1,1,6,6));
				et.add(new Excel_tilte("一级公路",1,1,7,7));
				et.add(new Excel_tilte("二级公路",1,1,8,8));
				et.add(new Excel_tilte("三级公路",1,1,9,9));
				et.add(new Excel_tilte("四级公路",1,1,10,10));
				et.add(new Excel_tilte("等外公路",1,1,11,11));
				et.add(new Excel_tilte("无路",1,1,12,12));
				et.add(new Excel_tilte("建设性质",1,1,13,13));
				et.add(new Excel_tilte("大桥(米)",1,1,14,14));
				et.add(new Excel_tilte("大桥(座)",1,1,15,15));
				et.add(new Excel_tilte("建设技术等级",1,1,16,16));
				et.add(new Excel_tilte("隧道(米)",1,1,17,17));		
				et.add(new Excel_tilte("隧道(座)",1,1,18,18));
				et.add(new Excel_tilte("建设单位",1,1,19,19));
				et.add(new Excel_tilte("开工年月",1,1,20,20));
				et.add(new Excel_tilte("完工年月",1,1,21,21));
				et.add(new Excel_tilte("编制单位",1,1,22,22));
				et.add(new Excel_tilte("投资估算",1,1,23,23));
				et.add(new Excel_tilte("地方自筹",1,1,24,24));
				et.add(new Excel_tilte("银行贷款",1,1,25,25));
				et.add(new Excel_tilte("工可批复文号",1,1,26,26));
				et.add(new Excel_tilte("批复时间",1,1,27,27));
				xmbt="路面改造";
				elist=lxshServer.querykxxLmgz(lxsh);
			}
			if("xj".equals(lxsh.getXmlx())){
				et.add(new Excel_tilte("项目编码",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("行政区划",1,1,2,2));
				et.add(new Excel_tilte("路线编码",1,1,3,3));
				et.add(new Excel_tilte("起点桩号",1,1,4,4));
				et.add(new Excel_tilte("止点桩号",1,1,5,5));
				et.add(new Excel_tilte("里程",1,1,6,6));
				et.add(new Excel_tilte("新建路线编码",1,1,7,7));
				et.add(new Excel_tilte("新建起点桩号",1,1,8,8));
				et.add(new Excel_tilte("新建止点桩号",1,1,9,9));
				et.add(new Excel_tilte("新建里程",1,1,10,10));
				et.add(new Excel_tilte("一级公路",1,1,11,11));
				et.add(new Excel_tilte("二级公路",1,1,12,12));
				et.add(new Excel_tilte("三级公路",1,1,13,13));
				et.add(new Excel_tilte("四级公路",1,1,14,14));
				et.add(new Excel_tilte("等外公路",1,1,15,15));
				et.add(new Excel_tilte("无路",1,1,16,16));
				et.add(new Excel_tilte("建设性质",1,1,17,17));
				et.add(new Excel_tilte("大桥(米)",1,1,18,18));
				et.add(new Excel_tilte("大桥(座)",1,1,19,19));
				et.add(new Excel_tilte("建设技术等级",1,1,20,20));
				et.add(new Excel_tilte("隧道(米)",1,1,21,21));		
				et.add(new Excel_tilte("隧道(座)",1,1,22,22));
				et.add(new Excel_tilte("建设单位",1,1,23,23));
				et.add(new Excel_tilte("开工年月",1,1,24,24));
				et.add(new Excel_tilte("完工年月",1,1,25,25));
				et.add(new Excel_tilte("编制单位",1,1,26,26));
				et.add(new Excel_tilte("投资估算",1,1,27,27));
				et.add(new Excel_tilte("地方自筹",1,1,28,28));
				et.add(new Excel_tilte("银行贷款",1,1,29,29));
				et.add(new Excel_tilte("工可批复文号",1,1,30,30));
				et.add(new Excel_tilte("批复时间",1,1,31,31));
				xmbt="新建";
				elist=lxshServer.querykxxXj(lxsh);
			}
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName(xmbt+"工程项目工可信息表");//设置第一行 
			eldata.setSheetName("工可信息");//设置sheeet名
			eldata.setFileName(xmbt+"工程项目工可信息表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void importsjgzlxsh(){
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
				dataMapArray = ExcelReader1.readExcelContent(2,30,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			//获取项目编码
			for (Map map : data) {
				String xzqhdm="select id from XTGL_XZQH where trim(name)='"+map.get("22").toString()+"'";
				String xzqh=lxshServer.selectimportXmbm(xzqhdm);
				if(xzqh==null||xzqh==""||"".equals(xzqh)){
					response.getWriter().print(fileuploadFileName+"中  "+map.get("2").toString()+"  项目行政区划有误");
					return;
				}
				String tiaojian="select max(substr(xmbm,-3)) from lxsh_sjgz where xmbm like "+map.get("0").toString()+"||"+"(select id from XTGL_XZQH where trim(name)='"+map.get("22").toString()+"')"+"||'%' ";
				String xmbm=lxshServer.selectimportXmbm(tiaojian);
				if(xmbm==null||xmbm==""||"".equals(xmbm)){
					map.put("xmbm", map.get("0").toString()+xzqh+"1001");
				}else{
					xmbm=Integer.parseInt(xmbm)+1+"";
					if(xmbm.length()==1)
						xmbm=map.get("0").toString()+xzqh+"100"+xmbm;
					if(xmbm.length()==2)
						xmbm=map.get("0").toString()+xzqh+"10"+xmbm;
					if(xmbm.length()==3)
						xmbm=map.get("0").toString()+xzqh+"1"+xmbm;
					map.put("xmbm", xmbm);
				}
				//计算补助测算
				double bzcs=0;
				Lxsh ll=new Lxsh();
				ll.setXmlx("升级改造工程项目");
				ll.setGldj(map.get("1").toString().substring(0, 1));
				if(map.get("14").toString()!=null && !map.get("14").toString().equals("")){
					ll.setJsdj("一级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs= new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("15").toString()!=null && !map.get("15").toString().equals("")){
					ll.setJsdj("二级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("16").toString()!=null && !map.get("16").toString().equals("")){
					ll.setJsdj("三级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("17").toString()!=null && !map.get("17").toString().equals("")){
					ll.setJsdj("四级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("18").toString()!=null && !map.get("18").toString().equals("")){
					ll.setJsdj("等外");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("19").toString()!=null && !map.get("19").toString().equals("")){
					ll.setJsdj("无路");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				Lxsh l = lxshServer.selectbzcs(ll);
				
				if(l==null){
					response.getWriter().print(map.get("2").toString()+"  项目路线编码、建设技术等级有误");
					return;
				}
				BigDecimal b1=new BigDecimal(bzcs);
				BigDecimal b2=new BigDecimal(map.get("5").toString()).subtract(new BigDecimal(map.get("4").toString()));
				String bzys=b1.multiply(b2)+"";
				map.put("bzys", bzys);
			}
			boolean sfcg=true;
			sfcg=lxshServer.importsjgzlxsh(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void importlmgzlxsh(){
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
				dataMapArray = ExcelReader1.readExcelContent(2,23,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			//获取项目编码
			for (Map map : data) {
				String xzqhdm="select id from XTGL_XZQH where trim(name)='"+map.get("16").toString()+"'";
				String xzqh=lxshServer.selectimportXmbm(xzqhdm);
				if(xzqh==null||xzqh==""||"".equals(xzqh)){
					response.getWriter().print(fileuploadFileName+"中  "+map.get("2").toString()+"  项目行政区划有误");
					return;
				}
				String tiaojian="select max(substr(xmbm,-3)) from lxsh_lmgz where xmbm like "+map.get("0").toString()+"||"+"(select id from XTGL_XZQH where trim(name)='"+map.get("16").toString()+"')"+"||'%' ";
				String xmbm=lxshServer.selectimportXmbm(tiaojian);
				if(xmbm==null||xmbm==""||"".equals(xmbm)){
					map.put("xmbm", map.get("0").toString()+xzqh+"2001");
				}else{
					xmbm=Integer.parseInt(xmbm)+1+"";
					if(xmbm.length()==1)
						xmbm=map.get("0").toString()+xzqh+"200"+xmbm;
					if(xmbm.length()==2)
						xmbm=map.get("0").toString()+xzqh+"20"+xmbm;
					if(xmbm.length()==3)
						xmbm=map.get("0").toString()+xzqh+"2"+xmbm;
					map.put("xmbm", xmbm);
				}
				//计算补助测算
				double bzcs=0;
				Lxsh ll=new Lxsh();
				ll.setXmlx("路面改造工程项目");
				ll.setGldj(map.get("1").toString().substring(0, 1));
				if(map.get("8").toString()!=null && !map.get("8").toString().equals("")){
					ll.setJsdj("一级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs= new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("9").toString()!=null && !map.get("9").toString().equals("")){
					ll.setJsdj("二级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("10").toString()!=null && !map.get("10").toString().equals("")){
					ll.setJsdj("三级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("11").toString()!=null && !map.get("11").toString().equals("")){
					ll.setJsdj("四级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("12").toString()!=null && !map.get("12").toString().equals("")){
					ll.setJsdj("等外");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("13").toString()!=null && !map.get("13").toString().equals("")){
					ll.setJsdj("无路");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				Lxsh l = lxshServer.selectbzcs(ll);
				if(l==null){
					response.getWriter().print(map.get("2").toString()+"  项目路线编码、建设技术等级有误");
					return;
				}
				BigDecimal b1=new BigDecimal(bzcs);
				BigDecimal b2=new BigDecimal(map.get("5").toString()).subtract(new BigDecimal(map.get("4").toString()));
				String bzys=b1.multiply(b2)+"";
				map.put("bzys", bzys);
			}
			boolean sfcg=true;
			sfcg=lxshServer.importlmgzlxsh(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void importxjlxsh(){
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
				String xzqhdm="select id from XTGL_XZQH where trim(name)='"+map.get("20").toString()+"'";
				String xzqh=lxshServer.selectimportXmbm(xzqhdm);
				if(xzqh==null||xzqh==""||"".equals(xzqh)){
					response.getWriter().print(fileuploadFileName+"中  "+map.get("2").toString()+"  项目行政区划有误");
					return;
				}
				String tiaojian="select max(substr(xmbm,-3)) from lxsh_xj where xmbm like "+map.get("0").toString()+"||"+"(select id from XTGL_XZQH where trim(name)='"+map.get("20").toString()+"')"+"||'%' ";
				String xmbm=lxshServer.selectimportXmbm(tiaojian);
				if(xmbm==null||xmbm==""||"".equals(xmbm)){
					map.put("xmbm", map.get("0").toString()+xzqh+"3001");
				}else{
					xmbm=Integer.parseInt(xmbm)+1+"";
					if(xmbm.length()==1)
						xmbm=map.get("0").toString()+xzqh+"300"+xmbm;
					if(xmbm.length()==2)
						xmbm=map.get("0").toString()+xzqh+"30"+xmbm;
					if(xmbm.length()==3)
						xmbm=map.get("0").toString()+xzqh+"3"+xmbm;
					map.put("xmbm", xmbm);
				}
				map.put("bzys", map.get("27").toString());
			}
			boolean sfcg=true;
			sfcg=lxshServer.importxjlxsh(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public void selectWqbzbz(){
		try {
		List<Wqbzbz> list=lxshServer.selectWqbzbz();
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void tjwqbzbz(){
		boolean bl=lxshServer.tjwqbzbz(wqbzbz);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void xgwqbzbz(){
		String jsdj1=wqbzbz.getJsdj1().replaceAll(",,,",",");
		if(",".equals(jsdj1.substring(0, 1))){
			jsdj1=jsdj1.substring(1);
		}
		String jsdj2=wqbzbz.getJsdj().replaceAll(",,,",",");
		if(",".equals(jsdj2.substring(0, 1))){
			jsdj2=jsdj2.substring(1);
		}
		wqbzbz.setJsdj1(jsdj1);
		wqbzbz.setJsdj(jsdj2);
		boolean bl=lxshServer.xgwqbzbz(wqbzbz);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void delwqbzbz(){
		boolean bl=lxshServer.delwqbzbz(wqbzbz);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public Lx getLx() {
		return lx;
	}
	public void setLx(Lx lx) {
		this.lx = lx;
	}
}

