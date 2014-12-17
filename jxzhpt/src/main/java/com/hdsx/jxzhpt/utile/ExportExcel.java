package com.hdsx.jxzhpt.utile;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

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

/**
 * 利用开源组件POI3.0.2动态导出EXCEL文档 转载时请保留以下信息，注明出处！
 * 
 * 使用注意：
 * 1.Collection(T)集合应该是HashMap的list
 * 2.excelHtml 指的是除去css样式的表头的html样式
 * 3.如何表头中含有没有文字的单元格应该给他赋值为''
 * 4.如何表头中含有合并两行并且合并两列的单元格，应该用C2R2代替
 * 5.如果表头超过了两行应该在两行之间用分号分隔           
 *            
 */
public class ExportExcel<T> {
    // 声明一个工作薄
    HSSFWorkbook workbook = new HSSFWorkbook();
    
	//所用到的sheet页
	HSSFSheet sheet  = workbook.createSheet("sheet1");
	//外边框
	HSSFCellStyle setBorder = workbook.createCellStyle();
	//设置字体
	HSSFFont font = workbook.createFont();
	//头注
	HSSFHeader header = sheet.getHeader();
	String[] qtArray = null;
	short totalCol = 0;
	int tempNum = 0;
	List qtListtemp = null;
	//样式
    HSSFCellStyle style3 = workbook.createCellStyle(); // 样式对象        
  //样式
    HSSFCellStyle style2 = workbook.createCellStyle(); // 样式对象     
    
    HSSFCellStyle btStyle=workbook.createCellStyle();
    HSSFCellStyle titleStyle=workbook.createCellStyle();
	//存放每行的数据
    String[] rowArray ;
    //存放每行被占用的单元格位置
    String[] numArray = new String[]{"","","","","","","","","","","","","","","","","","","","","","","","","","","","",""
    								,"","","","","","","","","","","","","","","","","","","","","","","","","","","","",""
    								,"","","","","","","","","","","","","","","","","","","","","","","","","","","","",""
    								,"","","","","","","","","","","","","","","","","","","","","","","","","","","","",""
    								};
    //单元格
    HSSFCell ce ; 
	//所用的行
	
	HSSFRow tempRow = null;
	
	 String[] colorList = null;
	 String excelFoot;
    public void exportExcel(List qtList,String excelHtml, Collection<T> dataset,
            OutputStream out,String exInClude[],String excelFoot) {
    	this.excelFoot=excelFoot;
        exportExcel(qtList,"测试POI导出EXCEL文档", excelHtml, dataset, out, "yyyy-MM-dd", exInClude);
    }
    public void exportExcel(List qtList,String excelHtml, Collection<T> dataset,
            OutputStream out,String exInClude[]) {
        exportExcel(qtList,"测试POI导出EXCEL文档", excelHtml, dataset, out, "yyyy-MM-dd", exInClude);
    }
    

    /**
     * 这是一个通用的方法，利用了JAVA的反射机制，可以将放置在JAVA集合中并且符号一定条件的数据以EXCEL 的形式输出到指定IO设备上
     * 
     * @param title
     *            表格标题名
     * @param excelHtml
     *            表格属性列名数组
     * @param dataset
     *            需要显示的数据集合,集合中一定要放置符合javabean风格的类的对象。此方法支持的
     *            javabean属性的数据类型有基本数据类型及String,Date,byte[](图片数据)
     * @param out
     *            与输出设备关联的流对象，可以将EXCEL文档导出到本地文件或者网络中
     * @param pattern
     *            如果有时间数据，设定输出格式。默认为"yyy-MM-dd"
     */
    @SuppressWarnings("unchecked")
    public void exportExcel(List qtList,String title, String excelHtml,
            Collection<T> dataset, OutputStream out, String pattern,String exInClude[]) {

        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 15);
      //产生表格标题行
      
        style3.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直      
        style3.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平 
        // 生成一个字体
        HSSFFont font = workbook.createFont();
        font.setColor(HSSFColor.VIOLET.index);
        font.setBoldweight((short)100);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直      
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平 
        // 把字体应用到当前的样式
        style2.setFont(font);
        
        btStyle.setFillBackgroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
        btStyle.setFont(font);
        //创建
        int size = 0;
        if(qtList != null){
        	createQt(qtList);
        	
            if((Boolean)qtList.get(1)){
            	 size = qtList.get(3).toString().split(";").length-1;
            }else{
            	 size = qtList.get(3).toString().split(";").length;
            }
            if(qtList.size()==5){
            	colorList =  (String[])qtList.get(4);
            	 
            }
        }
        
        
       
        //存放每一行值
        String btArray[] = null;
        int index =0;
       //存放所有的表头
        List headers = new ArrayList();
        int firstColSum = 0;
        if(excelHtml!=null){
        	
        	headers= CreatHeads(excelHtml);
            btArray = excelHtml.split(";");
            //表头的下标
            int bt = 0;
            //遍历所有表头行，生成表头
            for(int i = 0; i<btArray.length; i++){
            	if(i != 0 && i %5 ==0){
            		returnArray(numArray,i,0,0);	
            	}
            	short rowNum=0;
            	//纵向合并时的第二行的行号
                int  secRowNum=0;
            	//取出每一行的html代码并进行格式化
            	String a = btArray[i].replaceAll(" ", "").replaceAll("<tr><tdrowspan='", "R")
            			.replaceAll("</td><tdcolspan='", "C").replaceAll("</td><tdrowspan='", "R")
            			.replaceAll("<tr><tdcolspan='", "C").replaceAll("</td></tr>", "");;
            	
            	a=a.replaceAll("<tr>", "").replaceAll("<td", "").replaceAll("</td>", "");
            	//当前行的所有列
            	rowArray=a.split(">");
            	//当前所使用的行
            	tempRow = returnRow(i+size);
            	tempRow.setRowStyle(btStyle);
            	
            	for(int j = 0; j < rowArray.length-1; j++ ){
            			 //判断是否有单元格合并行为
                  		if(rowArray[j].length()>=3){
                  			String temp = rowArray[j].substring(rowArray[j].length()-3, rowArray[j].length());
                  			String temp2 = "";
                  			if(rowArray[j].length() >= 4){
                  				temp2 = rowArray[j].substring(rowArray[j].length()-4,rowArray[j].length());
                  			}
                  			if(temp.endsWith("'")){
                  				if (!Character.isDigit(temp.charAt(1))){
                  					//获取可用单元格
                  					rowNum = isTrueOrFalse(rowNum,numArray[i]);
                  					ce=tempRow.createCell(rowNum);
                    			  	ce.setCellValue((String)headers.get(bt)); 
                    			  	if(sfColor(bt)){
                    			  		ce.setCellStyle(style2);
                    			  	}else{
                    			  		ce.setCellStyle(style3);
                    			  	}
                    			  	
                    			  	rowNum+=1;
                  				}else{
                  					if("C".equals(temp.substring(0, 1))){
                  						rowNum = isTrueOrFalse(rowNum,numArray[i]);
                  						//合并后第二个单元格的位置
                  						short secCol=(short) ((short) (new Short(temp.substring(1,2))-(short)1)+rowNum);
                  						sheet.addMergedRegion(new Region(i+size, rowNum, i+size, secCol));
                  			    		ce=tempRow.createCell(new Short(rowNum));
                  			    		ce.setCellValue((String)headers.get(bt));
                  			    		if(sfColor(bt)){
                        			  		ce.setCellStyle(style2);
                        			  	}else{
                        			  		ce.setCellStyle(style3);
                        			  	}
                  			    		rowNum=(short) (secCol+1);
                  			    		  
                  					}else if("R".equals(temp.substring(0, 1)))  {
                  						rowNum = isTrueOrFalse(rowNum,numArray[i]);
                  						secRowNum = i + new Integer(temp.substring(1,2)) -1;
                  	  		    		returnArray(numArray,i,rowNum,new Integer(temp.substring(1,2)));	
                  	  		    		
                  	  		    		sheet.addMergedRegion(new Region(i+size, rowNum, secRowNum+size, rowNum));
                  	  		    		ce=tempRow.createCell(new Short(rowNum));
        	      	  		    		ce.setCellValue((String)headers.get(bt));
	        	      	  		    	if(sfColor(bt)){
	                    			  		ce.setCellStyle(style2);
	                    			  	}else{
	                    			  		ce.setCellStyle(style3);
	                    			  	}
                  	  		    		rowNum+=1;
                  					}else if(Character.isDigit(temp.charAt(1))){
                  						if(rowArray[j].length()>=4){
                  		   					temp=rowArray[j].substring(rowArray[j].length()-4, rowArray[j].length());
                  		   					if("C".equals(temp.substring(0, 1))){
                  		   						rowNum = isTrueOrFalse(rowNum,numArray[i]);
                  		   						
                          						short secCol=(short) ((short) (new Short(temp.substring(1,3))-(short)1)+rowNum);
                          						
                          						sheet.addMergedRegion(new Region(i+size, rowNum, i+size, secCol));
                          			    		ce=tempRow.createCell(new Short(rowNum));
                          			    		ce.setCellValue((String)headers.get(bt));
                          			    		if(sfColor(bt)){
                                			  		ce.setCellStyle(style2);
                                			  	}else{
                                			  		ce.setCellStyle(style3);
                                			  	}
                          			    		rowNum=(short) (secCol+1);
                          			    		  
                          					}else if("R".equals(temp.substring(0, 1)))  {
                          						rowNum = isTrueOrFalse(rowNum,numArray[i]);
                          						secRowNum = i + new Integer(temp.substring(1,3)) -1;
                          	  		    		returnArray(numArray,i,rowNum,new Integer(temp.substring(1,3)));	
                          	  		    		
                          	  		    		sheet.addMergedRegion(new Region(i+size, rowNum, secRowNum+size, rowNum));
                          	  		    		ce=tempRow.createCell(new Short(rowNum));
                	      	  		    		ce.setCellValue((String)headers.get(bt));
	                	      	  		    	if(sfColor(bt)){
	                            			  		ce.setCellStyle(style2);
	                            			  	}else{
	                            			  		ce.setCellStyle(style3);
	                            			  	}
                          	  		    		rowNum+=1;
                          					}else{
                          						rowNum = isTrueOrFalse(rowNum,numArray[i]);
                          						ce=tempRow.createCell(rowNum);
                          				  		ce.setCellValue((String)headers.get(bt)); 
	                          				  	if(sfColor(bt)){
	                            			  		ce.setCellStyle(style2);
	                            			  	}else{
	                            			  		ce.setCellStyle(style3);
	                            			  	}
                          				  		rowNum+=1;
                          					}
                  		      	   			
                  		   				}
                  					}
                  					else{
                  						rowNum = isTrueOrFalse(rowNum,numArray[i]);
                  						ce=tempRow.createCell(rowNum);
                  				  		ce.setCellValue((String)headers.get(bt)); 
	                  				  	if(sfColor(bt)){
	                    			  		ce.setCellStyle(style2);
	                    			  	}else{
	                    			  		ce.setCellStyle(style3);
	                    			  	}
                  				  		rowNum+=1;
                  					}
                  				}
                  			}else if(temp2.length()==4  && temp2.substring(0,1).equals("C")
										 && Character.isDigit(temp2.charAt(1)) 
										 && temp2.substring(2,3).equals("R") 
										 && Character.isDigit(temp2.charAt(3)))
                  				{
									//当前的单元格的位置
									rowNum = isTrueOrFalse(rowNum,numArray[i]);
									//横向合并列后的单元格的位置
									short secCol=(short) ((short) (new Short(temp2.substring(1,2))-(short)1)+rowNum);
									//纵向合并后的行的位置
									secRowNum = i + new Integer(temp2.substring(3,4)) -1;
									//进行合并单元格
									sheet.addMergedRegion(new Region(i+size, rowNum, secRowNum+size, secCol));
									ce=tempRow.createCell(new Short(rowNum));
    	      	  		    		ce.setCellValue((String)headers.get(bt));
	    	      	  		    	if(sfColor(bt)){
	                			  		ce.setCellStyle(style2);
	                			  	}else{
	                			  		ce.setCellStyle(style3);
	                			  	}
									//为数组增加值
									for(int t = 0; t<new Integer(temp2.substring(1,2)); t++ ){
										returnArray(numArray,i,rowNum++,new Integer(temp2.substring(3,4)));
									}
									
                  				}
                  			else{
                  				rowNum = isTrueOrFalse(rowNum,numArray[i]);
          						ce=tempRow.createCell(rowNum);
                  		  		ce.setCellValue((String)headers.get(bt)); 
	                  		  	if(sfColor(bt)){
	            			  		ce.setCellStyle(style2);
	            			  	}else{
	            			  		ce.setCellStyle(style3);
	            			  	}
                  		  		rowNum+=1;
                  			}
                  			
                    		}else{
                    			rowNum = isTrueOrFalse(rowNum,numArray[i]);
          						ce=tempRow.createCell(rowNum);
                  		  		ce.setCellValue((String)headers.get(bt)); 
	                  		  	if(sfColor(bt)){
	            			  		ce.setCellStyle(style2);
	            			  	}else{
	            			  		ce.setCellStyle(style3);
	            			  	}
                  		  		rowNum+=1;
                    		}
                  		//增加表头数组的下标
                  		bt++;
            	}
            	if(i==0){
            		//记录每一行共有多少个单元格
            		firstColSum =rowNum ;
            	}
            }
        }
        index = btArray.length+size;
        //遍历集合数据，产生数据行
     	if(dataset!=null){
     		HSSFRow row = null;
    	 	Iterator<T> it = dataset.iterator();
    	 	
    	      while (it.hasNext()) {
    	    	 Object value = null;
    	    	 HSSFCell cell = null;
    	         row = sheet.createRow(index);
    	         T t = (T) it.next();
    	         System.out.println(t.getClass()+"     "+(SjbbMessage)t);
    	         if(t instanceof HashMap){
    	        	 	for(int m=0;m< firstColSum;m++){
    	        	 		String name ="v_"+m;
    	        	 		value = ((HashMap) t).get(name);
    		        		 cell = row.createCell(m);	
    	 	            //判断值的类型后进行强制类型转换
    	                 String textValue = null;
    	                 if(value == null){
    	                	 value = "";
    	                 }
    	                 if (value instanceof Boolean) {
    	  
    	                    boolean bValue = (Boolean) value;
    	  
    	                    textValue = "男";
    	  
    	                    if (!bValue) {
    	  
    	                       textValue ="女";
    	  
    	                    }
    	                    cell.setCellValue(textValue);
    	                    cell.setCellStyle(style3);
    	                    continue;
    	  
    	                 } else if (value instanceof Date) {
    	  
    	                    Date date = (Date) value;
    	  
    	                    SimpleDateFormat sdf = new SimpleDateFormat(pattern);
    	  
    	                    textValue = sdf.format(date);
    	                    cell.setCellValue(textValue);
    	                    cell.setCellStyle(style3);
    	                    continue;
    	                 } 
    	                 
    	                 CreatValue(value,cell);
    	                 
    	        	 	}
    	                 
    	         }else{
    	        	 
    	        	 
    		         for (int i = 0; i <firstColSum; i++) {
    		        	 SjbbMessage sjbb=null;
    		        	 try{
    		        		 sjbb = (SjbbMessage)t;
    		        	 }catch(Exception e){
    		        		 System.out.println("\n"+"类型转换有误！");
    		        	 }
 		                	String methodName = "getV_" + i;
 		                	cell = row.createCell(i);
 				        	
    		            try {
//    		            	value = (String) sjbb.getClass().getMethod(methodName,  new Class[]{}).invoke(sjbb,new Object[]{});
    		            	value=(String)sjbb.getClass().getMethod(methodName).invoke(sjbb, null);
    		 	            //判断值的类型后进行强制类型转换
    		                 String textValue = null;

    		                 if (value instanceof Boolean) {
    		  
    		                    boolean bValue = (Boolean) value;
    		  
    		                    textValue = "男";
    		  
    		                    if (!bValue) {
    		  
    		                       textValue ="女";
    		  
    		                    }
    		                    cell.setCellValue(textValue);
    		                    continue;
    		                 } else if (value instanceof Date) {
    		  
    		                    Date date = (Date) value;
    		  
    		                    SimpleDateFormat sdf = new SimpleDateFormat(pattern);
    		  
    		                    textValue = sdf.format(date);
    		                    cell.setCellValue(textValue);
    		                    continue;
    		                 } 
    		  
    		                 CreatValue(value, cell);
    		            } catch (Exception e) {
    		 
    		                // TODO Auto-generated catch block
    		 
    		                e.printStackTrace();
    		 
    		            } finally {
    		 
    		                //清理资源
    		 
    		            }
    		         }
    	         
    	         }
    	         index++;
                    }
    	      }
	     	if(qtList !=null){
	     		if((Boolean)qtList.get(1)){
		     		 tempRow = sheet.createRow(index);;
		 	     	for(int j = 0; j < totalCol; j++){
		 				ce=tempRow.createCell(j);
		  			    ce.setCellValue((String)qtListtemp.get(tempNum));
		 			    ce.setCellStyle(style3);
		 			    tempNum ++;
		 			}
		     	}
	     	}
	     	
     	
     	
        try {
        	HSSFFooter footer = sheet.getFooter();   
        	footer.setRight( "Page " + HSSFFooter.page() + " of " + HSSFFooter.numPages() );
        	
        	tempRow = sheet.createRow(index);;
			ce=tempRow.createCell(2);
		    ce.setCellValue(excelFoot);
		    ce.setCellStyle(style3);
            workbook.write(out);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        

    }
    /**
     * 通过html表头、头注、脚注代码创建对应代码
     */
    private void createQt(List qt){
    	setBorder.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框
    	setBorder.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框
    	setBorder.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框
    	setBorder.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
    	setBorder.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中
    	font.setFontHeightInPoints((short) 16);//设置字体大小
    	setBorder.setFont(font);//选择需要用到的字体格式
    	
    	String qtHtml = (String) qt.get(3);
    	qtListtemp = CreatHeads(qtHtml);
    	totalCol = (Short)qt.get(2);
    	qtArray = qtHtml.split(";");
    	tempNum = 0;
    	for(int i = 0; i < qtArray.length; i++ ){
    		if(i == 0 && (Boolean)qt.get(0)){
				tempRow = returnRow(i);
				tempRow.setHeight((short)800);
				sheet.addMergedRegion(new Region(i,(short)0,i,(short)(totalCol-1)));
				ce=tempRow.createCell(0);
  		    	ce.setCellValue((String)qtListtemp.get(tempNum));
  		    	ce.setCellStyle(setBorder);
  		    	tempNum ++;
			}else if(i == qtArray.length-1 && (Boolean)qt.get(1)){
				
			}else{
				tempRow = returnRow(i);
				for(int j = 0; j < totalCol; j++){
					ce=tempRow.createCell(j);
	  		    	ce.setCellValue((String)qtListtemp.get(tempNum));
	  		    	ce.setCellStyle(style3);
	  		    	tempNum ++;
	    		}
			}
    		
    	}
    	
    }
   
    /**
     * 通过html标题代码创建标题头数组
     * @param excelHtml
     * @return 
     */
    private List CreatHeads( String excelHtml){
 	//整理html代码   
 	String a=excelHtml.replaceAll(";", "");
    	a = a.replaceAll(" ", "").replaceAll("<tr><tdrowspan='", "R").replaceAll("</td><tdcolspan='", "C").replaceAll("</td><tdrowspan='", "R").replaceAll("<tr><tdcolspan='", "C").replaceAll("</td></tr>", "");
    	System.out.println(a);
    	String array[]=a.replaceAll("<tr>", "").replaceAll("</tr>", "").replaceAll("<td", "").replaceAll("</td>", "").split(">");
    	
    	String bt="";
    	String temp="";
    	String temp2 = "";
    	for(int i=0;i<array.length;i++){
    		temp=array[i];
    		if(temp.length()>=4){
    			temp2 = temp.substring(temp.length()-4,temp.length());
    		}
    		if(temp.length()>=3){
    			//获得后三位值
    			String t=temp.substring(temp.length()-3, temp.length());
    			//获得除后三位以外的值
    			String s=temp.substring(0,temp.length()-3);
    			//该情况为单元格合并的数量小于10
    			if(t.endsWith("'")&&(t.startsWith("C")||t.startsWith("R"))){
    				char ch=t.charAt(1);
    				if(!Character.isDigit(ch)){
    					bt=bt+temp+";";
    				}else{
    					if(temp.length()>3){
    						bt=bt+s+";";
    					}
    					
    				}
    			//该情况为单元格合并的数量大于等于10
    			}else if(t.endsWith("'") && Character.isDigit(t.charAt(0))){
    				
    				if(temp.length()>=4){
    					
    				t=temp.substring(temp.length()-4, temp.length());
       	   			s=temp.substring(0,temp.length()-4);
       	   			
       	   			 if(t.startsWith("C")||t.startsWith("R")){
       	   				bt=bt+s+";";
       	   			}else{
       	   				bt=bt+temp+";";
       	   			}
    				}else{
    					bt=bt+temp+";";
    				}
    			}else if(temp2.length() == 4
   	   					&& temp2.substring(0,1).equals("C")
						&& Character.isDigit(temp2.charAt(1)) 
						&& temp2.substring(2,3).equals("R") 
						&& Character.isDigit(temp2.charAt(3)))
   	   			{
    				s=temp.substring(0,temp.length()-4);
   	   				bt=bt+s+";";
   	   			}
    			else{
    				bt=bt+temp+";";
    			}
    		}else{
    			bt=bt+temp+";";
    		}
    		
    	}
    	String heads[] = bt.split(";");
    	List<String> headList= new ArrayList<String>();
    	for(int i=0;i<heads.length;i++){
    		if(heads[i]!=null && (!"".equals(heads[i]))){
    			if(heads[i].equals( "''"))
    				headList.add("");
    			else if(heads[i].equals("null"))
    				headList.add("");
    			else
    				headList.add(heads[i]);
    		}
    		
    	}
    	return headList;
    }
    //判断当前单元格是否被占用
    private short  isTrueOrFalse(short num,String rowNum){
    	short tempNum = num;
    	if(rowNum == null){
    		rowNum = "";
    	}
    	String rowNumArray[] = rowNum.split(",");
    	if(rowNumArray != null && rowNumArray.length!=0){
    		for(int k =0;k<rowNumArray.length;k++){
	  			if((num+"").equals(rowNumArray[k])){
	  				num++;
	  				break;
	  			}	
	  		}
    		if(tempNum != num){
  				num = isTrueOrFalse(num,rowNum);
  			}
  			return num;
  			
    	}else{
    		return num;
    	}
    }
    /**
     * 
     * @param array 存放每行被占用的单元格的数组
     * @param i     当前行
     * @param j     当前的单元格的位置
     * @param value 一共合并的行数
     */
    private void returnArray(String[] array, int i, int j, int value){
    	String temp ="";
    	/*String[] tempArray = null;
    	if(i != 0 && i % 5 == 0){
    		tempArray = new String[array.length*2];
    	}else{
    		tempArray = new String[array.length];
    	}
    	for(int t = 0; t < array.length; t++){
    		tempArray[t] = array[t];
    	}*/
    	
    	for(int k = i+1; k < (i+value); k++){
    		temp = array[k]+j+",";
    		array[k]=temp;
    	}
    }
	/**
	 * 根据行号确定选取哪一行
	 * @param num
	 * @return
	 */
    private  HSSFRow returnRow( int num){ 
    	tempRow = sheet.createRow((short) num);
    	return tempRow;
    }
    /**
     * 根据类型创建单元格
     * @param value
     * @param cell
     */
    private void CreatValue(Object value, HSSFCell cell){
	        if (value instanceof Integer) {
	        	int intValue = (Integer) value;
	        	cell.setCellValue(intValue);
	        } else if (value instanceof Float) {
	        	float fValue = (Float) value;
	        	cell.setCellValue(fValue);
	        } else if (value instanceof Double) {
	        	double dValue = (Double) value;
	        /*textValue = new HSSFRichTextString(
	              String.valueOf(dValue));*/
	        	cell.setCellValue(dValue);
	        } else if (value instanceof Long) {
	        	long longValue = (Long) value;
	        	cell.setCellValue(longValue);
	        } else{
	        	cell.setCellValue(String.valueOf(value));
	        }
	        	cell.setCellStyle(style3);
    	}
    

	private boolean sfColor(int num){
		boolean flag = false;
		if(colorList != null && colorList.length !=0){
			for(int i = 0; i < colorList.length; i++){
				if(colorList[i].equals(num+"")){
					flag = true;
					break;
				}
			}
		}
		
		return flag;
	}
}