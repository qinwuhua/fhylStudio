package com.hdsx.jxzhpt.wjxt.controller;

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
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
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
 * 系统管理Controller层
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class DbyhController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "dbyhServerImpl")
	private DbyhServer dbyhServer;
	private String gydw;
	private String tiaojian;
	private String nian;
	private String yue;
	private String fileuploadFileName;
	
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	private Zdxx zdxx=new Zdxx();
	private String fileupload;
	
	public String getFileupload() {
		return fileupload;
	}
	public void setFileupload(String fileupload) {
		this.fileupload = fileupload;
	}
	public Zdxx getZdxx() {
		return zdxx;
	}
	public void setZdxx(Zdxx zdxx) {
		this.zdxx = zdxx;
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
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getTiaojian() {
		return tiaojian;
	}
	public void setTiaojian(String tiaojian) {
		this.tiaojian = tiaojian;
	}

	public String getNian() {
		return nian;
	}
	public void setNian(String nian) {
		this.nian = nian;
	}
	public String getYue() {
		return yue;
	}
	public void setYue(String yue) {
		this.yue = yue;
	}
	public void selectYbbList(){
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		List<Map<String, Object>> list1 =dbyhServer.selectList2(zdxx);

		try {
			JsonUtils.write(list1, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void export_ybb() throws Exception{
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		List<Excel_list> list = dbyhServer.export_ybb(zdxx);

		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路养护小修保养月报表");//设置第一行
		eldata.setSheetName("月报表");//设置sheeet名
		eldata.setFileName(nian+"年"+yue+"月"+"公路养护小修保养月报表");//设置文件名
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("分局(道班名称)",1,2,0,0));
		et.add(new Excel_tilte("整修路肩、边坡",1,1,1,1));
		et.add(new Excel_tilte("开挖、清理边沟",1,1,2,2));	
		et.add(new Excel_tilte("石砌边沟修复",1,1,3,3));
		et.add(new Excel_tilte("回填路基缺口",1,1,4,4));
		et.add(new Excel_tilte("清理塌方",1,1,5,5));
		et.add(new Excel_tilte("路基翻浆处理",1,1,6,6));
		et.add(new Excel_tilte("增、修挡土墙",1,1,7,7));
		et.add(new Excel_tilte("清理路面垃圾",1,1,8,8));
		et.add(new Excel_tilte("路面清扫",1,1,9,9));
		et.add(new Excel_tilte("修补油路坑槽",1,1,10,10));
		et.add(new Excel_tilte("水泥路面灌缝",1,1,11,11));
		et.add(new Excel_tilte("修复水泥砼路面",1,1,12,12));
		et.add(new Excel_tilte("沥青灌缝（裂缝）",1,1,13,13));
		et.add(new Excel_tilte("路面除冰",1,1,14,14));
		et.add(new Excel_tilte("砂石路面扫砂/加砂",1,1,15,15));
		et.add(new Excel_tilte("路缘带刷白",1,1,16,16));
		et.add(new Excel_tilte("除草",1,1,17,17));
		et.add(new Excel_tilte("花木浇灌",1,1,18,18));
		et.add(new Excel_tilte("花木整枝、灭虫",1,1,19,19));
		et.add(new Excel_tilte("路树整枝、灭虫",1,1,20,20));
		et.add(new Excel_tilte("苗木补植",1,1,21,21));
		et.add(new Excel_tilte("路树刷白",1,1,22,22));
		et.add(new Excel_tilte("埋置示警桩",1,1,23,23));
		et.add(new Excel_tilte("埋置公里桩/百米桩",1,1,24,24));
		et.add(new Excel_tilte("公里桩/百米桩刷漆",1,1,25,25));
		et.add(new Excel_tilte("油漆示警桩",1,1,26,26));
		et.add(new Excel_tilte("油漆轮廓桩",1,1,27,27));
		et.add(new Excel_tilte("油漆防护栏板",1,1,28,28));
		et.add(new Excel_tilte("维护防护栏板",1,1,29,29));
		et.add(new Excel_tilte("疏通泄水孔",1,1,30,30));
		et.add(new Excel_tilte("安装栏板",1,1,31,31));
		et.add(new Excel_tilte("油漆防护栏板",1,1,32,32));
		et.add(new Excel_tilte("清理伸缩缝",1,1,33,33));
		et.add(new Excel_tilte("桥面小型维修",1,1,34,34));
		et.add(new Excel_tilte("油漆桥梁栏杆",1,1,35,35));
		et.add(new Excel_tilte("桥栏刷白",1,1,36,36));
		et.add(new Excel_tilte("涵洞洞口维修",1,1,37,37));
		et.add(new Excel_tilte("清除涵洞",1,1,38,38));
		et.add(new Excel_tilte("道班内业整理",1,1,39,39));
		et.add(new Excel_tilte("交通量调查",1,1,40,40));
		et.add(new Excel_tilte("m2/m", 2, 2, 1, 1));
		et.add(new Excel_tilte("m", 2, 2, 2, 2));
		et.add(new Excel_tilte("m3/m", 2, 2, 3, 3));
		et.add(new Excel_tilte("m3/m", 2, 2, 4, 4));
		et.add(new Excel_tilte("m3/处", 2, 2, 5, 5));
		et.add(new Excel_tilte("m2/km", 2, 2, 6, 6));
		et.add(new Excel_tilte("m3/km", 2, 2, 7, 7));
		et.add(new Excel_tilte("m3", 2, 2, 8, 8));
		et.add(new Excel_tilte("m2/km", 2, 2, 9, 9));
		et.add(new Excel_tilte("m2/km", 2, 2, 10, 10));
		et.add(new Excel_tilte("m2", 2, 2, 11, 11));
		et.add(new Excel_tilte("m2", 2, 2, 12, 12));
		et.add(new Excel_tilte("m/km", 2, 2, 13, 13));
		et.add(new Excel_tilte("m2/km", 2, 2, 14, 14));
		et.add(new Excel_tilte("m3/km", 2, 2, 15, 15));
		et.add(new Excel_tilte("m", 2, 2, 16, 16));
		et.add(new Excel_tilte("m2", 2, 2, 17, 17));
		et.add(new Excel_tilte("m2", 2, 2, 18, 18));
		et.add(new Excel_tilte("m2", 2, 2, 19, 19));
		et.add(new Excel_tilte("株/km", 2, 2, 20, 20));
		et.add(new Excel_tilte("株/km", 2, 2, 21, 21));
		et.add(new Excel_tilte("株/km", 2, 2, 22, 22));
		et.add(new Excel_tilte("根", 2, 2, 23, 23));
		et.add(new Excel_tilte("个", 2, 2, 24, 24));
		et.add(new Excel_tilte("个", 2, 2, 25, 25));
		et.add(new Excel_tilte("根", 2, 2, 26, 26));
		et.add(new Excel_tilte("根", 2, 2, 27, 27));
		et.add(new Excel_tilte("m", 2, 2, 28, 28));
		et.add(new Excel_tilte("m/处", 2, 2, 29, 29));
		et.add(new Excel_tilte("个/座", 2, 2, 30, 30));
		et.add(new Excel_tilte("m/座", 2, 2, 31, 31));
		et.add(new Excel_tilte("m3/座", 2, 2, 32, 32));
		et.add(new Excel_tilte("m/座", 2, 2, 33, 33));
		et.add(new Excel_tilte("m2/座", 2, 2, 34, 34));
		et.add(new Excel_tilte("m/座", 2, 2, 35, 35));
		et.add(new Excel_tilte("m/座", 2, 2, 36, 36));
		et.add(new Excel_tilte("m3/道", 2, 2, 37, 37));
		et.add(new Excel_tilte("m3/道", 2, 2, 38, 38));
		et.add(new Excel_tilte("工日", 2, 2, 39, 39));
		et.add(new Excel_tilte("工日", 2, 2, 40, 40));

		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		Excel_export.excel_export(eldata,response);//将类和参数HttpServletResponse传入即可实现导出excel

	}
	public void export_xhb() throws Exception{
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		List<Excel_list> list = dbyhServer.export_xhb(zdxx);

		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路养护小修保养材料消耗表");//设置第一行
		eldata.setSheetName("月报表");//设置sheeet名
		eldata.setFileName(nian+"年"+yue+"月"+"公路养护小修保养材料消耗表");//设置文件名
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("分局(道班名称)",1,2,0,0));
		et.add(new Excel_tilte("备料",1,1,1,17));
		et.add(new Excel_tilte("材料、燃料消耗",1,1,18,30));	
		et.add(new Excel_tilte("砂(立方米)",2,2,1,1));
		et.add(new Excel_tilte("石(立方米)",2,2,2,2));
		et.add(new Excel_tilte("(黄土)包括天然料(立方米)",2,2,3,3));
		et.add(new Excel_tilte("沥青(吨)",2,2,4,4));
		et.add(new Excel_tilte("乳化沥青(吨)",2,2,5,5));
		et.add(new Excel_tilte("水泥(吨)",2,2,6,6));
		et.add(new Excel_tilte("嵌缝料(吨)",2,2,7,7));
		et.add(new Excel_tilte("柴油(升)",2,2,8,8));
		et.add(new Excel_tilte("汽油(升)",2,2,9,9));
		et.add(new Excel_tilte("石灰(吨)",2,2,10,10));
		et.add(new Excel_tilte("柴火(吨)",2,2,11,11));
		et.add(new Excel_tilte("工业盐(吨)",2,2,12,12));
		et.add(new Excel_tilte("草袋(只)",2,2,13,13));
		et.add(new Excel_tilte("橡胶水(公斤)",2,2,14,14));
		et.add(new Excel_tilte("冷补料",2,2,15,15));
		et.add(new Excel_tilte("砂(立方米)",2,2,16,16));
		et.add(new Excel_tilte("石(立方米)",2,2,17,17));
		et.add(new Excel_tilte("(黄土)包括天然料(立方米)",2,2,18,18));
		et.add(new Excel_tilte("沥青(吨)",2,2,19,19));
		et.add(new Excel_tilte("乳化沥青(吨)",2,2,20,20));
		et.add(new Excel_tilte("水泥(吨)",2,2,21,21));
		et.add(new Excel_tilte("嵌缝料(吨)",2,2,22,22));
		et.add(new Excel_tilte("柴油(升)",2,2,23,23));
		et.add(new Excel_tilte("汽油(升)",2,2,24,24));
		et.add(new Excel_tilte("石灰(吨)",2,2,25,25));
		et.add(new Excel_tilte("柴火(吨)",2,2,26,26));
		et.add(new Excel_tilte("工业盐(吨)",2,2,27,27));
		et.add(new Excel_tilte("草袋(只)",2,2,28,28));
		et.add(new Excel_tilte("橡胶水(公斤)",2,2,29,29));
		et.add(new Excel_tilte("冷补料",2,2,30,30));

		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		Excel_export.excel_export(eldata,response);//将类和参数HttpServletResponse传入即可实现导出excel

	}
	public void selectXhbList(){
		zdxx.setGydw(gydw);
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		List<Map<String, Object>> list=dbyhServer.selectxhbList1(zdxx);
	
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void export_fxb() throws Exception{
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		List<Excel_list> list = dbyhServer.export_fxb(zdxx);

		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路管理月报分析表");//设置第一行
		eldata.setSheetName("月报表");//设置sheeet名
		eldata.setFileName(nian+"年"+yue+"月"+"公路管理月报分析表");//设置文件名
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("分局(道班名称)",1,3,0,0));
		et.add(new Excel_tilte("实际评定养护里程Km",1,3,1,1));
		et.add(new Excel_tilte("本 月 路 况",1,1,2,7));	
		et.add(new Excel_tilte("'其 中",1,1,8,11));
		et.add(new Excel_tilte("优良路率 %",2,2,2,4));
		et.add(new Excel_tilte("MQI",2,2,5,7));
		et.add(new Excel_tilte("油 路",2,2,8,9));
		et.add(new Excel_tilte("水 泥 路",2,2,10,11));
		et.add(new Excel_tilte("上月优良路率%",3,3,2,2));
		et.add(new Excel_tilte("本月优良路率%",3,3,3,3));
		et.add(new Excel_tilte("优良路率比上月↑↓",3,3,4,4));
		et.add(new Excel_tilte("上月MQI",3,3,5,5));
		et.add(new Excel_tilte("本月MQI",3,3,6,6));
		et.add(new Excel_tilte("MQI比上月↑↓",3,3,7,7));
		et.add(new Excel_tilte("上月优良路率%",3,3,8,8));
		et.add(new Excel_tilte("本月优良路率%",3,3,9,9));
		et.add(new Excel_tilte("上月优良路率%",3,3,10,10));
		et.add(new Excel_tilte("本月优良路率%",3,3,11,11));

		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		Excel_export.excel_export(eldata,response);//将类和参数HttpServletResponse传入即可实现导出excel

	}
	public void selectFxbList(){
		zdxx.setGydw(gydw);
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		List<Map<String, Object>> list1=dbyhServer.selectfxbList1(zdxx);
		try{
		JsonUtils.write(list1, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void selectPdbList(){
		zdxx.setGydw(gydw);
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		List<Map<String, Object>> list1=dbyhServer.selectPdbList(zdxx);
		try{
		JsonUtils.write(list1, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public void export_pdb() throws Exception{
		zdxx.setGydw(gydw);
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		try{
			List<Excel_list> list2=dbyhServer.export_pdb(zdxx);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路路况评定表");//设置第一行
		eldata.setSheetName("评定表");//设置sheeet名
		eldata.setFileName(nian+"年"+yue+"月"+"公路路况评定表");//设置文件名
		eldata.setEl(list2);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("分局(道班名称)",1,3,0,0));
		et.add(new Excel_tilte("养护里程(公里)",1,3,1,1));
		et.add(new Excel_tilte("路况等级(公里)",1,1,2,6));	
		et.add(new Excel_tilte("MQI", 1, 3, 7, 7));
		et.add(new Excel_tilte("优良路率(%)", 1, 3, 8, 8));
		et.add(new Excel_tilte("其　　　　中", 1, 1, 9, 24));
		et.add(new Excel_tilte("养路工人出勤情况", 1, 1, 25, 30));
		et.add(new Excel_tilte("优", 2, 3, 2, 2));
		et.add(new Excel_tilte("良", 2, 3, 3, 3));
		et.add(new Excel_tilte("中", 2, 3, 4, 4));
		et.add(new Excel_tilte("次", 2, 3, 5, 5));
		et.add(new Excel_tilte("差", 2, 3, 6, 6));
		et.add(new Excel_tilte("油　路 (公里)", 2, 2, 9, 14));
		et.add(new Excel_tilte("MQI", 2, 3, 15, 15));
		et.add(new Excel_tilte("优良路率(%)", 2, 3, 16, 16));
		et.add(new Excel_tilte("水　泥　路(公里)", 2, 2, 17, 22));
		et.add(new Excel_tilte("MQI", 2, 3, 23, 23));
		et.add(new Excel_tilte("优良路率(%)", 2, 3, 24, 24));
		et.add(new Excel_tilte("工人数 (人)", 2, 2, 25, 26));
		et.add(new Excel_tilte("出 工 率", 2, 2, 27, 28));
		et.add(new Excel_tilte("出 勤 率", 2, 2, 29, 30));
		et.add(new Excel_tilte("总里程", 3, 3, 9, 9));
		et.add(new Excel_tilte("优", 3, 3, 10, 10));
		et.add(new Excel_tilte("良", 3, 3, 11, 11));
		et.add(new Excel_tilte("中", 3, 3, 12, 12));
		et.add(new Excel_tilte("次", 3, 3, 13, 13));
		et.add(new Excel_tilte("差", 3, 3, 14, 14));
		et.add(new Excel_tilte("总里程", 3, 3, 17, 17));
		et.add(new Excel_tilte("优", 3, 3, 18, 18));
		et.add(new Excel_tilte("良", 3, 3, 19, 19));
		et.add(new Excel_tilte("中", 3, 3, 20, 20));
		et.add(new Excel_tilte("次", 3, 3, 21, 21));
		et.add(new Excel_tilte("差", 3, 3, 22, 22));
		et.add(new Excel_tilte("在册", 3, 3, 25, 25));
		et.add(new Excel_tilte("临时", 3, 3, 26, 26));
		et.add(new Excel_tilte("直接生产工日", 3, 3, 27, 27));
		et.add(new Excel_tilte("出工率(%)", 3, 3, 28, 28));
		et.add(new Excel_tilte("直接间接生产工日", 3, 3, 29, 29));
		et.add(new Excel_tilte("出勤率(%)", 3, 3, 30, 30));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		Excel_export.excel_export(eldata,response);//将类和参数HttpServletResponse传入即可实现导出excel

		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public void selectYlbList(){
		zdxx.setGydw(gydw);
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		List<Map<String, Object>> list1=dbyhServer.selectYlbList(zdxx);
		try{
		
		JsonUtils.write(list1, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public void export_ylb() throws Exception{
		zdxx.setGydw(gydw);
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		try{
			List<Excel_list> list2=dbyhServer.export_ylb(zdxx);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路路线技术状况一览表");//设置第一行
		eldata.setSheetName("一览表");//设置sheeet名
		eldata.setFileName(nian+"年"+yue+"月"+"公路路线技术状况一览表");//设置文件名
		eldata.setEl(list2);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("路线编号",1,2,0,0));
		et.add(new Excel_tilte("路线名称",1,2,1,1));
		et.add(new Excel_tilte("养护单位",1,2,2,2));	
		et.add(new Excel_tilte("起点桩号", 1, 2, 3, 3));
		et.add(new Excel_tilte("终点桩号", 1, 2, 4, 4));
		et.add(new Excel_tilte("评定里程（公里）", 1, 2, 5, 5));
		et.add(new Excel_tilte("评定结果（公里）", 1, 1, 6, 10));
		et.add(new Excel_tilte("优良路率（%）", 1, 2, 11, 11));
		et.add(new Excel_tilte("MQI", 1, 2, 12, 12));
		et.add(new Excel_tilte("备 注", 1, 2, 13, 13));
		et.add(new Excel_tilte("优等路", 2, 2, 6, 6));
		et.add(new Excel_tilte("良等路", 2, 2, 7, 7));
		et.add(new Excel_tilte("中等路", 2, 2, 8, 8));
		et.add(new Excel_tilte("次等路", 2, 2, 9, 9));
		et.add(new Excel_tilte("差等路", 2, 2, 10, 10));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		Excel_export.excel_export(eldata,response);//将类和参数HttpServletResponse传入即可实现导出excel

		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	//重做
	public void insertYBBData(){
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
				dataMapArray = ExcelReader1.readExcelContent(3,41,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			int num=1;
			
			String niany=data.get(data.size()-2).get("1").toString();
			//验证是否为时间
			try{
				SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
				d.parse(niany);
				//System.out.println(d);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"导入失败，填报日期不为日期");
				e.printStackTrace();
				return;
			}
			//验证是否存在
			List<Map<String,Object>> l=dbyhServer.selectybbbyYf(niany.substring(0,7));
			//System.out.println(l.size()+"长度");
			if(l.size()>0){
				response.getWriter().print(fileuploadFileName+"导入失败，填报日期重复\r");
				return;
			}
			//System.out.println(niany);
			for (int i = 0; i < data.size()-2; i++) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				data.get(i).put("id", s1);data.get(i).put("xh", num+"");
				data.get(i).put("ybyf", niany.substring(0,7));
				num++;
			}
			data.remove(data.size()-1);
			data.remove(data.size()-1);
			boolean sfcg=true;
			
			sfcg=dbyhServer.insertYBBData(data);
			
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void delete_ybb(){
		System.out.println(nian+"-"+yue);
		List<Map<String,Object>> l=dbyhServer.selectybbbyYf(nian+"-"+yue);
		boolean flag=false;
		if(l.size()>0){
			flag = dbyhServer.delete_ybb(nian+"-"+yue);
		}
		if(flag){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	//
	public void insertXHBData(){
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
				dataMapArray = ExcelReader1.readExcelContent(3,31,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			int num=1;
			
			String niany=data.get(data.size()-2).get("1").toString();
			//验证是否为时间
			try{
				SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
				d.parse(niany);
				//System.out.println(d);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"导入失败，填报日期不为日期");
				e.printStackTrace();
				return;
			}
			//验证是否存在
			List<Map<String,Object>> l=dbyhServer.selectxhbbyYf(niany.substring(0,7));
			//System.out.println(l.size()+"长度");
			if(l.size()>0){
				response.getWriter().print(fileuploadFileName+"导入失败，填报日期重复\r");
				return;
			}
			//System.out.println(niany);
			for (int i = 0; i < data.size()-2; i++) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				data.get(i).put("id", s1);data.get(i).put("xh", num+"");
				data.get(i).put("ybyf", niany.substring(0,7).toString());
				num++;
			}
			data.remove(data.size()-1);
			data.remove(data.size()-1);
			boolean sfcg=true;
			for (Map map : data) {
				System.out.println(map);
			}
			sfcg=dbyhServer.insertXHBData(data);
			
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void delete_xhb(){
		System.out.println(nian+"-"+yue);
		List<Map<String,Object>> l=dbyhServer.selectxhbbyYf(nian+"-"+yue);
		boolean flag=false;
		if(l.size()>0){
			flag = dbyhServer.delete_xhb(nian+"-"+yue);
		}
		if(flag){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	//
	public void insertFXBData(){
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
				dataMapArray = ExcelReader1.readExcelContent(4,12,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			int num=1;
			
			String niany=data.get(data.size()-2).get("1").toString();
			//验证是否为时间
			try{
				SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
				d.parse(niany);
				//System.out.println(d);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"导入失败，填报日期不为日期");
				e.printStackTrace();
				return;
			}
			//验证是否存在
			List<Map<String,Object>> l=dbyhServer.selectfxbbyYf(niany.substring(0,7));
			//System.out.println(l.size()+"长度");
			if(l.size()>0){
				response.getWriter().print(fileuploadFileName+"导入失败，填报日期重复\r");
				return;
			}
			//System.out.println(niany);
			for (int i = 0; i < data.size()-2; i++) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				data.get(i).put("id", s1);data.get(i).put("xh", num+"");
				data.get(i).put("ybyf", niany.substring(0,7).toString());
				num++;
			}
			data.remove(data.size()-1);
			data.remove(data.size()-1);
			boolean sfcg=true;
			for (Map map : data) {
				System.out.println(map);
			}
			sfcg=dbyhServer.insertFXBData(data);
			
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void delete_fxb(){
		System.out.println(nian+"-"+yue);
		List<Map<String,Object>> l=dbyhServer.selectfxbbyYf(nian+"-"+yue);
		boolean flag=false;
		if(l.size()>0){
			flag = dbyhServer.delete_fxb(nian+"-"+yue);
		}
		if(flag){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	//
	public void insertPDBData(){
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
				dataMapArray = ExcelReader1.readExcelContent(4,31,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			int num=1;
			
			String niany=data.get(data.size()-2).get("1").toString();
			//验证是否为时间
			try{
				SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
				d.parse(niany);
				//System.out.println(d);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"导入失败，填报日期不为日期");
				e.printStackTrace();
				return;
			}
			//验证是否存在
			List<Map<String,Object>> l=dbyhServer.selectpdbbyYf(niany.substring(0,7));
			//System.out.println(l.size()+"长度");
			if(l.size()>0){
				response.getWriter().print(fileuploadFileName+"导入失败，填报日期重复\r");
				return;
			}
			//System.out.println(niany);
			for (int i = 0; i < data.size()-2; i++) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				data.get(i).put("id", s1);data.get(i).put("xh", num+"");
				data.get(i).put("ybyf", niany.substring(0,7).toString());
				num++;
			}
			data.remove(data.size()-1);
			data.remove(data.size()-1);
			boolean sfcg=true;
			for (Map map : data) {
				System.out.println(map);
			}
			sfcg=dbyhServer.insertPDBData(data);
			
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void delete_pdb(){
		System.out.println(nian+"-"+yue);
		List<Map<String,Object>> l=dbyhServer.selectpdbbyYf(nian+"-"+yue);
		boolean flag=false;
		if(l.size()>0){
			flag = dbyhServer.delete_pdb(nian+"-"+yue);
		}
		if(flag){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	//
	public void insertYLBData(){
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
				dataMapArray = ExcelReader1.readExcelContent(3,14,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			int num=1;
			
			String niany=data.get(data.size()-2).get("1").toString();
			//验证是否为时间
			try{
				SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
				d.parse(niany);
				//System.out.println(d);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"导入失败，填报日期不为日期");
				e.printStackTrace();
				return;
			}
			//验证是否存在
			List<Map<String,Object>> l=dbyhServer.selectylbbyYf(niany.substring(0,7));
			//System.out.println(l.size()+"长度");
			if(l.size()>0){
				response.getWriter().print(fileuploadFileName+"导入失败，填报日期重复\r");
				return;
			}
			//System.out.println(niany);
			for (int i = 0; i < data.size()-2; i++) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				data.get(i).put("id", s1);data.get(i).put("xh", num+"");
				data.get(i).put("ybyf", niany.substring(0,7).toString());
				num++;
			}
			data.remove(data.size()-1);
			data.remove(data.size()-1);
			boolean sfcg=true;
			for (Map map : data) {
				System.out.println(map);
			}
			sfcg=dbyhServer.insertYLBData(data);
			
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void delete_ylb(){
		System.out.println(nian+"-"+yue);
		List<Map<String,Object>> l=dbyhServer.selectylbbyYf(nian+"-"+yue);
		boolean flag=false;
		if(l.size()>0){
			flag = dbyhServer.delete_ylb(nian+"-"+yue);
		}
		if(flag){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
}

