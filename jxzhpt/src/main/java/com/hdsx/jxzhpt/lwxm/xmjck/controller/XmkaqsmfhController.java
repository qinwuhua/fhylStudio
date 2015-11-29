package com.hdsx.jxzhpt.lwxm.xmjck.controller;


import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;

import oracle.net.aso.l;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Xmkaqsmfh;
import com.hdsx.jxzhpt.lwxm.xmjck.server.XmkaqsmfhServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;

/**
 * 项目基础库——危桥改造Action层
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
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.insertAqsmfhxmk(xmkaqsmfh)+"");
	}
	//修改生命防护基础库
	public void updateAqsmfhxmk(){
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
		
		ResponseUtils.write(getresponse(), xmkaqsmfhServer.insertAqsmfhsck(xmkaqsmfh)+"");
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
}