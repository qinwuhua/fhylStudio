package com.hdsx.jxzhpt.lwxm.xmjck.controller;


import java.io.IOException;
import java.util.ArrayList;
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
import com.hdsx.jxzhpt.lwxm.xmjck.server.XmkaqsmfhServer;
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
	
	public void dcaqsmfhsckExcel(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			xmkaqsmfh.setGydw("and ld.gydwdm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			xmkaqsmfh.setGydw("and ld.gydwdm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			xmkaqsmfh.setXzqhdm("and xzqhdm like '%"+xzqhs+"%'");
		}else{
			xmkaqsmfh.setXzqhdm("and xzqhdm in ("+xzqhs+")");
		}
		
		List<Excel_list> l = xmkaqsmfhServer.dcaqsmfhsckExcel(xmkaqsmfh);

		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路安全生命防护工程审查项目");//设置第一行
		eldata.setSheetName("安防");//设置sheeet名
		eldata.setFileName("公路安全生命防护工程审查项目");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号 ",1,2,0,0));
		et.add(new Excel_tilte("省",1,2,1,1));
		et.add(new Excel_tilte("市",1,2,2,2));
		et.add(new Excel_tilte("县",1,2,3,3));
		et.add(new Excel_tilte("公路编码",1,2,4,4));
		et.add(new Excel_tilte("管养单位",1,2,5,5));
		et.add(new Excel_tilte("行政区划代码",1,2,6,6));
		et.add(new Excel_tilte("路线名称",1,2,7,7));
		et.add(new Excel_tilte("技术等级",1,1,8,8));
		et.add(new Excel_tilte("起点桩号",1,2,9,9));
		et.add(new Excel_tilte("止点桩号",1,2,10,10));
		et.add(new Excel_tilte("隐患里程",1,1,11,11));
		et.add(new Excel_tilte("处置总里程",1,1,12,12));
		et.add(new Excel_tilte("修建/改建年度",1,2,13,13));
		et.add(new Excel_tilte("方案评估单位",1,2,14,14));
		et.add(new Excel_tilte("方案审查单位",1,2,15,15));
		et.add(new Excel_tilte("方案审批时间",1,1,16,16));
		et.add(new Excel_tilte("审批文号",1,2,17,17));
		et.add(new Excel_tilte("处置投资估算",1,1,18,18));
		et.add(new Excel_tilte("是否申请按比例补助",1,1,19,19));
		et.add(new Excel_tilte("按比例补助申请文号",1,2,20,20));
		et.add(new Excel_tilte("建设内容",1,1,21,21));
		et.add(new Excel_tilte("建设性质",1,1,22,22));
		et.add(new Excel_tilte("备注",1,1,23,23));
		et.add(new Excel_tilte("1、一级 2、二级 3、三级 4、四级",2,2,8,8));
		et.add(new Excel_tilte("(KM)",2,2,11,11));
		et.add(new Excel_tilte("(KM)",2,2,12,12));
		et.add(new Excel_tilte("（年/月/日）",2,2,16,16));
		et.add(new Excel_tilte("（万元）",2,2,18,18));
		et.add(new Excel_tilte("0、否 1、是",2,2,19,19));
		et.add(new Excel_tilte("1、中修 2、大修",2,2,21,21));
		et.add(new Excel_tilte("标志标线处置？米，交叉口综合处置？处，加装护栏警示诱导设施处置？米，涉及路线参数调整的土建工程？处？立方米；边坡、边沟或路域环境整治？处？立方米",2,2,22,22));
		et.add(new Excel_tilte("批复文件路线编码及桩号如为老编码，需在备注栏说明",2,2,23,23));
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
			xmkaqsmfh.setGydw("and ld.gydwdm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			xmkaqsmfh.setGydw("and ld.gydwdm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			xmkaqsmfh.setXzqhdm("and xzqhdm like '%"+xzqhs+"%'");
		}else{
			xmkaqsmfh.setXzqhdm("and xzqhdm in ("+xzqhs+")");
		}
		
		List<Excel_list> l = xmkaqsmfhServer.dcaqsmfhsckshExcel(xmkaqsmfh);

		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路安全生命防护工程审查项目");//设置第一行
		eldata.setSheetName("安防");//设置sheeet名
		eldata.setFileName("公路安全生命防护工程审查项目");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号 ",1,2,0,0));
		et.add(new Excel_tilte("省",1,2,1,1));
		et.add(new Excel_tilte("市",1,2,2,2));
		et.add(new Excel_tilte("县",1,2,3,3));
		et.add(new Excel_tilte("公路编码",1,2,4,4));
		et.add(new Excel_tilte("管养单位",1,2,5,5));
		et.add(new Excel_tilte("行政区划代码",1,2,6,6));
		et.add(new Excel_tilte("路线名称",1,2,7,7));
		et.add(new Excel_tilte("技术等级",1,1,8,8));
		et.add(new Excel_tilte("起点桩号",1,2,9,9));
		et.add(new Excel_tilte("止点桩号",1,2,10,10));
		et.add(new Excel_tilte("隐患里程",1,1,11,11));
		et.add(new Excel_tilte("处置总里程",1,1,12,12));
		et.add(new Excel_tilte("修建/改建年度",1,2,13,13));
		et.add(new Excel_tilte("方案评估单位",1,2,14,14));
		et.add(new Excel_tilte("方案审查单位",1,2,15,15));
		et.add(new Excel_tilte("方案审批时间",1,1,16,16));
		et.add(new Excel_tilte("审批文号",1,2,17,17));
		et.add(new Excel_tilte("处置投资估算",1,1,18,18));
		et.add(new Excel_tilte("是否申请按比例补助",1,1,19,19));
		et.add(new Excel_tilte("按比例补助申请文号",1,2,20,20));
		et.add(new Excel_tilte("建设内容",1,1,21,21));
		et.add(new Excel_tilte("建设性质",1,1,22,22));
		et.add(new Excel_tilte("备注",1,1,23,23));
		et.add(new Excel_tilte("1、一级 2、二级 3、三级 4、四级",2,2,8,8));
		et.add(new Excel_tilte("(KM)",2,2,11,11));
		et.add(new Excel_tilte("(KM)",2,2,12,12));
		et.add(new Excel_tilte("（年/月/日）",2,2,16,16));
		et.add(new Excel_tilte("（万元）",2,2,18,18));
		et.add(new Excel_tilte("0、否 1、是",2,2,19,19));
		et.add(new Excel_tilte("1、中修 2、大修",2,2,21,21));
		et.add(new Excel_tilte("标志标线处置？米，交叉口综合处置？处，加装护栏警示诱导设施处置？米，涉及路线参数调整的土建工程？处？立方米；边坡、边沟或路域环境整治？处？立方米",2,2,22,22));
		et.add(new Excel_tilte("批复文件路线编码及桩号如为老编码，需在备注栏说明",2,2,23,23));
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}