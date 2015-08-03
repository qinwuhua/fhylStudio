package com.hdsx.jxzhpt.jhgl.bean;
/**
 * 
 * @author Administrator
 *文件上传
 */
public class Plan_upload {
	public Plan_upload() {
		super();
	}
	public Plan_upload(String id,String filename, String filetype,
			String xmbm, String fileurl, String filewh) {
		super();
		this.id=id;
		this.filename = filename;
		this.filetype = filetype;
		this.xmbm = xmbm;
		this.fileurl = fileurl;
		this.filewh = filewh;
	}
	private String id;
	private String fid;//文件ID
	private String xmbm;//项目编码
	private String filename;
	private byte[] filedata;
	private String filetype;
	private String parentid;
	private String fileurl;//文件路径
	private String filewh;//文件文号
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getXmbm() {
		return xmbm;
	}
	public void setXmbm(String xmbm) {
		this.xmbm = xmbm;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getParentid() {
		return parentid;
	}
	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public String getFilewh() {
		return filewh;
	}
	public void setFilewh(String filewh) {
		this.filewh = filewh;
	}
}
