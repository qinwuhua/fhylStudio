package com.hdsx.jxzhpt.utile;

import java.util.List;
import java.util.Map;
/**
 * @author chc
 * 
 *
 */
public class SheetBean {
	private String tableName ;//����
	private String sheetName; //sheetҳ���
	private String header;  //��ͷ
	private String footer; //��ײ�
	private List list;  //��ݼ���
	private short colnum; //������
	private Map<String,String> statis_field=null;  //Ҫͳ�Ƶ��� ��ʽ map('1','sum')��index ��1��ʼ
	private String []rowspan_field=null; //���кϲ���ֵͬ���� ��index ��1��ʼ
	private short columnWidth=15;
	
	
	public short getColumnWidth() {
		return columnWidth;
	}
	public void setColumnWidth(short columnWidth) {
		this.columnWidth = columnWidth;
	}
	public short getColnum() {
		return colnum;
	}
	public void setColnum(short colnum) {
		this.colnum = colnum;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getSheetName() {
		return sheetName;
	}
	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getFooter() {
		return footer;
	}
	public void setFooter(String footer) {
		this.footer = footer;
	}
	
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Map<String, String> getStatis_field() {
		return statis_field;
	}
	public void setStatis_field(Map<String, String> statis_field) {
		this.statis_field = statis_field;
	}
	public String[] getRowspan_field() {
		return rowspan_field;
	}
	public void setRowspan_field(String[] rowspan_field) {
		this.rowspan_field = rowspan_field;
	}
	
	
}
