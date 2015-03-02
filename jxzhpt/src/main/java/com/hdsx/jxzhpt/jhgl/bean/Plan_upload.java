package com.hdsx.jxzhpt.jhgl.bean;
/**
 * 
 * @author Administrator
 *文件上传
 */
public class Plan_upload {
		private String id;
		private String filename;
		private byte[] filedata;
		private String filetype;
		private String parentid;
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
		
		
}
