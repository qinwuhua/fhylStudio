package com.hdsx.jxzhpt.jhgl.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelUtil {
	public static void excelWrite(List<Map<String, String>> exceData,
			List<String> excelTitle, String tableName,
			HttpServletResponse response) {
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("工程改建路面升级");
		//表头
		int rowNumber=0;
		HSSFRow title = sheet.createRow(rowNumber);
		//居中样式
		HSSFCellStyle styleCenter = wb.createCellStyle(); 
		styleCenter.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		for(int i=0;i<excelTitle.size();i++){
			HSSFCell cell = title.createCell(i);
		    cell.setCellValue(excelTitle.get(i));
		    cell.setCellStyle(styleCenter);
		}
		rowNumber+=1;
		for(Map<String, String> item : exceData){
			HSSFRow dataRow = sheet.createRow(rowNumber);
			Set<Entry<String,String>> entrySet = item.entrySet();
			for (Entry<String, String> entry : entrySet) {
				HSSFCell createCell = dataRow.createCell(new Integer(entry.getKey()).intValue());
				createCell.setCellValue(entry.getValue());
				createCell.setCellStyle(styleCenter);
			}
			rowNumber+=1;
		}
		response.setContentType("octets/stream");
		try {
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(tableName.getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = response.getOutputStream();
			wb.write(out);
			out.flush();
			out.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
