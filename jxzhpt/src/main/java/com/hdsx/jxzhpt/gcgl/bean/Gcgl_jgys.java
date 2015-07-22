package com.hdsx.jxzhpt.gcgl.bean;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

public class Gcgl_jgys implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String ysdw;
	private String ysyj;
	private String filename;
	private byte[] filedata;
	private String filetype;
	private String jhid;
	private String yssj;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getYssj() {
		return yssj;
	}
	public void setYssj(String yssj) {
		this.yssj = yssj;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getYsdw() {
		return ysdw;
	}
	public void setYsdw(String ysdw) {
		this.ysdw = ysdw;
	}
	public String getYsyj() {
		return ysyj;
	}
	public void setYsyj(String ysyj) {
		this.ysyj = ysyj;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public byte[] getFiledata() {
		return filedata;
	}
	public void setFiledata(byte[] filedata) {
		this.filedata = filedata;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	@Override
	public String toString() {
		return "Gcgl_jgys [id=" + id + ", ysdw=" + ysdw + ", ysyj=" + ysyj
				+ ", filename=" + filename + ", filedata="
				+ Arrays.toString(filedata) + ", filetype=" + filetype
				+ ", jhid=" + jhid + ", yssj=" + yssj + ", name=" + name + "]";
	}

}
