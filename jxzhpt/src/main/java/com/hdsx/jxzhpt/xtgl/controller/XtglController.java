package com.hdsx.jxzhpt.xtgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import sun.misc.BASE64Encoder;

import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.xtgl.server.XtglServer;
import com.hdsx.jxzhpt.xtgl.bean.Unit;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.jxzhpt.xtgl.bean.Param;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.jxzhpt.xtgl.bean.Yhdzxcs;
import com.hdsx.webutil.struts.BaseActionSupport;
/**
 * 系统管理Controller层
 * @author xunq
 *
 */
@Scope("prototype")
@Controller
public class XtglController extends BaseActionSupport{
	
	private static final long serialVersionUID = -1512493918772500846L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "xtglServerImpl")
	private XtglServer xtglServer;
	//单位实体
	private Unit unit;
	private Bzbz bzbz;
	private Param param;
	private Plan_flwbzbz flwbzbz;
	private Yhdzxcs yhdzxcs;
	//用户实体
	private Master master;
	private String anyXml;
	private String yhm;
	private String yhzt;
	private String yhdw;
	private String yhids;
	private String username;
	private String password;
	private String gmgid;
	private String id;
	private String yzm;
	private String parent;
	private String wh;
	private String type;
	
	public String getWh() {
		return wh;
	}
	public void setWh(String wh) {
		this.wh = wh;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	/**
	 * 重置密碼
	 */
	public void czPassword(){
		MessageDigest md5;
		String temp="";
		try {
			md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base = new BASE64Encoder();
			temp = base.encode(md5.digest("000000".getBytes()));
			this.master.setPassword(temp);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean bl = xtglServer.czPassword(master);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}
		else
			ResponseUtils.write(getresponse(), "false");
	}
	/**
	 * 单位级联查询
	 */
	public void seldw2(){
		try {
			List<TreeNode> l=xtglServer.selchildedw(yhdw+"__");
			String s=JSONArray.fromObject(l).toString();
			ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void seldw(){
		try {
			List<TreeNode> l=xtglServer.seldw(yhdw);
			String s=JSONArray.fromObject(l).toString();
			ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * updatePassword
	 */
	public void updatePassword(){
		MessageDigest md5;
		String temp="";
		try {
			md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base = new BASE64Encoder();
			temp = base.encode(md5.digest(password.getBytes()));
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap hm=new HashMap();
		hm.put("id", username);
		hm.put("mm", temp);
		boolean bl = xtglServer.updatePassword(hm);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	/**
	 * 登陆
	 */
	public void login(){
		MessageDigest md5;
		String temp="";
		try {
			md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base = new BASE64Encoder();
			temp = base.encode(md5.digest(master.getPassword().getBytes()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		HashMap hm=new HashMap();
		hm.put("truename", master.getTruename());
		hm.put("password", temp);
		HashMap<String,String> bl = xtglServer.login(hm);
		if(bl!=null){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			session.setAttribute("truename", bl.get("TRUENAME"));
			session.setAttribute("name", bl.get("NAME"));
			session.setAttribute("rolename", bl.get("ROLENAME"));
			try {
				JsonUtils.write(bl, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	
	
	
	
	public void loginCheck(){
		HashMap hm=new HashMap();
		hm.put("truename", master.getTruename());
		HashMap<String,String> bl = xtglServer.loginCheck(hm);
		if(bl!=null){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			session.setAttribute("truename", bl.get("TRUENAME"));
			session.setAttribute("name", bl.get("NAME"));
			session.setAttribute("rolename", bl.get("ROLENAME"));
			try {
				JsonUtils.write(bl, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	/**
	 * 行政区划级联查询
	 */
	public void selAllXzqh2() {
		try {
		    List<TreeNode> l=xtglServer.selAllXzqh2(yhdw);
            String s=JSONArray.fromObject(l).toString();
            System.out.println(s);
			ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//查询行政区划
	public void selAllXzqh() {
		try {
            List<TreeNode> l=xtglServer.selAllXzqh(yhdw);
		    String s=JSONArray.fromObject(l).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 用户退出系统时删除session信息
	 * @return
	 */
	public void clearSession(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("truename") != null){
			session.setAttribute("truename",null);
			session.setAttribute("name", null);
		}
		ResponseUtils.write(getresponse(), "true");
	}
	
	/**
	 * 从session中取出用户名查询权限（防止用户没有登录直接访问index页面）
	 */
	public void selQx(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("truename");
		if(username == null || username == ""){
			ResponseUtils.write(getresponse(), "false");
		}else{
			ResponseUtils.write(getresponse(), "true");
		}
	}
	/**
	 * 用户管理列表
	 */
	public void selectYhList(){
		HashMap hm=new HashMap();
		hm.put("page", page);
		hm.put("rows", rows);
		hm.put("yhm", master.getTruename());
		if(!"36".equals(master.getUnit())) hm.put("unit", master.getUnit());
		int count=xtglServer.selectYhListCount(hm);
		List<Master> list=xtglServer.selectYhList(hm);
		EasyUIPage<Master> e=new EasyUIPage<Master>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	/**
	 * 修改状态
	 */
	public void updatezt(){
		HashMap hm=new HashMap();
		hm.put("id", yhm);
		hm.put("zt", yhzt);
		boolean bl = xtglServer.updatezt(hm);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	/**
	 * 选择角色列表
	 */
	public void selQxList(){
		HashMap hm=new HashMap();
		List<HashMap> list=xtglServer.selQxList(hm);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 添加用户
	 */
	public void insertYh(){
		MessageDigest md5;
		try {
			md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base = new BASE64Encoder();
			String temp = base.encode(md5.digest(master.getPassword().getBytes()));
			master.setPassword(temp);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		boolean b=xtglServer.insertYh(master);
		if(b!=true){
			ResponseUtils.write(getresponse(), "false");
		}else{
			ResponseUtils.write(getresponse(), "true");
		}
	}
	/**
	 * 重置密码
	 */
	public void mimareset(){
		MessageDigest md5;
		String temp="";
		try {
			md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base = new BASE64Encoder();
			temp = base.encode(md5.digest("000000".getBytes()));
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap hm=new HashMap();
		hm.put("id", yhm);
		hm.put("password", temp);
		boolean bl = xtglServer.mimareset(hm);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	/**
	 * 删除用户
	 */
	public void deleteYh(){
		boolean bl = xtglServer.deleteYh(yhm);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	/**
	 * 删除用户
	 */
	public void updateYh(){
		/*
		MessageDigest md5;
		String temp="";
		try {
			md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base = new BASE64Encoder();
			temp = base.encode(md5.digest("000000".getBytes()));
			master.setPassword(temp);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}*/
		boolean bl = xtglServer.updateYh(master);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	/**
	 * 角色列表
	 */
	public void selectJsList(){
		List<Param> list=xtglServer.selectJsList(param);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 角色列表
	 */
	public void insertJs(){
		boolean bl  = xtglServer.insertJs(param);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void updateJs(){
		boolean bl  = xtglServer.updateJs(param);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectJsById(){
		Param p=xtglServer.selectJsById(param);
		try {
			JsonUtils.write(p, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	/**
	 * 删除角色
	 */
	public void deleteJsById(){
		boolean bl  = xtglServer.deleteJsById(param);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	/**
	 * 行政区划树列表
	 */
	public void selectXzqhList(){
		
		int count =0;
		List<Unit> list=new ArrayList<Unit>();
		
		if(id==null){
			count = xtglServer.selectXzqhListCount(unit);
			list = xtglServer.selectXzqhList(unit);
			int len=unit.getId().length();
			for(int i=0;i<list.size();i++){
				if(!unit.getId().equals(list.get(i).getId())&&i!=0)
				{
					list.get(i).set_parentId(list.get(i).getParent());
				}
				if(list.get(i).getBmid().length()>=(len/2)*6+6||len==6){
					list.get(i).setState("closed");
				}
			}
		}else{
			list = xtglServer.selectLxQlDataList(id);
			for(int i=0;i<list.size();i++){
				list.get(i).set_parentId(list.get(i).getParent());	
				list.get(i).setState("closed");
			}
		}
		
		EasyUIPage<Unit> ep = new EasyUIPage<Unit>();
		ep.setTotal(count);
		ep.setRows(list);
		try {
			JsonUtils.write(ep, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 单位树列表
	 */
	public void selectDwList(){
		int count = xtglServer.selectDwListCount(unit);
		List<Unit> list = xtglServer.selectDwList(unit);
		int len=unit.getId().length();
		if(len!=0) len+=4;
		for(int i=0;i<list.size();i++){
			if(!unit.getId().equals(list.get(i).getId())&&i!=0)
			{
				list.get(i).set_parentId(list.get(i).getParent());
			}
			if(list.get(i).getUnit().length()>len+11){
				list.get(i).setState("closed");
			}
		}
		EasyUIPage<Unit> ep = new EasyUIPage<Unit>();
		ep.setTotal(count);
		ep.setRows(list);
		try {
			JsonUtils.write(ep, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 编码编码树列表
	 */
	public void getBmbmTreeByName(){
		try {
			yhm=java.net.URLDecoder.decode(yhm,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		HashMap<String, String> hm=new HashMap<String, String>();
		hm.put("name", yhm);
		List<TreeNode> list =  xtglServer.getBmbmTreeByName(hm);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getbbh(){
		
		HashMap<String, String> hm=new HashMap<String, String>();
		hm.put("name", yhm);
		List<TreeNode> list =  xtglServer.getbbh(hm);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 插入单位
	 */
	public void insertDw(){
		boolean bl=xtglServer.insertDw(unit);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	/**
	 * 插入单位
	 */
	public void deleteDwById(){
		boolean bl=xtglServer.deleteDwById(unit);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	/**
	 * cha单位
	 */
	public void selectDwById(){
		List<Unit> list =  xtglServer.selectDwById(unit);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * update单位
	 */
	public void updateDw(){
		boolean bl=xtglServer.updateDw(unit);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	/**
	 * bmbm树
	 */
	public void selectBmbmList(){
		int count = xtglServer.selectBmbmListCount(unit);
		List<Unit> list = xtglServer.selectBmbmList(unit);
		for(int i=0;i<list.size();i++){
			if(!unit.getId().equals(list.get(i).getId()))
			{
				list.get(i).set_parentId(list.get(i).getParent());
			}
			if(list.get(i).getId().length()==4){
				list.get(i).setState("closed");
			}
		}
		EasyUIPage<Unit> ep = new EasyUIPage<Unit>();
		ep.setTotal(count);
		ep.setRows(list);
		try {
			JsonUtils.write(ep, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * insertBmbm
	 */
	public void insertBmbm(){
		boolean bl=xtglServer.insertBmbm(unit);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	/**
	 * updateBmbm
	 */
	public void updateBmbm(){
		boolean bl=xtglServer.updateBmbm(unit);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	/**
	 * deleteBmbm
	 */
	public void deleteBmbmById(){
		boolean bl=xtglServer.deleteBmbmById(unit);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void checkname(){
		HashMap hm=new HashMap();
		hm.put("truename", master.getTruename());
		List<Master> list=xtglServer.checkname(hm);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	/**
	 * 特殊地区列表
	 */
	public void selectTsdqList(){
		List<Param> list=xtglServer.selectTsdqList(param);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void updateTsdqZt(){
		boolean bl=xtglServer.updateTsdqZt(param);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selAllTsdq2() {
		try {
		    List<TreeNode> l=xtglServer.selAllTsdq2(yhdw);
            String s=JSONArray.fromObject(l).toString();
			ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void selAllTsdq() {
		try {
            List<TreeNode> l=xtglServer.selAllTsdq(yhdw);
		    String s=JSONArray.fromObject(l).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selAnyChartXml(){
		List<Param> l=xtglServer.selSqlStrByLxid(param);
		List<Param> l_total=new ArrayList<Param>();
		Param temp=l.get(0);
		int flag_temp=Integer.parseInt(l.get(0).getId());
		for(int i=1;i<l.size();i++){
			if(temp.getParent().equals(l.get(i).getParent())&&i!=l.size()-1){
				flag_temp+=Integer.parseInt(l.get(i).getId());
			}else if(!temp.getParent().equals(l.get(i).getParent())&&i!=l.size()-1){
				temp.setDescr(flag_temp+"");
				l_total.add(temp);
				temp=l.get(i);
				flag_temp=Integer.parseInt(l.get(i).getId());
			}else{
				temp.setDescr(flag_temp+"");
				l_total.add(temp);
			}
		}
		HashMap<String, List<Param>> hm1=new HashMap<String, List<Param>>();
		HashMap<String, String> hm2=new HashMap<String, String>();
		HashMap<String, HashMap> hm=new HashMap<String, HashMap>();
		String sanyXml= xtglServer.createGsAnyChartXml(l_total);
		hm1.put("list", l);
		hm1.put("list2", l_total);
		hm2.put("xml", sanyXml);
		hm.put("hm1", hm1);
		hm.put("hm2", hm2);
		try {
			JsonUtils.write(hm, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void createAnyChartXml(){
		System.out.println(anyXml);
		ResponseUtils.write(getresponse(), anyXml);
	}
	
	public void checkXzqhCfById(){
		List<Unit> list=xtglServer.checkXzqhCfById(unit);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void insertXzqh(){
		boolean bl=xtglServer.insertXzqh(unit);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void updateXzqh(){
		boolean bl=xtglServer.updateXzqh(unit);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void deleteXzqhById(){
		boolean bl=xtglServer.deleteXzqhById(unit);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void insertTsdq(){
		boolean bl=xtglServer.insertTsdq(param);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void deleteTsdqById(){
		boolean bl=xtglServer.deleteTsdqById(param);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectTsdqById(){
		Param p=xtglServer.selectTsdqById(param);
		try {
			JsonUtils.write(p, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void selectYhById(){
		Master m=xtglServer.selectYhById(master);
		try {
			JsonUtils.write(m, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void updateTsdq(){
		boolean bl=xtglServer.updateTsdq(param);
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selAllBm(){
		try {
            List<TreeNode> l=xtglServer.selAllBm(yhdw);
		    String s=JSONArray.fromObject(l).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selAllBm2(){
		try {
            List<TreeNode> l=xtglServer.selAllBm2(yhdw);
		    String s=JSONArray.fromObject(l).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selQxByUser(){
		List<Param> l=null;
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			
				l=xtglServer.selQxByUser(param);
				String qx1="";String qx2="";String qx3="";String qx4="";String qx5="";String qx6="";String qx7="";String qx8="";
				String qx9="";
				for (Param param : l) {
					if(param.getId().length()==4)
						qx1+=","+param.getId();
					if(param.getId().length()==6)
						qx2+=","+param.getId();
					if(param.getId().length()==8)
						qx3+=","+param.getId();
					if(param.getId().length()==10)
						qx4+=","+param.getId();
					if(param.getId().length()==12)
						qx5+=","+param.getId();
					if(param.getId().length()==14)
						qx6+=","+param.getId();
					if(param.getId().length()==16)
						qx7+=","+param.getId();
					if(param.getId().length()==18)
						qx8+=","+param.getId();
					if(param.getId().length()==20)
						qx9+=","+param.getId();
				}
				if(qx1.length()>0)
				session.setAttribute("qx1", qx1.substring(1));
				if(qx2.length()>0)
				session.setAttribute("qx2", qx2.substring(1));
				if(qx3.length()>0)
				session.setAttribute("qx3", qx3.substring(1));
				if(qx4.length()>0)
				session.setAttribute("qx4", qx4.substring(1));
				if(qx5.length()>0)
				session.setAttribute("qx5", qx5.substring(1));
				if(qx6.length()>0)
				session.setAttribute("qx6", qx6.substring(1));
				if(qx7.length()>0)
				session.setAttribute("qx7", qx7.substring(1));
				if(qx8.length()>0)
					session.setAttribute("qx8", qx8.substring(1));
				if(qx9.length()>0)
					session.setAttribute("qx9", qx9.substring(1));
				//List<Param> l1	=xtglServer.selQxByUser1(param);
				session.setAttribute("sour", l);
				
		
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selQxByUser2(){
		List<Param> l=null;
		List<Param> l1=null;
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			if(session.getAttribute("sour")!=null){
				l=(List<Param>) session.getAttribute("sour");
			}else{
				l=xtglServer.selQxByUser(param);
				String qx1="";String qx2="";String qx3="";String qx4="";String qx5="";String qx6="";String qx7="";String qx8="";
				String qx9="";
				for (Param param : l) {
					if(param.getId().length()==4)
						qx1+=","+param.getId();
					if(param.getId().length()==6)
						qx2+=","+param.getId();
					if(param.getId().length()==8)
						qx3+=","+param.getId();
					if(param.getId().length()==10)
						qx4+=","+param.getId();
					if(param.getId().length()==12)
						qx5+=","+param.getId();
					if(param.getId().length()==14)
						qx6+=","+param.getId();
					if(param.getId().length()==16)
						qx7+=","+param.getId();
					if(param.getId().length()==18)
						qx8+=","+param.getId();
					if(param.getId().length()==20)
						qx9+=","+param.getId();
				}
				if(qx1.length()>0)
				session.setAttribute("qx1", qx1.substring(1));
				if(qx2.length()>0)
				session.setAttribute("qx2", qx2.substring(1));
				if(qx3.length()>0)
				session.setAttribute("qx3", qx3.substring(1));
				if(qx4.length()>0)
				session.setAttribute("qx4", qx4.substring(1));
				if(qx5.length()>0)
				session.setAttribute("qx5", qx5.substring(1));
				if(qx6.length()>0)
				session.setAttribute("qx6", qx6.substring(1));
				if(qx7.length()>0)
				session.setAttribute("qx7", qx7.substring(1));
				if(qx8.length()>0)
					session.setAttribute("qx8", qx8.substring(1));
				if(qx9.length()>0)
					session.setAttribute("qx9", qx9.substring(1));
				//l1=xtglServer.selQxByUser1(param);
				session.setAttribute("sour", l);
			};
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selAllQx(){
		List<TreeNode> l=xtglServer.selQxByRoleid(param);
		TreeNode root = returnRoot(l,l.get(0),new ArrayList<Param>());
		List<TreeNode> children = root.getChildren();
		try {
		    String s=JSONArray.fromObject(children).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selAllQx2(){
		List<TreeNode> l=xtglServer.selAllQx2(yhdw);
		try {
		    String s=JSONArray.fromObject(l).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selQxByRoleid(){
		List<TreeNode> l=xtglServer.selQxByRoleid(param);
		List<Param> l2=xtglServer.selQxListByRoleid(param);
		
		
		TreeNode root = returnRoot(l,l.get(0),l2);
		List<TreeNode> children = root.getChildren();
		try{
		    String s=JSONArray.fromObject(children).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private TreeNode returnRoot(List<TreeNode> list, TreeNode zzjgTree,List<Param> l2){
		for (Param p : l2) {
				if(p.getSourceid().equals(zzjgTree.getId())) zzjgTree.setChecked("true");
		}
		
		for(TreeNode temp : list){
			if(temp!=zzjgTree){
				if(temp.getParent() != null &&temp.getParent() !="" && temp.getParent().equals(zzjgTree.getId())){
					zzjgTree.setState("closed");
					zzjgTree.getChildren().add(temp);
					returnRoot(list,temp,l2);
				}
			}
		}
		return zzjgTree;
	}
	
	
	public void selBzbz(){
		List<Bzbz> l=xtglServer.selBzbz(bzbz);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void updateBzbz(){
		List<Bzbz> roadList;
		boolean bl=false;
		try {
			roadList = JsonUtils.json2List(bzbz.getId(), Bzbz.class);
			bl=xtglServer.updateBzbz(roadList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(bl == true){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	/**
	 * 查询非路网项目的补助标准列表
	 */
	public void queryFlwbzbz(){
		try {
			JsonUtils.write(xtglServer.queryFlwbzbz(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addFlwbzbz(){
		Map<String, String> result=new HashMap<String, String>();
		try {
			result.put("result", new Boolean(xtglServer.addFlwbzbz(flwbzbz)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryFlwbzbzById(){
		try {
			JsonUtils.write(xtglServer.queryFlwbzbzById(flwbzbz.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateFlwbzbz(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(xtglServer.updateFlwbzbz(flwbzbz)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropFlwbzbzById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(xtglServer.dropFlwbzbzById(flwbzbz.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryYhdzxcs(){
		try {
			JsonUtils.write(xtglServer.queryYhdzxcs(yhdzxcs), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addYhdzxcs(){
		try{
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(xtglServer.addYhdzxcs(yhdzxcs)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void queryYhdzxcsById(){
		try {
			JsonUtils.write(xtglServer.queryYhdzxcsById(yhdzxcs.getId()), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryYhdzxcsByLx(){
		try {
			JsonUtils.write(xtglServer.queryYhdzxcsByLx(yhdzxcs), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropYhdzxcsById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(xtglServer.dropYhdzxcsById(yhdzxcs.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editYhdzxcs(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(xtglServer.updateYhdzxcs(yhdzxcs)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryFlwxmFdfw(){
		try {
			JsonUtils.write(xtglServer.queryFlwxmFdfw(), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateFdbzByXmlx(){
		ResponseUtils.write(getresponse(), new Boolean(xtglServer.updateFdbzByXmlx(flwbzbz)).toString());
	}
	
	public void checkJsCfByName(){
		List<Param> l=xtglServer.checkJsCfByName(param);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void selJsUsedById(){
		System.out.println(param.getRoleid());
		List<Param> l=xtglServer.selJsUsedById(param);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	
	public String getYhdw() {
		return yhdw;
	}
	public void setYhdw(String yhdw) {
		this.yhdw = yhdw;
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
	public Unit getUnit() {
		return unit;
	}
	public void setUnit(Unit unit) {
		this.unit = unit;
	}
	public Master getMaster() {
		return master;
	}
	public void setMaster(Master master) {
		this.master = master;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getYhm() {
		return yhm;
	}
	public void setYhm(String yhm) {
		this.yhm = yhm;
	}
	public String getYhzt() {
		return yhzt;
	}
	public void setYhzt(String yhzt) {
		this.yhzt = yhzt;
	}
	public String getYhids() {
		return yhids;
	}
	public void setYhids(String yhids) {
		this.yhids = yhids;
	}
	public String getGmgid() {
		return gmgid;
	}
	public void setGmgid(String gmgid) {
		this.gmgid = gmgid;
	}
	public String getYzm() {
		return yzm;
	}
	public void setYzm(String yzm) {
		this.yzm = yzm;
	}
	public Param getParam() {
		return param;
	}
	public void setParam(Param param) {
		this.param = param;
	}
	public Bzbz getBzbz() {
		return bzbz;
	}
	public void setBzbz(Bzbz bzbz) {
		this.bzbz = bzbz;
	}
	public Plan_flwbzbz getFlwbzbz() {
		return flwbzbz;
	}
	public void setFlwbzbz(Plan_flwbzbz flwbzbz) {
		this.flwbzbz = flwbzbz;
	}
	public Yhdzxcs getYhdzxcs() {
		return yhdzxcs;
	}
	public void setYhdzxcs(Yhdzxcs yhdzxcs) {
		this.yhdzxcs = yhdzxcs;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAnyXml() {
		return anyXml;
	}
	public void setAnyXml(String anyXml) {
		this.anyXml = anyXml;
	}
	public void userlogin(){
		try {
			List<Master> l = xtglServer.userlogin(name);
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void createMenu(){
		try {
			Unit unit=new Unit();
			
			String id = "";
			HttpSession session = getRequest().getSession();
				session.getAttribute("qx3");
					//id += c.getValue().replaceAll("%2C", ",") + ",";
				id=session.getAttribute("qx3")+","+session.getAttribute("qx4")+","+session.getAttribute("qx5")+","+session.getAttribute("qx6")+","+session.getAttribute("qx7")+","+session.getAttribute("qx8")+","+session.getAttribute("qx9");
			//System.out.println(id);
			if(",".equals(id.substring(id.length()-1))){
				id=id.substring(0,id.length()-1);
			}
			unit.setParent(parent);
			unit.setId(id);
			List<TreeNode> list = xtglServer.createMenu(unit);
			
			TreeNode root = returnRoot(list,list.get(0));
			List<TreeNode> children = root.getChildren();			
		    String s=JSONArray.fromObject(children).toString();
            ResponseUtils.write(getresponse(), s);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private TreeNode returnRoot(List<TreeNode> list, TreeNode zzjgTree){

		for(TreeNode temp : list){
			
			if(temp!=zzjgTree){
				if(temp.getParent() != null &&temp.getParent() !="" && temp.getParent().equals(zzjgTree.getId())){
					//zzjgTree.setState("closed");
					zzjgTree.getChildren().add(temp);
					returnRoot(list,temp);
				}
			}
		}
		return zzjgTree;
	}
	
	public void getQxfromSession(){
		try {
		HttpSession session = getRequest().getSession();
		System.out.println((String)session.getAttribute(qx));
		ResponseUtils.write(getresponse(), (String)session.getAttribute(qx));
			//JsonUtils.write((String)session.getAttribute(qx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	private String qx;

	public String getQx() {
		return qx;
	}
	public void setQx(String qx) {
		this.qx = qx;
	}
	
	
	public void urllogin(){
		MessageDigest md5;
		String temp="";
		String sKey="zkrhdsxjx_";

		try {
			temp=URLDecoder.decode(master.getTruename(),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		/*String a="ZwsUcorZkCrsujLiL6T2vQ==";
		System.out.println(DigestUtils.md5Hex(sKey+a));
		System.out.println(master.getPassword());*/
		HashMap hm=new HashMap();
		hm.put("truename", temp);
		Master m=xtglServer.selectPwd(temp);
		if(m==null){
			ResponseUtils.write(getresponse(), "false");
		}else{
			String npwd=DigestUtils.md5Hex(sKey+m.getPassword());//通过后台取出的密码进行加密
			if(master.getPassword().equals(npwd)){
				hm.put("password", m.getPassword());
				HashMap<String,String> bl = xtglServer.login(hm);
				if(bl!=null){
					HttpServletRequest request = ServletActionContext.getRequest();
					HttpSession session = request.getSession();
					session.setAttribute("truename", bl.get("TRUENAME"));
					session.setAttribute("name", bl.get("NAME"));
					session.setAttribute("rolename", bl.get("ROLENAME"));
					try {
						JsonUtils.write(bl, getresponse().getWriter());
					} catch (Exception e1) {
						e1.printStackTrace();
					}
				}else{
					ResponseUtils.write(getresponse(), "false");
				}
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		
	}
	
	//qwh添加项目筛选
	public void insertxmsx(){
		ResponseUtils.write(getresponse(), ""+xtglServer.insertxmsx(param));
	}
	//查询项目筛选
	public void selectXmsx(){
		try {
			JsonUtils.write(xtglServer.selectXmsx(), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//对外提供下载文件接口
	public void downFileByWhAndType(){
		try {
			Plan_upload p = new Plan_upload();
			
			
			
			
			System.out.println(MyUtil.getURLEncoderString(MyUtil.getBase64("赣路综规字[2015]88号")));
			System.out.println(MyUtil.getURLEncoderString(MyUtil.getBase64("工可批复文件")));
			p.setFilewh(MyUtil.getURLDecoderString(MyUtil.getFromBase64(wh)));
			p.setFiletype(MyUtil.getURLDecoderString(MyUtil.getFromBase64(type)));
			List<Plan_upload> list = xtglServer.downFileByWhAndType(p);
			if (list.size() > 0) {
				File file = new File(list.get(0).getFileurl());
				HttpServletResponse response = getresponse();
				OutputStream out = response.getOutputStream();
				response.setContentType("application/x-download");
				response.addHeader(
						"Content-Disposition",
						"attachment;filename="
								+ new String(list.get(0).getFilename().getBytes(
										"GBK"), "ISO-8859-1"));
				byte[] buffer = new byte[1024];
				InputStream is = new FileInputStream(file);
				int length = 0;
				while ((length = is.read(buffer)) > 0) {
					out.write(buffer, 0, length);
				}
				out.write(buffer);
				out.flush();
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	
	
}
