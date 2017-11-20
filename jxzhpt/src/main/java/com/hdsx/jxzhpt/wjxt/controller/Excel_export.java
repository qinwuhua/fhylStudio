package com.hdsx.jxzhpt.wjxt.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPrintSetup;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;

import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
/**
 * 功能：导出excel<br/>
 * 调用：方法excel_export<br/>
 * 需要参数：ExcelData   HttpServletResponse<br/>
 * @author qwh
 *
 */
public class Excel_export {
	public static void excel_exportjxzhqkb(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            	if(j==0){
            		cell.setCellValue(trqk1.getV_0());  
                    cell.setCellStyle(style);
            	}
            	if(j==1){
            		cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	
			}
        }
		CellRangeAddress range1 = new CellRangeAddress(3,3,1,2);
		sheet.addMergedRegion(range1);
		setRegionStyle(style,range1,sheet);
		CellRangeAddress range2 = new CellRangeAddress(4,4,1,2);
		sheet.addMergedRegion(range2);
		setRegionStyle(style,range2,sheet);
		CellRangeAddress range3 = new CellRangeAddress(5,8,0,0);
		sheet.addMergedRegion(range3);
		setRegionStyle(style,range3,sheet);
		CellRangeAddress range4 = new CellRangeAddress(5,8,1,1);
		sheet.addMergedRegion(range4);
		setRegionStyle(style,range4,sheet);
		CellRangeAddress range5 = new CellRangeAddress(9,12,0,0);
		sheet.addMergedRegion(range5);
		setRegionStyle(style,range5,sheet);
		CellRangeAddress range6 = new CellRangeAddress(9,12,1,1);
		sheet.addMergedRegion(range6);
		setRegionStyle(style,range6,sheet);
		CellRangeAddress range7 = new CellRangeAddress(13,13,1,2);
		sheet.addMergedRegion(range7);
		setRegionStyle(style,range7,sheet);
		CellRangeAddress range8 = new CellRangeAddress(14,14,1,2);
		sheet.addMergedRegion(range8);
		setRegionStyle(style,range8,sheet);
		CellRangeAddress range9 = new CellRangeAddress(15,15,1,2);
		sheet.addMergedRegion(range9);
		setRegionStyle(style,range9,sheet);
		
		
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	
	
	public static void excel_export(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            	if(j==0){
            		cell.setCellValue(trqk1.getV_0());  
                    cell.setCellStyle(style);
            	}
            	if(j==1){
            		cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//导出Gljsjhhzb
	public static void excel_exportGljsjhhzb(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		List<Integer> a=new ArrayList<Integer>();
		int flag=0; String flags="";
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
            if("".equals(flags)){
            	flags=trqk1.getV_0();
            }
            if(!flags.equals(trqk1.getV_0())){
            	a.add(flag);
            	flags=trqk1.getV_0();
            	flag=1;
            }else{
            	flag++;
            }
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            	if(j==0){
            		cell.setCellValue(trqk1.getV_0());  
                    cell.setCellStyle(style);
            	}
            	if(j==1){
            		cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }
		a.add(flag);
		int k=5;
		for (Integer l : a) {
			System.out.println(l+"   "+k);
			System.out.println(k+" --- "+(l+k-1));
			CellRangeAddress rangehb = new CellRangeAddress(k,l+k-1,0,0);
			k=l+k;
			sheet.addMergedRegion(rangehb);
			setRegionStyle(style,rangehb,sheet);
		}
		
		
		
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	
	public static void excel_exportHZB(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); //自动适应宽度
		}
		HSSFPrintSetup printSetup = sheet.getPrintSetup();
		printSetup.setLandscape(true);
		printSetup.setPaperSize(HSSFPrintSetup.A3_PAPERSIZE); // 纸张
		
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
            
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            	if(j==0){
            		if(!trqk1.getV_0().equals("0")){
            			cell.setCellValue(trqk1.getXzqh());  
                        cell.setCellStyle(style);
                      //  System.out.println(i+"    "+trqk1.getV_0()+"   "+maxx);
                        CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+Integer.parseInt(trqk1.getV_0()),0,0);
            			sheet.addMergedRegion(ranges);
            			setRegionStyle(style,ranges,sheet);
            		}
            	}
            	if(j==1){
            		cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public static void excel_exportbyXH(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            	if(j==0){
            		cell.setCellValue(i+1);  
                    cell.setCellStyle(style);
            	}
            	if(j==1){
            		cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void excel_export1(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	if(j==0){
            		cell.setCellValue(trqk1.getV_0());  
                    cell.setCellStyle(style);
            		
            	}
            	if(j==1){
            		if(!trqk1.getV_1().equals(" ")){
            			cell.setCellValue(trqk1.getV_1());  
                        cell.setCellStyle(style);
            		}else{
            			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,0,1);
            			sheet.addMergedRegion(ranges);
            			setRegionStyle(style,ranges,sheet);
            		}
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public static void excel_exportGlgzxj(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style.setWrapText(true); 
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setWrapText(true); 
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setWrapText(true); 
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 15);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 9);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 
		
		HSSFPrintSetup ps = sheet.getPrintSetup(); 
	     
        
        ps.setLandscape(true); // 打印方向，true：横向，false：纵向(默认)    
        ps.setVResolution((short)600);    
        ps.setPaperSize(HSSFPrintSetup.A3_PAPERSIZE); //纸张类型
        
		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			if(i==0){
				sheet.setColumnWidth(i, 32 * 90);
			}
			else {
				sheet.setColumnWidth(i, 32 * 150);
//				sheet.autoSizeColumn((short)i); //自动适应宽度
			}
          
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				System.out.println(x1+"   "+x2+"    "+y1+"   "+y2);
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	if(j==0){
            		if(trqk1.getV_0().equals("是")){
            			cell.setCellValue("");  
                        cell.setCellStyle(style);
            		}else{
            			cell.setCellValue(trqk1.getV_0());  
                        cell.setCellStyle(style);
            		}         		
            	}
            	if(j==1){
        			cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		if(trqk1.getV_0().equals("是")){
        				cell.setCellValue(trqk1.getV_3());  
            			cell.setCellStyle(style);
            			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,3,4);
            			sheet.addMergedRegion(ranges);
            			setRegionStyle(style,ranges,sheet);
        			}else{
        				cell.setCellValue(trqk1.getV_3());  
            			cell.setCellStyle(style);
        			}
            	}
            	if(j==4){
            			
            			if(trqk1.getV_0().equals("是")){
            				cell.setCellValue(trqk1.getV_3());  
                			cell.setCellStyle(style);
                			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,3,4);
                			sheet.addMergedRegion(ranges);
                			setRegionStyle(style,ranges,sheet);
            			}else{
            				cell.setCellValue(trqk1.getV_4());  
                			cell.setCellStyle(style);
            			}
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public static void excel_export11(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	if(j==0){
            		cell.setCellValue(trqk1.getV_0());  
                    cell.setCellStyle(style);
            		
            	}
            	if(j==1){
            		if(!trqk1.getV_0().equals(" ")){
            			cell.setCellValue(trqk1.getV_1());  
                        cell.setCellStyle(style);
            		}else{
            			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,0,1);
            			sheet.addMergedRegion(ranges);
            			setRegionStyle(style,ranges,sheet);
            		}
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	//
	public static void excel_export2(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	if(j==0){
            		if(trqk1.getV_0().equals("是")){
            			cell.setCellValue(trqk1.getV_1());  
                        cell.setCellStyle(style);
            		}else if(trqk1.getV_0().equals("是1")){
            			cell.setCellValue("");  
                        cell.setCellStyle(style);
            		}else{
            			cell.setCellValue(trqk1.getV_0());  
                        cell.setCellStyle(style);
            		}         		
            	}
            	if(j==1){
        			System.out.println(trqk1.getV_1());
        			cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            		if(trqk1.getV_0().equals(" ")){
            			cell.setCellValue(trqk1.getV_2());  
                        cell.setCellStyle(style);	
            		}else{
            			if(trqk1.getV_0().equals("是")){
                			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,0,2);
                			sheet.addMergedRegion(ranges);
                			setRegionStyle(style,ranges,sheet);
            			}else{
                			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,1,2);
                			sheet.addMergedRegion(ranges);
                			setRegionStyle(style,ranges,sheet);
            			}
            		}
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//wqjh
	//
	public static void excel_exportwqjh(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	if(j==0){
            			cell.setCellValue(trqk1.getV_0());  
                        cell.setCellStyle(style);    		
            	}
            	if(j==1){
        			cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
                        if(trqk1.getV_4().equals("")){
                			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,1,2);
                			sheet.addMergedRegion(ranges);
                			setRegionStyle(style,ranges,sheet);
            			}else{
            				cell.setCellValue(trqk1.getV_2());  
                            cell.setCellStyle(style);	
//                			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,1,2);
//                			sheet.addMergedRegion(ranges);
//                			setRegionStyle(style,ranges,sheet);
            		}
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//abjh
	public static void excel_exportabjh(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	if(j==0){
            			cell.setCellValue(trqk1.getV_0());  
                        cell.setCellStyle(style);    		
            	}
            	if(j==1){
        			cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            				cell.setCellValue(trqk1.getV_2());  
                            cell.setCellStyle(style);	
            	}
            	if(j==3){
            		if(trqk1.getV_1().equals("")){
            			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,0,3);
            			sheet.addMergedRegion(ranges);
            			setRegionStyle(style,ranges,sheet);
        			}else{
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
        			}
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//路网报表
	public static void excel_export3(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	if(j==0){
            		cell.setCellValue(trqk1.getV_0());  
                    cell.setCellStyle(style);
            		
            	}
            	if(j==1){
        			cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);	
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		if(trqk1.getV_22().equals("是")){
            			cell.setCellValue(trqk1.getV_3());  
                        cell.setCellStyle(style);
                        CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,1,3);
            			sheet.addMergedRegion(ranges);
            			setRegionStyle(style,ranges,sheet);
            		}else{
            			cell.setCellValue(trqk1.getV_3());  
                        cell.setCellStyle(style);
            		}
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//建设计划
	public static void excel_exportjsjh(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<SjbbMessage> el2 = el.getEl1();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            SjbbMessage trqk1 = (SjbbMessage) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	if(j==0){
            		cell.setCellValue(trqk1.getV_0());  
                    cell.setCellStyle(style);
            	}
            	if(j==1){
            		cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){            		
						cell.setCellValue((int)Double.parseDouble(trqk1.getV_2()));  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
			}
        }  
		CellRangeAddress range1 = new CellRangeAddress(3,6,0,0);
		sheet.addMergedRegion(range1);
		setRegionStyle(style,range1,sheet);
		CellRangeAddress range2 = new CellRangeAddress(7,9,0,0);
		sheet.addMergedRegion(range2);
		setRegionStyle(style,range2,sheet);
		CellRangeAddress range3 = new CellRangeAddress(10,12,0,0);
		sheet.addMergedRegion(range3);
		setRegionStyle(style,range3,sheet);
		CellRangeAddress range4 = new CellRangeAddress(2,2,0,1);
		sheet.addMergedRegion(range4);
		setRegionStyle(style,range4,sheet);
		
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//建设计划
		public static void excel_exportgdzc(ExcelData el,HttpServletResponse response) throws Exception{
			try{
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = response.getOutputStream();
			HSSFWorkbook wb = new HSSFWorkbook();  
			HSSFSheet sheet = wb.createSheet(el.getSheetName());
			HSSFRow row = sheet.createRow((int) 0); 
			HSSFCellStyle style = wb.createCellStyle();
			HSSFCellStyle style1 = wb.createCellStyle();
			HSSFCellStyle style2 = wb.createCellStyle();
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
			style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			HSSFCell cell = row.createCell((short) 0);
			row.setHeightInPoints(30f);
			HSSFFont font= wb.createFont();
			HSSFFont font1= wb.createFont();
			font.setFontName("楷体");
	        font.setFontHeightInPoints((short) 18);// 设置字体大小
			font1.setFontName("宋体");
	        font1.setFontHeightInPoints((short) 10);// 设置字体大小
	        style.setFont(font1);
	        style2.setFont(font);
			cell.setCellValue(el.getTitleName());
			cell.setCellStyle(style2); 

			List<Excel_tilte> et = el.getEt();
			int maxy=0;
			int maxx=0;
			int minx=1;
			row = sheet.createRow((int) 1);
			for (Excel_tilte excel_tilte : et) {
				
				row.setHeightInPoints(20f);
				int x1=excel_tilte.getX1();
				int x2=excel_tilte.getX2();
				int y1=excel_tilte.getY1();
				int y2=excel_tilte.getY2();
				if(y2>maxy){
					maxy=y2;
				}
				if(x2>maxx){
					maxx=x2;
				}
				if(x1>minx){
					minx=x1;
					row = sheet.createRow((int) x1);
				}
				cell = row.createCell((short) y1);
				cell.setCellValue(excel_tilte.getName());  
				cell.setCellStyle(style1);
				
				
			}
			for (int i = 0; i <=maxy ; i++) {
				sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
				//sheet.autoSizeColumn((short)i); 自动适应宽度
			}
			for (Excel_tilte excel_tilte : et){
				int x1=excel_tilte.getX1();
				int x2=excel_tilte.getX2();
				int y1=excel_tilte.getY1();
				int y2=excel_tilte.getY2();
				if(x1!=x2||y1!=y2){
					CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
					sheet.addMergedRegion(range);
					setRegionStyle(style1,range,sheet);
				}
			}
			CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
			sheet.addMergedRegion(range);
			setRegionStyle(style2,range,sheet);


			List<SjbbMessage> el2 = el.getEl1();
			for (int i = 0; i < el2.size(); i++)  
	        {  
	            row = sheet.createRow((int) i + maxx+1);  
	            SjbbMessage trqk1 = (SjbbMessage) el2.get(i);  
	            // 第四步，创建单元格，并设置值  
	         
	            for (int j = 0; j <= maxy; j++) {
	            	cell = row.createCell((short) j);
	            	if(j==0){
	            		cell.setCellValue(trqk1.getV_0());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==1){
	            		cell.setCellValue(trqk1.getV_1());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==2){
	            		cell.setCellValue(trqk1.getV_2());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==3){
	            		cell.setCellValue(trqk1.getV_3());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==4){
	            		cell.setCellValue(trqk1.getV_4());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==5){
	            		cell.setCellValue(trqk1.getV_5());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==6){
	            		cell.setCellValue(trqk1.getV_6());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==7){
	            		cell.setCellValue(trqk1.getV_7());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==8){
	            		cell.setCellValue(trqk1.getV_8());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==9){
	            		cell.setCellValue(trqk1.getV_9());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==10){
	            		cell.setCellValue(trqk1.getV_10());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==11){
	            		cell.setCellValue(trqk1.getV_11());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==12){
	            		cell.setCellValue(trqk1.getV_12());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==13){
	            		cell.setCellValue(trqk1.getV_13());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==14){
	            		cell.setCellValue(trqk1.getV_14());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==15){
	            		cell.setCellValue(trqk1.getV_15());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==16){
	            		cell.setCellValue(trqk1.getV_16());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==17){
	            		cell.setCellValue(trqk1.getV_17());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==18){
	            		cell.setCellValue(trqk1.getV_18());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==19){
	            		cell.setCellValue(trqk1.getV_19());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==20){
	            		cell.setCellValue(trqk1.getV_20());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==21){
	            		cell.setCellValue(trqk1.getV_21());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==22){
	            		cell.setCellValue(trqk1.getV_22());  
	                    cell.setCellStyle(style);
	            	}
	            	
	            	if(j==23){
	            		cell.setCellValue(trqk1.getV_23());  
	                    cell.setCellStyle(style);
	            	}if(j==24){
	            		cell.setCellValue(trqk1.getV_24());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==25){
	            		cell.setCellValue(trqk1.getV_25());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==26){
	            		cell.setCellValue(trqk1.getV_26());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==27){
	            		cell.setCellValue(trqk1.getV_27());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==28){
	            		cell.setCellValue(trqk1.getV_28());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==29){
	            		cell.setCellValue(trqk1.getV_29());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==30){
	            		cell.setCellValue(trqk1.getV_30());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==31){
	            		cell.setCellValue(trqk1.getV_31());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==32){
	            		cell.setCellValue(trqk1.getV_32());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==33){
	            		cell.setCellValue(trqk1.getV_33());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==34){
	            		cell.setCellValue(trqk1.getV_34());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==35){
	            		cell.setCellValue(trqk1.getV_35());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==36){
	            		cell.setCellValue(trqk1.getV_36());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==37){
	            		cell.setCellValue(trqk1.getV_37());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==38){
	            		cell.setCellValue(trqk1.getV_38());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==39){
	            		cell.setCellValue(trqk1.getV_39());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==40){
	            		cell.setCellValue(trqk1.getV_40());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==41){
	            		cell.setCellValue(trqk1.getV_41());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==42){
	            		cell.setCellValue(trqk1.getV_42());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==43){
	            		cell.setCellValue(trqk1.getV_43());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==44){
	            		cell.setCellValue(trqk1.getV_44());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==45){
	            		cell.setCellValue(trqk1.getV_45());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==46){
	            		cell.setCellValue(trqk1.getV_46());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==47){
	            		cell.setCellValue(trqk1.getV_47());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==48){
	            		cell.setCellValue(trqk1.getV_48());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==49){
	            		cell.setCellValue(trqk1.getV_49());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==50){
	            		cell.setCellValue(trqk1.getV_50());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==51){
	            		cell.setCellValue(trqk1.getV_51());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==52){
	            		cell.setCellValue(trqk1.getV_52());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==53){
	            		cell.setCellValue(trqk1.getV_53());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==54){
	            		cell.setCellValue(trqk1.getV_54());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==55){
	            		cell.setCellValue(trqk1.getV_55());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==56){
	            		cell.setCellValue(trqk1.getV_56());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==57){
	            		cell.setCellValue(trqk1.getV_57());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==58){
	            		cell.setCellValue(trqk1.getV_58());  
	                    cell.setCellStyle(style);
	            	}
				}
	        }  
			
			wb.write(out);
	 		out.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//进展情况
		public static void excel_exportjzqk(ExcelData el,HttpServletResponse response) throws Exception{
			try{
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = response.getOutputStream();
			HSSFWorkbook wb = new HSSFWorkbook();  
			HSSFSheet sheet = wb.createSheet(el.getSheetName());
			HSSFRow row = sheet.createRow((int) 0); 
			HSSFCellStyle style = wb.createCellStyle();
			HSSFCellStyle style1 = wb.createCellStyle();
			HSSFCellStyle style2 = wb.createCellStyle();
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
			style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			HSSFCell cell = row.createCell((short) 0);
			row.setHeightInPoints(30f);
			HSSFFont font= wb.createFont();
			HSSFFont font1= wb.createFont();
			font.setFontName("楷体");
	        font.setFontHeightInPoints((short) 18);// 设置字体大小
			font1.setFontName("宋体");
	        font1.setFontHeightInPoints((short) 10);// 设置字体大小
	        style.setFont(font1);
	        style2.setFont(font);
			cell.setCellValue(el.getTitleName());
			cell.setCellStyle(style2); 

			List<Excel_tilte> et = el.getEt();
			int maxy=0;
			int maxx=0;
			int minx=1;
			row = sheet.createRow((int) 1);
			for (Excel_tilte excel_tilte : et) {
				
				row.setHeightInPoints(20f);
				int x1=excel_tilte.getX1();
				int x2=excel_tilte.getX2();
				int y1=excel_tilte.getY1();
				int y2=excel_tilte.getY2();
				if(y2>maxy){
					maxy=y2;
				}
				if(x2>maxx){
					maxx=x2;
				}
				if(x1>minx){
					minx=x1;
					row = sheet.createRow((int) x1);
				}
				cell = row.createCell((short) y1);
				cell.setCellValue(excel_tilte.getName());  
				cell.setCellStyle(style1);
				
				
			}
			for (int i = 0; i <=maxy ; i++) {
				sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
				//sheet.autoSizeColumn((short)i); 自动适应宽度
			}
			for (Excel_tilte excel_tilte : et){
				int x1=excel_tilte.getX1();
				int x2=excel_tilte.getX2();
				int y1=excel_tilte.getY1();
				int y2=excel_tilte.getY2();
				if(x1!=x2||y1!=y2){
					CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
					sheet.addMergedRegion(range);
					setRegionStyle(style1,range,sheet);
				}
			}
			CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
			sheet.addMergedRegion(range);
			setRegionStyle(style2,range,sheet);


			List<SjbbMessage> el2 = el.getEl1();
			for (int i = 0; i < el2.size(); i++)  
	        {  
	            row = sheet.createRow((int) i + maxx+1);  
	            SjbbMessage trqk1 = (SjbbMessage) el2.get(i);  
	            // 第四步，创建单元格，并设置值  
	         
	            for (int j = 0; j <= maxy; j++) {
	            	cell = row.createCell((short) j);
	            	if(j==0){
	            		cell.setCellValue(trqk1.getV_0());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==1){
	            		cell.setCellValue(trqk1.getV_1());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==2){
	            		if(i==3){
	            			cell.setCellValue((int)Double.parseDouble(trqk1.getV_2()));  
		                    cell.setCellStyle(style);
	            		}else{
	            			cell.setCellValue(trqk1.getV_2());  
		                    cell.setCellStyle(style);
	            		}
	            		
	            	}
	            	if(j==3){
	            		cell.setCellValue(trqk1.getV_3());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==4){
	            		cell.setCellValue(trqk1.getV_4());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==5){
	            		cell.setCellValue(trqk1.getV_5());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==6){
	            		cell.setCellValue(trqk1.getV_6());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==7){
	            		if(i==3){
	            			cell.setCellValue((int)Double.parseDouble(trqk1.getV_7()));  
		                    cell.setCellStyle(style);
	            		}else{
	            			cell.setCellValue(trqk1.getV_7());  
		                    cell.setCellStyle(style);
	            		}
	            	}
	            	if(j==8){
	            		cell.setCellValue(trqk1.getV_8());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==9){
	            		cell.setCellValue(trqk1.getV_9());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==10){
	            		cell.setCellValue(trqk1.getV_10());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==11){
	            		cell.setCellValue(trqk1.getV_11());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==12){
	            		cell.setCellValue(trqk1.getV_12());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==13){
	            		cell.setCellValue(trqk1.getV_13());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==14){
	            		cell.setCellValue(trqk1.getV_14());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==15){
	            		cell.setCellValue(trqk1.getV_15());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==16){
	            		cell.setCellValue(trqk1.getV_16());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==17){
	            		cell.setCellValue(trqk1.getV_17());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==18){
	            		cell.setCellValue(trqk1.getV_18());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==19){
	            		cell.setCellValue(trqk1.getV_19());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==20){
	            		cell.setCellValue(trqk1.getV_20());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==21){
	            		cell.setCellValue(trqk1.getV_21());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==22){
	            		cell.setCellValue(trqk1.getV_22());  
	                    cell.setCellStyle(style);
	            	}
	            	
	            	if(j==23){
	            		cell.setCellValue(trqk1.getV_23());  
	                    cell.setCellStyle(style);
	            	}if(j==24){
	            		cell.setCellValue(trqk1.getV_24());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==25){
	            		cell.setCellValue(trqk1.getV_25());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==26){
	            		cell.setCellValue(trqk1.getV_26());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==27){
	            		cell.setCellValue(trqk1.getV_27());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==28){
	            		cell.setCellValue(trqk1.getV_28());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==29){
	            		cell.setCellValue(trqk1.getV_29());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==30){
	            		cell.setCellValue(trqk1.getV_30());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==31){
	            		cell.setCellValue(trqk1.getV_31());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==32){
	            		cell.setCellValue(trqk1.getV_32());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==33){
	            		cell.setCellValue(trqk1.getV_33());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==34){
	            		cell.setCellValue(trqk1.getV_34());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==35){
	            		cell.setCellValue(trqk1.getV_35());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==36){
	            		cell.setCellValue(trqk1.getV_36());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==37){
	            		cell.setCellValue(trqk1.getV_37());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==38){
	            		cell.setCellValue(trqk1.getV_38());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==39){
	            		cell.setCellValue(trqk1.getV_39());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==40){
	            		cell.setCellValue(trqk1.getV_40());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==41){
	            		cell.setCellValue(trqk1.getV_41());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==42){
	            		cell.setCellValue(trqk1.getV_42());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==43){
	            		cell.setCellValue(trqk1.getV_43());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==44){
	            		cell.setCellValue(trqk1.getV_44());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==45){
	            		cell.setCellValue(trqk1.getV_45());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==46){
	            		cell.setCellValue(trqk1.getV_46());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==47){
	            		cell.setCellValue(trqk1.getV_47());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==48){
	            		cell.setCellValue(trqk1.getV_48());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==49){
	            		cell.setCellValue(trqk1.getV_49());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==50){
	            		cell.setCellValue(trqk1.getV_50());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==51){
	            		cell.setCellValue(trqk1.getV_51());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==52){
	            		cell.setCellValue(trqk1.getV_52());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==53){
	            		cell.setCellValue(trqk1.getV_53());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==54){
	            		cell.setCellValue(trqk1.getV_54());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==55){
	            		cell.setCellValue(trqk1.getV_55());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==56){
	            		cell.setCellValue(trqk1.getV_56());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==57){
	            		cell.setCellValue(trqk1.getV_57());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==58){
	            		cell.setCellValue(trqk1.getV_58());  
	                    cell.setCellStyle(style);
	            	}
				}
	        }  
			CellRangeAddress range1 = new CellRangeAddress(5,7,0,0);
			sheet.addMergedRegion(range1);
			setRegionStyle(style,range1,sheet);
			CellRangeAddress range2 = new CellRangeAddress(8,10,0,0);
			sheet.addMergedRegion(range2);
			setRegionStyle(style,range2,sheet);
			
			wb.write(out);
	 		out.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		public static void excel_exportmxb(ExcelData el,HttpServletResponse response) throws Exception{
			try{
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = response.getOutputStream();
			HSSFWorkbook wb = new HSSFWorkbook();  
			HSSFSheet sheet = wb.createSheet(el.getSheetName());
			HSSFRow row = sheet.createRow((int) 0); 
			HSSFCellStyle style = wb.createCellStyle();
			HSSFCellStyle style1 = wb.createCellStyle();
			HSSFCellStyle style2 = wb.createCellStyle();
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style.setWrapText(true);
		    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style1.setWrapText(true);
		    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style2.setWrapText(true);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
			style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			HSSFCell cell = row.createCell((short) 0);
			
			row.setHeightInPoints(30f);
			HSSFFont font= wb.createFont();
			HSSFFont font1= wb.createFont();
			font.setFontName("楷体");
	        font.setFontHeightInPoints((short) 13);// 设置字体大小
			font1.setFontName("宋体");
	        font1.setFontHeightInPoints((short) 9);// 设置字体大小
	        HSSFPrintSetup ps = sheet.getPrintSetup(); 
	     
           
	        ps.setLandscape(true); // 打印方向，true：横向，false：纵向(默认)    
            ps.setVResolution((short)600);    
            ps.setPaperSize(HSSFPrintSetup.A3_PAPERSIZE); //纸张类型
            
	        style.setFont(font1);
	        style2.setFont(font);
			cell.setCellValue(el.getTitleName());
			cell.setCellStyle(style2); 
			
			List<Excel_tilte> et = el.getEt();
			int maxy=0;
			int maxx=0;
			int minx=1;
			row = sheet.createRow((int) 1);
			for (Excel_tilte excel_tilte : et) {
				
				row.setHeightInPoints(40f);
				int x1=excel_tilte.getX1();
				int x2=excel_tilte.getX2();
				int y1=excel_tilte.getY1();
				int y2=excel_tilte.getY2();
				if(y2>maxy){
					maxy=y2;
				}
				if(x2>maxx){
					maxx=x2;
				}
				if(x1>minx){
					minx=x1;
					row = sheet.createRow((int) x1);
				}
				cell = row.createCell((short) y1);
				cell.setCellValue(excel_tilte.getName());  
				cell.setCellStyle(style1);
				
			}
			for (int i = 0; i <=maxy ; i++) {
				if(i==0)sheet.setColumnWidth(i, 32 * 30);
				else if(i==1)sheet.setColumnWidth(i, 32 * 50);
				else if(i==3)sheet.setColumnWidth(i, 32 * 50);
				else if(i==13)sheet.setColumnWidth(i, 32 * 50);
				else{
					sheet.setColumnWidth(i, 32 * 110);//设置固定宽度150
				}
//				sheet.autoSizeColumn((short)i); //自动适应宽度
			}
			for (Excel_tilte excel_tilte : et){
				int x1=excel_tilte.getX1();
				int x2=excel_tilte.getX2();
				int y1=excel_tilte.getY1();
				int y2=excel_tilte.getY2();
				if(x1!=x2||y1!=y2){
					CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
					sheet.addMergedRegion(range);
					setRegionStyle(style1,range,sheet);
				}
			}
			CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
			sheet.addMergedRegion(range);
			setRegionStyle(style2,range,sheet);


			List<Excel_list> el2 = el.getEl();
			for (int i = 0; i < el2.size(); i++)  
	        {  
	            row = sheet.createRow((int) i + maxx+1);  
	            Excel_list trqk1 = (Excel_list) el2.get(i);  
	            // 第四步，创建单元格，并设置值  
	         
	            for (int j = 0; j <= maxy; j++) {
	            	cell = row.createCell((short) j);
	            	if(j==0){
	            		cell.setCellValue(trqk1.getV_0());  
	                    cell.setCellStyle(style);
	            		
	            	}
	            	if(j==1){
	            		if(!trqk1.getV_0().equals("全省汇总")){
	            			cell.setCellValue(trqk1.getV_1());  
	                        cell.setCellStyle(style);
	            		}else{
	            			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,0,1);
	            			sheet.addMergedRegion(ranges);
	            			setRegionStyle(style,ranges,sheet);
	            		}
	            	}
	            	if(j==2){
	            		cell.setCellValue(trqk1.getV_2());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==3){
	            		cell.setCellValue(trqk1.getV_3());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==4){
	            		cell.setCellValue(trqk1.getV_4());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==5){
	            		cell.setCellValue(trqk1.getV_5());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==6){
	            		cell.setCellValue(trqk1.getV_6());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==7){
	            		cell.setCellValue(trqk1.getV_7());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==8){
	            		cell.setCellValue(trqk1.getV_8());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==9){
	            		cell.setCellValue(trqk1.getV_9());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==10){
	            		cell.setCellValue(trqk1.getV_10());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==11){
	            		cell.setCellValue(trqk1.getV_11());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==12){
	            		cell.setCellValue(trqk1.getV_12());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==13){
	            		cell.setCellValue(trqk1.getV_13());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==14){
	            		cell.setCellValue(trqk1.getV_14());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==15){
	            		cell.setCellValue(trqk1.getV_15());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==16){
	            		cell.setCellValue(trqk1.getV_16());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==17){
	            		cell.setCellValue(trqk1.getV_17());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==18){
	            		cell.setCellValue(trqk1.getV_18());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==19){
	            		cell.setCellValue(trqk1.getV_19());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==20){
	            		cell.setCellValue(trqk1.getV_20());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==21){
	            		cell.setCellValue(trqk1.getV_21());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==22){
	            		cell.setCellValue(trqk1.getV_22());  
	                    cell.setCellStyle(style);
	            	}
	            	
	            	if(j==23){
	            		cell.setCellValue(trqk1.getV_23());  
	                    cell.setCellStyle(style);
	            	}if(j==24){
	            		cell.setCellValue(trqk1.getV_24());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==25){
	            		cell.setCellValue(trqk1.getV_25());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==26){
	            		cell.setCellValue(trqk1.getV_26());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==27){
	            		cell.setCellValue(trqk1.getV_27());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==28){
	            		cell.setCellValue(trqk1.getV_28());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==29){
	            		cell.setCellValue(trqk1.getV_29());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==30){
	            		cell.setCellValue(trqk1.getV_30());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==31){
	            		cell.setCellValue(trqk1.getV_31());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==32){
	            		cell.setCellValue(trqk1.getV_32());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==33){
	            		cell.setCellValue(trqk1.getV_33());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==34){
	            		cell.setCellValue(trqk1.getV_34());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==35){
	            		cell.setCellValue(trqk1.getV_35());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==36){
	            		cell.setCellValue(trqk1.getV_36());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==37){
	            		cell.setCellValue(trqk1.getV_37());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==38){
	            		cell.setCellValue(trqk1.getV_38());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==39){
	            		cell.setCellValue(trqk1.getV_39());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==40){
	            		cell.setCellValue(trqk1.getV_40());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==41){
	            		cell.setCellValue(trqk1.getV_41());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==42){
	            		cell.setCellValue(trqk1.getV_42());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==43){
	            		cell.setCellValue(trqk1.getV_43());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==44){
	            		cell.setCellValue(trqk1.getV_44());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==45){
	            		cell.setCellValue(trqk1.getV_45());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==46){
	            		cell.setCellValue(trqk1.getV_46());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==47){
	            		cell.setCellValue(trqk1.getV_47());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==48){
	            		cell.setCellValue(trqk1.getV_48());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==49){
	            		cell.setCellValue(trqk1.getV_49());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==50){
	            		cell.setCellValue(trqk1.getV_50());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==51){
	            		cell.setCellValue(trqk1.getV_51());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==52){
	            		cell.setCellValue(trqk1.getV_52());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==53){
	            		cell.setCellValue(trqk1.getV_53());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==54){
	            		cell.setCellValue(trqk1.getV_54());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==55){
	            		cell.setCellValue(trqk1.getV_55());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==56){
	            		cell.setCellValue(trqk1.getV_56());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==57){
	            		cell.setCellValue(trqk1.getV_57());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==58){
	            		cell.setCellValue(trqk1.getV_58());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==59){
	            		cell.setCellValue(trqk1.getV_59());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==60){
	            		cell.setCellValue(trqk1.getV_60());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==61){
	            		cell.setCellValue(trqk1.getV_61());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==62){
	            		cell.setCellValue(trqk1.getV_62());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==63){
	            		cell.setCellValue(trqk1.getV_63());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==64){
	            		cell.setCellValue(trqk1.getV_64());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==65){
	            		cell.setCellValue(trqk1.getV_65());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==66){
	            		cell.setCellValue(trqk1.getV_66());  
	                    cell.setCellStyle(style);
	            	}if(j==67){
	            		cell.setCellValue(trqk1.getV_67());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==68){
	            		cell.setCellValue(trqk1.getV_68());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==69){
	            		cell.setCellValue(trqk1.getV_69());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==70){
	            		cell.setCellValue(trqk1.getV_70());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==71){
	            		cell.setCellValue(trqk1.getV_71());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==72){
	            		cell.setCellValue(trqk1.getV_72());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==73){
	            		cell.setCellValue(trqk1.getV_73());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==74){
	            		cell.setCellValue(trqk1.getV_74());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==75){
	            		cell.setCellValue(trqk1.getV_75());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==76){
	            		cell.setCellValue(trqk1.getV_76());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==77){
	            		cell.setCellValue(trqk1.getV_77());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==78){
	            		cell.setCellValue(trqk1.getV_78());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==79){
	            		cell.setCellValue(trqk1.getV_79());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==80){
	            		cell.setCellValue(trqk1.getV_80());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==81){
	            		cell.setCellValue(trqk1.getV_81());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==82){
	            		cell.setCellValue(trqk1.getV_82());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==83){
	            		cell.setCellValue(trqk1.getV_83());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==84){
	            		cell.setCellValue(trqk1.getV_84());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==85){
	            		cell.setCellValue(trqk1.getV_85());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==86){
	            		cell.setCellValue(trqk1.getV_86());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==87){
	            		cell.setCellValue(trqk1.getV_87());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==88){
	            		cell.setCellValue(trqk1.getV_88());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==89){
	            		cell.setCellValue(trqk1.getV_89());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==90){
	            		cell.setCellValue(trqk1.getV_90());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==91){
	            		cell.setCellValue(trqk1.getV_91());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==92){
	            		cell.setCellValue(trqk1.getV_92());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==93){
	            		cell.setCellValue(trqk1.getV_93());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==94){
	            		cell.setCellValue(trqk1.getV_94());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==95){
	            		cell.setCellValue(trqk1.getV_95());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==96){
	            		cell.setCellValue(trqk1.getV_96());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==97){
	            		cell.setCellValue(trqk1.getV_97());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==98){
	            		cell.setCellValue(trqk1.getV_98());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==99){
	            		cell.setCellValue(trqk1.getV_99());  
	                    cell.setCellStyle(style);
	            	}
				}
	        }  
			/*
			  for (Excel_tilte excel_tilte : et){
				int x1=excel_tilte.getX1();
				if(excel_tilte.isSfyc()){
					sheet.setColumnHidden(x1, true);
				}
			}
			*/
			wb.write(out);
	 		out.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}

		//ptgx
		public static void excel_exportptgx(ExcelData el,HttpServletResponse response) throws Exception{
			try{
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = response.getOutputStream();
			HSSFWorkbook wb = new HSSFWorkbook();  
			HSSFSheet sheet = wb.createSheet(el.getSheetName());
			HSSFRow row = sheet.createRow((int) 0); 
			HSSFCellStyle style = wb.createCellStyle();
			HSSFCellStyle style1 = wb.createCellStyle();
			HSSFCellStyle style2 = wb.createCellStyle();
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
			style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			HSSFCell cell = row.createCell((short) 0);
			row.setHeightInPoints(30f);
			HSSFFont font= wb.createFont();
			HSSFFont font1= wb.createFont();
			font.setFontName("楷体");
	        font.setFontHeightInPoints((short) 18);// 设置字体大小
			font1.setFontName("宋体");
	        font1.setFontHeightInPoints((short) 10);// 设置字体大小
	        style.setFont(font1);
	        style2.setFont(font);
			cell.setCellValue(el.getTitleName());
			cell.setCellStyle(style2); 

			List<Excel_tilte> et = el.getEt();
			int maxy=0;
			int maxx=0;
			int minx=1;
			row = sheet.createRow((int) 1);
			for (Excel_tilte excel_tilte : et) {
				
				row.setHeightInPoints(20f);
				int x1=excel_tilte.getX1();
				int x2=excel_tilte.getX2();
				int y1=excel_tilte.getY1();
				int y2=excel_tilte.getY2();
				if(y2>maxy){
					maxy=y2;
				}
				if(x2>maxx){
					maxx=x2;
				}
				if(x1>minx){
					minx=x1;
					row = sheet.createRow((int) x1);
				}
				cell = row.createCell((short) y1);
				cell.setCellValue(excel_tilte.getName());  
				cell.setCellStyle(style1);
				
				
			}
			for (int i = 0; i <=maxy ; i++) {
				sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
				//sheet.autoSizeColumn((short)i); 自动适应宽度
			}
			for (Excel_tilte excel_tilte : et){
				int x1=excel_tilte.getX1();
				int x2=excel_tilte.getX2();
				int y1=excel_tilte.getY1();
				int y2=excel_tilte.getY2();
				if(x1!=x2||y1!=y2){
					CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
					sheet.addMergedRegion(range);
					setRegionStyle(style1,range,sheet);
				}
			}
			CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
			sheet.addMergedRegion(range);
			setRegionStyle(style2,range,sheet);


			List<Excel_list> el2 = el.getEl();
			List<int[]> lists=new ArrayList<int[]>();
			for (int i = 0; i < el2.size(); i++)  
	        {  
	            row = sheet.createRow((int) i + maxx+1);  
	            Excel_list trqk1 = (Excel_list) el2.get(i);  
	            // 第四步，创建单元格，并设置值  
	         
	            for (int j = 0; j <= maxy; j++) {
	            	cell = row.createCell((short) j);
	            	if(j==0){
	            		cell.setCellValue(trqk1.getV_0());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==1){
	            		cell.setCellValue(trqk1.getV_1());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==2){
	            		cell.setCellValue(trqk1.getV_2());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==3){
	            		cell.setCellValue(trqk1.getV_3());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==4){
	            		cell.setCellValue(trqk1.getV_4());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==5){
	            		cell.setCellValue(trqk1.getV_5());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==6){
	            		cell.setCellValue(trqk1.getV_6());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==7){
	            		cell.setCellValue(trqk1.getV_7());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==8){
	            		cell.setCellValue(trqk1.getV_8());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==9){
	            		cell.setCellValue(trqk1.getV_9());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==10){
	            		cell.setCellValue(trqk1.getV_10());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==11){
	            		cell.setCellValue(trqk1.getV_11());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==12){
	            		cell.setCellValue(trqk1.getV_12());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==13){
	            		cell.setCellValue(trqk1.getV_13());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==14){
	            		cell.setCellValue(trqk1.getV_14());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==15){
	            		cell.setCellValue(trqk1.getV_15());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==16){
	            		cell.setCellValue(trqk1.getV_16());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==17){
	            		cell.setCellValue(trqk1.getV_17());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==18){
	            		cell.setCellValue(trqk1.getV_18());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==19){
	            		cell.setCellValue(trqk1.getV_19());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==20){
	            		cell.setCellValue(trqk1.getV_20());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==21){
	            		cell.setCellValue(trqk1.getV_21());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==22){
	            		cell.setCellValue(trqk1.getV_22());  
	                    cell.setCellStyle(style);
	            	}
	            	
	            	if(j==23){
	            		cell.setCellValue(trqk1.getV_23());  
	                    cell.setCellStyle(style);
	            	}if(j==24){
	            		cell.setCellValue(trqk1.getV_24());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==25){
	            		cell.setCellValue(trqk1.getV_25());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==26){
	            		cell.setCellValue(trqk1.getV_26());  
	                    cell.setCellStyle(style);
	            	}
	            	if(Integer.parseInt(trqk1.getV_27())>1){
	            		lists.add( new int[]{(int) i + maxx+1,Integer.parseInt(trqk1.getV_27())});
	            	}
				}
	        }
			for (int[] is : lists) {
				CellRangeAddress range0 = new CellRangeAddress(is[0],is[0]+is[1]-1,0,0);
				sheet.addMergedRegion(range0);
				setRegionStyle(style,range0,sheet);
				CellRangeAddress range1 = new CellRangeAddress(is[0],is[0]+is[1]-1,1,1);
				sheet.addMergedRegion(range1);
				setRegionStyle(style,range1,sheet);
				CellRangeAddress range2 = new CellRangeAddress(is[0],is[0]+is[1]-1,2,2);
				sheet.addMergedRegion(range2);
				setRegionStyle(style,range2,sheet);
				CellRangeAddress range3 = new CellRangeAddress(is[0],is[0]+is[1]-1,3,3);
				sheet.addMergedRegion(range3);
				setRegionStyle(style,range3,sheet);
				CellRangeAddress range5 = new CellRangeAddress(is[0],is[0]+is[1]-1,5,5);
				sheet.addMergedRegion(range5);
				setRegionStyle(style,range5,sheet);
				CellRangeAddress range6 = new CellRangeAddress(is[0],is[0]+is[1]-1,6,6);
				sheet.addMergedRegion(range6);
				setRegionStyle(style,range6,sheet);
				CellRangeAddress range7 = new CellRangeAddress(is[0],is[0]+is[1]-1,7,7);
				sheet.addMergedRegion(range7);
				setRegionStyle(style,range7,sheet);
				CellRangeAddress range8 = new CellRangeAddress(is[0],is[0]+is[1]-1,8,8);
				sheet.addMergedRegion(range8);
				setRegionStyle(style,range8,sheet);
				for (int k = 13; k < 24; k++) {
					CellRangeAddress range9 = new CellRangeAddress(is[0],is[0]+is[1]-1,k,k);
					sheet.addMergedRegion(range9);
					setRegionStyle(style,range9,sheet);
				}
			}
			wb.write(out);
	 		out.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	//计划审核excel报表
		public static void excel_exportjhsh(ExcelData el,HttpServletResponse response) throws Exception{
			try{
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = response.getOutputStream();
			HSSFWorkbook wb = new HSSFWorkbook();  
			HSSFSheet sheet = wb.createSheet(el.getSheetName());
			HSSFRow row = sheet.createRow((int) 0); 
			HSSFCellStyle style = wb.createCellStyle();
			HSSFCellStyle style1 = wb.createCellStyle();
			HSSFCellStyle style2 = wb.createCellStyle();
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
			style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			HSSFCell cell = row.createCell((short) 0);
			row.setHeightInPoints(30f);
			HSSFFont font= wb.createFont();
			HSSFFont font1= wb.createFont();
			font.setFontName("楷体");
	        font.setFontHeightInPoints((short) 18);// 设置字体大小
			font1.setFontName("宋体");
	        font1.setFontHeightInPoints((short) 10);// 设置字体大小
	        style.setFont(font1);
	        style2.setFont(font);
			cell.setCellValue(el.getTitleName());
			cell.setCellStyle(style2); 

			List<Excel_tilte> et = el.getEt();
			int maxy=0;
			int maxx=0;
			int minx=1;
			row = sheet.createRow((int) 1);
			for (Excel_tilte excel_tilte : et) {
				
				row.setHeightInPoints(20f);
				int x1=excel_tilte.getX1();
				int x2=excel_tilte.getX2();
				int y1=excel_tilte.getY1();
				int y2=excel_tilte.getY2();
				if(y2>maxy){
					maxy=y2;
				}
				if(x2>maxx){
					maxx=x2;
				}
				if(x1>minx){
					minx=x1;
					row = sheet.createRow((int) x1);
				}
				cell = row.createCell((short) y1);
				cell.setCellValue(excel_tilte.getName());  
				cell.setCellStyle(style1);
				
				
			}
			for (int i = 0; i <=maxy ; i++) {
				sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
				//sheet.autoSizeColumn((short)i); 自动适应宽度
			}
			for (Excel_tilte excel_tilte : et){
				int x1=excel_tilte.getX1();
				int x2=excel_tilte.getX2();
				int y1=excel_tilte.getY1();
				int y2=excel_tilte.getY2();
				if(x1!=x2||y1!=y2){
					CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
					sheet.addMergedRegion(range);
					setRegionStyle(style1,range,sheet);
				}
			}
			CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
			sheet.addMergedRegion(range);
			setRegionStyle(style2,range,sheet);


			List<Excel_list> el2 = el.getEl();
			for (int i = 0; i < el2.size(); i++)  
	        {  
	            row = sheet.createRow((int) i + maxx+1);  
	            Excel_list trqk1 = (Excel_list) el2.get(i);  
	            // 第四步，创建单元格，并设置值  
	         
	            for (int j = 0; j <= maxy; j++) {
	            	cell = row.createCell((short) j);
	            	if(j==0){
	            		cell.setCellValue(trqk1.getV_0());  
	                    cell.setCellStyle(style);
	            		
	            	}
	            	if(j==1){
	            		cell.setCellValue(trqk1.getV_1());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==2){
	            		if(!trqk1.getV_4().equals(" ")){
	            			cell.setCellValue(trqk1.getV_2());  
		                    cell.setCellStyle(style);
	            		}else{
	            			CellRangeAddress ranges = new CellRangeAddress((int) i + maxx+1,(int) i + maxx+1,1,2);
	            			sheet.addMergedRegion(ranges);
	            			setRegionStyle(style,ranges,sheet);
	            		}
	            		
	            	}
	            	if(j==3){
	            		cell.setCellValue(trqk1.getV_3());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==4){
	            		cell.setCellValue(trqk1.getV_4());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==5){
	            		cell.setCellValue(trqk1.getV_5());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==6){
	            		cell.setCellValue(trqk1.getV_6());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==7){
	            		cell.setCellValue(trqk1.getV_7());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==8){
	            		cell.setCellValue(trqk1.getV_8());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==9){
	            		cell.setCellValue(trqk1.getV_9());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==10){
	            		cell.setCellValue(trqk1.getV_10());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==11){
	            		cell.setCellValue(trqk1.getV_11());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==12){
	            		cell.setCellValue(trqk1.getV_12());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==13){
	            		cell.setCellValue(trqk1.getV_13());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==14){
	            		cell.setCellValue(trqk1.getV_14());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==15){
	            		cell.setCellValue(trqk1.getV_15());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==16){
	            		cell.setCellValue(trqk1.getV_16());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==17){
	            		cell.setCellValue(trqk1.getV_17());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==18){
	            		cell.setCellValue(trqk1.getV_18());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==19){
	            		cell.setCellValue(trqk1.getV_19());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==20){
	            		cell.setCellValue(trqk1.getV_20());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==21){
	            		cell.setCellValue(trqk1.getV_21());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==22){
	            		cell.setCellValue(trqk1.getV_22());  
	                    cell.setCellStyle(style);
	            	}
	            	
	            	if(j==23){
	            		cell.setCellValue(trqk1.getV_23());  
	                    cell.setCellStyle(style);
	            	}if(j==24){
	            		cell.setCellValue(trqk1.getV_24());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==25){
	            		cell.setCellValue(trqk1.getV_25());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==26){
	            		cell.setCellValue(trqk1.getV_26());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==27){
	            		cell.setCellValue(trqk1.getV_27());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==28){
	            		cell.setCellValue(trqk1.getV_28());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==29){
	            		cell.setCellValue(trqk1.getV_29());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==30){
	            		cell.setCellValue(trqk1.getV_30());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==31){
	            		cell.setCellValue(trqk1.getV_31());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==32){
	            		cell.setCellValue(trqk1.getV_32());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==33){
	            		cell.setCellValue(trqk1.getV_33());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==34){
	            		cell.setCellValue(trqk1.getV_34());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==35){
	            		cell.setCellValue(trqk1.getV_35());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==36){
	            		cell.setCellValue(trqk1.getV_36());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==37){
	            		cell.setCellValue(trqk1.getV_37());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==38){
	            		cell.setCellValue(trqk1.getV_38());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==39){
	            		cell.setCellValue(trqk1.getV_39());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==40){
	            		cell.setCellValue(trqk1.getV_40());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==41){
	            		cell.setCellValue(trqk1.getV_41());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==42){
	            		cell.setCellValue(trqk1.getV_42());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==43){
	            		cell.setCellValue(trqk1.getV_43());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==44){
	            		cell.setCellValue(trqk1.getV_44());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==45){
	            		cell.setCellValue(trqk1.getV_45());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==46){
	            		cell.setCellValue(trqk1.getV_46());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==47){
	            		cell.setCellValue(trqk1.getV_47());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==48){
	            		cell.setCellValue(trqk1.getV_48());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==49){
	            		cell.setCellValue(trqk1.getV_49());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==50){
	            		cell.setCellValue(trqk1.getV_50());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==51){
	            		cell.setCellValue(trqk1.getV_51());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==52){
	            		cell.setCellValue(trqk1.getV_52());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==53){
	            		cell.setCellValue(trqk1.getV_53());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==54){
	            		cell.setCellValue(trqk1.getV_54());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==55){
	            		cell.setCellValue(trqk1.getV_55());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==56){
	            		cell.setCellValue(trqk1.getV_56());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==57){
	            		cell.setCellValue(trqk1.getV_57());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==58){
	            		cell.setCellValue(trqk1.getV_58());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==59){
	            		cell.setCellValue(trqk1.getV_59());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==60){
	            		cell.setCellValue(trqk1.getV_60());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==61){
	            		cell.setCellValue(trqk1.getV_61());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==62){
	            		cell.setCellValue(trqk1.getV_62());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==63){
	            		cell.setCellValue(trqk1.getV_63());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==64){
	            		cell.setCellValue(trqk1.getV_64());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==65){
	            		cell.setCellValue(trqk1.getV_65());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==66){
	            		cell.setCellValue(trqk1.getV_66());  
	                    cell.setCellStyle(style);
	            	}if(j==67){
	            		cell.setCellValue(trqk1.getV_67());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==68){
	            		cell.setCellValue(trqk1.getV_68());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==69){
	            		cell.setCellValue(trqk1.getV_69());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==70){
	            		cell.setCellValue(trqk1.getV_70());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==71){
	            		cell.setCellValue(trqk1.getV_71());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==72){
	            		cell.setCellValue(trqk1.getV_72());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==73){
	            		cell.setCellValue(trqk1.getV_73());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==74){
	            		cell.setCellValue(trqk1.getV_74());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==75){
	            		cell.setCellValue(trqk1.getV_75());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==76){
	            		cell.setCellValue(trqk1.getV_76());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==77){
	            		cell.setCellValue(trqk1.getV_77());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==78){
	            		cell.setCellValue(trqk1.getV_78());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==79){
	            		cell.setCellValue(trqk1.getV_79());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==80){
	            		cell.setCellValue(trqk1.getV_80());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==81){
	            		cell.setCellValue(trqk1.getV_81());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==82){
	            		cell.setCellValue(trqk1.getV_82());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==83){
	            		cell.setCellValue(trqk1.getV_83());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==84){
	            		cell.setCellValue(trqk1.getV_84());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==85){
	            		cell.setCellValue(trqk1.getV_85());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==86){
	            		cell.setCellValue(trqk1.getV_86());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==87){
	            		cell.setCellValue(trqk1.getV_87());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==88){
	            		cell.setCellValue(trqk1.getV_88());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==89){
	            		cell.setCellValue(trqk1.getV_89());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==90){
	            		cell.setCellValue(trqk1.getV_90());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==91){
	            		cell.setCellValue(trqk1.getV_91());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==92){
	            		cell.setCellValue(trqk1.getV_92());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==93){
	            		cell.setCellValue(trqk1.getV_93());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==94){
	            		cell.setCellValue(trqk1.getV_94());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==95){
	            		cell.setCellValue(trqk1.getV_95());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==96){
	            		cell.setCellValue(trqk1.getV_96());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==97){
	            		cell.setCellValue(trqk1.getV_97());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==98){
	            		cell.setCellValue(trqk1.getV_98());  
	                    cell.setCellStyle(style);
	            	}
	            	if(j==99){
	            		cell.setCellValue(trqk1.getV_99());  
	                    cell.setCellStyle(style);
	            	}
				}
	        }  
			wb.write(out);
	 		out.close();
			}catch(Exception e){
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
	
	//导出三件实事
	public static void excel_exportsjss(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xls");
		OutputStream out = response.getOutputStream();
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(el.getSheetName());
		HSSFRow row = sheet.createRow((int) 0); 
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCellStyle style1 = wb.createCellStyle();
		HSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFCell cell = row.createCell((short) 0);
		row.setHeightInPoints(30f);
		HSSFFont font= wb.createFont();
		HSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	if(j==0){
            		cell.setCellValue(trqk1.getV_0());  
                    cell.setCellStyle(style);
            		
            	}
            	if(j==1){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	
			}
        }  
		if(el2.size()>0){
			CellRangeAddress ranges = new CellRangeAddress(4,7,0,1);
			CellRangeAddress ranges1 = new CellRangeAddress(4,5,2,2);
			CellRangeAddress ranges2 = new CellRangeAddress(6,7,2,2);
			CellRangeAddress ranges3 = new CellRangeAddress(8,21,0,0);
			CellRangeAddress ranges4 = new CellRangeAddress(8,17,1,1);
			CellRangeAddress ranges5 = new CellRangeAddress(8,9,2,2);
			CellRangeAddress ranges6 = new CellRangeAddress(10,11,2,2);
			CellRangeAddress ranges7 = new CellRangeAddress(12,14,2,2);
			CellRangeAddress ranges8 = new CellRangeAddress(15,17,2,2);
			CellRangeAddress ranges9 = new CellRangeAddress(18,21,1,1);
			CellRangeAddress ranges10 = new CellRangeAddress(18,19,2,2);
			CellRangeAddress ranges11 = new CellRangeAddress(20,21,2,2);
			CellRangeAddress ranges12 = new CellRangeAddress(22,27,0,0);
			CellRangeAddress ranges13 = new CellRangeAddress(22,24,1,1);
			CellRangeAddress ranges14 = new CellRangeAddress(22,23,2,2);
			CellRangeAddress ranges15 = new CellRangeAddress(24,24,2,3);
			CellRangeAddress ranges16 = new CellRangeAddress(25,27,1,1);
			CellRangeAddress ranges17 = new CellRangeAddress(25,26,2,2);
			CellRangeAddress ranges18 = new CellRangeAddress(27,27,2,3);
			sheet.addMergedRegion(ranges);
			setRegionStyle(style,ranges,sheet);
			sheet.addMergedRegion(ranges1);
			setRegionStyle(style,ranges1,sheet);
			sheet.addMergedRegion(ranges2);
			setRegionStyle(style,ranges2,sheet);
			sheet.addMergedRegion(ranges3);
			setRegionStyle(style,ranges3,sheet);
			sheet.addMergedRegion(ranges4);
			setRegionStyle(style,ranges4,sheet);
			sheet.addMergedRegion(ranges5);
			setRegionStyle(style,ranges5,sheet);
			sheet.addMergedRegion(ranges6);
			setRegionStyle(style,ranges6,sheet);
			sheet.addMergedRegion(ranges7);
			setRegionStyle(style,ranges7,sheet);
			sheet.addMergedRegion(ranges8);
			setRegionStyle(style,ranges8,sheet);
			sheet.addMergedRegion(ranges9);
			setRegionStyle(style,ranges9,sheet);
			sheet.addMergedRegion(ranges10);
			setRegionStyle(style,ranges10,sheet);
			sheet.addMergedRegion(ranges11);
			setRegionStyle(style,ranges11,sheet);
			sheet.addMergedRegion(ranges12);
			setRegionStyle(style,ranges12,sheet);
			sheet.addMergedRegion(ranges13);
			setRegionStyle(style,ranges13,sheet);
			sheet.addMergedRegion(ranges14);
			setRegionStyle(style,ranges14,sheet);
			sheet.addMergedRegion(ranges15);
			setRegionStyle(style,ranges15,sheet);
			sheet.addMergedRegion(ranges16);
			setRegionStyle(style,ranges16,sheet);
			sheet.addMergedRegion(ranges17);
			setRegionStyle(style,ranges17,sheet);
			sheet.addMergedRegion(ranges18);
			setRegionStyle(style,ranges18,sheet);
		}
		
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
