package com.hdsx.jxzhpt.lwxm.xmjck.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.net.aso.l;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Xmkaqsmfh;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Zdycx;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzsjServer;
import com.hdsx.jxzhpt.lwxm.xmjck.server.XmkaqsmfhServer;
import com.hdsx.jxzhpt.lwxm.xmjck.server.impl.JckwqgzsjServerImpl;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.webutil.struts.BaseActionSupport;

/**
 * 项目基础库——安防Action层
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class XmkaqsmfhController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource(name="xmkaqsmfhServerImpl")
	private XmkaqsmfhServer  xmkaqsmfhServer;
	private int page = 1;
	private int rows = 10;
	private String roadcode;
	private String unitcode;
	private String distcode;
	private Xmkaqsmfh xmkaqsmfh=new Xmkaqsmfh();
	
	public String getUnitcode() {
		return unitcode;
	}
	public void setUnitcode(String unitcode) {
		this.unitcode = unitcode;
	}
	public String getDistcode() {
		return distcode;
	}
	public void setDistcode(String distcode) {
		this.distcode = distcode;
	}
	public String getRoadcode() {
		return roadcode;
	}
	public void setRoadcode(String roadcode) {
		this.roadcode = roadcode;
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
	public Xmkaqsmfh getXmkaqsmfh() {
		return xmkaqsmfh;
	}
	public void setXmkaqsmfh(Xmkaqsmfh xmkaqsmfh) {
		this.xmkaqsmfh = xmkaqsmfh;
	}

	public void selectXmkaqsmfhXMK(){
		try {
			if(xmkaqsmfh.getUnitcode().indexOf(",")==-1){
				if(xmkaqsmfh.getUnitcode().length()==9)
					xmkaqsmfh.setUnitcode("and (unitcode='"+xmkaqsmfh.getUnitcode()+"'||'00' or unitcode in(select id from xtgl_department where parent='"+xmkaqsmfh.getUnitcode()+"'||'00'))");					else
						xmkaqsmfh.setUnitcode("and unitcode like '%'||substr('"+xmkaqsmfh.getUnitcode()+"',0,4)||'_'||substr('"+xmkaqsmfh.getUnitcode()+"',6)||'%'");
			}else{
				xmkaqsmfh.setUnitcode("and unitcode in ("+xmkaqsmfh.getUnitcode()+")");
			}
			if(xmkaqsmfh.getDistcode().indexOf(",")==-1){
				xmkaqsmfh.setDistcode("and distcode like '%"+xmkaqsmfh.getDistcode()+"%'");
			}else{
				xmkaqsmfh.setDistcode("and distcode in ("+xmkaqsmfh.getDistcode()+")");
			}
			xmkaqsmfh.setPage(page);
			xmkaqsmfh.setRows(rows);
			if(xmkaqsmfh.getTsdq().length()>0){
				String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
				xmkaqsmfh.setTsdq(tsdq);
			}
			if(xmkaqsmfh.getGldj().length()>0){
				String[] tsdqs=xmkaqsmfh.getGldj().split(",");
				String tsdq="and substr(roadcode,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setGldj(tsdq);
			}
			if(xmkaqsmfh.getJsdj().length()>0){
				String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setJsdj(tsdq);
			}
			
			String sss = xmkaqsmfh.getThroadname();
			List<Xmkaqsmfh> wqgzList = xmkaqsmfhServer.selectXmkaqsmfhXMK(xmkaqsmfh);
			int count = xmkaqsmfhServer.selectXmkaqsmfhXMKCount(xmkaqsmfh);
			EasyUIPage<Xmkaqsmfh> eui = new EasyUIPage<Xmkaqsmfh>();
			eui.setRows(wqgzList);
			eui.setTotal(count);
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public void loadXmkaqsmfhXMKCount(){
		try {
			if(xmkaqsmfh.getUnitcode().indexOf(",")==-1){
				if(xmkaqsmfh.getUnitcode().length()==9)
					xmkaqsmfh.setUnitcode("and (unitcode='"+xmkaqsmfh.getUnitcode()+"'||'00' or unitcode in(select id from xtgl_department where parent='"+xmkaqsmfh.getUnitcode()+"'||'00'))");					else
						xmkaqsmfh.setUnitcode("and unitcode like '%'||substr('"+xmkaqsmfh.getUnitcode()+"',0,4)||'_'||substr('"+xmkaqsmfh.getUnitcode()+"',6)||'%'");
			}else{
				xmkaqsmfh.setUnitcode("and unitcode in ("+xmkaqsmfh.getUnitcode()+")");
			}
			if(xmkaqsmfh.getDistcode().indexOf(",")==-1){
				xmkaqsmfh.setDistcode("and distcode like '%"+xmkaqsmfh.getDistcode()+"%'");
			}else{
				xmkaqsmfh.setDistcode("and distcode in ("+xmkaqsmfh.getDistcode()+")");
			}
			if(xmkaqsmfh.getTsdq().length()>0){
				String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
				xmkaqsmfh.setTsdq(tsdq);
			}
			if(xmkaqsmfh.getGldj().length()>0){
				String[] tsdqs=xmkaqsmfh.getGldj().split(",");
				String tsdq="and substr(roadcode,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setGldj(tsdq);
			}
			if(xmkaqsmfh.getJsdj().length()>0){
				String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setJsdj(tsdq);
			}
			
			Xmkaqsmfh aqsmfh=xmkaqsmfhServer.loadXmkaqsmfhXMKCount(xmkaqsmfh);
			JsonUtils.write(aqsmfh, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void selectXmkaqsmfhsh(){
		try {
			if(xmkaqsmfh.getUnitcode().indexOf(",")==-1){
				if(xmkaqsmfh.getUnitcode().length()==9)
					xmkaqsmfh.setUnitcode("and (unitcode='"+xmkaqsmfh.getUnitcode()+"'||'00' or unitcode in(select id from xtgl_department where parent='"+xmkaqsmfh.getUnitcode()+"'||'00'))");					else
						xmkaqsmfh.setUnitcode("and unitcode like '%'||substr('"+xmkaqsmfh.getUnitcode()+"',0,4)||'_'||substr('"+xmkaqsmfh.getUnitcode()+"',6)||'%'");
			}else{
				xmkaqsmfh.setUnitcode("and unitcode in ("+xmkaqsmfh.getUnitcode()+")");
			}
			if(xmkaqsmfh.getDistcode().indexOf(",")==-1){
				xmkaqsmfh.setDistcode("and distcode like '%"+xmkaqsmfh.getDistcode()+"%'");
			}else{
				xmkaqsmfh.setDistcode("and distcode in ("+xmkaqsmfh.getDistcode()+")");
			}
			xmkaqsmfh.setPage(page);
			xmkaqsmfh.setRows(rows);
			if(xmkaqsmfh.getTsdq().length()>0){
				String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
				xmkaqsmfh.setTsdq(tsdq);
			}
			if(xmkaqsmfh.getGldj().length()>0){
				String[] tsdqs=xmkaqsmfh.getGldj().split(",");
				String tsdq="and substr(roadcode,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setGldj(tsdq);
			}
			if(xmkaqsmfh.getJsdj().length()>0){
				String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setJsdj(tsdq);
			}
			List<Xmkaqsmfh> wqgzList = xmkaqsmfhServer.selectXmkaqsmfhsh(xmkaqsmfh);
			int count = xmkaqsmfhServer.selectXmkaqsmfhshCount(xmkaqsmfh);
			EasyUIPage<Xmkaqsmfh> eui = new EasyUIPage<Xmkaqsmfh>();
			eui.setRows(wqgzList);
			eui.setTotal(count);
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public void loadXmkaqsmfhshCount(){
		try {
			if(xmkaqsmfh.getUnitcode().indexOf(",")==-1){
				if(xmkaqsmfh.getUnitcode().length()==9)
					xmkaqsmfh.setUnitcode("and (unitcode='"+xmkaqsmfh.getUnitcode()+"'||'00' or unitcode in(select id from xtgl_department where parent='"+xmkaqsmfh.getUnitcode()+"'||'00'))");					else
						xmkaqsmfh.setUnitcode("and unitcode like '%'||substr('"+xmkaqsmfh.getUnitcode()+"',0,4)||'_'||substr('"+xmkaqsmfh.getUnitcode()+"',6)||'%'");
			}else{
				xmkaqsmfh.setUnitcode("and unitcode in ("+xmkaqsmfh.getUnitcode()+")");
			}
			if(xmkaqsmfh.getDistcode().indexOf(",")==-1){
				xmkaqsmfh.setDistcode("and distcode like '%"+xmkaqsmfh.getDistcode()+"%'");
			}else{
				xmkaqsmfh.setDistcode("and distcode in ("+xmkaqsmfh.getDistcode()+")");
			}
			if(xmkaqsmfh.getTsdq().length()>0){
				String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
				xmkaqsmfh.setTsdq(tsdq);
			}
			if(xmkaqsmfh.getGldj().length()>0){
				String[] tsdqs=xmkaqsmfh.getGldj().split(",");
				String tsdq="and substr(roadcode,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setGldj(tsdq);
			}
			if(xmkaqsmfh.getJsdj().length()>0){
				String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setJsdj(tsdq);
			}
			Xmkaqsmfh aqsmfh=xmkaqsmfhServer.loadXmkaqsmfhshCount(xmkaqsmfh);
			JsonUtils.write(aqsmfh, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void smfhGpsroad(){
		try {
			xmkaqsmfh.setRoadcode(roadcode);
			xmkaqsmfh.setUnitcode(unitcode);
			xmkaqsmfh.setDistcode(distcode);
			List<Xmkaqsmfh> list=xmkaqsmfhServer.smfhGpsroad(xmkaqsmfh);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//添加生命防护基础库
	public void insertAqsmfhxmk(){
		Zdycx z = new Zdycx();//定义一个类，接收查询补助历史的参数
		z.setXmnf(Calendar.getInstance().get(Calendar.YEAR)+"");//本项目的年份
		z.setLxbm(xmkaqsmfh.getLxbm().substring(0, 4));//本项目的路线编码
		z.setQdzh(xmkaqsmfh.getQdzh());//本项目起点
		z.setZdzh(xmkaqsmfh.getZdzh());//本项目止点
		z.setSfafsc("否");//是否安防审查，如果不是就是否
		z.setXzqh(xmkaqsmfh.getXzqhdm());//设置行政区划
		//调用方法，返回历史信息
		JckwqgzsjServer jckwqgzsjServer=new JckwqgzsjServerImpl();
		Zdycx c = jckwqgzsjServer.queryLwLsxx(z);
		xmkaqsmfh.setLsjl(c.getLsjl());//设置值
		xmkaqsmfh.setLsxmxx(c.getLsxmxx());//设置值
		
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.insertAqsmfhxmk(xmkaqsmfh)+"");
	}
	//修改生命防护基础库
	public void updateAqsmfhxmk(){
		Zdycx z = new Zdycx();//定义一个类，接收查询补助历史的参数
		z.setXmnf(Calendar.getInstance().get(Calendar.YEAR)+"");//本项目的年份
		z.setLxbm(xmkaqsmfh.getLxbm().substring(0, 4));//本项目的路线编码
		z.setQdzh(xmkaqsmfh.getQdzh());//本项目起点
		z.setZdzh(xmkaqsmfh.getZdzh());//本项目止点
		z.setSfafsc("否");//是否安防审查，如果不是就是否
		z.setXzqh(xmkaqsmfh.getXzqhdm());//设置行政区划
		//调用方法，返回历史信息
		JckwqgzsjServer jckwqgzsjServer=new JckwqgzsjServerImpl();
		Zdycx c = jckwqgzsjServer.queryLwLsxx(z);
		xmkaqsmfh.setLsjl(c.getLsjl());//设置值
		xmkaqsmfh.setLsxmxx(c.getLsxmxx());//设置值
		
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.updateAqsmfhxmk(xmkaqsmfh)+"");
	}
	public void xgXmkAFSbzt(){
		try {
			JsonUtils.write(xmkaqsmfhServer.xgXmkAFSbzt(xmkaqsmfh),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteAfxmkById(){
		try {
			JsonUtils.write(xmkaqsmfhServer.deleteAfxmkById(xmkaqsmfh),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void afXmkCs(){
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.afXmkCs(xmkaqsmfh)+"");	
	}
	public void afXmkZs(){
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.afXmkZs(xmkaqsmfh)+"");	
	}
	
	public void afXmkZsbeatch(){
		try {
			ResponseUtils.write(getresponse(),
					xmkaqsmfhServer.afXmkZsbeatch(xmkaqsmfh) + "");
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	
	
	
	//审查库
	public void selectSckaqsmfh(){
		try {
			if(xmkaqsmfh.getGydw().indexOf(",")==-1){
				if(xmkaqsmfh.getGydw().length()==9)
					xmkaqsmfh.setGydw("and (gydwdm='"+xmkaqsmfh.getGydw()+"'||'00' or gydwdm in(select id from xtgl_department where parent='"+xmkaqsmfh.getGydw()+"'||'00'))");					else
						xmkaqsmfh.setGydw("and gydwdm like '%'||substr('"+xmkaqsmfh.getGydw()+"',0,4)||'_'||substr('"+xmkaqsmfh.getGydw()+"',6)||'%'");
			}else{
				xmkaqsmfh.setGydw("and gydwdm in ("+xmkaqsmfh.getGydw()+")");
			}
			if(xmkaqsmfh.getXzqh().indexOf(",")==-1){
				xmkaqsmfh.setXzqh("and xzqhdm like '%"+xmkaqsmfh.getXzqh()+"%'");
			}else{
				xmkaqsmfh.setXzqh("and xzqhdm in ("+xmkaqsmfh.getXzqh()+")");
			}
			xmkaqsmfh.setPage(page);
			xmkaqsmfh.setRows(rows);
			if(xmkaqsmfh.getTsdq().length()>0){
				String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
				xmkaqsmfh.setTsdq(tsdq);
			}
			if(xmkaqsmfh.getGldj().length()>0){
				String[] tsdqs=xmkaqsmfh.getGldj().split(",");
				String tsdq="and substr(lxbm,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setGldj(tsdq);
			}
			if(xmkaqsmfh.getJsdj().length()>0){
				String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setJsdj(tsdq);
			}
			List<Xmkaqsmfh> wqgzList = xmkaqsmfhServer.selectSckaqsmfh(xmkaqsmfh);
			int count = xmkaqsmfhServer.selectSckaqsmfhCount(xmkaqsmfh);
			EasyUIPage<Xmkaqsmfh> eui = new EasyUIPage<Xmkaqsmfh>();
			eui.setRows(wqgzList);
			eui.setTotal(count);
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	//sh
	public void selectSckaqsmfhsh(){
		try {
			if(xmkaqsmfh.getGydw().indexOf(",")==-1){
				if(xmkaqsmfh.getGydw().length()==9)
					xmkaqsmfh.setGydw("and (gydwdm='"+xmkaqsmfh.getGydw()+"'||'00' or gydwdm in(select id from xtgl_department where parent='"+xmkaqsmfh.getGydw()+"'||'00'))");					else
						xmkaqsmfh.setGydw("and gydwdm like '%'||substr('"+xmkaqsmfh.getGydw()+"',0,4)||'_'||substr('"+xmkaqsmfh.getGydw()+"',6)||'%'");
			}else{
				xmkaqsmfh.setGydw("and gydwdm in ("+xmkaqsmfh.getGydw()+")");
			}
			if(xmkaqsmfh.getXzqh().indexOf(",")==-1){
				xmkaqsmfh.setXzqh("and xzqhdm like '%"+xmkaqsmfh.getXzqh()+"%'");
			}else{
				xmkaqsmfh.setXzqh("and xzqhdm in ("+xmkaqsmfh.getXzqh()+")");
			}
			xmkaqsmfh.setPage(page);
			xmkaqsmfh.setRows(rows);
			if(xmkaqsmfh.getTsdq().length()>0){
				String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
				xmkaqsmfh.setTsdq(tsdq);
			}
			if(xmkaqsmfh.getGldj().length()>0){
				String[] tsdqs=xmkaqsmfh.getGldj().split(",");
				String tsdq="and substr(lxbm,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setGldj(tsdq);
			}
			if(xmkaqsmfh.getJsdj().length()>0){
				String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setJsdj(tsdq);
			}
			
			List<Xmkaqsmfh> wqgzList = xmkaqsmfhServer.selectSckaqsmfhsh(xmkaqsmfh);
			int count = xmkaqsmfhServer.selectSckaqsmfhshCount(xmkaqsmfh);
			EasyUIPage<Xmkaqsmfh> eui = new EasyUIPage<Xmkaqsmfh>();
			eui.setRows(wqgzList);
			eui.setTotal(count);
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	public void loadSckaqsmfhCount(){
		try {
			if(xmkaqsmfh.getGydw().indexOf(",")==-1){
				if(xmkaqsmfh.getGydw().length()==9)
					xmkaqsmfh.setGydw("and (gydwdm='"+xmkaqsmfh.getGydw()+"'||'00' or gydwdm in(select id from xtgl_department where parent='"+xmkaqsmfh.getGydw()+"'||'00'))");					else
						xmkaqsmfh.setGydw("and gydwdm like '%'||substr('"+xmkaqsmfh.getGydw()+"',0,4)||'_'||substr('"+xmkaqsmfh.getGydw()+"',6)||'%'");
			}else{
				xmkaqsmfh.setGydw("and gydwdm in ("+xmkaqsmfh.getGydw()+")");
			}
			if(xmkaqsmfh.getXzqh().indexOf(",")==-1){
				xmkaqsmfh.setXzqh("and xzqhdm like '%"+xmkaqsmfh.getXzqh()+"%'");
			}else{
				xmkaqsmfh.setXzqh("and xzqhdm in ("+xmkaqsmfh.getXzqh()+")");
			}
			if(xmkaqsmfh.getTsdq().length()>0){
				String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
				xmkaqsmfh.setTsdq(tsdq);
			}
			if(xmkaqsmfh.getGldj().length()>0){
				String[] tsdqs=xmkaqsmfh.getGldj().split(",");
				String tsdq="and substr(lxbm,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setGldj(tsdq);
			}
			if(xmkaqsmfh.getJsdj().length()>0){
				String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setJsdj(tsdq);
			}
			
			Xmkaqsmfh aqsmfh=xmkaqsmfhServer.loadSckaqsmfhCount(xmkaqsmfh);
			JsonUtils.write(aqsmfh, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void loadSckaqsmfhshCount(){
		try {
			if(xmkaqsmfh.getGydw().indexOf(",")==-1){
				if(xmkaqsmfh.getGydw().length()==9)
					xmkaqsmfh.setGydw("and (gydwdm='"+xmkaqsmfh.getGydw()+"'||'00' or gydwdm in(select id from xtgl_department where parent='"+xmkaqsmfh.getGydw()+"'||'00'))");					else
						xmkaqsmfh.setGydw("and gydwdm like '%'||substr('"+xmkaqsmfh.getGydw()+"',0,4)||'_'||substr('"+xmkaqsmfh.getGydw()+"',6)||'%'");
			}else{
				xmkaqsmfh.setGydw("and gydwdm in ("+xmkaqsmfh.getGydw()+")");
			}
			if(xmkaqsmfh.getXzqh().indexOf(",")==-1){
				xmkaqsmfh.setXzqh("and xzqhdm like '%"+xmkaqsmfh.getXzqh()+"%'");
			}else{
				xmkaqsmfh.setXzqh("and xzqhdm in ("+xmkaqsmfh.getXzqh()+")");
			}
			if(xmkaqsmfh.getTsdq().length()>0){
				String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
				xmkaqsmfh.setTsdq(tsdq);
			}
			if(xmkaqsmfh.getGldj().length()>0){
				String[] tsdqs=xmkaqsmfh.getGldj().split(",");
				String tsdq="and substr(lxbm,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setGldj(tsdq);
			}
			if(xmkaqsmfh.getJsdj().length()>0){
				String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setJsdj(tsdq);
			}
			Xmkaqsmfh aqsmfh=xmkaqsmfhServer.loadSckaqsmfhshCount(xmkaqsmfh);
			JsonUtils.write(aqsmfh, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void aqsmfhJckGpsRoad(){
		try {
			xmkaqsmfh.setRoadcode(roadcode);
			xmkaqsmfh.setUnitcode(unitcode);
			xmkaqsmfh.setDistcode(distcode);
			List<Xmkaqsmfh> list=xmkaqsmfhServer.aqsmfhJckGpsRoad(xmkaqsmfh);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertAqsmfhsck(){
		try {
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.insertAqsmfhsck(xmkaqsmfh)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectafldList(){
		try {
			JsonUtils.write(xmkaqsmfhServer.selectafldList(xmkaqsmfh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectAqsmfhsckbyid(){
		try {
			JsonUtils.write(xmkaqsmfhServer.selectAqsmfhsckbyid(xmkaqsmfh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectAqsmfhsckbyid1(){
		try {
			JsonUtils.write(xmkaqsmfhServer.selectAqsmfhsckbyid1(xmkaqsmfh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectAqsmfhxmkbyid(){
		try {
			JsonUtils.write(xmkaqsmfhServer.selectAqsmfhxmkbyid(xmkaqsmfh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateAqsmfhsck(){
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.updateAqsmfhsck(xmkaqsmfh)+"");
	}
	
	public void selectSckaqsmfhld(){
		try {
			JsonUtils.write(xmkaqsmfhServer.selectSckaqsmfhld(xmkaqsmfh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectSckaqsmfhld1(){
		try {
			JsonUtils.write(xmkaqsmfhServer.selectSckaqsmfhld1(xmkaqsmfh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertAqsmfhsckld(){
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.insertAqsmfhsckld(xmkaqsmfh)+"");
	}
	public void loadscktjld(){
		try {
			JsonUtils.write(xmkaqsmfhServer.loadscktjld(xmkaqsmfh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void loadscktjld1(){
		try {
			JsonUtils.write(xmkaqsmfhServer.loadscktjld1(xmkaqsmfh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void delafldsck(){
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.delafldsck(xmkaqsmfh)+"");
	}
	
	public void deleteSckAf(){
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.deleteSckAf(xmkaqsmfh)+"");	
	}
	
	public void sckAfSb(){
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.sckAfSb(xmkaqsmfh)+"");	
	}
	
	public void afSckCs(){
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.afSckCs(xmkaqsmfh)+"");	
	}
	
	public void afSckZs(){
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.afSckZs(xmkaqsmfh)+"");	
	}
	
	public void dcaqsmfhsckExcel(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			xmkaqsmfh.setGydw("and sc.gydwdm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			xmkaqsmfh.setGydw("and sc.gydwdm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			xmkaqsmfh.setXzqhdm("and sc.xzqhdm like '%"+xzqhs+"%'");
		}else{
			xmkaqsmfh.setXzqhdm("and sc.xzqhdm in ("+xzqhs+")");
		}
		
		List<Excel_list> l = xmkaqsmfhServer.dcaqsmfhsckExcel(xmkaqsmfh);
		int k=1;
		for (Excel_list e : l) {
			if("1".equals(e.getV_50())) {
				e.setV_0(""+k);k++;
			}
		}
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路安全生命防护工程审查项目");//设置第一行
		eldata.setSheetName("安防");//设置sheeet名
		eldata.setFileName("公路安全生命防护工程审查项目");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号 ",1,1,0,0));
		et.add(new Excel_tilte("行政区划代码",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("原路线编码",1,1,3,3));
		et.add(new Excel_tilte("原路线名称",1,1,4,4));
		et.add(new Excel_tilte("原路线起点桩号",1,1,5,5));
		et.add(new Excel_tilte("原路线止点桩号",1,1,6,6));
		et.add(new Excel_tilte("总里程",1,1,7,7));
		et.add(new Excel_tilte("隐患里程",1,1,8,8));
		et.add(new Excel_tilte("修建/改建年度",1,1,9,9));
		et.add(new Excel_tilte("方案评估单位",1,1,10,10));
		et.add(new Excel_tilte("方案审查单位",1,1,11,11));
		et.add(new Excel_tilte("方案审批时间",1,1,12,12));
		et.add(new Excel_tilte("审批文号",1,1,13,13));
		et.add(new Excel_tilte("投资估算（万元）",1,1,14,14));
		et.add(new Excel_tilte("建设性质",1,1,15,15));
		et.add(new Excel_tilte("建设内容",1,1,16,16));
		et.add(new Excel_tilte("项目年份",1,1,17,17));
		et.add(new Excel_tilte("备注",1,1,18,18));
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dcaqsmfhsckshExcel(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			xmkaqsmfh.setGydw("and sc.gydwdm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			xmkaqsmfh.setGydw("and sc.gydwdm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			xmkaqsmfh.setXzqhdm("and sc.xzqhdm like '%"+xzqhs+"%'");
		}else{
			xmkaqsmfh.setXzqhdm("and sc.xzqhdm in ("+xzqhs+")");
		}
		if(xmkaqsmfh.getTsdq().length()>0){
			String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
			xmkaqsmfh.setTsdq(tsdq);
		}
		if(xmkaqsmfh.getGldj().length()>0){
			String[] tsdqs=xmkaqsmfh.getGldj().split(",");
			String tsdq="and substr(sc.lxbm,0,1) in (";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="'"+tsdqs[i]+"'";
				else
					tsdq+=",'"+tsdqs[i]+"'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			xmkaqsmfh.setGldj(tsdq);
		}
		if(xmkaqsmfh.getJsdj().length()>0){
			String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
			String tsdq="and substr(jsdj,0,1) in (";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
				else
					tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			xmkaqsmfh.setJsdj(tsdq);
		}
		List<Excel_list> l = xmkaqsmfhServer.dcaqsmfhsckshExcel(xmkaqsmfh);

		int k=1;
		for (Excel_list e : l) {
			if("1".equals(e.getV_50())) {
				e.setV_0(""+k);k++;
			}
		}
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路安全生命防护工程审查项目");//设置第一行
		eldata.setSheetName("安防");//设置sheeet名
		eldata.setFileName("公路安全生命防护工程审查项目");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号 ",1,1,0,0));
		et.add(new Excel_tilte("行政区划代码",1,1,1,1));
		et.add(new Excel_tilte("行政区划",1,1,2,2));
		et.add(new Excel_tilte("原路线编码",1,1,3,3));
		et.add(new Excel_tilte("原路线名称",1,1,4,4));
		et.add(new Excel_tilte("原路线起点桩号",1,1,5,5));
		et.add(new Excel_tilte("原路线止点桩号",1,1,6,6));
		et.add(new Excel_tilte("总里程",1,1,7,7));
		et.add(new Excel_tilte("隐患里程",1,1,8,8));
		et.add(new Excel_tilte("修建/改建年度",1,1,9,9));
		et.add(new Excel_tilte("方案评估单位",1,1,10,10));
		et.add(new Excel_tilte("方案审查单位",1,1,11,11));
		et.add(new Excel_tilte("方案审批时间",1,1,12,12));
		et.add(new Excel_tilte("审批文号",1,1,13,13));
		et.add(new Excel_tilte("投资估算（万元）",1,1,14,14));
		et.add(new Excel_tilte("建设性质",1,1,15,15));
		et.add(new Excel_tilte("建设内容",1,1,16,16));
		et.add(new Excel_tilte("项目年份",1,1,17,17));
		et.add(new Excel_tilte("备注",1,1,18,18));
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void sfcfbntj(){
		xmkaqsmfh.setBz(xmkaqsmfhServer.sfcfbntj(xmkaqsmfh));
		
		try {
			JsonUtils.write(xmkaqsmfh, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//shm 路网项目----基础库管理---安全生命防护--导出excel
	public void xmkaqsmfhDoExcel(){
		try {
			if(xmkaqsmfh.getUnitcode().indexOf(",")==-1){
				if(xmkaqsmfh.getUnitcode().length()==9)
					xmkaqsmfh.setUnitcode("and (unitcode='"+xmkaqsmfh.getUnitcode()+"'||'00' or unitcode in(select id from xtgl_department where parent='"+xmkaqsmfh.getUnitcode()+"'||'00'))");					else
						xmkaqsmfh.setUnitcode("and unitcode like '%'||substr('"+xmkaqsmfh.getUnitcode()+"',0,4)||'_'||substr('"+xmkaqsmfh.getUnitcode()+"',6)||'%'");
			}else{
				xmkaqsmfh.setUnitcode("and unitcode in ("+xmkaqsmfh.getUnitcode()+")");
			}
			if(xmkaqsmfh.getDistcode().indexOf(",")==-1){
				xmkaqsmfh.setDistcode("and distcode like '%"+xmkaqsmfh.getDistcode()+"%'");
			}else{
				xmkaqsmfh.setDistcode("and distcode in ("+xmkaqsmfh.getDistcode()+")");
			}
			//xmkaqsmfh.setPage(page);
			//xmkaqsmfh.setRows(rows);
			if(xmkaqsmfh.getTsdq().length()>0){
				String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
				xmkaqsmfh.setTsdq(tsdq);
			}
			if(xmkaqsmfh.getGldj().length()>0){
				String[] tsdqs=xmkaqsmfh.getGldj().split(",");
				String tsdq="and substr(roadcode,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setGldj(tsdq);
			}
			if(xmkaqsmfh.getJsdj().length()>0){
				String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				xmkaqsmfh.setJsdj(tsdq);
			}
			
			List<Excel_list> l = xmkaqsmfhServer.xmkaqsmfhDoExcel(xmkaqsmfh);
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("安全生命防护工程");//设置第一行
			eldata.setSheetName("安防");//设置sheeet名
			eldata.setFileName("安全生命防护工程");//设置文件名
			eldata.setEl(l);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号 ",1,2,0,0));
			et.add(new Excel_tilte("省",1,2,1,1));
			et.add(new Excel_tilte("市",1,2,2,2));
			et.add(new Excel_tilte("县",1,2,3,3));
			et.add(new Excel_tilte("原路线编码",1,2,4,4));
			et.add(new Excel_tilte("原路线名称",1,2,5,5));
			et.add(new Excel_tilte("原路线起点桩号",1,2,6,6));
			et.add(new Excel_tilte("原路线止点桩号",1,2,7,7));
			et.add(new Excel_tilte("技术等级",1,2,8,8));
			et.add(new Excel_tilte("方向",1,2,9,9));
			et.add(new Excel_tilte("隐患里程",1,2,10,10));
			et.add(new Excel_tilte("排查时间",1,2,11,11));
			et.add(new Excel_tilte("路段分类",1,2,12,12));
			et.add(new Excel_tilte("交通事故排查方法",1,2,13,13));
			et.add(new Excel_tilte("交通事故风险等级",1,2,14,14));
			et.add(new Excel_tilte("公路条件排查方法",1,2,15,15));
			et.add(new Excel_tilte("公路风险等级",1,2,16,16));
			et.add(new Excel_tilte("综合指标信息",1,1,17,27));
			et.add(new Excel_tilte("路段既有安全设施信息",1,1,28,31));
			et.add(new Excel_tilte("拟采取的处置措施",1,1,32,38));
			et.add(new Excel_tilte("处置投诉估算",1,2,39,39));
			et.add(new Excel_tilte("计划实施安防工程年份",1,2,40,40));
			et.add(new Excel_tilte("符合事故判别指标",2,2,17,17));
			et.add(new Excel_tilte("单个急弯",2,2,18,18));
			et.add(new Excel_tilte("连续急弯",2,2,19,19));
			et.add(new Excel_tilte("连续下坡",2,2,20,20));
			et.add(new Excel_tilte("陡坡",2,2,21,21));
			et.add(new Excel_tilte("视距不良",2,2,22,22));
			et.add(new Excel_tilte("符合公路路侧判别指标",2,2,23,23));
			et.add(new Excel_tilte("符合公路环境判别指标",2,2,24,24));
			et.add(new Excel_tilte("符合交通量判别指标",2,2,25,25));
			et.add(new Excel_tilte("符合通行校车或班线车判别指标",2,2,26,26));
			et.add(new Excel_tilte("运行车速或路段限速或设计速度",2,2,27,27));
			et.add(new Excel_tilte("护栏",2,2,28,28));
			et.add(new Excel_tilte("标志标线",2,2,29,29));
			et.add(new Excel_tilte("警示和视线诱导设施",2,2,30,30));
			et.add(new Excel_tilte("其他",2,2,31,31));
			et.add(new Excel_tilte("涉及路线参数调整的土建工程",2,2,32,32));
			et.add(new Excel_tilte("边坡、边沟或路域环境整治",2,2,33,33));
			et.add(new Excel_tilte("标志标线处置",2,2,34,34));
			et.add(new Excel_tilte("交叉口综合处置",2,2,35,35));
			et.add(new Excel_tilte("加装护栏",2,2,36,36));
			et.add(new Excel_tilte("警示诱导设置处置",2,2,37,37));
			et.add(new Excel_tilte("其他",2,2,38,38));
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}

		//wdd 路网项目----基础库审核---安全生命防护--导出excel  start
		public void shaqsmfhDoExcel(){
			try {
				if(xmkaqsmfh.getUnitcode().indexOf(",")==-1){
					if(xmkaqsmfh.getUnitcode().length()==9)
						xmkaqsmfh.setUnitcode("and (unitcode='"+xmkaqsmfh.getUnitcode()+"'||'00' or unitcode in(select id from xtgl_department where parent='"+xmkaqsmfh.getUnitcode()+"'||'00'))");					else
							xmkaqsmfh.setUnitcode("and unitcode like '%'||substr('"+xmkaqsmfh.getUnitcode()+"',0,4)||'_'||substr('"+xmkaqsmfh.getUnitcode()+"',6)||'%'");
				}else{
					xmkaqsmfh.setUnitcode("and unitcode in ("+xmkaqsmfh.getUnitcode()+")");
				}
				if(xmkaqsmfh.getDistcode().indexOf(",")==-1){
					xmkaqsmfh.setDistcode("and distcode like '%"+xmkaqsmfh.getDistcode()+"%'");
				}else{
					xmkaqsmfh.setDistcode("and distcode in ("+xmkaqsmfh.getDistcode()+")");
				}
				//xmkaqsmfh.setPage(page);
				//xmkaqsmfh.setRows(rows);
				if(xmkaqsmfh.getTsdq().length()>0){
					String[] tsdqs=xmkaqsmfh.getTsdq().split(",");
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
					xmkaqsmfh.setTsdq(tsdq);
				}
				if(xmkaqsmfh.getGldj().length()>0){
					String[] tsdqs=xmkaqsmfh.getGldj().split(",");
					String tsdq="and substr(roadcode,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					xmkaqsmfh.setGldj(tsdq);
				}
				if(xmkaqsmfh.getJsdj().length()>0){
					String[] tsdqs=xmkaqsmfh.getJsdj().split(",");
					String tsdq="and substr(jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i].substring(0, 1)+"'";
						else
							tsdq+=",'"+tsdqs[i].substring(0, 1)+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					xmkaqsmfh.setJsdj(tsdq);
				}
				
				List<Excel_list> l = xmkaqsmfhServer.shaqsmfhDoExcel(xmkaqsmfh);
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("安全生命防护工程");//设置第一行
				eldata.setSheetName("安防");//设置sheeet名
				eldata.setFileName("安全生命防护工程");//设置文件名
				eldata.setEl(l);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号 ",1,2,0,0));
				et.add(new Excel_tilte("省",1,2,1,1));
				et.add(new Excel_tilte("市",1,2,2,2));
				et.add(new Excel_tilte("县",1,2,3,3));
				et.add(new Excel_tilte("规划路线编码",1,2,4,4));
				et.add(new Excel_tilte("规划路线名称",1,2,5,5));
				et.add(new Excel_tilte("规划路线起点桩号",1,2,6,6));
				et.add(new Excel_tilte("规划路线止点桩号",1,2,7,7));
				et.add(new Excel_tilte("原路线编码",1,2,8,8));
				et.add(new Excel_tilte("原路线名称",1,2,9,9));
				et.add(new Excel_tilte("原路线起点桩号",1,2,10,10));
				et.add(new Excel_tilte("原路线止点桩号",1,2,11,11));
				et.add(new Excel_tilte("技术等级",1,2,12,12));
				et.add(new Excel_tilte("方向",1,2,13,13));
				et.add(new Excel_tilte("隐患里程",1,2,14,14));
				et.add(new Excel_tilte("排查时间",1,2,15,15));
				et.add(new Excel_tilte("路段分类",1,2,16,16));
				et.add(new Excel_tilte("交通事故排查方法",1,2,17,17));
				et.add(new Excel_tilte("交通事故风险等级",1,2,18,18));
				et.add(new Excel_tilte("公路条件排查方法",1,2,19,19));
				et.add(new Excel_tilte("公路风险等级",1,2,20,20));
				et.add(new Excel_tilte("综合指标信息",1,1,21,31));
				et.add(new Excel_tilte("路段既有安全设施信息",1,1,32,35));
				et.add(new Excel_tilte("拟采取的处置措施",1,1,36,42));
				et.add(new Excel_tilte("处置投诉估算",1,2,43,43));
				et.add(new Excel_tilte("计划实施安防工程年份",1,2,44,44));
				et.add(new Excel_tilte("符合事故判别指标",2,2,21,21));
				et.add(new Excel_tilte("单个急弯",2,2,22,22));
				et.add(new Excel_tilte("连续急弯",2,2,23,23));
				et.add(new Excel_tilte("连续下坡",2,2,24,24));
				et.add(new Excel_tilte("陡坡",2,2,25,25));
				et.add(new Excel_tilte("视距不良",2,2,26,26));
				et.add(new Excel_tilte("符合公路路侧判别指标",2,2,27,27));
				et.add(new Excel_tilte("符合公路环境判别指标",2,2,28,28));
				et.add(new Excel_tilte("符合交通量判别指标",2,2,29,29));
				et.add(new Excel_tilte("符合通行校车或班线车判别指标",2,2,30,30));
				et.add(new Excel_tilte("运行车速或路段限速或设计速度",2,2,31,31));
				et.add(new Excel_tilte("护栏",2,2,32,32));
				et.add(new Excel_tilte("标志标线",2,2,33,33));
				et.add(new Excel_tilte("警示和视线诱导设施",2,2,34,34));
				et.add(new Excel_tilte("其他",2,2,35,35));
				et.add(new Excel_tilte("涉及路线参数调整的土建工程",2,2,36,36));
				et.add(new Excel_tilte("边坡、边沟或路域环境整治",2,2,37,37));
				et.add(new Excel_tilte("标志标线处置",2,2,38,38));
				et.add(new Excel_tilte("交叉口综合处置",2,2,39,39));
				et.add(new Excel_tilte("加装护栏",2,2,40,40));
				et.add(new Excel_tilte("警示诱导设置处置",2,2,41,41));
				et.add(new Excel_tilte("其他",2,2,42,42));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
					Excel_export.excel_export(eldata,response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}	//wdd 路网项目----基础库审核---安全生命防护--导出excel  end
}