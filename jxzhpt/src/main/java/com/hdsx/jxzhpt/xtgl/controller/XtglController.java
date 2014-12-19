package com.hdsx.jxzhpt.xtgl.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import sun.misc.BASE64Encoder;

import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.server.XtglServer;
import com.hdsx.jxzhpt.xtgl.bean.Unit;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.jxzhpt.xtgl.bean.Param;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
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
	private Param param;
	//用户实体
	private Master master;
	private String yhm;
	private String yhzt;
	private String yhdw;
	private String yhids;
	private String username;
	private String password;
	private String gmgid;
	
	private String yzm;
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
			temp = base.encode(md5.digest(password.getBytes()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		HashMap hm=new HashMap();
		hm.put("username", username);
		hm.put("password", temp);
		hm.put("gmgid", gmgid);
		hm.put("zt", "禁用");
		HashMap<String,String> bl = xtglServer.login(hm);
		if(bl.size() >0){
			String s=JSONArray.fromObject(bl).toString();
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			ResponseUtils.write(getresponse(), s);
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
		if(session.getAttribute("username") != null){
			session.setAttribute("username",null);
		}
		ResponseUtils.write(getresponse(), "true");
	}
	
	/**
	 * 从session中取出用户名查询权限（防止用户没有登录直接访问index页面）
	 */
	public void selQx(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
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
		hm.put("yhm", yhm);
		//hm.put("unit", master.getUnit());
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
	 * 添加用户
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
		MessageDigest md5;
		String temp="";
		try {
			md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base = new BASE64Encoder();
			temp = base.encode(md5.digest("000000".getBytes()));
			master.setPassword(temp);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
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
		int count = xtglServer.selectXzqhListCount(unit);
		List<Unit> list = xtglServer.selectXzqhList(unit);
		int len=unit.getId().length();
		for(int i=0;i<list.size();i++){
			if(!unit.getId().equals(list.get(i).getId()))
			{
				list.get(i).set_parentId(list.get(i).getParent());
			}
			if(list.get(i).getBmid().length()>=12){
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
		for(int i=0;i<list.size();i++){
			if(!unit.getId().equals(list.get(i).getId()))
			{
				list.get(i).set_parentId(list.get(i).getParent());
			}
			if(list.get(i).getId().length()==len+11){
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
		HashMap<String, String> hm=new HashMap<String, String>();
		hm.put("name", yhm);
		List<TreeNode> list =  xtglServer.getBmbmTreeByName(hm);
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
		int len=unit.getId().length();
		for(int i=0;i<list.size();i++){
			if(!unit.getId().equals(list.get(i).getId()))
			{
				list.get(i).set_parentId(list.get(i).getParent());
			}
			if(list.get(i).getId().length()==len+2){
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
		hm.put("username", master.getName());
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
	
	
}
