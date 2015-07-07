package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzsjServer;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目基础库——危桥改造Action层
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class JckwqgzsjController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckwqgzsjServerImpl")
	private JckwqgzsjServer jckwqgzsjServer;
	private Jckwqgzsj jckwqgzsj=new Jckwqgzsj();
	
	private int sbthcd;
 	private String gydw;
 	private String xzqhdm;
 	private String lxmc;
 	private String qlmc;
 	private String xmnf;
 	private String sbzt;
 	private String jsdj;
 	private String akjfl;
 	private String lxbm;
 	private String qlbh;
 	private String tsdq;
 	private int page = 1;
	private int rows = 10;
	private String bzls;
	
	
	public String getBzls() {
		return bzls;
	}
	public void setBzls(String bzls) {
		this.bzls = bzls;
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
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
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
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getSbzt() {
		return sbzt;
	}
	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}
	public String getAkjfl() {
		return akjfl;
	}
	public void setAkjfl(String akjfl) {
		this.akjfl = akjfl;
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm;
	}
	public String getQlbh() {
		return qlbh;
	}
	public void setQlbh(String qlbh) {
		this.qlbh = qlbh;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public Jckwqgzsj getJckwqgzsj() {
		return jckwqgzsj;
	}
	public void setJckwqgzsj(Jckwqgzsj jckwqgzsj) {
		this.jckwqgzsj = jckwqgzsj;
	}
	
	public void deleteqlzpbyxmbm(){
		try {
			boolean bl = jckwqgzsjServer.deleteqlzpbyxmbm(jckwqgzsj);
			ResponseUtils.write(getresponse(), bl + "");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertWqgz(){
		boolean b = jckwqgzsjServer.insertWqgz(jckwqgzsj);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectWqgz(){
		try {
			if(gydw.indexOf(",")==-1){
				jckwqgzsj.setGydw("and tbbmbm like '%"+gydw+"%'");
			}else{
				jckwqgzsj.setGydw("and tbbmbm in ("+gydw+")");
			}
			if(xzqhdm.indexOf(",")==-1){
				jckwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhdm+"%'");
			}else{
				jckwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhdm+")");
			}
			jckwqgzsj.setSbthcd(sbthcd);
			jckwqgzsj.setLxmc(lxmc);
			jckwqgzsj.setQlmc(qlmc);
			jckwqgzsj.setXmnf(xmnf);
			jckwqgzsj.setSbzt(sbzt);
			jckwqgzsj.setJsdj(jsdj);
			jckwqgzsj.setAkjfl(akjfl);
			jckwqgzsj.setLxbm(lxbm);
			jckwqgzsj.setQlbh(qlbh);
			jckwqgzsj.setTsdq(tsdq);
			jckwqgzsj.setPage(page);
			jckwqgzsj.setRows(rows);
			List<Jckwqgzsj> wqgzList = jckwqgzsjServer.selectWqgzList(jckwqgzsj);
			int count = jckwqgzsjServer.selectWqgzCount(jckwqgzsj);
			EasyUIPage<Jckwqgzsj> eui = new EasyUIPage<Jckwqgzsj>();
			eui.setRows(wqgzList);
			eui.setTotal(count);
			
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	public void deleteWqgzsjById(){
		try {
			JsonUtils.write(jckwqgzsjServer.deleteWqgzsjById(jckwqgzsj),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getwqgzZP(){
		try {
			ResponseUtils.write(getresponse(), jckwqgzsjServer.getwqgzZP(jckwqgzsj)+"");
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void xgJckWqgzSbzt(){
		try {
			JsonUtils.write(jckwqgzsjServer.xgJckWqgzSbzt(jckwqgzsj),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void shtyWqgzsjById(){
		try {
			JsonUtils.write(jckwqgzsjServer.shtyWqgzsjById(jckwqgzsj),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void shbtyWqgzsjById(){
		try {
			JsonUtils.write(jckwqgzsjServer.shbtyWqgzsjById(jckwqgzsj),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectJckShwqgz(){
		try {
			if(gydw.indexOf(",")==-1){
				jckwqgzsj.setGydw("and tbbmbm like '%"+gydw+"%'");
			}else{
				jckwqgzsj.setGydw("and tbbmbm in ("+gydw+")");
			}
			if(xzqhdm.indexOf(",")==-1){
				jckwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhdm+"%'");
			}else{
				jckwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhdm+")");
			}
			jckwqgzsj.setSbthcd(sbthcd);
			jckwqgzsj.setLxmc(lxmc);
			jckwqgzsj.setQlmc(qlmc);
			jckwqgzsj.setXmnf(xmnf);
			jckwqgzsj.setShzt(sbzt);
			jckwqgzsj.setJsdj(jsdj);
			jckwqgzsj.setAkjfl(akjfl);
			jckwqgzsj.setLxbm(lxbm);
			jckwqgzsj.setQlbh(qlbh);
			jckwqgzsj.setTsdq(tsdq);
			jckwqgzsj.setPage(page);
			jckwqgzsj.setRows(rows);
		List<Jckwqgzsj> wqgzList = jckwqgzsjServer.selectJckShwqgz(jckwqgzsj);
		int count = jckwqgzsjServer.selectWqgzShCount(jckwqgzsj);
		EasyUIPage<Jckwqgzsj> eui = new EasyUIPage<Jckwqgzsj>();
		eui.setRows(wqgzList);
		eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectWqgzShCount(){
		try {
			if(gydw.indexOf(",")==-1){
				jckwqgzsj.setGydw("and tbbmbm like '%"+gydw+"%'");
			}else{
				jckwqgzsj.setGydw("and tbbmbm in ("+gydw+")");
			}
			if(xzqhdm.indexOf(",")==-1){
				jckwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhdm+"%'");
			}else{
				jckwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhdm+")");
			}
			jckwqgzsj.setSbthcd(sbthcd);
			jckwqgzsj.setLxmc(lxmc);
			jckwqgzsj.setQlmc(qlmc);
			jckwqgzsj.setXmnf(xmnf);
			jckwqgzsj.setShzt(sbzt);
			jckwqgzsj.setJsdj(jsdj);
			jckwqgzsj.setAkjfl(akjfl);
			jckwqgzsj.setLxbm(lxbm);
			jckwqgzsj.setQlbh(qlbh);
			jckwqgzsj.setTsdq(tsdq);
			jckwqgzsj.setPage(page);
			jckwqgzsj.setRows(rows);
			int count = jckwqgzsjServer.selectWqgzShCount(jckwqgzsj);
			ResponseUtils.write(getresponse(), count+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void sjshtyWqgzsjById(){
		try {
			JsonUtils.write(jckwqgzsjServer.sjshtyWqgzsjById(jckwqgzsj),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void sjshbtyWqgzsjById(){
		try {
			JsonUtils.write(jckwqgzsjServer.sjshbtyWqgzsjById(jckwqgzsj),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateWqgz(){
		try {
			ResponseUtils.write(getresponse(), jckwqgzsjServer.updateWqgz(jckwqgzsj)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectSckwqgz(){
		try {
			if(gydw.indexOf(",")==-1){
				jckwqgzsj.setGydw("and tbbmbm like '%"+gydw+"%'");
			}else{
				jckwqgzsj.setGydw("and tbbmbm in ("+gydw+")");
			}
			if(xzqhdm.indexOf(",")==-1){
				jckwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhdm+"%'");
			}else{
				jckwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhdm+")");
			}
			jckwqgzsj.setSck_sbthcd(sbthcd);
			jckwqgzsj.setLxmc(lxmc);
			jckwqgzsj.setQlmc(qlmc);
			jckwqgzsj.setXmnf(xmnf);
			jckwqgzsj.setSbzt(sbzt);
			jckwqgzsj.setJsdj(jsdj);
			jckwqgzsj.setAkjfl(akjfl);
			jckwqgzsj.setLxbm(lxbm);
			jckwqgzsj.setQlbh(qlbh);
			jckwqgzsj.setTsdq(tsdq);
			jckwqgzsj.setPage(page);
			jckwqgzsj.setRows(rows);
			jckwqgzsj.setBzls(bzls);
		List<Jckwqgzsj> list = jckwqgzsjServer.selectSckwqgz(jckwqgzsj);
		int count = jckwqgzsjServer.selectSckwqgzCount(jckwqgzsj);
		EasyUIPage<Jckwqgzsj> eui = new EasyUIPage<Jckwqgzsj>();
		eui.setRows(list);
		eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectSckwqgzCount(){
		try {
			if(gydw.indexOf(",")==-1){
				jckwqgzsj.setGydw("and tbbmbm like '%"+gydw+"%'");
			}else{
				jckwqgzsj.setGydw("and tbbmbm in ("+gydw+")");
			}
			if(xzqhdm.indexOf(",")==-1){
				jckwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhdm+"%'");
			}else{
				jckwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhdm+")");
			}
			jckwqgzsj.setSck_sbthcd(sbthcd);
			jckwqgzsj.setLxmc(lxmc);
			jckwqgzsj.setQlmc(qlmc);
			jckwqgzsj.setXmnf(xmnf);
			jckwqgzsj.setSbzt(sbzt);
			jckwqgzsj.setJsdj(jsdj);
			jckwqgzsj.setAkjfl(akjfl);
			jckwqgzsj.setLxbm(lxbm);
			jckwqgzsj.setQlbh(qlbh);
			jckwqgzsj.setTsdq(tsdq);
			jckwqgzsj.setPage(page);
			jckwqgzsj.setRows(rows);
			jckwqgzsj.setBzls(bzls);
		int count = jckwqgzsjServer.selectSckwqgzCount(jckwqgzsj);
		ResponseUtils.write(getresponse(), count+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void JckWqgzRoad(){
		jckwqgzsj.setQlbh(qlbh);
		jckwqgzsj.setGydwbm(gydw);
		jckwqgzsj.setXzqhdm(xzqhdm);
		try {
			JsonUtils.write(jckwqgzsjServer.JckWqgzRoad(jckwqgzsj), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertSckwqgz(){
		boolean b = jckwqgzsjServer.insertSckwqgz(jckwqgzsj);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void deleteSckWqgz(){
		try {
			JsonUtils.write(jckwqgzsjServer.deleteSckWqgz(jckwqgzsj),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
}

	
