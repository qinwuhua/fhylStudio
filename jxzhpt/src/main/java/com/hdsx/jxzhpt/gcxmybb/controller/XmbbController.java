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
 * 系统管理Controller层
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
		for (int i = nian; i >= 2011; i--) {
				json=json+"{id:"+i+",text:"+i+"年,iconCls:'icon-none',checked:'true'},";
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
			tiaojian1="and gydw like '%"+gydwdm+"%'";
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
		List<Map<String,Object>> l=new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> l1=xmbbServer.getptgxlist1(xmbb);
		List<Map<String,Object>> l2=xmbbServer.getptgxlist2(xmbb);
		List<Map<String,Object>> l3=xmbbServer.getptgxlist3(xmbb);
		List<Map<String,Object>> l4=xmbbServer.getptgxlist4(xmbb);
		int t2=0;
		int i1=0,i2=0;
		int j1=0,j2=0;
		int k1=0;
		for(int t=0;t<l1.size();t++){
			l.add(l1.get(t));
			t2=t2+Integer.parseInt((l1.get(t).get("XMGS").toString()));
			//if() break;
				for(int i=i1;i<l2.size();i++){
					i1++;
					i2=i2+Integer.parseInt((l2.get(i).get("XMGS").toString()));
					l.add(l2.get(i));
					
						for(int j=j1;j<l3.size();j++){
							j1++;
							j2=j2+Integer.parseInt((l3.get(j).get("XMGS").toString()));
							l.add(l3.get(j));
							
								for(int k=0; k< Integer.parseInt((l3.get(j).get("XMGS").toString()));k++){
									
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
			for (int i=0;i<l.size();i++) {
				try{if(Integer.parseInt(l.get(i).get("SL").toString())>1){
					int j=Integer.parseInt(l.get(i).get("SL").toString());
					int ybf=0;
					int wbf=0;
					int sum=0;
					for(int k=0;k<j;k++){
						if(Integer.parseInt(l.get(i).get("BFZJ").toString())-sum>0 && Integer.parseInt(l.get(i).get("BFZJ").toString())-sum>=Integer.parseInt(l.get(i+k).get("JHXDZJ").toString())){
							ybf=Integer.parseInt(l.get(i+k).get("JHXDZJ").toString());
							wbf=0;
							sum=sum+Integer.parseInt(l.get(i+k).get("JHXDZJ").toString());
						}else if(Integer.parseInt(l.get(i).get("BFZJ").toString())-sum>0 && Integer.parseInt(l.get(i).get("BFZJ").toString())-sum<Integer.parseInt(l.get(i+k).get("JHXDZJ").toString())){
							ybf=Integer.parseInt(l.get(i).get("BFZJ").toString())-sum;
							wbf=Integer.parseInt(l.get(i+k).get("JHXDZJ").toString())-(Integer.parseInt(l.get(i).get("BFZJ").toString())-sum);
							sum=sum+Integer.parseInt(l.get(i+k).get("JHXDZJ").toString());
						}else{
							ybf=0;
							wbf=Integer.parseInt(l.get(i+k).get("JHXDZJ").toString());
							sum=sum+Integer.parseInt(l.get(i+k).get("JHXDZJ").toString());
						}
						 if(k==0){
							 Excel_list ll=new Excel_list();
							 try {ll.setV_0(l.get(i).get("XH").toString());} catch (Exception e) {ll.setV_0("");} 
							 try {ll.setV_1(l.get(i).get("XMMC").toString());} catch (Exception e) {ll.setV_1("");} 
							 try {ll.setV_2(l.get(i).get("XZQHMC").toString());} catch (Exception e) {ll.setV_2("");} 
							 try {ll.setV_3(l.get(i).get("TSDQ").toString());} catch (Exception e) {ll.setV_3("");} 
							 try {ll.setV_4(l.get(i).get("XDNF").toString());} catch (Exception e) {ll.setV_4("");} 
							 try {ll.setV_5(l.get(i).get("QDZH").toString());} catch (Exception e) {ll.setV_5("");} 
							 try {ll.setV_6(l.get(i).get("ZDZH").toString());} catch (Exception e) {ll.setV_6("");} 
							 try {ll.setV_7(l.get(i).get("YHLC").toString());} catch (Exception e) {ll.setV_7("");} 
							 try {ll.setV_8(l.get(i).get("PFZTZ").toString());} catch (Exception e) {ll.setV_8("");} 
							 try {ll.setV_9(l.get(i).get("JHXDZJ").toString());} catch (Exception e) {ll.setV_9("");} 
							 try {ll.setV_10(ybf+"");} catch (Exception e) {ll.setV_10("");} 
							 try {ll.setV_11(wbf+"");} catch (Exception e) {ll.setV_11("");} 
							 try {ll.setV_12(l.get(i).get("JSZT").toString());} catch (Exception e) {ll.setV_12("");} 
							 try {ll.setV_13(l.get(i).get("DC").toString());} catch (Exception e) {ll.setV_13("");} 
							 try {ll.setV_14(l.get(i).get("JC").toString());} catch (Exception e) {ll.setV_14("");} 
							 try {ll.setV_15(l.get(i).get("WGLC").toString());} catch (Exception e) {ll.setV_15("");} 
							 try {ll.setV_16(l.get(i).get("WKGLC").toString());} catch (Exception e) {ll.setV_16("");} 
							 try {ll.setV_17(l.get(i).get("SJKGSJ").toString());} catch (Exception e) {ll.setV_17("");} 
							 try {ll.setV_18(l.get(i).get("SFQXKG").toString());} catch (Exception e) {ll.setV_18("");} 
							 try {ll.setV_19(l.get(i).get("KGDL").toString());} catch (Exception e) {ll.setV_19("");} 
							 try {ll.setV_20(l.get(i).get("SJWGSJ").toString());} catch (Exception e) {ll.setV_20("");} 
							 try {ll.setV_21(l.get(i).get("YJWGSJ").toString());} catch (Exception e) {ll.setV_21("");} 
							 try {ll.setV_22(l.get(i).get("QKSM").toString());} catch (Exception e) {ll.setV_22("");} 
							 try {ll.setV_23(l.get(i).get("XDWH").toString());} catch (Exception e) {ll.setV_23("");} 
							 try {ll.setV_24(l.get(i).get("XGCSYJ").toString());} catch (Exception e) {ll.setV_24("");} 
							 try {ll.setV_25(l.get(i).get("CSCYJ").toString());} catch (Exception e) {ll.setV_25("");} 
							 try {ll.setV_26(l.get(i).get("SL").toString());} catch (Exception e) {ll.setV_25("1");} 
							 elist.add(ll);
						 }else{
							 Excel_list ll=new Excel_list();
							 try {ll.setV_0(l.get(i).get("XH").toString());} catch (Exception e) {ll.setV_0("");} 
							 try {ll.setV_1(l.get(i).get("XMMC").toString());} catch (Exception e) {ll.setV_1("");} 
							 try {ll.setV_2(l.get(i).get("XZQHMC").toString());} catch (Exception e) {ll.setV_2("");} 
							 try {ll.setV_3(l.get(i).get("TSDQ").toString());} catch (Exception e) {ll.setV_3("");} 
							 try {ll.setV_4(l.get(i).get("XDNF").toString());} catch (Exception e) {ll.setV_4("");} 
							 try {ll.setV_5(l.get(i+k).get("QDZH").toString());} catch (Exception e) {ll.setV_5("");} 
							 try {ll.setV_6(l.get(i+k).get("ZDZH").toString());} catch (Exception e) {ll.setV_6("");} 
							 try {ll.setV_7(l.get(i+k).get("YHLC").toString());} catch (Exception e) {ll.setV_7("");} 
							 try {ll.setV_8(l.get(i+k).get("PFZTZ").toString());} catch (Exception e) {ll.setV_8("");} 
							 try {ll.setV_9(l.get(i+k).get("JHXDZJ").toString());} catch (Exception e) {ll.setV_9("");} 
							 try {ll.setV_10(ybf+"");} catch (Exception e) {ll.setV_10("");} 
							 try {ll.setV_11(wbf+"");} catch (Exception e) {ll.setV_11("");} 
							 try {ll.setV_12(l.get(i+k).get("JSZT").toString());} catch (Exception e) {ll.setV_12("");} 
							 try {ll.setV_13(l.get(i+k).get("DC").toString());} catch (Exception e) {ll.setV_13("");} 
							 try {ll.setV_14(l.get(i+k).get("JC").toString());} catch (Exception e) {ll.setV_14("");} 
							 try {ll.setV_15(l.get(i+k).get("WGLC").toString());} catch (Exception e) {ll.setV_15("");} 
							 try {ll.setV_16(l.get(i+k).get("WKGLC").toString());} catch (Exception e) {ll.setV_16("");} 
							 try {ll.setV_17(l.get(i+k).get("SJKGSJ").toString());} catch (Exception e) {ll.setV_17("");} 
							 try {ll.setV_18(l.get(i+k).get("SFQXKG").toString());} catch (Exception e) {ll.setV_18("");} 
							 try {ll.setV_19(l.get(i+k).get("KGDL").toString());} catch (Exception e) {ll.setV_19("");} 
							 try {ll.setV_20(l.get(i+k).get("SJWGSJ").toString());} catch (Exception e) {ll.setV_20("");} 
							 try {ll.setV_21(l.get(i+k).get("YJWGSJ").toString());} catch (Exception e) {ll.setV_21("");} 
							 try {ll.setV_22(l.get(i+k).get("QKSM").toString());} catch (Exception e) {ll.setV_22("");} 
							 try {ll.setV_23(l.get(i+k).get("XDWH").toString());} catch (Exception e) {ll.setV_23("");} 
							 try {ll.setV_24(l.get(i+k).get("XGCSYJ").toString());} catch (Exception e) {ll.setV_24("");} 
							 try {ll.setV_25(l.get(i+k).get("CSCYJ").toString());} catch (Exception e) {ll.setV_25("");} 
							 ll.setV_26("1");
							 elist.add(ll);
						 }
						}
						i=i+j-1;
					}else{
						throw new Exception();
					}
				}catch(Exception e1){
					Excel_list ll=new Excel_list();
					try {ll.setV_0(l.get(i).get("XH").toString());} catch (Exception e) {ll.setV_0("");} 
					 try {ll.setV_1(l.get(i).get("XMMC").toString());} catch (Exception e) {ll.setV_1("");} 
					 try {ll.setV_2(l.get(i).get("XZQHMC").toString());} catch (Exception e) {ll.setV_2("");} 
					 try {ll.setV_3(l.get(i).get("TSDQ").toString());} catch (Exception e) {ll.setV_3("");} 
					 try {ll.setV_4(l.get(i).get("XDNF").toString());} catch (Exception e) {ll.setV_4("");} 
					 try {ll.setV_5(l.get(i).get("QDZH").toString());} catch (Exception e) {ll.setV_5("");} 
					 try {ll.setV_6(l.get(i).get("ZDZH").toString());} catch (Exception e) {ll.setV_6("");} 
					 try {ll.setV_7(l.get(i).get("YHLC").toString());} catch (Exception e) {ll.setV_7("");} 
					 try {ll.setV_8(l.get(i).get("PFZTZ").toString());} catch (Exception e) {ll.setV_8("");} 
					 try {ll.setV_9(l.get(i).get("JHXDZJ").toString());} catch (Exception e) {ll.setV_9("");} 
					 try {ll.setV_10(l.get(i).get("BFZJ").toString());} catch (Exception e) {ll.setV_10("");} 
					 try {ll.setV_11(l.get(i).get("WBFZJ").toString());} catch (Exception e) {ll.setV_11("");} 
					 try {ll.setV_12(l.get(i).get("JSZT").toString());} catch (Exception e) {ll.setV_12("");} 
					 try {ll.setV_13(l.get(i).get("DC").toString());} catch (Exception e) {ll.setV_13("");} 
					 try {ll.setV_14(l.get(i).get("JC").toString());} catch (Exception e) {ll.setV_14("");} 
					 try {ll.setV_15(l.get(i).get("WGLC").toString());} catch (Exception e) {ll.setV_15("");} 
					 try {ll.setV_16(l.get(i).get("WKGLC").toString());} catch (Exception e) {ll.setV_16("");} 
					 try {ll.setV_17(l.get(i).get("SJKGSJ").toString());} catch (Exception e) {ll.setV_17("");} 
					 try {ll.setV_18(l.get(i).get("SFQXKG").toString());} catch (Exception e) {ll.setV_18("");} 
					 try {ll.setV_19(l.get(i).get("KGDL").toString());} catch (Exception e) {ll.setV_19("");} 
					 try {ll.setV_20(l.get(i).get("SJWGSJ").toString());} catch (Exception e) {ll.setV_20("");} 
					 try {ll.setV_21(l.get(i).get("YJWGSJ").toString());} catch (Exception e) {ll.setV_21("");} 
					 try {ll.setV_22(l.get(i).get("QKSM").toString());} catch (Exception e) {ll.setV_22("");} 
					 try {ll.setV_23(l.get(i).get("XDWH").toString());} catch (Exception e) {ll.setV_23("");} 
					 try {ll.setV_24(l.get(i).get("XGCSYJ").toString());} catch (Exception e) {ll.setV_24("");} 
					 try {ll.setV_25(l.get(i).get("CSCYJ").toString());} catch (Exception e) {ll.setV_25("");} 
					 ll.setV_26("1");
					 elist.add(ll);
				}
			}
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
			et.add(new Excel_tilte("已拨付资金（万元）",1,1,10,10));
			et.add(new Excel_tilte("未拨付资金（万元）",1,1,11,11));
			et.add(new Excel_tilte("建设状态",1,1,12,12));
			et.add(new Excel_tilte("垫层（m³）",1,1,13,13));
			et.add(new Excel_tilte("基层（m³）",1,1,14,14));
			et.add(new Excel_tilte("完工里程（公里）",1,1,15,15));
			et.add(new Excel_tilte("未开工里程(公里)",1,1,16,16));
			et.add(new Excel_tilte("开工日期",1,1,17,17));
			et.add(new Excel_tilte("全线开工",1,1,18,18));
			et.add(new Excel_tilte("开工段落",1,1,19,19));
			et.add(new Excel_tilte("完工日期",1,1,20,20));
			et.add(new Excel_tilte("预计完工时间",1,1,21,21));
			et.add(new Excel_tilte("情况说明",1,1,22,22));
			et.add(new Excel_tilte("计划下达文号",1,1,23,23));
			et.add(new Excel_tilte("相关处室意见",1,1,24,24));
			et.add(new Excel_tilte("财审处意见",1,1,25,25));

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
	public void exportPtgx(){
		List<Excel_list> exl = new ArrayList<Excel_list>();
		
		List<Excel_list> exl1 = new ArrayList<Excel_list>();
		xmbb.setGydw(xmbb.getGydw().replaceAll("0*$",""));
		xmbb.setXzqh(xmbb.getXzqh().replaceAll("0*$",""));
		if(xmbb.getJhxdnf().equals("")){
			xmbb.setJhxdnf(Calendar.getInstance().get(Calendar.YEAR)+"");
		}
		if("未开工".equals(xmbb.getJszt())){
			xmbb.setKgzt("0");
			xmbb.setJgzt("");
		}
		if("在建".equals(xmbb.getJszt())){
			xmbb.setKgzt("1");
			xmbb.setJgzt("0");
		}
		if("竣工".equals(xmbb.getJszt())){
			xmbb.setKgzt("");
			xmbb.setJgzt("1");
		}
		//先查询行政区划
		List<Map<String, Object>> lsit1=xmbbServer.getptgxXzqh1(xmbb);
		List<Map<String, Object>> lsit2=xmbbServer.getptgxXzqh2(xmbb);
		Excel_list e1=xmbbServer.selectEx1(xmbb);
		if(e1!=null){
			e1.setV_0("(一)");
			e1.setV_1("路面改造");
			e1.setV_11("0");
			exl1.add(e1);
		}
		if(lsit1.size()>0)
		for (Map<String, Object> map : lsit1) {
			xmbb.setXzqh(map.get("XZQHDM").toString());
			Excel_list e2=xmbbServer.selectEx1(xmbb);
			if(e2!=null){
				e2.setV_1(map.get("XZQHMC").toString()+"小计");
				exl1.add(e2);
			}
			List<Excel_list> elist1=xmbbServer.selectelist1(xmbb);
			if(elist1.size()>0)
				exl1.addAll(elist1);
		}
		Excel_list e2=xmbbServer.selectEx2(xmbb);
		if(e2!=null){
			e2.setV_0("(二)");
			e2.setV_1("路面升级");
			e2.setV_11("0");
			exl1.add(e2);
		}
		if(lsit2.size()>0)
		for (Map<String, Object> map : lsit2) {
			xmbb.setXzqh(map.get("XZQHDM").toString());
			Excel_list e3=xmbbServer.selectEx2(xmbb);
			if(e3!=null){
				e3.setV_1(map.get("XZQHMC").toString()+"小计");
				exl1.add(e3);
			}
			List<Excel_list> elist1=xmbbServer.selectelist2(xmbb);
			if(elist1.size()>0)
				exl1.addAll(elist1);
		}
		try {
			if (e1 != null || e2 != null) {
				Excel_list e4 = new Excel_list();
				e4.setV_0("一");
				e4.setV_1("普通国省道改造建设项目");
				if(e1!=null){
					if (e1.getV_9() == "")
						e1.setV_9("0");
					if (e1.getV_10() == "")
						e1.setV_10("0");
					if (e1.getV_12() == "")
						e1.setV_12("0");
					if (e1.getV_13() == "")
						e1.setV_13("0");
					if (e1.getV_15() == "")
						e1.setV_15("0");
					if (e1.getV_16() == "")
						e1.setV_16("0");
					if (e1.getV_17() == "")
						e1.setV_17("0");
					if (e1.getV_18() == "")
						e1.setV_18("0");	
				}else{
						e1=new Excel_list();
						e1.setV_9("0");					
						e1.setV_10("0");					
						e1.setV_12("0");					
						e1.setV_13("0");					
						e1.setV_15("0");					
						e1.setV_16("0");					
						e1.setV_17("0");
						e1.setV_18("0");	
				}
				if(e2!=null){
					if (e2.getV_9() == "")
						e2.setV_9("0");
					if (e2.getV_10() == "")
						e2.setV_10("0");
					if (e2.getV_12() == "")
						e2.setV_12("0");
					if (e2.getV_13() == "")
						e2.setV_13("0");
					if (e2.getV_15() == "")
						e2.setV_15("0");
					if (e2.getV_16() == "")
						e2.setV_16("0");
					if (e2.getV_17() == "")
						e2.setV_17("0");
					if (e2.getV_18() == "")
						e2.setV_18("0");
				}else{
					e2=new Excel_list();
					e2.setV_9("0");					
					e2.setV_10("0");					
					e2.setV_12("0");					
					e2.setV_13("0");					
					e2.setV_15("0");					
					e2.setV_16("0");					
					e2.setV_17("0");
					e2.setV_18("0");	
			}
				e4.setV_9(Double.parseDouble(e1.getV_9())
						+ Double.parseDouble(e2.getV_9()) + "");
				e4.setV_10(Double.parseDouble(e1.getV_10())
						+ Double.parseDouble(e2.getV_10()) + "");
				e4.setV_11("0");
				e4.setV_12(Double.parseDouble(e1.getV_12())
						+ Double.parseDouble(e2.getV_12()) + "");
				e4.setV_13(Double.parseDouble(e1.getV_13())
						+ Double.parseDouble(e2.getV_13()) + "");
				e4.setV_15(Double.parseDouble(e1.getV_15())
						+ Double.parseDouble(e2.getV_15()) + "");
				e4.setV_16(Double.parseDouble(e1.getV_16())
						+ Double.parseDouble(e2.getV_16()) + "");
				e4.setV_17(Double.parseDouble(e1.getV_17())
						+ Double.parseDouble(e2.getV_17()) + "");
				e4.setV_18(Double.parseDouble(e1.getV_18())
						+ Double.parseDouble(e2.getV_18()) + "");
				exl.add(e4);
				exl.addAll(exl1);
			}
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("普通干线公路建设项目进展情况表");//设置第一行
			eldata.setSheetName("项目进展情况表");//设置sheeet名
			eldata.setFileName("普通干线公路建设项目进展情况表");//设置文件名
			eldata.setEl(exl);//将实体list放入类中
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
			et.add(new Excel_tilte("已拨付资金（万元）",1,1,10,10));
			et.add(new Excel_tilte("本次拨付资金（万元）",1,1,11,11));
			et.add(new Excel_tilte("累计拨付资金（万元）",1,1,12,12));
			et.add(new Excel_tilte("未拨付资金（万元）",1,1,13,13));
			et.add(new Excel_tilte("建设状态",1,1,14,14));
			et.add(new Excel_tilte("垫层（m³）",1,1,15,15));
			et.add(new Excel_tilte("基层（m³）",1,1,16,16));
			et.add(new Excel_tilte("完工里程（公里）",1,1,17,17));
			et.add(new Excel_tilte("未开工里程(公里)",1,1,18,18));
			et.add(new Excel_tilte("开工日期",1,1,19,19));
			et.add(new Excel_tilte("全线开工",1,1,20,20));
			et.add(new Excel_tilte("开工段落",1,1,21,21));
			et.add(new Excel_tilte("完工日期",1,1,22,22));
			et.add(new Excel_tilte("预计完工时间",1,1,23,23));
			et.add(new Excel_tilte("情况说明",1,1,24,24));
			et.add(new Excel_tilte("计划下达文号",1,1,25,25));
			et.add(new Excel_tilte("相关处室意见",1,1,26,26));
			et.add(new Excel_tilte("财审处意见",1,1,27,27));

			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			try {
				Excel_export.excel_export(eldata,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//将类和参数HttpServletResponse传入即可实现导出excel
			
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
			tiaojian1="and gydw like '%"+gydwdm+"%'";
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
		List<Map<String,Object>> list1=xmbbServer.getyhbblist1(xmbb);
		List<Map<String,Object>> list2=xmbbServer.getyhbblist2(xmbb);
		List<Map<String,Object>> list3=xmbbServer.getyhbblist3(xmbb);
		List<Map<String,Object>> list4=xmbbServer.getyhbblist4(xmbb);

		try {
			if(list2.size()>0)
			for (int i = 0; i < list2.size(); i++) {
				list1.add(list2.get(i));
				if(list3.size()>0)
				for (int j = 0; j < list3.size(); j++) {
					if(list2.get(i).get("XZQHDM").toString().equals(list3.get(j).get("XZQHDM").toString())){
						list1.add(list3.get(j));
						if(list4.size()>0)
						for (int k = 0; k < list4.size(); k++) {
							if(list2.get(i).get("XZQHDM").toString().equals(list4.get(k).get("XZQHDM").toString())&&list3.get(j).get("XZQHMC").toString().equals(list4.get(k).get("DLLX").toString()))
								list1.add(list4.get(k));
						}
					}
				}
			}
			if("flag".equals(flag)){
				List<Excel_list> elist=new ArrayList<Excel_list>();
				for (Map<String, Object> map : list1) {
					Excel_list l=new Excel_list();
					try {l.setV_0(map.get("HB").toString());} catch (Exception e) {l.setV_0("");}
					if("是1".equals(map.get("HB").toString())){
						try {l.setV_1(map.get("XZQHMC").toString().substring(1));} catch (Exception e) {l.setV_1("");}
					}else{
						try {l.setV_1(map.get("XZQHMC").toString());} catch (Exception e) {l.setV_1("");}
					}
					try {l.setV_2(map.get("TSDQ").toString());} catch (Exception e) {l.setV_2("");}
					try {l.setV_3(map.get("XMMC").toString());} catch (Exception e) {l.setV_3("");}
					try {l.setV_4(map.get("GCFL").toString());} catch (Exception e) {l.setV_4("");}
					try {l.setV_5(map.get("XDNF").toString());} catch (Exception e) {l.setV_5("");}
					try {l.setV_6(map.get("QDZH").toString());} catch (Exception e) {l.setV_6("");}
					try {l.setV_7(map.get("ZDZH").toString());} catch (Exception e) {l.setV_7("");}
					try {l.setV_8(map.get("JHLC").toString());} catch (Exception e) {l.setV_8("");}
					try {l.setV_9(map.get("GYS").toString());} catch (Exception e) {l.setV_9("");}
					try {l.setV_10(map.get("JHXDZJ").toString());} catch (Exception e) {l.setV_10("");}
					try {l.setV_11(map.get("BFZJ").toString());} catch (Exception e) {l.setV_11("");}
					try {l.setV_12(map.get("WBFZJ").toString());} catch (Exception e) {l.setV_12("");}
					try {l.setV_13(map.get("JSZT").toString());} catch (Exception e) {l.setV_13("");}
					try {l.setV_14(map.get("DC").toString());} catch (Exception e) {l.setV_14("");}
					try {l.setV_15(map.get("JC").toString());} catch (Exception e) {l.setV_15("");}
					try {l.setV_16(map.get("KGRQ").toString());} catch (Exception e) {l.setV_16("");}
					try {l.setV_17(map.get("WGRQ").toString());} catch (Exception e) {l.setV_17("");}
					try {l.setV_18(map.get("KGDL").toString());} catch (Exception e) {l.setV_18("");}
					try {l.setV_19(map.get("WGLC").toString());} catch (Exception e) {l.setV_19("");}
					try {l.setV_20(map.get("QKSM").toString());} catch (Exception e) {l.setV_20("");}
					try {l.setV_21(map.get("JHXDWH").toString());} catch (Exception e) {l.setV_21("");}
					try {l.setV_22(map.get("XGCSYJ").toString());} catch (Exception e) {l.setV_22("");}
					try {l.setV_23(map.get("CSCYJ").toString());} catch (Exception e) {l.setV_23("");}
					elist.add(l);
				}
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
				et.add(new Excel_tilte("累计拨付资金（万元）",1,2,11,11));
				et.add(new Excel_tilte("未拨付资金（万元）",1,2,12,12));
				et.add(new Excel_tilte("建设状态",1,2,13,13));
				et.add(new Excel_tilte("垫层（m³）",1,2,14,14));
				et.add(new Excel_tilte("基层（m³）",1,2,15,15));
				et.add(new Excel_tilte("开工日期",1,2,16,16));
				et.add(new Excel_tilte("完工日期",1,2,17,17));
				et.add(new Excel_tilte("开工段落",1,2,18,18));
				et.add(new Excel_tilte("完工里程（公里）",1,2,19,19));
				et.add(new Excel_tilte("情况说明",1,2,20,20));
				et.add(new Excel_tilte("计划下达文号",1,2,21,21));
				et.add(new Excel_tilte("相关处室意见",1,2,22,22));
				et.add(new Excel_tilte("财审处意见",1,2,23,23));
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
			tiaojian1="and gydw like '%"+gydwdm+"%'";
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
			List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> list1=xmbbServer.getlwbblist1(xmbb);
			List<Map<String,Object>> list2=xmbbServer.getlwbblist2(xmbb);
			if(list1.size()>0)
			for (Map<String, Object> map : list1) {
				list.add(map);
				int i=1;
				if(list2.size()>0)
				for (Map<String, Object> map1 : list2) {
					
					if(map.get("XMLX").toString().equals(map1.get("XMLX").toString())){
						map1.put("XH", i+"、");
						i++;
						list.add(map1);
					}
				}
			}
			if("flag".equals(flag)){
				List<Excel_list> elist=new ArrayList<Excel_list>();
				for (Map<String, Object> map : list) {
					Excel_list l=new Excel_list();
					try {l.setV_0(map.get("XH").toString());} catch (Exception e) {l.setV_0("");}
					try {l.setV_1(map.get("XZQHMC").toString());} catch (Exception e) {l.setV_1("");}
					try {l.setV_2(map.get("TSDQ").toString());} catch (Exception e) {l.setV_2("");}
					try {l.setV_3(map.get("XMMC").toString());} catch (Exception e) {l.setV_3("");}
					try {l.setV_4(map.get("JSXZ").toString());} catch (Exception e) {l.setV_4("");}
					try {l.setV_5(map.get("QDZH").toString());} catch (Exception e) {l.setV_5("");}
					try {l.setV_6(map.get("ZDZH").toString());} catch (Exception e) {l.setV_6("");}
					try {l.setV_7(map.get("YHLC").toString());} catch (Exception e) {l.setV_7("");}
					try {l.setV_8(map.get("XDNF").toString());} catch (Exception e) {l.setV_8("");}
					try {l.setV_9(map.get("XDZJ").toString());} catch (Exception e) {l.setV_9("");}
					try {l.setV_10(map.get("GYS").toString());} catch (Exception e) {l.setV_10("");}
					try {l.setV_11(map.get("BFZJ").toString());} catch (Exception e) {l.setV_11("");}
					try {l.setV_12(map.get("WBFZJ").toString());} catch (Exception e) {l.setV_12("");}
					try {l.setV_13(map.get("JSZT").toString());} catch (Exception e) {l.setV_13("");}
					try {l.setV_14(map.get("WGLC").toString());} catch (Exception e) {l.setV_14("");}
					try {l.setV_15(map.get("KGRQ").toString());} catch (Exception e) {l.setV_15("");}
					try {l.setV_16(map.get("WGRQ").toString());} catch (Exception e) {l.setV_16("");}
					try {l.setV_17(map.get("YJRQ").toString());} catch (Exception e) {l.setV_17("");}
					try {l.setV_18(map.get("QKSM").toString());} catch (Exception e) {l.setV_18("");}
					try {l.setV_19(map.get("JHXDWH").toString());} catch (Exception e) {l.setV_19("");}
					try {l.setV_20(map.get("XGCSYJ").toString());} catch (Exception e) {l.setV_20("");}
					try {l.setV_21(map.get("CSCYJ").toString());} catch (Exception e) {l.setV_21("");}
					try {l.setV_22(map.get("HB").toString());} catch (Exception e) {l.setV_22("");}
					elist.add(l);
				}
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
				et.add(new Excel_tilte("累计拨付资金（万元）",1,2,11,11));
				et.add(new Excel_tilte("未拨付资金（万元）",1,2,12,12));
				et.add(new Excel_tilte("建设状态",1,2,13,13));
				et.add(new Excel_tilte("完工桥长或隐患里程",1,2,14,14));
				et.add(new Excel_tilte("开工日期",1,2,15,15));
				et.add(new Excel_tilte("完工日期",1,2,16,16));
				et.add(new Excel_tilte("预计完工时间",1,2,17,17));
				et.add(new Excel_tilte("情况说明",1,2,18,18));
				et.add(new Excel_tilte("计划下达文号",1,2,19,19));
				et.add(new Excel_tilte("相关处室意见",1,2,20,20));
				et.add(new Excel_tilte("财审处意见",1,2,21,21));
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
	
}
