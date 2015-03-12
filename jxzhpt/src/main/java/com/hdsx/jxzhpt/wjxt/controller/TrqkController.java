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
import java.util.ArrayList;
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
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 系统管理Controller层
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class TrqkController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "trqkServerImpl")
	private TrqkServer trqkServer;
	private String gydw;
	private String tiaojian;
	private Trqk trqk=new Trqk();

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

	public Trqk getTrqk() {
		return trqk;
	}

	public void setTrqk(Trqk trqk) {
		this.trqk = trqk;
	}
	
	public void insertTrqk(){
		Boolean bl=trqkServer.insertTrqk(trqk);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectTrqkList(){
		trqk.setPage(page);
		trqk.setRows(rows);
		trqk.setGydw(gydw);
		trqk.setTiaojian(tiaojian);
		int count=trqkServer.selectTrqkListCount(trqk);
		List<Trqk> list=trqkServer.selectTrqkList(trqk);
		EasyUIPage<Trqk> e=new EasyUIPage<Trqk>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void updateTrqk(){
		boolean bl=trqkServer.updateTrqk(trqk);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void deletetrqk(){
		boolean bl=trqkServer.deletetrqk(trqk);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	@SuppressWarnings({ "deprecation", "unused" })
	public void exportExcel_trqk(){
		try {
			trqk.setGydw(gydw);
			trqk.setTiaojian(tiaojian);
			List<Trqk> list = trqkServer.selectTrqkList1(trqk);
			HSSFWorkbook wb = new HSSFWorkbook();  
			HSSFSheet sheet = wb.createSheet("投入情况"); 
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
			cell.setCellValue("公路水毁抢修人财物投入情况");
			cell.setCellStyle(style); 
			sheet.setColumnWidth(0, 32 * 200);sheet.setColumnWidth(1, 32 * 100);sheet.setColumnWidth(2, 32 * 100);sheet.setColumnWidth(3, 32 * 100);sheet.setColumnWidth(4, 32 * 100);sheet.setColumnWidth(5, 32 * 100);sheet.setColumnWidth(6, 32 * 100);sheet.setColumnWidth(7, 32 * 100);sheet.setColumnWidth(8, 32 * 100);sheet.setColumnWidth(9, 32 * 100);sheet.setColumnWidth(10, 32 * 100);sheet.setColumnWidth(11, 32 * 100);sheet.setColumnWidth(12, 32 * 100);sheet.setColumnWidth(13, 32 * 140);sheet.setColumnWidth(14, 32 * 100);sheet.setColumnWidth(15, 32 * 200);sheet.setColumnWidth(16, 32 * 100);sheet.setColumnWidth(17, 32 * 100);
			style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
			row = sheet.createRow((int) 1);
			row.setHeightInPoints(20f);
			cell = row.createCell((short) 0);
			cell.setCellValue("单位");  
			cell.setCellStyle(style1); 
			cell = row.createCell((short) 1);
			cell.setCellValue("抢修人数(工日)");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 2);
			cell.setCellValue("材料");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 8);
			cell.setCellValue("设备(台班)");  
			cell.setCellStyle(style1); 
			cell = row.createCell((short) 13);
			cell.setCellValue("投入抢修经费(万元)");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 14);
			cell.setCellValue("填报时间");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 15);
			cell.setCellValue("填报单位");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 16);
			cell.setCellValue("统计人");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 17);
			cell.setCellValue("审核人");  
			cell.setCellStyle(style1);
			row = sheet.createRow((int) 2);
			row.setHeightInPoints(20f);
			cell = row.createCell((short) 2);
			cell.setCellValue("沥青(吨)");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 3);
			cell.setCellValue("水泥(吨)");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 4);
			cell.setCellValue("沙石(立方)");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 5);
			cell.setCellValue("编织袋(个)");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 6);
			cell.setCellValue("工业盐(吨)");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 7);
			cell.setCellValue("沥青冷补料");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 8);
			cell.setCellValue("挖掘机");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 9);
			cell.setCellValue("装载机"); 
			cell.setCellStyle(style1);
			cell = row.createCell((short) 10);
			cell.setCellValue("自卸汽车");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 11);
			cell.setCellValue("抽水台班");  
			cell.setCellStyle(style1);
			cell = row.createCell((short) 12);
			cell.setCellValue("设备台班小计");  
			cell.setCellStyle(style1);
			style.setFillBackgroundColor(IndexedColors.WHITE.getIndex());
			CellRangeAddress range = new CellRangeAddress(0,0,0,17);
			sheet.addMergedRegion(range);
			setRegionStyle(style,range,sheet);
			range = new CellRangeAddress(1,2,0,0);
			sheet.addMergedRegion(range);
			setRegionStyle(style1,range,sheet);
			range = new CellRangeAddress(1,2,1,1);
			sheet.addMergedRegion(range);
			setRegionStyle(style1,range,sheet);
			range = new CellRangeAddress(1,1,2,7);
			sheet.addMergedRegion(range);
			setRegionStyle(style1,range,sheet);
			range = new CellRangeAddress(1,1,8,12);
			sheet.addMergedRegion(range);
			setRegionStyle(style1,range,sheet);
			range = new CellRangeAddress(1,2,13,13);
			sheet.addMergedRegion(range);
			setRegionStyle(style1,range,sheet);
			range = new CellRangeAddress(1,2,14,14);
			sheet.addMergedRegion(range);
			setRegionStyle(style1,range,sheet);
			range = new CellRangeAddress(1,2,15,15);
			sheet.addMergedRegion(range);
			setRegionStyle(style1,range,sheet);
			range = new CellRangeAddress(1,2,16,16);
			sheet.addMergedRegion(range);
			setRegionStyle(style1,range,sheet);
			range = new CellRangeAddress(1,2,17,17);
			sheet.addMergedRegion(range);
			setRegionStyle(style1,range,sheet);
			HttpServletResponse response= getresponse();
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String("公路水毁抢修人财物投入情况".getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = response.getOutputStream();
			
			for (int i = 0; i < list.size(); i++)  
	        {  
	            row = sheet.createRow((int) i + 3);  
	            Trqk trqk1 = (Trqk) list.get(i);  
	            // 第四步，创建单元格，并设置值  
	           cell = row.createCell((short) 0);
	           cell.setCellValue(trqk1.getGydwmc());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 1);
	           cell.setCellValue(trqk1.getQxrs());  
	           cell.setCellStyle(style);
	           cell = row.createCell((short) 2);
	           cell.setCellValue(trqk1.getLq());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 3);
	           cell.setCellValue(trqk1.getSn());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 4);
	           cell.setCellValue(trqk1.getSs());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 5);
	           cell.setCellValue(trqk1.getBzd());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 6);
	           cell.setCellValue(trqk1.getGyy());  
	           cell.setCellStyle(style);
	           cell = row.createCell((short) 7);
	           cell.setCellValue(trqk1.getLqlbl());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 8);
	           cell.setCellValue(trqk1.getWjj());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 9);
	           cell.setCellValue(trqk1.getZzj());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 10);
	           cell.setCellValue(trqk1.getZxqc());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 11);
	           cell.setCellValue(trqk1.getCstb());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 12);
	           cell.setCellValue(trqk1.getSbtbxj());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 13);
	           cell.setCellValue(trqk1.getTrqxjf());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 14);
	           cell.setCellValue(trqk1.getTbsj());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 15);
	           cell.setCellValue(trqk1.getTbdwmc());  
	           cell.setCellStyle(style);
	           cell = row.createCell((short) 16);
	           cell.setCellValue(trqk1.getTjr());  
	           cell.setCellStyle(style);
	           cell =  row.createCell((short) 17);
	           cell.setCellValue(trqk1.getShry());  
	           cell.setCellStyle(style);
	        }  
			
			
			wb.write(out);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
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
