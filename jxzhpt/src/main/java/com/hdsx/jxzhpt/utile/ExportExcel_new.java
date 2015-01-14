package com.hdsx.jxzhpt.utile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFFooter;
import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.core.io.ClassPathResource;


/**
 * 利用开源组件POI3.0.2动态导出EXCEL文档 转载时请保留以下信息，注明出处！
 * 
 * 使用注意： 1.Collection(T)集合应该是HashMap的list 2.excelHtml 指的是除去css样式的表头的html样式
 * 3.如何表头中含有没有文字的单元格应该给他赋值为'' 4.如何表头中含有合并两行并且合并两列的单元格，应该用C2R2代替
 * 5.如果表头超过了两行应该在两行之间用分号分隔 6.cell中的value true表示男 false表示女
 * 7.cell中的date也可以通过参数设置，默认为yyyy-mm-dd 8.表尾汇总信息部分:List<Map> statis_fields
 * （第五列就和：statis_fields.add(new map("5","sum")) list下表为5） 求平均avg 、求最大max、求最小min
 */
public class ExportExcel_new<T> {
	static String sheetName1="";
	static String sheetName2="";
	static String sheetName3="";
	String rowspans[];//记录哪些列要进行行合并
	int dataIndex;//记录数据行的开始下标
	// 声明一个工作薄
	public static HSSFWorkbook workbook = new HSSFWorkbook();

	// 所用到的sheet页
	static HSSFSheet sheet;
	static HSSFSheet sheet1;
	static HSSFSheet sheet2;
	// 头注
	static HSSFHeader header;
	// 外边框
	HSSFCellStyle setBorder = workbook.createCellStyle();
	// 设置字体
	HSSFFont font = workbook.createFont();
	
	String[] qtArray = null;
	short totalCol = 0;
	int tempNum = 0;
	List qtListtemp = null;
	// 样式
    static HSSFCellStyle style3; // 样式对象
	// 样式
    static HSSFCellStyle style2; // 样式对象
	// 样式
    static HSSFCellStyle style1; // 样式对象
	// 表位
    static HSSFCellStyle style4; // 样式对象
    
    static HSSFCellStyle style5; // 样式对象
    
	// 存放每行的数据
	String[] rowArray;
	// 存放每行被占用的单元格位置
	String[] numArray = new String[1000];
	// 单元格
	HSSFCell ce;
	// 所用的行

	HSSFRow tempRow = null;

	String[] colorList = null;
	//字段名称
	@SuppressWarnings("unchecked")
	public void exportExcel(List<SheetBean> sheetBeans,OutputStream out) {
		for(int i=0;i<sheetBeans.size();i++){
			String sheetName=sheetBeans.get(i).getSheetName();
			sheet=(workbook.getSheet(sheetName)==null?workbook.createSheet(sheetName):sheet);
			guodu(sheetBeans.get(i));
			//进行行合并
			rowspans=sheetBeans.get(i).getRowspan_field();
			List<T> dataset=sheetBeans.get(i).getList();
			if(rowspans!=null && rowspans.length!=0){
				for(int k=0;k<rowspans.length;k++){
					if("".equals(rowspans[k])){
						continue;
					}
					int index=Integer.parseInt(rowspans[k])-1;
					int start=dataIndex;//记录要合并的起始行号
					int end=dataIndex;//记录要合并的结束行号
					int count=0;
					String t=sheet.getRow(dataIndex).getCell(index).getRichStringCellValue().toString();
					for(int j=1;j<dataset.size();j++){
						String str=sheet.getRow(dataIndex+j).getCell(index).getRichStringCellValue().toString();
						if(t.equals(str)){
							end++;count++;
							if(j==dataset.size()-1){
								sheet.addMergedRegion(new Region(start,(short)index,end,(short)index));
							}
						}else{
							int a=start;
							int b=end;
							t=str;
							start=end+1;
							end =start;
							if(count!=0){
								sheet.addMergedRegion(new Region(a,(short)index,b,(short)index));
								count=0;
							}
						}
					}
				}
			}
		}
		try {
			//header= sheet.getHeader();
			workbook.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public List splitList(List<T> list){
		List<List<T>> result=new ArrayList<List<T>>();
		if(list.size()/60000==1){
			List<T> list1=new ArrayList<T>();
			List<T> list2=new ArrayList<T>();
			for(int i=0;i<list.size();i++){
				if(i<60000)
					list1.add(list.get(i));
				else
					list2.add(list.get(i));
			}
			result.add(list1);
			result.add(list2);
		}else if(list.size()/60000==2){
			List<T> list1=new ArrayList<T>();
			List<T> list2=new ArrayList<T>();
			List<T> list3=new ArrayList<T>();
			for(int i=0;i<list.size();i++){
				if(i<60000) list1.add(list.get(i));
				else if(i>=60000 && i<120000) list2.add(list.get(i));
				else list3.add(list.get(i));
			}
			result.add(list1);
			result.add(list2);
			result.add(list3);
		}
		return result;
	}
	public void guodu(SheetBean sheetBean){
		double[] statistics = null;
		Map<String,String> statis_fields = sheetBean.getStatis_field();
		if (statis_fields!=null) {
			Set<String> keys=statis_fields.keySet();
			Iterator iter1=keys.iterator();
			System.out.println("-------------------------statis_fields size : "+statis_fields.size()+"-------------------------");
			statistics = new double[sheetBean.getColnum()];
			for (int i = 0; i < statis_fields.size() && iter1.hasNext(); i++) {
				if (statis_fields!= null && "min".equals(statis_fields.get(iter1.next()).toString())) {
					statistics[i] = 999999999999999d;
				}
			}
		}
		// 设置表格默认列宽度为15个字节
		sheet.setDefaultColumnWidth(sheetBean.getColumnWidth());
		// 产生表格标题行
		int size = 1;
		createQt(sheetBean);
		String []str={"1","2"};
		colorList =str;

		// 存放每一行值
		String btArray[] = null;
		int index = 0;
		// 存放所有的表头
		List headers = new ArrayList();
		int firstColSum = 0;
		String excelHtml=sheetBean.getHeader(); 
		if (sheetBean.getHeader() != null) {
			headers = CreatHeads(excelHtml);
			btArray = excelHtml.split(";");
			// 表头的下标
			int bt = 0;
			// 遍历所有表头行，生成表头
			for (int i = 0; i < btArray.length; i++) {
				if (i != 0 && i % 5 == 0) {
					returnArray(numArray, i, 0, 0);
				}
				short rowNum = 0;
				// 纵向合并时的第二行的行号
				int secRowNum = 0;
				// 取出每一行的html代码并进行格式化
				String a = btArray[i].replaceAll(" ", "")
						.replaceAll("<tr><tdrowspan='", "R")
						.replaceAll("</td><tdcolspan='", "C")
						.replaceAll("</td><tdrowspan='", "R")
						.replaceAll("<tr><tdcolspan='", "C")
						.replaceAll("</td></tr>", "");
				a = a.replaceAll("<tr>", "").replaceAll("<td", "")
						.replaceAll("</td>", "");
				// 当前行的所有列
				rowArray = a.split(">");
				// 当前所使用的行
				tempRow = returnRow(i + size,sheet);
				tempRow.setHeightInPoints(22);
				// tempRow.setRowStyle(style2);
				for (int j = 0; j < rowArray.length - 1; j++) {
					// 判断是否有单元格合并行为
					if (rowArray[j].length() >= 3) {
						String temp = rowArray[j].substring(
								rowArray[j].length() - 3, rowArray[j].length());
						String temp2 = "";
						if (rowArray[j].length() >= 4) {
							temp2 = rowArray[j].substring(
									rowArray[j].length() - 4,
									rowArray[j].length());
						}
						if (temp.endsWith("'")) {
							if (!Character.isDigit(temp.charAt(1))) {
								// 获取可用单元格
								rowNum = isTrueOrFalse(rowNum, numArray[i]);
								ce = tempRow.createCell(rowNum);
								ce.setCellValue((String) headers.get(bt));
								/*
								 * if (sfColor(bt)) { ce.setCellStyle(style2); }
								 * else { ce.setCellStyle(style3); }
								 */
								ce.setCellStyle(style2);
								rowNum += 1;
							} else {
								if ("C".equals(temp.substring(0, 1))) {
									rowNum = isTrueOrFalse(rowNum, numArray[i]);
									// 合并后第二个单元格的位置
									short secCol = (short) ((short) (new Short(
											temp.substring(1, 2)) - (short) 1) + rowNum);
									sheet.addMergedRegion(new Region(i + size,
											rowNum, i + size, secCol));
									for(int k=rowNum;k<=secCol;k++){
										ce=tempRow.getCell(k);
										if(ce==null) 
											ce=tempRow.createCell(k);
										ce.setCellStyle(style2);
									}
									ce = tempRow.createCell(new Short(rowNum));
									ce.setCellValue((String) headers.get(bt));
									ce.setCellStyle(style2);
									rowNum = (short) (secCol + 1);

								} else if ("R".equals(temp.substring(0, 1))) {
									rowNum = isTrueOrFalse(rowNum, numArray[i]);
									secRowNum = i
											+ new Integer(temp.substring(1, 2))
											- 1;
									returnArray(numArray, i, rowNum,
											new Integer(temp.substring(1, 2)));

									sheet.addMergedRegion(new Region(i + size,
											rowNum, secRowNum + size, rowNum));
									ce = tempRow.createCell(new Short(rowNum));
									ce.setCellValue((String) headers.get(bt));
									/*
									 * if (sfColor(bt)) {
									 * ce.setCellStyle(style2); } else {
									 * ce.setCellStyle(style3); }
									 */
									ce.setCellStyle(style2);
									rowNum += 1;
								} else if (Character.isDigit(temp.charAt(1))) {
									if (rowArray[j].length() >= 4) {
										temp = rowArray[j].substring(
												rowArray[j].length() - 4,
												rowArray[j].length());
										if ("C".equals(temp.substring(0, 1))) {
											rowNum = isTrueOrFalse(rowNum,
													numArray[i]);

											short secCol = (short) ((short) (new Short(
													temp.substring(1, 3)) - (short) 1) + rowNum);

											sheet.addMergedRegion(new Region(i
													+ size, rowNum, i + size,
													secCol));
											for(int k=rowNum;k<=secCol;k++){
												ce=tempRow.getCell(k);
												if(ce==null) 
													ce=tempRow.createCell(k);
												ce.setCellStyle(style2);
											}
											ce = tempRow.createCell(new Short(
													rowNum));
											ce.setCellValue((String) headers
													.get(bt));
											/*
											 * if (sfColor(bt)) {
											 * ce.setCellStyle(style2); } else {
											 * ce.setCellStyle(style3); }
											 */
											ce.setCellStyle(style2);
											rowNum = (short) (secCol + 1);

										} else if ("R".equals(temp.substring(0,
												1))) {
											rowNum = isTrueOrFalse(rowNum,
													numArray[i]);
											secRowNum = i
													+ new Integer(
															temp.substring(1, 3))
													- 1;
											returnArray(
													numArray,
													i,
													rowNum,
													new Integer(temp.substring(
															1, 3)));

											sheet.addMergedRegion(new Region(i
													+ size, rowNum, secRowNum
													+ size, rowNum));
											ce = tempRow.createCell(new Short(
													rowNum));
											ce.setCellValue((String) headers
													.get(bt));
											/*
											 * if (sfColor(bt)) {
											 * ce.setCellStyle(style2); } else {
											 * ce.setCellStyle(style3); }
											 */
											ce.setCellStyle(style2);
											rowNum += 1;
										} else {
											rowNum = isTrueOrFalse(rowNum,
													numArray[i]);
											ce = tempRow.createCell(rowNum);
											ce.setCellValue((String) headers
													.get(bt));
											/*
											 * if (sfColor(bt)) {
											 * ce.setCellStyle(style2); } else {
											 * ce.setCellStyle(style3); }
											 */
											ce.setCellStyle(style2);
											rowNum += 1;
										}

									}
								} else {
									rowNum = isTrueOrFalse(rowNum, numArray[i]);
									ce = tempRow.createCell(rowNum);
									ce.setCellValue((String) headers.get(bt));
									/*
									 * if (sfColor(bt)) {
									 * ce.setCellStyle(style2); } else {
									 * ce.setCellStyle(style3); }
									 */
									ce.setCellStyle(style2);
									rowNum += 1;
								}
							}
						} else if (temp2.length() == 4
								&& temp2.substring(0, 1).equals("C")
								&& Character.isDigit(temp2.charAt(1))
								&& temp2.substring(2, 3).equals("R")
								&& Character.isDigit(temp2.charAt(3))) {
							// 当前的单元格的位置
							rowNum = isTrueOrFalse(rowNum, numArray[i]);
							// 横向合并列后的单元格的位置
							short secCol = (short) ((short) (new Short(
									temp2.substring(1, 2)) - (short) 1) + rowNum);
							// 纵向合并后的行的位置
							secRowNum = i + new Integer(temp2.substring(3, 4))
									- 1;
							// 进行合并单元格
							sheet.addMergedRegion(new Region(i + size, rowNum,
									secRowNum + size, secCol));
							ce = tempRow.createCell(new Short(rowNum));
							ce.setCellValue((String) headers.get(bt));
							/*
							 * if (sfColor(bt)) { ce.setCellStyle(style2); }
							 * else { ce.setCellStyle(style3); }
							 */
							ce.setCellStyle(style2);
							// 为数组增加值
							for (int t = 0; t < new Integer(temp2.substring(1,
									2)); t++) {
								returnArray(numArray, i, rowNum++, new Integer(
										temp2.substring(3, 4)));
							}

						} else {
							rowNum = isTrueOrFalse(rowNum, numArray[i]);
							ce = tempRow.createCell(rowNum);
							ce.setCellValue((String) headers.get(bt));
							/*
							 * if (sfColor(bt)) { ce.setCellStyle(style2); }
							 * else { ce.setCellStyle(style3); }
							 */
							ce.setCellStyle(style2);
							rowNum += 1;
						}

					} else {
						rowNum = isTrueOrFalse(rowNum, numArray[i]);
						ce = tempRow.createCell(rowNum);
						ce.setCellValue((String) headers.get(bt));
						/*
						 * if (sfColor(bt)) { ce.setCellStyle(style2); } else {
						 * ce.setCellStyle(style3); }
						 */
						ce.setCellStyle(style2);
						rowNum += 1;
					}
					// 增加表头数组的下标
					bt++;
				}
				for(int k=0;k<firstColSum;k++){
					ce=tempRow.getCell(k);
					if(ce==null) 
						ce=tempRow.createCell(k);
					ce.setCellStyle(style2);
				}
				if (i == 0) {
					// 记录每一行共有多少个单元格
					firstColSum = rowNum;
				}
			}
		}
		index = btArray.length + size;
		dataIndex=index;
		// 遍历集合数据，产生数据行
		List<T> dataset=sheetBean.getList();
		if (dataset != null) {
			HSSFRow row = null;
			Iterator<T> it = dataset.iterator();
			while (it.hasNext()) {
				Object value = null;
				HSSFCell cell = null;
				row = sheet.createRow(index);
				T t = (T) it.next();
				if (t instanceof HashMap) {
					for (int m = 0; m < firstColSum; m++) {
						String name = "V_" + m;
						value = ((HashMap) t).get(name);
						cell = row.createCell(m);
						// 判断值的类型后进行强制类型转换
						String textValue = null;
						if (value == null) {
							value = "";
						}
						if (value instanceof Boolean) {

							boolean bValue = (Boolean) value;

							textValue = "男";

							if (!bValue) {

								textValue = "女";

							}
							cell.setCellValue(textValue);
							cell.setCellStyle(style3);
							continue;

						} else if (value instanceof Date) {

							Date date = (Date) value;

							SimpleDateFormat sdf = new SimpleDateFormat("yyyy年mm月dd日");

							textValue = sdf.format(date);
							cell.setCellValue(textValue);
							cell.setCellStyle(style3);
							continue;
						}
						CreatValue(value, cell);
					}
				} else if (t instanceof SjbbMessage) {
					for (int i = 0; i < firstColSum; i++) {

						SjbbMessage sjbb = null;
						try {
							sjbb = (SjbbMessage) t;
						} catch (Exception e) {
							System.out.println("\n" + "类型转换有误！");
						}
						String methodName = "getV_" + i;
						cell = row.createCell(i);

						try {
							// value = (String)
							// sjbb.getClass().getMethod(methodName, new
							// Class[]{}).invoke(sjbb,new Object[]{});
							value = (String) sjbb.getClass().getMethod(methodName).invoke(sjbb, null);
							String field="";
							if(statis_fields!=null){
								Iterator iterator=statis_fields.keySet().iterator();
							    while(iterator.hasNext()){
							    	String temp=iterator.next().toString();
							    	if(((i+1)+"").equals(temp)){
							    		field = statis_fields.get(temp).toString();
							    		break;
							    	}
							    }
								if ("sum".equals(field)) {
									statistics[i] += Double.valueOf(value+"");
								} else if ("avg".equals(field)) {
									statistics[i] += Double.valueOf(value+"");
								} else if ("max".equals(field)) {
									if (statistics[i] < Double.valueOf(value+"")) {
										statistics[i] = Double.valueOf(value+"");
									}
								} else if ("min".equals(field)) {
									if (statistics[i] > Double.parseDouble(value+"")) {
										statistics[i] = Double.valueOf(value+"");
									}
								} else {
									statistics[i] = 0;
								}
							}
							// 判断值的类型后进行强制类型转换
							String textValue = null;

							if (value instanceof Boolean) {

								boolean bValue = (Boolean) value;

								textValue = "男";

								if (!bValue) {

									textValue = "女";

								}
								cell.setCellValue(textValue);
								continue;
							} else if (value instanceof Date) {

								Date date = (Date) value;

								SimpleDateFormat sdf = new SimpleDateFormat("yyyy年mm月dd日");

								textValue = sdf.format(date);
								cell.setCellValue(textValue);
								continue;
							}

							CreatValue(value, cell);
						} catch (Exception e) {

							// TODO Auto-generated catch block

							e.printStackTrace();

						} finally {

							// 清理资源

						}
					}
				}
				index++;
			}
		}
		//表位统计行输出
		if (sheetBean.getStatis_field()!=null) {
			tempRow = sheet.createRow(index);
			ce = tempRow.createCell(0);
			ce.setCellValue("----汇  总----");
			ce.setCellStyle(style5); 
			for (int i = 1; i < firstColSum; i++) {
				ce = tempRow.createCell(i);
				String field="";
				Iterator iterator=statis_fields.keySet().iterator();
				while(iterator.hasNext()){
			    	String temp=iterator.next().toString();
			    	if(((i+1)+"").equals(temp)){
			    		field =statis_fields.get(temp)!=null?statis_fields.get(temp).toString():"";
			    		break;
			    	}
			    }
				if("".equals(field)) {
					continue;
				}
				if ("sum".equals(field)) {
					ce.setCellValue("合计：" + Math.round(statistics[i] * 100)/ 100);
				} 
				if ("avg".equals(field)) {
					if(dataset.size()==0){
						ce.setCellValue("平均值："+0);
					}else{
						ce.setCellValue("平均值："+ Math.round((statistics[i] * 1.0/ dataset.size() * 100) / 100));
					}
				} 
				if ("max".equals(field)) {
					ce.setCellValue("最大值："+ Math.round(statistics[i] * 100) / 100);
				} 
				if ("min".equals(field)) {
					ce.setCellValue("最小值："+ Math.round(statistics[i] * 100) / 100);
				} 
				ce.setCellStyle(style5);
			}
			index++;
		}
		
		//表尾输出
		String footer=sheetBean.getFooter();
		if(footer!=null){
			tempRow = sheet.createRow(index);
			sheet.addMergedRegion(new Region((short)index,(short)0,(short)index,(short)(firstColSum-1)));
			ce=tempRow.createCell(0);
			ce.setCellValue(footer);
		    ce.setCellStyle(style4);
			/*String []rowdatas=footer.split(";");
			int flag=0;
			for(String rowdata:rowdatas){
				String celldata=rowdata.replace(" ", "").replace("<tr>", "").replace("</tr>", "").replace("<td>", "").replace("</td>", ",").replace("<td", "").replace(" ","").replace("'","").replace("Colspan=", "C").replace("colspan=", "C").replace("Rowspan=", "R").replace("rowspan=", "R");
				celldata=celldata.substring(0, celldata.length()-1);
				String cellData[]=celldata.split(",");
				tempRow = sheet.createRow(index+flag);
				short tempvar=0;
				for(int r=0;r<cellData.length;r++){
					String cellvalue="";
					if((cellData[r]+"").startsWith("C")){
						short tempcolnum=Short.parseShort(cellData[r].substring(1,cellData[r].indexOf('>')));
						tempvar=(short)((short)tempcolnum+(short)r);
						sheet.addMergedRegion(new Region((short)index,(short)r,(short)index,tempvar));
						ce=tempRow.createCell(r);
						cellvalue=cellData[r].split(">")[1];
					}
					if((cellData[r]+"").startsWith("R")){
						short temprownum=Short.parseShort(cellData[r].substring(1, cellData[r].indexOf('>')));
						sheet.addMergedRegion(new Region((short)index,(short)r,(short)((short)index+temprownum-1),(short)r));
						cellvalue=cellData[r].split(">")[1];
					}else{
						ce=tempRow.createCell(r);
						cellvalue=cellData[r];
					}
					System.out.println("-----------------"+(r+1)+"  "+cellvalue+"----------------");
					ce.setCellValue(cellvalue);
				    ce.setCellStyle(style3);
				}
				flag++;
			}*/
		    index++;
		}
	}

	/**
	 * 通过html表头、头注、脚注代码创建对应代码 
	 */
	private void createQt(SheetBean sheetBean) {
		setBorder.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 下边框
		setBorder.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
		setBorder.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
		setBorder.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
		setBorder.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中
		font.setFontHeightInPoints((short) 16);// 设置字体大小
		setBorder.setFont(font);// 选择需要用到的字体格式

		String qtHtml ="<tr><td>"+sheetBean.getTableName()+"</td></tr>;";
		qtListtemp = CreatHeads(qtHtml);
		totalCol = (Short)sheetBean.getColnum();
		qtArray = qtHtml.split(";");
		tempNum = 0;
		for (int i = 0; i < qtArray.length; i++) {
			if (i == 0) {
				tempRow = returnRow(i,sheet);
				tempRow.setHeight((short) 800);
				sheet.addMergedRegion(new Region(i, (short) 0, i,(short) (totalCol - 1)));
				ce = tempRow.createCell(0);
				ce.setCellValue((String) qtListtemp.get(tempNum));
				ce.setCellStyle(style1);
				tempNum++;
			}  else {
				tempRow = returnRow(i,sheet);
				for (int j = 0; j < totalCol; j++) {
					ce = tempRow.createCell(j);
					ce.setCellValue((String) qtListtemp.get(tempNum));
					ce.setCellStyle(style1);
					tempNum++;
				}
			}

		}

	}

	/**
	 * 通过html标题代码创建标题头数组
	 * 
	 * @param excelHtml
	 * @return
	 */
	private List CreatHeads(String excelHtml) {
		// 整理html代码
		String a = excelHtml.replaceAll(";", "");
		a = a.replaceAll(" ", "").replaceAll("<tr><tdrowspan='", "R")
				.replaceAll("</td><tdcolspan='", "C")
				.replaceAll("</td><tdrowspan='", "R")
				.replaceAll("<tr><tdcolspan='", "C")
				.replaceAll("</td></tr>", "");
		String array[] = a.replaceAll("<tr>", "").replaceAll("</tr>", "")
				.replaceAll("<td", "").replaceAll("</td>", "").split(">");

		String bt = "";
		String temp = "";
		String temp2 = "";
		for (int i = 0; i < array.length; i++) {
			temp = array[i];
			if (temp.length() >= 4) {
				temp2 = temp.substring(temp.length() - 4, temp.length());
			}
			if (temp.length() >= 3) {
				// 获得后三位值
				String t = temp.substring(temp.length() - 3, temp.length());
				// 获得除后三位以外的值
				String s = temp.substring(0, temp.length() - 3);
				// 该情况为单元格合并的数量小于10
				if (t.endsWith("'") && (t.startsWith("C") || t.startsWith("R"))) {
					char ch = t.charAt(1);
					if (!Character.isDigit(ch)) {
						bt = bt + temp + ";";
					} else {
						if (temp.length() > 3) {
							bt = bt + s + ";";
						}

					}
					// 该情况为单元格合并的数量大于等于10
				} else if (t.endsWith("'") && Character.isDigit(t.charAt(0))) {

					if (temp.length() >= 4) {

						t = temp.substring(temp.length() - 4, temp.length());
						s = temp.substring(0, temp.length() - 4);

						if (t.startsWith("C") || t.startsWith("R")) {
							bt = bt + s + ";";
						} else {
							bt = bt + temp + ";";
						}
					} else {
						bt = bt + temp + ";";
					}
				} else if (temp2.length() == 4
						&& temp2.substring(0, 1).equals("C")
						&& Character.isDigit(temp2.charAt(1))
						&& temp2.substring(2, 3).equals("R")
						&& Character.isDigit(temp2.charAt(3))) {
					s = temp.substring(0, temp.length() - 4);
					bt = bt + s + ";";
				} else {
					bt = bt + temp + ";";
				}
			} else {
				bt = bt + temp + ";";
			}

		}
		String heads[] = bt.split(";");
		List<String> headList = new ArrayList<String>();
		for (int i = 0; i < heads.length; i++) {
			if (heads[i] != null && (!"".equals(heads[i]))) {
				if (heads[i].equals("''"))
					headList.add("");
				else if (heads[i].equals("null"))
					headList.add("");
				else
					headList.add(heads[i]);
			}

		}
		return headList;
	}

	// 判断当前单元格是否被占用
	private short isTrueOrFalse(short num, String rowNum) {
		short tempNum = num;
		if (rowNum == null) {
			rowNum = "";
		}
		String rowNumArray[] = rowNum.split(",");
		if (rowNumArray != null && rowNumArray.length != 0) {
			for (int k = 0; k < rowNumArray.length; k++) {
				if ((num + "").equals(rowNumArray[k])) {
					num++;
					break;
				}
			}
			if (tempNum != num) {
				num = isTrueOrFalse(num, rowNum);
			}
			return num;

		} else {
			return num;
		}
	}

	/**
	 * 
	 * @param array
	 *            存放每行被占用的单元格的数组
	 * @param i
	 *            当前行
	 * @param j
	 *            当前的单元格的位置
	 * @param value
	 *            一共合并的行数
	 */
	private void returnArray(String[] array, int i, int j, int value) {
		String temp = "";
		/*
		 * String[] tempArray = null; if(i != 0 && i % 5 == 0){ tempArray = new
		 * String[array.length*2]; }else{ tempArray = new String[array.length];
		 * } for(int t = 0; t < array.length; t++){ tempArray[t] = array[t]; }
		 */

		for (int k = i + 1; k < (i + value); k++) {
			temp = array[k] + j + ",";
			array[k] = temp;
		}
	}

	/**
	 * 根据行号确定选取哪一行
	 * 
	 * @param num
	 * @return
	 */
	private HSSFRow returnRow(int num,HSSFSheet sheet) {
		tempRow = sheet.createRow((short) num);
		return tempRow;
	}

	/**
	 * 根据类型创建单元格
	 * 
	 * @param value
	 * @param cell
	 */
	private void CreatValue(Object value, HSSFCell cell) {
		if (value instanceof Integer) {
			int intValue = (Integer) value;
			cell.setCellValue(intValue);
		} else if (value instanceof Float) {
			float fValue = (Float) value;
			cell.setCellValue(fValue);
		} else if (value instanceof Double) {
			double dValue = (Double) value;
			/*
			 * textValue = new HSSFRichTextString( String.valueOf(dValue));
			 */
			cell.setCellValue(dValue);
		} else if (value instanceof Long) {
			long longValue = (Long) value;
			cell.setCellValue(longValue);
		} else {
			cell.setCellValue(String.valueOf(value));
		}
		cell.setCellStyle(style3);
	}

	private boolean sfColor(int num) {
		boolean flag = false;
		if (colorList != null && colorList.length != 0) {
			for (int i = 0; i < colorList.length; i++) {
				if (colorList[i].equals(num + "")) {
					flag = true;
					break;
				}
			}
		}

		return flag;
	}

	public  void initStyle(HSSFWorkbook wb,String fileName) {
		/*置空样式*/
		style1=null;
		style2=null;
		style3=null;
		style4=null;
		style5=null;
		sheetName1= null;
		sheetName2= null;
		sheetName3= null;
		rowspans=null;
		HashMap<String, HSSFCellStyle> ret = new HashMap<String, HSSFCellStyle>();
		try {
//			ClassPathResource res = new ClassPathResource(path,ExportExcel.class);// 注意：module.xls模板文件跟该类同一路径
//			InputStream is = res.getInputStream();
			InputStream inputs=ExportExcel_new.class.getClassLoader().getResourceAsStream(fileName);
			POIFSFileSystem fs = new POIFSFileSystem(inputs);

			HSSFWorkbook src = new HSSFWorkbook(fs);
			HSSFSheet sheet = src.getSheetAt(0);
			// title
			HSSFRow row0 = sheet.getRow(0);
			HSSFCell cell0 = row0.getCell(1);
			HSSFCellStyle nstyle0 = wb.createCellStyle();
			style1 = copyCellStyle(wb, nstyle0, src, cell0.getCellStyle());
			// style2
			HSSFRow row1 = sheet.getRow(1);
			HSSFCell cell1 = row1.getCell(1);
			HSSFCellStyle nstyle1 = wb.createCellStyle();
			style2 = copyCellStyle(wb, nstyle1, src, cell1.getCellStyle());
			// style23
			HSSFRow row2 = sheet.getRow(2);
			HSSFCell cell2 = row2.getCell(1);
			HSSFCellStyle nstyle2 = wb.createCellStyle();
			style3 = copyCellStyle(wb, nstyle2, src, cell2.getCellStyle());
			// biaowei
			HSSFRow row3 = sheet.getRow(3);
			HSSFCell cell3 = row3.getCell(1);
			HSSFCellStyle nstyle3 = wb.createCellStyle();
			style4 = copyCellStyle(wb, nstyle3, src, cell3.getCellStyle());
			// biaowei
			HSSFRow row4 = sheet.getRow(4);
			HSSFCell cell4 = row4.getCell(1);
			HSSFCellStyle nstyle4 = wb.createCellStyle();
			style5 = copyCellStyle(wb, nstyle4, src, cell4.getCellStyle());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static HSSFCellStyle copyCellStyle(HSSFWorkbook destwb, HSSFCellStyle dest,
			HSSFWorkbook srcwb, HSSFCellStyle src) {
		if (src == null || dest == null)
			return null;
		dest.setAlignment(src.getAlignment());
		dest.setBorderBottom(src.getBorderBottom());
		dest.setBorderLeft(src.getBorderLeft());
		dest.setBorderRight(src.getBorderRight());
		dest.setBorderTop(src.getBorderTop());
		dest.setBottomBorderColor(findColor(src.getBottomBorderColor(), srcwb,
				destwb));
		dest.setDataFormat(destwb.createDataFormat().getFormat(
				srcwb.createDataFormat().getFormat(src.getDataFormat())));
		dest.setFillPattern(src.getFillPattern());
		dest.setFillForegroundColor(findColor(src.getFillForegroundColor(),
				srcwb, destwb));
		dest.setFillBackgroundColor(findColor(src.getFillBackgroundColor(),
				srcwb, destwb));
		dest.setHidden(src.getHidden());
		dest.setIndention(src.getIndention());
		dest.setLeftBorderColor(findColor(src.getLeftBorderColor(), srcwb,
				destwb));
		dest.setLocked(src.getLocked());
		dest.setRightBorderColor(findColor(src.getRightBorderColor(), srcwb,
				destwb));
		dest.setRotation(src.getRotation());
		dest.setTopBorderColor(findColor(src.getTopBorderColor(), srcwb, destwb));
		dest.setVerticalAlignment(src.getVerticalAlignment());
		dest.setWrapText(src.getWrapText());

		HSSFFont f = srcwb.getFontAt(src.getFontIndex());
		HSSFFont nf = findFont(f, srcwb, destwb);
		if (nf == null) {
			nf = destwb.createFont();
			nf.setBoldweight(f.getBoldweight());
			nf.setCharSet(f.getCharSet());
			nf.setColor(findColor(f.getColor(), srcwb, destwb));
			nf.setFontHeight(f.getFontHeight());
			nf.setFontHeightInPoints(f.getFontHeightInPoints());
			nf.setFontName(f.getFontName());
			nf.setItalic(f.getItalic());
			nf.setStrikeout(f.getStrikeout());
			nf.setTypeOffset(f.getTypeOffset());
			nf.setUnderline(f.getUnderline());
		}
		dest.setFont(nf);
		return dest;
	}

	private static short findColor(short index, HSSFWorkbook srcwb, HSSFWorkbook destwb) {
		Integer id = new Integer(index);
		if (HSSFColor.getIndexHash().containsKey(id))
			return index;
		if (index == HSSFColor.AUTOMATIC.index)
			return index;
		HSSFColor color = srcwb.getCustomPalette().getColor(index);
		if (color == null) {
			return index;
		}

		HSSFColor ncolor = destwb.getCustomPalette().findColor(
				(byte) color.getTriplet()[0], (byte) color.getTriplet()[1],
				(byte) color.getTriplet()[2]);
		if (ncolor != null)
			return ncolor.getIndex();
		destwb.getCustomPalette().setColorAtIndex(index,
				(byte) color.getTriplet()[0], (byte) color.getTriplet()[1],
				(byte) color.getTriplet()[2]);
		return index;
	}

	private static HSSFFont findFont(HSSFFont font, HSSFWorkbook src, HSSFWorkbook dest) {
		for (short i = 0; i < dest.getNumberOfFonts(); i++) {
			HSSFFont oldfont = dest.getFontAt(i);
			if (font.getBoldweight() == oldfont.getBoldweight()
					&& font.getItalic() == oldfont.getItalic()
					&& font.getStrikeout() == oldfont.getStrikeout()
					&& font.getCharSet() == oldfont.getCharSet()
					&& font.getColor() == oldfont.getColor()
					&& font.getFontHeight() == oldfont.getFontHeight()
					&& font.getFontName().equals(oldfont.getFontName())
					&& font.getTypeOffset() == oldfont.getTypeOffset()
					&& font.getUnderline() == oldfont.getUnderline()) {
				return oldfont;
			}
		}
		return null;
	}
	
	public void makeExcel(String tableName,List<SheetBean> sheetBeans,HttpServletResponse response) {
		try {
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(tableName.getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			List qtList = new ArrayList();
			String qtHtml="<tr><td>"+tableName+"</td></tr>;";
			ExportExcel_new ex=new ExportExcel_new();
			OutputStream out = response.getOutputStream();
			try {
				ex.exportExcel(sheetBeans,out);
			} catch (Exception e) {
				System.out.println("-----------------------工具类里面报错--------------------------");
				e.printStackTrace();
			}
			out.flush();
			out.close();
			System.out.println("excel导出成功！");
		} catch (Exception e) {
			System.out.println("-----------------------工具类外面报错--------------------------");
			e.printStackTrace();
		}
	}
}