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
		zdxx.setGydw(gydw);
		zdxx.setNian(nian);
		zdxx.setYue(yue);
		List<Map<String, Object>> list1=dbyhServer.selectList1();
		List<Map<String, Object>> list2=dbyhServer.selectList2(zdxx);
		
		List<Zdxx> list3=dbyhServer.selectList3(zdxx);
		String str="";
		for (int i = 0; i < list3.size(); i++) {
			if(i!=list3.size()-1){
				str=str+"'"+list3.get(i).getId()+"',";
			}
			else{
				str=str+"'"+list3.get(i).getId()+"'";
			}
		}
		zdxx.setTiaojian("iOrgID in("+str+")");
		List<Map<String, Object>> list4=dbyhServer.selectList4(zdxx);
		
		List<Map<String, Object>> list5=dbyhServer.selectList5(zdxx);
		
		List<Excel_list> list6=new ArrayList<Excel_list>();
		if(list5.size()>0){
			Excel_list el=new Excel_list();
			el.setV_0("合计");
			el.setV_1("0");
			el.setV_2("0");
			el.setV_3("0");
			el.setV_4("0");
			el.setV_5("0");
			el.setV_6("0");
			el.setV_7("0");
			el.setV_8("0");
			el.setV_9("0");
			el.setV_10("0");
			el.setV_11("0");
			el.setV_12("0");
			el.setV_13("0");
			el.setV_14("0");
			el.setV_15("0");
			el.setV_16("0");
			el.setV_17("0");
			el.setV_18("0");
			el.setV_19("0");
			el.setV_20("0");
			el.setV_21("0");
			el.setV_22("0");
			el.setV_23("0");
			el.setV_24("0");
			el.setV_25("0");
			el.setV_26("0");
			el.setV_27("0");
			el.setV_28("0");
			el.setV_29("0");
			el.setV_30("0");
			el.setV_31("0");
			el.setV_32("0");
			el.setV_33("0");
			el.setV_34("0");
			el.setV_35("0");
			el.setV_36("0");
			el.setV_37("0");
			el.setV_38("0");
			el.setV_39("0");
			el.setV_40("0");
			for (Map<String, Object> map : list5) {
				
				if("0101".equals(map.get("sItemCode").toString()))
					el.setV_1(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0102".equals(map.get("sItemCode").toString()))
					el.setV_2(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0103".equals(map.get("sItemCode").toString()))
					el.setV_3(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0104".equals(map.get("sItemCode").toString()))
					el.setV_4(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0105".equals(map.get("sItemCode").toString()))
					el.setV_5(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0106".equals(map.get("sItemCode").toString()))
					el.setV_6(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0107".equals(map.get("sItemCode").toString()))
					el.setV_7(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0201".equals(map.get("sItemCode").toString()))
					el.setV_8(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0202".equals(map.get("sItemCode").toString()))
					el.setV_9(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0203".equals(map.get("sItemCode").toString()))
					el.setV_10(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0204".equals(map.get("sItemCode").toString()))
					el.setV_11(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0205".equals(map.get("sItemCode").toString()))
					el.setV_12(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0206".equals(map.get("sItemCode").toString()))
					el.setV_13(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0207".equals(map.get("sItemCode").toString()))
					el.setV_14(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0208".equals(map.get("sItemCode").toString()))
					el.setV_15(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0209".equals(map.get("sItemCode").toString()))
					el.setV_16(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0301".equals(map.get("sItemCode").toString()))
					el.setV_17(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0302".equals(map.get("sItemCode").toString()))
					el.setV_18(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0303".equals(map.get("sItemCode").toString()))
					el.setV_19(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0304".equals(map.get("sItemCode").toString()))
					el.setV_20(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0305".equals(map.get("sItemCode").toString()))
					el.setV_21(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0306".equals(map.get("sItemCode").toString()))
					el.setV_22(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0401".equals(map.get("sItemCode").toString()))
					el.setV_23(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0402".equals(map.get("sItemCode").toString()))
					el.setV_24(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0403".equals(map.get("sItemCode").toString()))
					el.setV_25(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0404".equals(map.get("sItemCode").toString()))
					el.setV_26(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0405".equals(map.get("sItemCode").toString()))
					el.setV_27(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0406".equals(map.get("sItemCode").toString()))
					el.setV_28(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0407".equals(map.get("sItemCode").toString()))
					el.setV_29(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0501".equals(map.get("sItemCode").toString()))
					el.setV_30(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0502".equals(map.get("sItemCode").toString()))
					el.setV_31(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0503".equals(map.get("sItemCode").toString()))
					el.setV_32(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0504".equals(map.get("sItemCode").toString()))
					el.setV_33(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0505".equals(map.get("sItemCode").toString()))
					el.setV_34(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0506".equals(map.get("sItemCode").toString()))
					el.setV_35(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0507".equals(map.get("sItemCode").toString()))
					el.setV_36(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0508".equals(map.get("sItemCode").toString()))
					el.setV_37(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0509".equals(map.get("sItemCode").toString()))
					el.setV_38(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0601".equals(map.get("sItemCode").toString()))
					el.setV_39(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
				
				if("0602".equals(map.get("sItemCode").toString()))
					el.setV_40(map.get("mWorkNum").toString().substring(0,map.get("mWorkNum").toString().length()-2));
					
			}
			list6.add(el);
		}
		else{
			Excel_list el=new Excel_list();
			el.setV_0("合计");
			el.setV_1("0");
			el.setV_2("0");
			el.setV_3("0");
			el.setV_4("0");
			el.setV_5("0");
			el.setV_6("0");
			el.setV_7("0");
			el.setV_8("0");
			el.setV_9("0");
			el.setV_10("0");
			el.setV_11("0");
			el.setV_12("0");
			el.setV_13("0");
			el.setV_14("0");
			el.setV_15("0");
			el.setV_16("0");
			el.setV_17("0");
			el.setV_18("0");
			el.setV_19("0");
			el.setV_20("0");
			el.setV_21("0");
			el.setV_22("0");
			el.setV_23("0");
			el.setV_24("0");
			el.setV_25("0");
			el.setV_26("0");
			el.setV_27("0");
			el.setV_28("0");
			el.setV_29("0");
			el.setV_30("0");
			el.setV_31("0");
			el.setV_32("0");
			el.setV_33("0");
			el.setV_34("0");
			el.setV_35("0");
			el.setV_36("0");
			el.setV_37("0");
			el.setV_38("0");
			el.setV_39("0");
			el.setV_40("0");
			list6.add(el);
		}
		for (Map<String, Object> map : list2) {
			Excel_list el=new Excel_list();
			el.setV_0(map.get("sOrgName").toString());
			el.setV_1("0");
			el.setV_2("0");
			el.setV_3("0");
			el.setV_4("0");
			el.setV_5("0");
			el.setV_6("0");
			el.setV_7("0");
			el.setV_8("0");
			el.setV_9("0");
			el.setV_10("0");
			el.setV_11("0");
			el.setV_12("0");
			el.setV_13("0");
			el.setV_14("0");
			el.setV_15("0");
			el.setV_16("0");
			el.setV_17("0");
			el.setV_18("0");
			el.setV_19("0");
			el.setV_20("0");
			el.setV_21("0");
			el.setV_22("0");
			el.setV_23("0");
			el.setV_24("0");
			el.setV_25("0");
			el.setV_26("0");
			el.setV_27("0");
			el.setV_28("0");
			el.setV_29("0");
			el.setV_30("0");
			el.setV_31("0");
			el.setV_32("0");
			el.setV_33("0");
			el.setV_34("0");
			el.setV_35("0");
			el.setV_36("0");
			el.setV_37("0");
			el.setV_38("0");
			el.setV_39("0");
			el.setV_40("0");
			if(list4.size()==0){
				el.setV_1("0");
				el.setV_1("0");
				el.setV_2("0");
				el.setV_3("0");
				el.setV_4("0");
				el.setV_5("0");
				el.setV_6("0");
				el.setV_7("0");
				el.setV_8("0");
				el.setV_9("0");
				el.setV_10("0");
				el.setV_11("0");
				el.setV_12("0");
				el.setV_13("0");
				el.setV_14("0");
				el.setV_15("0");
				el.setV_16("0");
				el.setV_17("0");
				el.setV_18("0");
				el.setV_19("0");
				el.setV_20("0");
				el.setV_21("0");
				el.setV_22("0");
				el.setV_23("0");
				el.setV_24("0");
				el.setV_25("0");
				el.setV_26("0");
				el.setV_27("0");
				el.setV_28("0");
				el.setV_29("0");
				el.setV_30("0");
				el.setV_31("0");
				el.setV_32("0");
				el.setV_33("0");
				el.setV_34("0");
				el.setV_35("0");
				el.setV_36("0");
				el.setV_37("0");
				el.setV_38("0");
				el.setV_39("0");
				el.setV_40("0");
			}
			else{
				for (int i = 0; i < list4.size(); i++) {
					
					if(map.get("iOrgID").toString().equals(list4.get(i).get("iOrgID").toString())){
						if("0101".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_1(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0102".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_2(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0103".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_3(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0104".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_4(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0105".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_5(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0106".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_6(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0107".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_7(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0201".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_8(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0202".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_9(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0203".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_10(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0204".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_11(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0205".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_12(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0206".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_13(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0207".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_14(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0208".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_15(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0209".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_16(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0301".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_17(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0302".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_18(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0303".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_19(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0304".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_20(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0305".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_21(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0306".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_22(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0401".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_23(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0402".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_24(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0403".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_25(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0404".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_26(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0405".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_27(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0406".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_28(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0407".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_29(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0501".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_30(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0502".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_31(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0503".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_32(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0504".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_33(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0505".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_34(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0506".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_35(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0507".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_36(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0508".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_37(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0509".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_38(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0601".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_39(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
						if("0602".equals(list4.get(i).get("sItemCode").toString()))
							el.setV_40(list4.get(i).get("mWorkNum").toString().substring(0,list4.get(i).get("mWorkNum").toString().length()-2));
						
					}
				}
			}
			list6.add(el);
		}
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路养护小修保养月报表");//设置第一行
		eldata.setSheetName("月报表");//设置sheeet名
		eldata.setFileName(nian+"年"+yue+"月"+"公路养护小修保养月报表");//设置文件名
		eldata.setEl(list6);//将实体list放入类中
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
		List<Map<String, Object>> list1=dbyhServer.selectPdbList(zdxx);
		List<Excel_list> list2=new ArrayList<Excel_list>();
		try{
		for (int i = 0; i < list1.size(); i++) {
			Excel_list eli=new Excel_list();
			eli.setV_0("0.00");
			eli.setV_1("0.00");
			eli.setV_2("0.00");
			eli.setV_3("0.00");
			eli.setV_4("0.00");
			eli.setV_5("0.00");
			eli.setV_6("0.00");
			eli.setV_7("0.00");
			eli.setV_8("0.00");
			eli.setV_9("0.00");
			eli.setV_10("0.00");
			eli.setV_11("0.00");
			eli.setV_12("0.00");
			eli.setV_13("0.00");
			eli.setV_14("0.00");
			eli.setV_15("0.00");
			eli.setV_16("0.00");
			eli.setV_17("0.00");
			eli.setV_18("0.00");
			eli.setV_19("0.00");
			eli.setV_20("0.00");
			eli.setV_21("0.00");
			eli.setV_22("0.00");
			eli.setV_23("0.00");
			eli.setV_24("0.00");
			eli.setV_25("0.00");
			eli.setV_26("0.00");
			eli.setV_27("0.00");
			eli.setV_28("0.00");
			eli.setV_29("0.00");
			eli.setV_30("0.00");
			if(list1.get(i).get("OrgName")!=null){
				eli.setV_0(list1.get(i).get("OrgName").toString());
			}
			if(list1.get(i).get("YLSpace")!=null){
				eli.setV_9(list1.get(i).get("YLSpace").toString().substring(0,list1.get(i).get("YLSpace").toString().length()-2));
			}
			if(list1.get(i).get("YLSpace1")!=null){
				eli.setV_10(list1.get(i).get("YLSpace1").toString().substring(0,list1.get(i).get("YLSpace1").toString().length()-2));
			}
			if(list1.get(i).get("YLSpace2")!=null){
				eli.setV_11(list1.get(i).get("YLSpace2").toString().substring(0,list1.get(i).get("YLSpace2").toString().length()-2));
			}
			if(list1.get(i).get("YLSpace3")!=null){
				eli.setV_12(list1.get(i).get("YLSpace3").toString().substring(0,list1.get(i).get("YLSpace3").toString().length()-2));
			}
			if(list1.get(i).get("YLSpace4")!=null){
				eli.setV_13(list1.get(i).get("YLSpace4").toString().substring(0,list1.get(i).get("YLSpace4").toString().length()-2));
			}
			if(list1.get(i).get("YLSpace5")!=null){
				eli.setV_14(list1.get(i).get("YLSpace5").toString().substring(0,list1.get(i).get("YLSpace5").toString().length()-2));
			}
			if(list1.get(i).get("YLMQI")!=null){
				eli.setV_15(list1.get(i).get("YLMQI").toString().substring(0,list1.get(i).get("YLMQI").toString().length()-2));
			}
			if(list1.get(i).get("YLGoodRate")!=null){
				eli.setV_16(list1.get(i).get("YLGoodRate").toString().substring(0,list1.get(i).get("YLGoodRate").toString().length()-2));
			}
			if(list1.get(i).get("SNSpace")!=null){
				eli.setV_17(list1.get(i).get("SNSpace").toString().substring(0,list1.get(i).get("SNSpace").toString().length()-2));
			}
			if(list1.get(i).get("SNSpace1")!=null){
				eli.setV_18(list1.get(i).get("SNSpace1").toString().substring(0,list1.get(i).get("SNSpace1").toString().length()-2));
			}
			if(list1.get(i).get("SNSpace2")!=null){
				eli.setV_19(list1.get(i).get("SNSpace2").toString().substring(0,list1.get(i).get("SNSpace2").toString().length()-2));
			}
			if(list1.get(i).get("SNSpace3")!=null){
				eli.setV_20(list1.get(i).get("SNSpace3").toString().substring(0,list1.get(i).get("SNSpace3").toString().length()-2));
			}
			if(list1.get(i).get("SNSpace4")!=null){
				eli.setV_21(list1.get(i).get("SNSpace4").toString().substring(0,list1.get(i).get("SNSpace4").toString().length()-2));
			}
			if(list1.get(i).get("SNSpace5")!=null){
				eli.setV_22(list1.get(i).get("SNSpace5").toString().substring(0,list1.get(i).get("SNSpace5").toString().length()-2));
			}
			if(list1.get(i).get("SNMQI")!=null){
				eli.setV_23(list1.get(i).get("SNMQI").toString().substring(0,list1.get(i).get("SNMQI").toString().length()-2));
			}
			if(list1.get(i).get("snGoodRate")!=null){
				eli.setV_24(list1.get(i).get("snGoodRate").toString().substring(0,list1.get(i).get("snGoodRate").toString().length()-2));
			}
			if(list1.get(i).get("WorkManZz")!=null){
				eli.setV_25(list1.get(i).get("WorkManZz").toString().substring(0,list1.get(i).get("WorkManZz").toString().length()-2));
			}
			if(list1.get(i).get("WorkManLs")!=null){
				eli.setV_26(list1.get(i).get("WorkManLs").toString().substring(0,list1.get(i).get("WorkManLs").toString().length()-2));
			}
			if(list1.get(i).get("WorkDay")!=null){
				eli.setV_27(list1.get(i).get("WorkDay").toString().substring(0,list1.get(i).get("WorkDay").toString().length()-2));
			}
			if(list1.get(i).get("WorkDayRate")!=null){
				eli.setV_28(list1.get(i).get("WorkDayRate").toString().substring(0,list1.get(i).get("WorkDayRate").toString().length()-2));
			}
			if(list1.get(i).get("TimeDay")!=null){
				eli.setV_29(list1.get(i).get("TimeDay").toString().substring(0,list1.get(i).get("TimeDay").toString().length()-2));
			}
			if(list1.get(i).get("TimeDayRate")!=null){
				eli.setV_30(list1.get(i).get("TimeDayRate").toString().substring(0,list1.get(i).get("TimeDayRate").toString().length()-2));
			}
			eli.setV_1(new   BigDecimal(Double.parseDouble(eli.getV_9())+Double.parseDouble(eli.getV_17())).setScale(2,BigDecimal.ROUND_HALF_UP)+"");
			eli.setV_2(new   BigDecimal(Double.parseDouble(eli.getV_10())+Double.parseDouble(eli.getV_18())).setScale(2,BigDecimal.ROUND_HALF_UP)+"");
			eli.setV_3(new   BigDecimal(Double.parseDouble(eli.getV_11())+Double.parseDouble(eli.getV_19())).setScale(2,BigDecimal.ROUND_HALF_UP)+"");
			eli.setV_4(new   BigDecimal(Double.parseDouble(eli.getV_12())+Double.parseDouble(eli.getV_20())).setScale(2,BigDecimal.ROUND_HALF_UP)+"");
			eli.setV_5(new   BigDecimal(Double.parseDouble(eli.getV_13())+Double.parseDouble(eli.getV_21())).setScale(2,BigDecimal.ROUND_HALF_UP)+"");
			eli.setV_6(new   BigDecimal(Double.parseDouble(eli.getV_14())+Double.parseDouble(eli.getV_22())).setScale(2,BigDecimal.ROUND_HALF_UP)+"");
			eli.setV_7(new   BigDecimal(Double.parseDouble(eli.getV_15())+Double.parseDouble(eli.getV_23())).setScale(2,BigDecimal.ROUND_HALF_UP)+"");
			eli.setV_8(new   BigDecimal(Double.parseDouble(eli.getV_16())+Double.parseDouble(eli.getV_24())).setScale(2,BigDecimal.ROUND_HALF_UP)+"");
			list2.add(eli);
		}
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
		List<Map<String, Object>> list1=dbyhServer.selectYlbList(zdxx);
		List<Excel_list> list2=new ArrayList<Excel_list>();
		try{
		for (int i = 0; i < list1.size(); i++) {
			Excel_list eli=new Excel_list();
			eli.setV_0("");
			eli.setV_1("");
			eli.setV_2("");
			eli.setV_3("");
			eli.setV_4("");
			eli.setV_5("");
			eli.setV_6("");
			eli.setV_7("");
			eli.setV_8("");
			eli.setV_9("");
			eli.setV_10("");
			eli.setV_11("");
			eli.setV_12("");
			eli.setV_13("");
			
			if(list1.get(i).get("LineCode")!=null){
				eli.setV_0(list1.get(i).get("LineCode").toString());
			}
			if(list1.get(i).get("LineName")!=null){
				eli.setV_1(list1.get(i).get("LineName").toString());
			}
			if(list1.get(i).get("OrgName")!=null){
				eli.setV_2(list1.get(i).get("OrgName").toString());
			}
			if(list1.get(i).get("StartSpace")!=null){
				eli.setV_3(list1.get(i).get("StartSpace").toString());
			}
			if(list1.get(i).get("EndSpace")!=null){
				eli.setV_4(list1.get(i).get("EndSpace").toString());
			}
			if(list1.get(i).get("RoadTotal")!=null){
				eli.setV_5(list1.get(i).get("RoadTotal").toString().substring(0,list1.get(i).get("RoadTotal").toString().length()-2));
			}
			if(list1.get(i).get("Space1")!=null){
				eli.setV_6(list1.get(i).get("Space1").toString().substring(0,list1.get(i).get("Space1").toString().length()-2));
			}
			if(list1.get(i).get("Space2")!=null){
				eli.setV_7(list1.get(i).get("Space2").toString().substring(0,list1.get(i).get("Space2").toString().length()-2));
			}
			if(list1.get(i).get("Space3")!=null){
				eli.setV_8(list1.get(i).get("Space3").toString().substring(0,list1.get(i).get("Space3").toString().length()-2));
			}
			if(list1.get(i).get("Space4")!=null){
				eli.setV_9(list1.get(i).get("Space4").toString().substring(0,list1.get(i).get("Space4").toString().length()-2));
			}
			if(list1.get(i).get("Space5")!=null){
				eli.setV_10(list1.get(i).get("Space5").toString().substring(0,list1.get(i).get("Space5").toString().length()-2));
			}
			if(list1.get(i).get("GoodRate")!=null){
				eli.setV_11(list1.get(i).get("GoodRate").toString().substring(0,list1.get(i).get("GoodRate").toString().length()-2));
			}
			if(list1.get(i).get("MQITotal")!=null){
				eli.setV_12(list1.get(i).get("MQITotal").toString().substring(0,list1.get(i).get("MQITotal").toString().length()-2));
			}
			if(list1.get(i).get("LineIndex")!=null){
				eli.setV_13(list1.get(i).get("LineIndex").toString().substring(0,list1.get(i).get("LineIndex").toString().length()-2));
			}
			list2.add(eli);
		}
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
			
			String niany=data.get(data.size()-1).get("1").toString();
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
			for (int i = 0; i < data.size()-1; i++) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				data.get(i).put("id", s1);data.get(i).put("xh", num+"");
				data.get(i).put("ybyf", niany.substring(0,7));
				num++;
			}
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
			
			String niany=data.get(data.size()-1).get("1").toString();
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
			for (int i = 0; i < data.size()-1; i++) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				data.get(i).put("id", s1);data.get(i).put("xh", num+"");
				data.get(i).put("ybyf", niany.substring(0,7).toString());
				num++;
			}
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
			
			String niany=data.get(data.size()-1).get("1").toString();
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
			for (int i = 0; i < data.size()-1; i++) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				data.get(i).put("id", s1);data.get(i).put("xh", num+"");
				data.get(i).put("ybyf", niany.substring(0,7).toString());
				num++;
			}
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
			
			String niany=data.get(data.size()-1).get("1").toString();
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
			for (int i = 0; i < data.size()-1; i++) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				data.get(i).put("id", s1);data.get(i).put("xh", num+"");
				data.get(i).put("ybyf", niany.substring(0,7).toString());
				num++;
			}
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
			
			String niany=data.get(data.size()-1).get("1").toString();
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
			for (int i = 0; i < data.size()-1; i++) {
				String s = UUID.randomUUID().toString(); 
				String s1 = s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
				data.get(i).put("id", s1);data.get(i).put("xh", num+"");
				data.get(i).put("ybyf", niany.substring(0,7).toString());
				num++;
			}
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

