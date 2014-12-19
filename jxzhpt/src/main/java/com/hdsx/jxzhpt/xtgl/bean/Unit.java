package com.hdsx.jxzhpt.xtgl.bean;

import java.io.Serializable;

/**
 * 用户实体
 * 
 * @author wd
 * 
 */
public class Unit implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3611109655157548249L;
	private String id;//单位编码
	private String name;//单位名称
	private String _parentId;//上级单位
	private String parent;//上级单位
	private String dist;//行政区划
	private String iconCls="icon-none";
	private String state="open";
	private String text;
	private String trueId;
	private String jgdm;
	private String jglx;
	private String zxkjbzlb;
	private String zxkjzzlb;
	private String djzclx;
	private String sfzy;
	private String dwfzr;
	private String lxdh;
	private String sfgl;
	private String desr;
	private String tbdw;
	/**
	 * page 当前的页数
	 * rows 显示的条数
	 */
	private int page;
	private int rows;
	
	public String getTbdw() {
		return tbdw;
	}
	public void setTbdw(String tbdw) {
		this.tbdw = tbdw;
	}
	public String getJgdm() {
		return jgdm;
	}
	public void setJgdm(String jgdm) {
		this.jgdm = jgdm;
	}
	public String getJglx() {
		return jglx;
	}
	public void setJglx(String jglx) {
		this.jglx = jglx;
	}
	public String getZxkjbzlb() {
		return zxkjbzlb;
	}
	public void setZxkjbzlb(String zxkjbzlb) {
		this.zxkjbzlb = zxkjbzlb;
	}
	public String getZxkjzzlb() {
		return zxkjzzlb;
	}
	public void setZxkjzzlb(String zxkjzzlb) {
		this.zxkjzzlb = zxkjzzlb;
	}
	public String getDjzclx() {
		return djzclx;
	}
	public void setDjzclx(String djzclx) {
		this.djzclx = djzclx;
	}
	public String getSfzy() {
		return sfzy;
	}
	public void setSfzy(String sfzy) {
		this.sfzy = sfzy;
	}
	public String getDwfzr() {
		return dwfzr;
	}
	public void setDwfzr(String dwfzr) {
		this.dwfzr = dwfzr;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getSfgl() {
		return sfgl;
	}
	public void setSfgl(String sfgl) {
		this.sfgl = sfgl;
	}
	public String getDesr() {
		return desr;
	}
	public void setDesr(String desr) {
		this.desr = desr;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String get_parentId() {
		return _parentId;
	}
	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		if(parent.length()==3){
			this.parent = parent.substring(0,2);
		}else{
			this.parent = parent;
		}
		
	}
	public String getDist() {
		return dist;
	}
	public void setDist(String dist) {
		this.dist = dist;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getTrueId() {
		return trueId;
	}
	public void setTrueId(String trueId) {
		this.trueId = trueId;
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
	
	

}
