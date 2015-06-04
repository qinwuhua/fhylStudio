package com.hdsx.jxzhpt.qqgl.server;

import java.util.List;

import com.hdsx.jxzhpt.qqgl.bean.Jhsh;

public interface JhshServer {
	/**
	 * 根据项目编码，把需要的信息插入到计划审核表中
	 * @param xmbm 升级改造项目编码
	 * @return 执行结果
	 */
	public boolean insertJhshLmsjFromCbsj(String xmbm);
	/**
	 * 根据项目编码，把需要的信息插入到几号审核表中
	 * @param xmbm 路面改造项目编码
	 * @return 执行结果
	 */
	public boolean insertJhshLmgzFromCbsj(String xmbm);
	/**
	 * 根据项目编码，把需要的信息插入到几号审核表中
	 * @param xmbm 新建项目项目编码
	 * @return 执行结果
	 */
	public boolean insertJhshXjFromCbsj(String xmbm);
	/**
	 * 查询升级项目计划审核列表
	 * @param jhsh 计划审核对象
	 * @param page 页码
	 * @param rows 页面展示数量
	 * @return 升级项目计划审核列表信息
	 */
	public List<Jhsh> queryJhshLmsj(Jhsh jhsh,int page,int rows);
	/**
	 * 查询升级项目总数
	 * @param jhsh 计划审核对象
	 * @return 升级项目总数
	 */
	public int queryJhshCountLmsj(Jhsh jhsh);
	/**
	 * 查询计划审核路面改造列表信息
	 * @param jhsh 计划审核对象
	 * @param page 页码
	 * @param rows 页面展示数量
	 * @return
	 */
	public List<Jhsh> queryJhshLmgz(Jhsh jhsh, int page, int rows);
	/**
	 * 查询计划审核路面改造总数
	 * @param jhsh 计划审核对象
	 * @return 改造项目总数
	 */
	public int queryJhshCountLmgz(Jhsh jhsh);
	/**
	 * 查询新建项目信息列表
	 * @param jhsh 计划审核对象
	 * @param page 页码
	 * @param rows 每页展示行数
	 * @return 新建项目信息
	 */
	public List<Jhsh> queryJhshXj(Jhsh jhsh, int page, int rows);
	/**
	 * 查询新建项目总数
	 * @param jhsh 计划审核对象
	 * @return 新建项目总数
	 */
	public int queryJhshCountXj(Jhsh jhsh);
	/**
	 * 修改计划审核信息
	 * @param jhsh 计划审核信息
	 * @return 执行结果
	 */
	public boolean updateJhshxxLmsj(List<Jhsh> jhsh);
}
