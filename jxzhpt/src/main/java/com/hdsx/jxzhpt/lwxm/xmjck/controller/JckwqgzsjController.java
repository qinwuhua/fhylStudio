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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
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
	private String sfylrbwqk;
	private String shzt;
	
	public String getShzt() {
		return shzt;
	}
	public void setShzt(String shzt) {
		this.shzt = shzt;
	}
	public String getSfylrbwqk() {
		return sfylrbwqk;
	}
	public void setSfylrbwqk(String sfylrbwqk) {
		this.sfylrbwqk = sfylrbwqk;
	}
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
				if(gydw.length()==9)
jckwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else
				jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				jckwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			jckwqgzsj.setSfylrbwqk(sfylrbwqk);
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
	
	public void tuihuiWqgzsjById(){
		try {
			JsonUtils.write(jckwqgzsjServer.tuihuiWqgzsjById(jckwqgzsj),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void tuihuiWqgzsjsckById(){
		try {
			JsonUtils.write(jckwqgzsjServer.tuihuiWqgzsjsckById(jckwqgzsj),getresponse().getWriter());
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
				if(gydw.length()==9)
jckwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else
				jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				jckwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			jckwqgzsj.setSfylrbwqk(sfylrbwqk);
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
				if(gydw.length()==9)
jckwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else
				jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				jckwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			jckwqgzsj.setSfylrbwqk(sfylrbwqk);
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
				if(gydw.length()==9)
jckwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else
				jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				jckwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			jckwqgzsj.setSfylrbwqk(sfylrbwqk);
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
				if(gydw.length()==9)
jckwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else
				jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				jckwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			jckwqgzsj.setSfylrbwqk(sfylrbwqk);
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
		List<Jckwqgzsj> list = jckwqgzsjServer.JckWqgzRoad(jckwqgzsj);
		try {
			JsonUtils.write(list, getresponse().getWriter());
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
	
	public void xgSckWqgzSbzt(){
		try {
			JsonUtils.write(jckwqgzsjServer.xgSckWqgzSbzt(jckwqgzsj),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void shtyWqgzsckById(){
		try {
			JsonUtils.write(jckwqgzsjServer.shtyWqgzsckById(jckwqgzsj),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void shbtyWqgzsckById(){
		try {
			JsonUtils.write(jckwqgzsjServer.shbtyWqgzsckById(jckwqgzsj),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateSckwqgz(){
		boolean b = jckwqgzsjServer.updateSckwqgz(jckwqgzsj);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectSckShwqgz(){
		try {
			if(gydw.indexOf(",")==-1){
				if(gydw.length()==9)
jckwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else
				jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				jckwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			jckwqgzsj.setShzt(shzt);
			jckwqgzsj.setJsdj(jsdj);
			jckwqgzsj.setAkjfl(akjfl);
			jckwqgzsj.setLxbm(lxbm);
			jckwqgzsj.setQlbh(qlbh);
			jckwqgzsj.setTsdq(tsdq);
			jckwqgzsj.setPage(page);
			jckwqgzsj.setRows(rows);
			jckwqgzsj.setBzls(bzls);
			jckwqgzsj.setSfylrbwqk(sfylrbwqk);
		List<Jckwqgzsj> list = jckwqgzsjServer.selectSckShwqgz(jckwqgzsj);
		int count = jckwqgzsjServer.selectSckShwqgzCount(jckwqgzsj);
		EasyUIPage<Jckwqgzsj> eui = new EasyUIPage<Jckwqgzsj>();
		eui.setRows(list);
		eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectSckShwqgzCount(){
		try {
			if(gydw.indexOf(",")==-1){
				if(gydw.length()==9)
					jckwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else
				jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				jckwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			jckwqgzsj.setShzt(shzt);
			jckwqgzsj.setJsdj(jsdj);
			jckwqgzsj.setAkjfl(akjfl);
			jckwqgzsj.setLxbm(lxbm);
			jckwqgzsj.setQlbh(qlbh);
			jckwqgzsj.setTsdq(tsdq);
			jckwqgzsj.setPage(page);
			jckwqgzsj.setRows(rows);
			jckwqgzsj.setBzls(bzls);
			jckwqgzsj.setSfylrbwqk(sfylrbwqk);
		int count = jckwqgzsjServer.selectSckShwqgzCount(jckwqgzsj);
		ResponseUtils.write(getresponse(), count+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void sjshtyWqgzsjwqgz(){
		try {
			JsonUtils.write(jckwqgzsjServer.sjshtyWqgzsjwqgz(jckwqgzsj),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void sjshbtyWqgzsjwqgz(){
		try {
			JsonUtils.write(jckwqgzsjServer.sjshbtyWqgzsjwqgz(jckwqgzsj),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dcwqgzsjxmkExcel(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			jckwqgzsj.setGydw("and gydwbm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			jckwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhs+"%'");
		}else{
			jckwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhs+")");
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
		jckwqgzsj.setSfylrbwqk(sfylrbwqk);
		List<Excel_list> l = jckwqgzsjServer.dcwqgzsjjhExcel(jckwqgzsj);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("危桥改造（交通局）");//设置第一行
		eldata.setSheetName("危桥改造（交通局）");//设置sheeet名
		eldata.setFileName("危桥改造（交通局）");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,2,0,0));
		et.add(new Excel_tilte("设区市",1,2,1,1));
		et.add(new Excel_tilte("县(市、区)",1,2,2,2));
		et.add(new Excel_tilte("所在乡镇",1,2,3,3));
		et.add(new Excel_tilte("行政区划代码",1,2,4,4));
		et.add(new Excel_tilte("新路线编码",1,2,5,5));
		et.add(new Excel_tilte("新路线名称",1,2,6,6));
		et.add(new Excel_tilte("新桥路编码",1,2,7,7));
		et.add(new Excel_tilte("新中心桩号",1,2,8,8));
		et.add(new Excel_tilte("桥梁名称",1,2,9,9));
		et.add(new Excel_tilte("桥梁编号",1,2,10,10));
		et.add(new Excel_tilte("路线编码",1,2,11,11));
		et.add(new Excel_tilte("路线名称",1,2,12,12));
		et.add(new Excel_tilte("公路行政等级",1,2,13,13));
		et.add(new Excel_tilte("公路技术等级",1,2,14,14));
		et.add(new Excel_tilte("中心桩号",1,2,15,15));
		et.add(new Excel_tilte("桥梁位置",1,1,16,17));
		et.add(new Excel_tilte("建成时间(年份)",1,2,18,18));
		et.add(new Excel_tilte("桥梁长度(米)",1,2,19,19));
		et.add(new Excel_tilte("桥梁类别",1,1,20,22));
		et.add(new Excel_tilte("跨径总长(米)",1,2,23,23));
		et.add(new Excel_tilte("单孔最大跨径(米)",1,2,24,24));
		et.add(new Excel_tilte("设计洪水频率(年)",1,2,25,25));
		et.add(new Excel_tilte("桥下净宽(米)",1,2,26,26));
		et.add(new Excel_tilte("桥下净空(米)",1,2,27,27));
		et.add(new Excel_tilte("主桥孔数(孔)",1,2,28,28));
		et.add(new Excel_tilte("桥面全宽(米)",1,2,29,29));
		et.add(new Excel_tilte("桥面净宽(米)",1,2,30,30));
		et.add(new Excel_tilte("跨越地物类型",1,2,31,31));
		et.add(new Excel_tilte("通航等级",1,2,32,32));
		et.add(new Excel_tilte("公路桥梁用途",1,2,33,33));
		et.add(new Excel_tilte("桥梁结构",1,1,34,37));
		et.add(new Excel_tilte("主要病害",1,2,38,38));
		et.add(new Excel_tilte("评定等级分类",1,2,39,39));
		et.add(new Excel_tilte("备注",1,2,40,40));
		et.add(new Excel_tilte("是否已列入部危桥库",1,2,41,41));
		et.add(new Excel_tilte("经度",2,2,16,16));
		et.add(new Excel_tilte("纬度",2,2,17,17));
		et.add(new Excel_tilte("按跨径分类",2,2,20,20));
		et.add(new Excel_tilte("按建筑材料和使用年限分类",2,2,21,21));
		et.add(new Excel_tilte("技术等级状况",2,2,22,22));
		et.add(new Excel_tilte("上部结构",2,2,34,34));
		et.add(new Excel_tilte("桥墩类型",2,2,35,35));
		et.add(new Excel_tilte("桥台类型",2,2,36,36));
		et.add(new Excel_tilte("铺装类型",2,2,37,37));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_exportbyXH(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dcwqgzsjxmkshExcel(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			jckwqgzsj.setGydw("and gydwbm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			jckwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhs+"%'");
		}else{
			jckwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhs+")");
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
		jckwqgzsj.setSfylrbwqk(sfylrbwqk);
		List<Excel_list> l = jckwqgzsjServer.dcwqgzsjxmkshExcel(jckwqgzsj);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("危桥改造（交通局）");//设置第一行
		eldata.setSheetName("危桥改造（交通局）");//设置sheeet名
		eldata.setFileName("危桥改造（交通局）");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,2,0,0));
		et.add(new Excel_tilte("设区市",1,2,1,1));
		et.add(new Excel_tilte("县(市、区)",1,2,2,2));
		et.add(new Excel_tilte("所在乡镇",1,2,3,3));
		et.add(new Excel_tilte("行政区划代码",1,2,4,4));
		et.add(new Excel_tilte("新路线编码",1,2,5,5));
		et.add(new Excel_tilte("新路线名称",1,2,6,6));
		et.add(new Excel_tilte("新桥路编码",1,2,7,7));
		et.add(new Excel_tilte("新中心桩号",1,2,8,8));
		et.add(new Excel_tilte("桥梁名称",1,2,9,9));
		et.add(new Excel_tilte("桥梁编号",1,2,10,10));
		et.add(new Excel_tilte("路线编码",1,2,11,11));
		et.add(new Excel_tilte("路线名称",1,2,12,12));
		et.add(new Excel_tilte("公路行政等级",1,2,13,13));
		et.add(new Excel_tilte("公路技术等级",1,2,14,14));
		et.add(new Excel_tilte("中心桩号",1,2,15,15));
		et.add(new Excel_tilte("桥梁位置",1,1,16,17));
		et.add(new Excel_tilte("建成时间(年份)",1,2,18,18));
		et.add(new Excel_tilte("桥梁长度(米)",1,2,19,19));
		et.add(new Excel_tilte("桥梁类别",1,1,20,22));
		et.add(new Excel_tilte("跨径总长(米)",1,2,23,23));
		et.add(new Excel_tilte("单孔最大跨径(米)",1,2,24,24));
		et.add(new Excel_tilte("设计洪水频率(年)",1,2,25,25));
		et.add(new Excel_tilte("桥下净宽(米)",1,2,26,26));
		et.add(new Excel_tilte("桥下净空(米)",1,2,27,27));
		et.add(new Excel_tilte("主桥孔数(孔)",1,2,28,28));
		et.add(new Excel_tilte("桥面全宽(米)",1,2,29,29));
		et.add(new Excel_tilte("桥面净宽(米)",1,2,30,30));
		et.add(new Excel_tilte("跨越地物类型",1,2,31,31));
		et.add(new Excel_tilte("通航等级",1,2,32,32));
		et.add(new Excel_tilte("公路桥梁用途",1,2,33,33));
		et.add(new Excel_tilte("桥梁结构",1,1,34,37));
		et.add(new Excel_tilte("主要病害",1,2,38,38));
		et.add(new Excel_tilte("评定等级分类",1,2,39,39));
		et.add(new Excel_tilte("备注",1,2,40,40));
		et.add(new Excel_tilte("是否已列入部危桥库",1,2,41,41));
		et.add(new Excel_tilte("经度",2,2,16,16));
		et.add(new Excel_tilte("纬度",2,2,17,17));
		et.add(new Excel_tilte("按跨径分类",2,2,20,20));
		et.add(new Excel_tilte("按建筑材料和使用年限分类",2,2,21,21));
		et.add(new Excel_tilte("技术等级状况",2,2,22,22));
		et.add(new Excel_tilte("上部结构",2,2,34,34));
		et.add(new Excel_tilte("桥墩类型",2,2,35,35));
		et.add(new Excel_tilte("桥台类型",2,2,36,36));
		et.add(new Excel_tilte("铺装类型",2,2,37,37));
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_exportbyXH(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dcwqgzsjsckExcel(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			jckwqgzsj.setGydw("and gydwbm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			jckwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhs+"%'");
		}else{
			jckwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhs+")");
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
		jckwqgzsj.setBzls(bzls);
		jckwqgzsj.setSfylrbwqk(sfylrbwqk);
		List<Excel_list> l = jckwqgzsjServer.dcwqgzsjsckExcel(jckwqgzsj);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("危桥改造（交通局）");//设置第一行
		eldata.setSheetName("危桥改造（交通局）");//设置sheeet名
		eldata.setFileName("危桥改造（交通局）");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号 ",1,1,0,0));
		et.add(new Excel_tilte("设区市",1,1,1,1));
		et.add(new Excel_tilte("县（市、区）",1,1,2,2));
		et.add(new Excel_tilte("所在乡镇",1,1,3,3));
		et.add(new Excel_tilte("桥梁编码",1,1,4,4));
		et.add(new Excel_tilte("桥梁名称",1,1,5,5));
		et.add(new Excel_tilte("桥梁中心桩号",1,1,6,6));
		et.add(new Excel_tilte("桥梁全长（米）",1,1,7,7));
		et.add(new Excel_tilte("桥梁全宽（米）",1,1,8,8));
		et.add(new Excel_tilte("方案评估（设计）单位",1,1,9,9));
		et.add(new Excel_tilte("方案审查（批复）单位",1,1,10,10));
		et.add(new Excel_tilte("方案审批时间",1,1,11,11));
		et.add(new Excel_tilte("审批文号",1,1,12,12));
		et.add(new Excel_tilte("投资估算（万元）",1,1,13,13));
		et.add(new Excel_tilte("建设性质",1,1,14,14));
		et.add(new Excel_tilte("建设内容",1,1,15,15));
		et.add(new Excel_tilte("项目年份",1,1,16,16));
		et.add(new Excel_tilte("拟申请部（省）级补助资金（万元）",1,1,17,17));
		et.add(new Excel_tilte("备注",1,1,18,18));

		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_exportbyXH(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dcwqgzsjsckshExcel(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			jckwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			jckwqgzsj.setGydw("and gydwbm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			jckwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhs+"%'");
		}else{
			jckwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhs+")");
		}
		jckwqgzsj.setSck_sbthcd(sbthcd);
		jckwqgzsj.setLxmc(lxmc);
		jckwqgzsj.setQlmc(qlmc);
		jckwqgzsj.setXmnf(xmnf);
		jckwqgzsj.setShzt(sbzt);
		jckwqgzsj.setJsdj(jsdj);
		jckwqgzsj.setAkjfl(akjfl);
		jckwqgzsj.setLxbm(lxbm);
		jckwqgzsj.setQlbh(qlbh);
		jckwqgzsj.setTsdq(tsdq);
		jckwqgzsj.setBzls(bzls);
		jckwqgzsj.setSfylrbwqk(sfylrbwqk);
		List<Excel_list> l = jckwqgzsjServer.dcwqgzsjsckshExcel(jckwqgzsj);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("危桥改造（交通局）");//设置第一行
		eldata.setSheetName("危桥改造（交通局）");//设置sheeet名
		eldata.setFileName("危桥改造（交通局）");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号 ",1,1,0,0));
		et.add(new Excel_tilte("设区市",1,1,1,1));
		et.add(new Excel_tilte("县（市、区）",1,1,2,2));
		et.add(new Excel_tilte("所在乡镇",1,1,3,3));
		et.add(new Excel_tilte("桥梁编码",1,1,4,4));
		et.add(new Excel_tilte("桥梁名称",1,1,5,5));
		et.add(new Excel_tilte("桥梁中心桩号",1,1,6,6));
		et.add(new Excel_tilte("桥梁全长（米）",1,1,7,7));
		et.add(new Excel_tilte("桥梁全宽（米）",1,1,8,8));
		et.add(new Excel_tilte("方案评估（设计）单位",1,1,9,9));
		et.add(new Excel_tilte("方案审查（批复）单位",1,1,10,10));
		et.add(new Excel_tilte("方案审批时间",1,1,11,11));
		et.add(new Excel_tilte("审批文号",1,1,12,12));
		et.add(new Excel_tilte("投资估算（万元）",1,1,13,13));
		et.add(new Excel_tilte("建设性质",1,1,14,14));
		et.add(new Excel_tilte("建设内容",1,1,15,15));
		et.add(new Excel_tilte("项目年份",1,1,16,16));
		et.add(new Excel_tilte("拟申请部（省）级补助资金（万元）",1,1,17,17));
		et.add(new Excel_tilte("备注",1,1,18,18));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_exportbyXH(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

	
