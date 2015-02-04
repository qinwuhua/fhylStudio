package com.hdsx.jxzhpt.xtgl.bean;

import java.io.Serializable;

public class Bzbz implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9108227802425395142L;
	private String id;
	private String xmlx;
	private String lx;
	private String bz;
	private String bl;
	private String fd;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXmlx() {
		return xmlx;
	}
	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}
	public String getLx() {
		return lx;
	}
	public void setLx(String lx) {
		this.lx = lx;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getBl() {
		return bl;
	}
	public void setBl(String bl) {
		this.bl = bl;
	}
	public String getFd() {
		return fd;
	}
	public void setFd(String fd) {
		this.fd = fd;
	}
	@Override
	public String toString() {
		return "Bzbz [id=" + id + ", xmlx=" + xmlx + ", lx=" + lx + ", bz="
				+ bz + ", bl=" + bl + ", fd=" + fd + "]";
	}
	
}
