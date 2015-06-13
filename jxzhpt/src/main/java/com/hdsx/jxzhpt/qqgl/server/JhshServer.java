package com.hdsx.jxzhpt.qqgl.server;

import java.util.List;

import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh2;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;

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
	/**
	 * 修改计划审核信息
	 * @param list 计划审核信息
	 * @return 执行结果
	 */
	public boolean updateJhshxxLmgz(List<Jhsh> list);
	/**
	 * 修改计划审核信息
	 * @param list 计划审核信息
	 * @return 执行结果
	 */
	public boolean updateJhshxxXj(List<Jhsh> list);
	/**
	 * 查询升级项目的立项审核信息
	 * @param xmbm 项目编码
	 * @return 立项审核信息
	 */
	public Lxsh queryLxshLmsjByXmbm(String xmbm);
	/**
	 * 查询改造项目的立项审核信息
	 * @param xmbm 项目编码
	 * @return 立项审核信息
	 */
	public Lxsh queryLxshLmgzByXmbm(String xmbm);
	/**
	 * 查询新建项目的立项审核信息
	 * @param xmbm 项目编码
	 * @return 立项审核信息
	 */
	public Lxsh queryLxshXjByXmbm(String xmbm);
	/**
	 * 查询路面升级计划审核信息
	 * @param xmbm 项目编码
	 * @return 计划审核信息
	 */
	public Jhsh queryJhshxxLmsjByXmbm(String xmbm);
	/**
	 * 查询路面改造计划审核信息
	 * @param xmbm 项目编码
	 * @return 计划审核信息
	 */
	public Jhsh queryJhshxxLmgzByXmbm(String xmbm);
	/**
	 * 查询新建项目计划审核信息
	 * @param xmbm 项目编码
	 * @return 计划审核信息
	 */
	public Jhsh queryJhshxxXjByXmbm(String xmbm);
	/**
	 * 计划审核信息列表查询
	 * @param jhsh2  养护大中修计划审核
	 * @return 养护大中修计划审核集合
	 */
	public List<Jhsh> queryJhshYhdzx(Jhsh jhsh,int page,int rows);
	/**
	 * 计划审核总数量
	 * @param jhsh2 养护大中修计划审核数量
	 * @return 养护大中修计划审核数量
	 */
	public int queryJhshYhdzxCount(Jhsh jhsh);
	/**
	 * 养护大中修计划审核信息
	 * @param jhsh2 计划审核信息
	 * @return 执行结果
	 */
	public boolean updateJhshxxYhdzx(Jhsh jhsh);
	/**
	 * 水毁计划审核信息
	 * @param jhsh2  计划审核信息
	 * @return 执行结果
	 */
	public boolean updateJhshxxSh(Jhsh jhsh);
	/**
	 * 根据项目编码查询养护大中修德计划审核信息
	 * @param jhsh 计划审核信息项目编码
	 * @return 审核信息
	 */
	public Jhsh queryJhshxxYhdzxByXmbm(Jhsh jhsh);
	/**
	 * 根据项目编码查询养护大中修计划审核信息
	 * @param jhsh 计划审核信息项目编码
	 * @return 审核信息
	 */
	public Jhsh queryJhshxxShByXmbm(Jhsh jhsh);
	/**
	 * 查询计划审核信息列表
	 * @param jhsh2 计划审核信息
	 * @param page 页码
	 * @param rows 展示数量
	 * @return
	 */
	public List<Jhsh> queryJhshSh(Jhsh jhsh, int page, int rows);
	/**
	 * 查询水毁计划审核信息数量
	 * @param jhsh2 计划审核信息
	 * @return 总数量
	 */
	public int queryJhshShCount(Jhsh jhsh);
}
