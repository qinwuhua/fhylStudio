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
import java.util.Date;
import java.util.List;

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
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.ZdxxServer;
import com.hdsx.jxzhpt.wjxt.server.ZhqkServer;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 系统管理Controller层
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class ZdxxController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "zdxxServerImpl")
	private ZdxxServer zdxxServer;
	private String gydw;
	private String tiaojian;
	private String kssj;
	private String jssj;
	private Zdxx zdxx=new Zdxx();
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
	public String getKssj() {
		return kssj;
	}
	public void setKssj(String kssj) {
		this.kssj = kssj;
	}
	public String getJssj() {
		return jssj;
	}
	public void setJssj(String jssj) {
		this.jssj = jssj;
	}
	public Zdxx getZdxx() {
		return zdxx;
	}
	public void setZdxx(Zdxx zdxx) {
		this.zdxx = zdxx;
	}
	public void insertzdxx(){
		boolean bl=zdxxServer.insertzdxx(zdxx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectZdxxList(){
		zdxx.setPage(page);
		zdxx.setRows(rows);
		zdxx.setGydw(gydw);
		zdxx.setTiaojian(tiaojian);
		int count=zdxxServer.selectZdxxListCount(zdxx);
		List<Zdxx> list=zdxxServer.selectZdxxList(zdxx);
		EasyUIPage<Zdxx> e=new EasyUIPage<Zdxx>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void updatezdxx(){
		boolean bl=zdxxServer.updatezdxx(zdxx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deletezdxx(){
		boolean bl=zdxxServer.deletezdxx(zdxx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void exportExcel_zdxx() throws Exception{
		zdxx.setGydw(gydw);
		zdxx.setTiaojian(tiaojian);
		List<Zdxx> list=zdxxServer.selectZdxxList1(zdxx);
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet("阻断信息"); 
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		row.setHeightInPoints(25f);
		cell.setCellValue("公路交通阻断信息表");
		cell.setCellStyle(style); 
		sheet.setColumnWidth(0, 32 * 100);sheet.setColumnWidth(1, 32 * 150);sheet.setColumnWidth(2, 32 * 200);sheet.setColumnWidth(3, 32 * 100);sheet.setColumnWidth(4, 32 * 100);sheet.setColumnWidth(5, 32 * 100);sheet.setColumnWidth(6, 32 * 100);sheet.setColumnWidth(7, 32 * 100);sheet.setColumnWidth(8, 32 * 100);sheet.setColumnWidth(9, 32 * 100);sheet.setColumnWidth(10, 32 * 200);sheet.setColumnWidth(11, 32 * 100);sheet.setColumnWidth(12, 32 * 100);sheet.setColumnWidth(13, 32 * 100);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		row = sheet.createRow((int) 1);
		row.setHeightInPoints(20f);
		cell = row.createCell((short) 0);
		cell.setCellValue("路线编码");  
		cell.setCellStyle(style1); 
		cell = row.createCell((short) 1);
		cell.setCellValue("路段名称 ");  
		cell.setCellStyle(style1);
		cell = row.createCell((short) 2);
		cell.setCellValue("管养单位");  
		cell.setCellStyle(style1);
		cell = row.createCell((short) 3);
		cell.setCellValue("阻断时间");  
		cell.setCellStyle(style1); 
		cell = row.createCell((short) 4);
		cell.setCellValue("起点桩号");  
		cell.setCellStyle(style1);
		cell = row.createCell((short) 5);
		cell.setCellValue("止点桩号");  
		cell.setCellStyle(style1);
		cell = row.createCell((short) 6);
		cell.setCellValue("灾害类别");  
		cell.setCellStyle(style1);
		cell = row.createCell((short) 7);
		cell.setCellValue("抢通措施 ");  
		cell.setCellStyle(style1);
		cell = row.createCell((short) 8);
		cell.setCellValue("是否恢复"); 
		cell.setCellStyle(style1);
		cell = row.createCell((short) 9);
		cell.setCellValue("预计恢复时间");
		cell.setCellStyle(style1);
		cell = row.createCell((short) 10);
		cell.setCellValue("填报时间");
		cell.setCellStyle(style1);
		cell = row.createCell((short) 11);
		cell.setCellValue("填报单位"); 
		cell.setCellStyle(style1);
		cell = row.createCell((short) 12);
		cell.setCellValue("统计人 ");  
		cell.setCellStyle(style1);
		cell = row.createCell((short) 13);
		cell.setCellValue("审核人");  
		cell.setCellStyle(style1);
		
		CellRangeAddress range = new CellRangeAddress(0,0,0,13);
		sheet.addMergedRegion(range);
		setRegionStyle(style,range,sheet);

		HttpServletResponse response= getresponse();
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String("公路交通阻断信息表".getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		
		for (int i = 0; i < list.size(); i++)  
        {  
            row = sheet.createRow((int) i + 2);  
            Zdxx trqk1 = (Zdxx) list.get(i);  
            // 第四步，创建单元格，并设置值  
           cell = row.createCell((short) 0);
           cell.setCellValue(trqk1.getLxbm());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 1);
           cell.setCellValue(trqk1.getLxmc());  
           cell.setCellStyle(style);
           cell = row.createCell((short) 2);
           cell.setCellValue(trqk1.getGydwmc());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 3);
           cell.setCellValue(trqk1.getZdsj());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 4);
           cell.setCellValue(trqk1.getQdzh());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 5);
           cell.setCellValue(trqk1.getZdzh());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 6);
           cell.setCellValue(trqk1.getZhlb());  
           cell.setCellStyle(style);
           cell = row.createCell((short) 7);
           cell.setCellValue(trqk1.getQtcs());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 8);
           cell.setCellValue(trqk1.getSfhf());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 9);
           cell.setCellValue(trqk1.getYjhfsj());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 10);
           cell.setCellValue(trqk1.getTbsj());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 11);
           cell.setCellValue(trqk1.getTbdwmc());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 12);
           cell.setCellValue(trqk1.getTjr());  
           cell.setCellStyle(style);
           cell =  row.createCell((short) 13);
           cell.setCellValue(trqk1.getShry());  
           cell.setCellStyle(style);
        }  
		
		
		wb.write(out);
		out.close();
	}
	/**
	  * 设置合并单元格格式
	  * @param sheet
	  * @param region
	  * @param cs
	  */
	private static void setRegionStyle(CellStyle cs, CellRangeAddress region, Sheet sheet){  
       
       for(int i=region.getFirstRow();i<=region.getLastRow();i++){     
           Row row=sheet.getRow(i);  
           if(row==null) row=sheet.createRow(i);  
           for(int j=region.getFirstColumn();j<=region.getLastColumn();j++){  
               Cell cell=row.getCell(j);  
               if( cell==null){  
                   cell=row.createCell(j);  
                   cell.setCellValue("");  
               }  
                cell.setCellStyle(cs);  
           }  
       }  
   }  
}
