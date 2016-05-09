package com.hdsx.jxzhpt.gcxmybb.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import org.apache.poi.hssf.util.HSSFCellUtil;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.gcxmybb.bean.Xmbb;
import com.hdsx.jxzhpt.gcxmybb.server.GcybbServer;
import com.hdsx.jxzhpt.gcxmybb.server.XmbbServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 进展报表Controller层
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class XmbbController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "xmbbServerImpl")
	private XmbbServer xmbbServer;
	private Xmbb xmbb=new Xmbb();
	private String xzqh;
	private String flag;
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
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
	public Xmbb getXmbb() {
		return xmbb;
	}
	public void setXmbb(Xmbb xmbb) {
		this.xmbb = xmbb;
	}
	public void setjhxdnf(){
		Calendar a=Calendar.getInstance();
		int nian=a.get(Calendar.YEAR);
		String json="";
		String json1="[";
		for (int i = nian; i >= 2010; i--) {
			if(i==nian){
				json=json+"{id:"+i+",text:"+i+"年,iconCls:'icon-none',checked:'true'},";
			}
			else{
				if(i!=2010)
					json=json+"{id:"+i+",text:"+i+"年,iconCls:'icon-none'},";
				else json=json+"{id:"+i+",text:"+i+"年,iconCls:'icon-none'}";
			} 
		}
		try {
			JsonUtils.write(json1+json+"]", getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void setjhxdnf1(){
		Calendar a=Calendar.getInstance();
		int nian=a.get(Calendar.YEAR);
		String json="";
		String json1="[";
		for (int i = nian+5; i >= 2011; i--) {
			if(i==nian)
				json=json+"{id:"+i+",text:"+i+"年,iconCls:'icon-none',checked:'true'},";
			else 
				json=json+"{id:"+i+",text:"+i+"年,iconCls:'icon-none'},";
		}
		try {
			JsonUtils.write(json1+json+"]", getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void settsdq(){
		List<TreeNode> list=xmbbServer.gettsdq(xzqh.replaceAll("0*$",""));
		int i=1;
		for (TreeNode treeNode : list) {
			treeNode.setId(i+"");
			treeNode.setIconCls("icon-none");
			i++;
		}
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void setjhxdwh(){
		try {
			String tablename="";
			if("gsd".equals(xzqh))
				tablename="and (xmid like '__________1___' or xmid like '__________2___' or xmid like '__________3___')";
			if("yh".equals(xzqh))
				tablename="and (xmid like '__________4___')";
			if("sh".equals(xzqh))
				tablename="and (xmid like '__________5___')";
			List<TreeNode> list=xmbbServer.setjhxdwh(tablename);
			int i=1;
			for (TreeNode treeNode : list) {
				treeNode.setId(i+"");
				treeNode.setIconCls("icon-none");
				i++;
			}
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void settsdq1(){
		List<TreeNode> list=xmbbServer.gettsdq(xzqh.replaceAll("0*$",""));
		int i=1;
		List<TreeNode> list2=new ArrayList<TreeNode>();
		TreeNode t= new TreeNode();
		t.setId("");
		t.setText("全部");
		list2.add(t);
		list2.addAll(list);
		for (TreeNode treeNode : list2) {
			treeNode.setId(i+"");
			treeNode.setIconCls("icon-none");
			i++;
		}
		try {
			JsonUtils.write(list2, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void getPtgxbb(){
		String tiaojian1="";
		String tiaojian2="";
		String xzqhdm = "";
		String gydwdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = xmbb.getGydw();
		xzqhdm	= xmbb.getXzqh();
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		xmbb.setGydw(tiaojian1);
		xmbb.setXzqh(tiaojian2);
		if(xmbb.getJhxdnf().equals("")){
			xmbb.setJhxdnf(Calendar.getInstance().get(Calendar.YEAR)+"");
		}
		try{
		List<Excel_list> l=new ArrayList<Excel_list>();
		List<Excel_list> l1=xmbbServer.getptgxlist1(xmbb);
		List<Excel_list> l2=xmbbServer.getptgxlist2(xmbb);
		List<Excel_list> l3=xmbbServer.getptgxlist3(xmbb);
		List<Excel_list> l4=xmbbServer.getptgxlist4(xmbb);
		int t2=0;
		int i1=0,i2=0;
		int j1=0,j2=0;
		int k1=0;
		for(int t=0;t<l1.size();t++){
			if(t==0) l.add(l1.get(t));
			t2=t2+Integer.parseInt((l1.get(t).getXmgs()));
			//if() break;
				for(int i=i1;i<l2.size();i++){
					i1++;
					i2=i2+Integer.parseInt((l2.get(i).getXmgs()));
					l.add(l2.get(i));
					
						for(int j=j1;j<l3.size();j++){
							j1++;
							j2=j2+Integer.parseInt((l3.get(j).getXmgs()));
							l.add(l3.get(j));
							
								for(int k=0; k< Integer.parseInt((l3.get(j).getXmgs()));k++){
									
									l.add(l4.get(k1));
									k1++;
								}
								if(i2==j2) break;
						}
						if(t2==i2) break;
				}
		
		}
		
		if("flag".equals(flag)){
			List<Excel_list> elist=new ArrayList<Excel_list>();
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("普通干线公路建设项目进展情况表");//设置第一行
			eldata.setSheetName("项目进展情况表");//设置sheeet名
			eldata.setFileName("普通干线公路建设项目进展情况表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("项目名称",1,1,1,1));
			et.add(new Excel_tilte("所在地市",1,1,2,2));
			et.add(new Excel_tilte("特殊区域",1,1,3,3));
			et.add(new Excel_tilte("计划年度",1,1,4,4));
			et.add(new Excel_tilte("起点桩号",1,1,5,5));
			et.add(new Excel_tilte("讫点桩号",1,1,6,6));
			et.add(new Excel_tilte("计划里程（里程）",1,1,7,7));
			et.add(new Excel_tilte("概算总投资(万元)",1,1,8,8));
			et.add(new Excel_tilte("计划下达资金(万元)",1,1,9,9));
			et.add(new Excel_tilte("本年拨付资金（万元）",1,1,10,10));
			et.add(new Excel_tilte("已拨付资金（万元）",1,1,11,11));
			et.add(new Excel_tilte("未拨付资金（万元）",1,1,12,12));
			et.add(new Excel_tilte("建设状态",1,1,13,13));
			et.add(new Excel_tilte("垫层（m³）",1,1,14,14));
			et.add(new Excel_tilte("基层（m³）",1,1,15,15));
			et.add(new Excel_tilte("完工里程（公里）",1,1,16,16));
			et.add(new Excel_tilte("未开工里程(公里)",1,1,17,17));
			et.add(new Excel_tilte("开工日期",1,1,18,18));
			et.add(new Excel_tilte("全线开工",1,1,19,19));
			et.add(new Excel_tilte("开工段落",1,1,20,20));
			et.add(new Excel_tilte("完工日期",1,1,21,21));
			et.add(new Excel_tilte("预计完工时间",1,1,22,22));
			et.add(new Excel_tilte("情况说明",1,1,23,23));
			et.add(new Excel_tilte("计划下达文号",1,1,24,24));
			et.add(new Excel_tilte("相关处室意见",1,1,25,25));
			et.add(new Excel_tilte("财审处意见",1,1,26,26));

			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_exportptgx(eldata,response);

		}else{
			JsonUtils.write(l, getresponse().getWriter());
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getYhbb(){
		String tiaojian1="";
		String tiaojian2="";
		String gydwdm = "";
		String xzqhdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = xmbb.getGydw();
		xzqhdm	= xmbb.getXzqh();
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		xmbb.setGydw(tiaojian1);
		xmbb.setXzqh(tiaojian2);
		if(xmbb.getJhxdnf().equals("")){
			xmbb.setJhxdnf(Calendar.getInstance().get(Calendar.YEAR)+"");
		}
		List<Excel_list> list1=xmbbServer.getyhbblist1(xmbb);
		List<Excel_list> list2=xmbbServer.getyhbblist2(xmbb);
		List<Excel_list> list3=xmbbServer.getyhbblist3(xmbb);
		List<Excel_list> list4=xmbbServer.getyhbblist4(xmbb);

		try {
			if(list2.size()>0)
			for (int i = 0; i < list2.size(); i++) {
				list1.add(list2.get(i));
				if(list3.size()>0)
				for (int j = 0; j < list3.size(); j++) {
					if(list2.get(i).getXzqhdm().equals(list3.get(j).getXzqhdm())){
						list1.add(list3.get(j));
						if(list4.size()>0)
						for (int k = 0; k < list4.size(); k++) {
							if(list2.get(i).getXzqhdm().equals(list4.get(k).getXzqhdm())&&list3.get(j).getXzqhmc().equals(list4.get(k).getDllx()))
								list1.add(list4.get(k));
						}
					}
				}
			}
			if("flag".equals(flag)){
				List<Excel_list> elist=new ArrayList<Excel_list>();
				
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("省统筹养护大中修工程项目进展情况表");//设置第一行 
				eldata.setSheetName("项目进展情况表");//设置sheeet名
				eldata.setFileName("省统筹养护大中修工程项目进展情况表");//设置文件名
				eldata.setEl(elist);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,2,0,0));
				et.add(new Excel_tilte("所在地市",1,2,1,1));
				et.add(new Excel_tilte("特殊区域",1,2,2,2));
				et.add(new Excel_tilte("项目名称",1,2,3,3));
				et.add(new Excel_tilte("工程分类",1,2,4,4));
				et.add(new Excel_tilte("计划下达年度",1,2,5,5));
				et.add(new Excel_tilte("项目段落",1,1,6,7));
				et.add(new Excel_tilte("计划里程（公里）",1,2,8,8));
				et.add(new Excel_tilte("概算总投资(万元)",1,2,9,9));
				et.add(new Excel_tilte("计划下达资金(万元)",1,2,10,10));	
				et.add(new Excel_tilte("本年拨付资金（万元）",1,2,11,11));
				et.add(new Excel_tilte("累计拨付资金（万元）",1,2,12,12));
				et.add(new Excel_tilte("未拨付资金（万元）",1,2,13,13));
				et.add(new Excel_tilte("建设状态",1,2,14,14));
				et.add(new Excel_tilte("垫层（m³）",1,2,15,15));
				et.add(new Excel_tilte("基层（m³）",1,2,16,16));
				et.add(new Excel_tilte("开工日期",1,2,17,17));
				et.add(new Excel_tilte("完工日期",1,2,18,18));
				et.add(new Excel_tilte("开工段落",1,2,19,19));
				et.add(new Excel_tilte("完工里程（公里）",1,2,20,20));
				et.add(new Excel_tilte("情况说明",1,2,21,21));
				et.add(new Excel_tilte("计划下达文号",1,2,22,22));
				et.add(new Excel_tilte("相关处室意见",1,2,23,23));
				et.add(new Excel_tilte("财审处意见",1,2,24,24));
				et.add(new Excel_tilte("起点桩号",2,2,6,6));
				et.add(new Excel_tilte("迄点桩号 ",2,2,7,7));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
					Excel_export.excel_export2(eldata,response);

			}else{
				if(list1.size()==1){
					JsonUtils.write(null, getresponse().getWriter());
				}else
				JsonUtils.write(list1, getresponse().getWriter());
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void getLwbb(){
		String tiaojian1="";
		String tiaojian2="";
		String gydwdm = "";
		String xzqhdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = xmbb.getGydw();
		xzqhdm	= xmbb.getXzqh();
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}

		xmbb.setGydw(tiaojian1);
		xmbb.setXzqh(tiaojian2);
		if(xmbb.getJhxdnf().equals("")){
			xmbb.setJhxdnf(Calendar.getInstance().get(Calendar.YEAR)+"");
		}
		try {
			List<Excel_list> list=new ArrayList<Excel_list>();
			List<Excel_list> list1=xmbbServer.getlwbblist1(xmbb);
			List<Excel_list> list2=xmbbServer.getlwbblist2(xmbb);
			if(list1.size()>0)
			for (Excel_list map : list1) {
				list.add(map);
				int i=1;
				if(list2.size()>0)
				for (Excel_list map1 : list2) {
					
					if(map.getXmlx().equals(map1.getXmlx())){
						map1.setV_0(i+"");
						i++;
						list.add(map1);
					}
				}
			}
			if("flag".equals(flag)){
				List<Excel_list> elist=new ArrayList<Excel_list>();
				
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("路网结构改造工程项目进展情况表");//设置第一行 
				eldata.setSheetName("项目进展情况表");//设置sheeet名
				eldata.setFileName("路网结构改造工程项目进展情况表");//设置文件名
				eldata.setEl(elist);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,2,0,0));
				et.add(new Excel_tilte("所在地市",1,2,1,1));
				et.add(new Excel_tilte("特殊区域",1,2,2,2));
				et.add(new Excel_tilte("项目名称",1,2,3,3));
				et.add(new Excel_tilte("建设性质",1,2,4,4));
				et.add(new Excel_tilte("项目段落",1,1,5,7));
				et.add(new Excel_tilte("计划下达年度",1,2,8,8));
				et.add(new Excel_tilte("计划下达资金(万元)",1,2,9,9));
				et.add(new Excel_tilte("概预算(万元)",1,2,10,10));
				et.add(new Excel_tilte("本年拨付资金（万元）",1,2,11,11));
				et.add(new Excel_tilte("累计拨付资金（万元）",1,2,12,12));
				et.add(new Excel_tilte("未拨付资金（万元）",1,2,13,13));
				et.add(new Excel_tilte("建设状态",1,2,14,14));
				et.add(new Excel_tilte("完工桥长或隐患里程",1,2,15,15));
				et.add(new Excel_tilte("开工日期",1,2,16,16));
				et.add(new Excel_tilte("完工日期",1,2,17,17));
				et.add(new Excel_tilte("预计完工时间",1,2,18,18));
				et.add(new Excel_tilte("情况说明",1,2,19,19));
				et.add(new Excel_tilte("计划下达文号",1,2,20,20));
				et.add(new Excel_tilte("相关处室意见",1,2,21,21));
				et.add(new Excel_tilte("财审处意见",1,2,22,22));
				et.add(new Excel_tilte("起点桩号或中心桩号",2,2,5,5));
				et.add(new Excel_tilte("迄点桩号 ",2,2,6,6));
				et.add(new Excel_tilte("桥长或隐患里程（延米）",2,2,7,7));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse 
					Excel_export.excel_export3(eldata,response);

			}else{
				if(list.size()==1){
					JsonUtils.write(null, getresponse().getWriter());
				}else
				JsonUtils.write(list, getresponse().getWriter());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	public void getPtgxtz(){
		
		try{
		List<Excel_list> l=xmbbServer.getPtgxtz(xmbb);
		
		
		if("flag".equals(flag)){
			List<Excel_list> elist=new ArrayList<Excel_list>();
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("普通干线公路建设项目进展情况表");//设置第一行
			eldata.setSheetName("项目进展情况表");//设置sheeet名
			eldata.setFileName("普通干线公路建设项目进展情况表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("项目名称",1,1,1,1));
			et.add(new Excel_tilte("所在地市",1,1,2,2));
			et.add(new Excel_tilte("特殊区域",1,1,3,3));
			et.add(new Excel_tilte("计划年度",1,1,4,4));
			et.add(new Excel_tilte("起点桩号",1,1,5,5));
			et.add(new Excel_tilte("讫点桩号",1,1,6,6));
			et.add(new Excel_tilte("计划里程（里程）",1,1,7,7));
			et.add(new Excel_tilte("概算总投资(万元)",1,1,8,8));
			et.add(new Excel_tilte("计划下达资金(万元)",1,1,9,9));
			et.add(new Excel_tilte("本年拨付资金（万元）",1,1,10,10));
			et.add(new Excel_tilte("已拨付资金（万元）",1,1,11,11));
			et.add(new Excel_tilte("未拨付资金（万元）",1,1,12,12));
			et.add(new Excel_tilte("建设状态",1,1,13,13));
			et.add(new Excel_tilte("垫层（m³）",1,1,14,14));
			et.add(new Excel_tilte("基层（m³）",1,1,15,15));
			et.add(new Excel_tilte("完工里程（公里）",1,1,16,16));
			et.add(new Excel_tilte("未开工里程(公里)",1,1,17,17));
			et.add(new Excel_tilte("开工日期",1,1,18,18));
			et.add(new Excel_tilte("全线开工",1,1,19,19));
			et.add(new Excel_tilte("开工段落",1,1,20,20));
			et.add(new Excel_tilte("完工日期",1,1,21,21));
			et.add(new Excel_tilte("预计完工时间",1,1,22,22));
			et.add(new Excel_tilte("情况说明",1,1,23,23));
			et.add(new Excel_tilte("计划下达文号",1,1,24,24));
			et.add(new Excel_tilte("相关处室意见",1,1,25,25));
			et.add(new Excel_tilte("财审处意见",1,1,26,26));

			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_exportptgx(eldata,response);

		}else{
			JsonUtils.write(l, getresponse().getWriter());
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
