package com.hdsx.jxzhpt.qqgl.server;

import java.util.List;

import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;

public interface XmsqServer {
	/**
	 * 添加养护大中修
	 * @param list 项目申请信息集合
	 * @return 执行结果
	 */
	public boolean insertXmsqYhdzx(List<Xmsq> list);
	/**
	 * 添加水毁项目
	 * @param list 项目申请信息集合
	 * @return 执行结果
	 */
	public boolean insertXmsqSh(List<Xmsq> list);
	/**
	 * 获取下一个项目编码
	 * @return 项目编码
	 */
	public String queryYhdzxNextXmbm();
	/**
	 * 获取下一个项目编码
	 * @return 项目编码
	 */
	public String queryShNextXmbm();
	/**
	 * 根据路线名称和行政区划查询列表
	 * @param xmsq 
	 * @return 反映列表
	 */
	public List<Lx> queryAutoList(Xmsq xmsq);
	/**
	 * 查询是否有历史记录
	 * @param ylxbh 路线编号
	 * @param qdzh 起点桩号
	 * @param zdzh 止点桩号
	 * @return 历史记录个数
	 */
	public int queryLsjl(String ylxbh, String qdzh, String zdzh);
	/**
	 * 添加路线信息到路线表
	 * @param lx 路线对象
	 * @return 执行结果
	 */
	public boolean insertLx(Lx lx);
	/**
	 * 根据路线编号和起止点桩号查询特殊地区
	 * @param xmsq 项目申请信息
	 * @return 特殊地区集合
	 */
	public List<String> queryTsdq(Xmsq xmsq);
	/**
	 * 查询养护大中修列表信息
	 * @param xmsq 项目申请信息条件
	 * @return 列表集合
	 */
	public List<Xmsq> queryYhdzxXmsq(Xmsq xmsq,int page,int rows);
	/**
	 * 查询水毁列表信息
	 * @param xmsq 查询条件
	 * @return 列表集合
	 */
	public List<Xmsq> queryShXmsq(Xmsq xmsq,int page,int rows);
	/**
	 * 查询养护大中修数量
	 * @param xmsq 查询条件
	 * @return 数量
	 */
	public int queryYhdzxCount(Xmsq xmsq);
	/**
	 * 查询水毁数量
	 * @param xmsq 查询条件
	 * @return 数量
	 */
	public int queryShCount(Xmsq xmsq);
	/**
	 * 删除项目
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean deleteYhdzxByXmbm(String xmbm);
	/**
	 * 删除项目
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean deleteShByXmbm(String xmbm);
	/**
	 * 修改养护大中修德上报状态
	 * @param xmsq 项目信息
	 * @return 执行结果
	 */
	public boolean updateYhdzxSqzt(Xmsq xmsq);
	/**
	 * 修改水毁上报状态
	 * @param xmsq 项目信息
	 * @return 执行结果
	 */
	public boolean updateShSqzt(Xmsq xmsq);
	/**
	 * 通过申请后，向计划审核中加入信息
	 * @param xmsq 项目申请信息
	 * @return 执行结果
	 */
	public boolean insertJhshYhdzx(Xmsq xmsq);
	/**
	 * 通过申请后，想计划审核中加入信息
	 * @param xmsq 水毁项目信息
	 * @return 执行结果
	 */
	public boolean insertJhshSh(Xmsq xmsq);

}
