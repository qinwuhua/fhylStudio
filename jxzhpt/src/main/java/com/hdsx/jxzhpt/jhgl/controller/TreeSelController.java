package com.hdsx.jxzhpt.jhgl.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.server.TreeSelectServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class TreeSelController extends BaseActionSupport{
	@Resource(name = "treeSelectServerImpl")
	private TreeSelectServer treeSelServer;//树状图
	private String parentId;//父级编码
	
	/**
	 * 根据父级别获取管养单位列表
	 */
	public void queryGydwByparent(){
		List<TreeNode> gydwByParent = treeSelServer.queryGydwByParent(parentId);
		try {
			JsonUtils.write(gydwByParent, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryChildCount(){
		try {
			JsonUtils.write(treeSelServer.queryChildCount(parentId),getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据父类型获取行政区划列表
	 */
	public void queryXzqhByParent(){
		try {
			JsonUtils.write(treeSelServer.queryXzqhByParent(parentId),getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public TreeSelectServer getTreeSelServer() {
		return treeSelServer;
	}
	public void setTreeSelServer(TreeSelectServer treeSelServer) {
		this.treeSelServer = treeSelServer;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
}
