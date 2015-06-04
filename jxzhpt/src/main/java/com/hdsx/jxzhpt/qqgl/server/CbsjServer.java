package com.hdsx.jxzhpt.qqgl.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;

public interface CbsjServer {
	/**
	 * 分页查询初步申请
	 * @param lmsj 路面升级对象
	 * @param page 页码
	 * @param rows 行数
	 * @return 集合
	 */
	public List<Cbsj> queryCbsjLmgz(Cbsj lmsj,int page,int rows);
	
	/**
	 * 查询总个数
	 * @param lmsj 路面升级项目对象
	 * @return 个数
	 */
	public int queryCbsjLmgzCount(Cbsj lmsj);
	/**
	 * 根据项目编码查询初步审核信息
	 * @param xmbm 计划的项目编码
	 * @return 返回初步审核对象
	 */
	public Cbsj queryCbsjLmgzByXmbm(String xmbm);
	/**
	 * 修改初步设计信息
	 * @param cbsj 修改后的初步设计信息
	 * @return 是否成功
	 */
	public boolean updateCbsjLmgz(Cbsj cbsj);
	/**
	 * 上传设计批复文件
	 * @param uploads
	 * @return 执行结果
	 */
	public boolean insertFile(Plan_upload uploads);
	/**
	 * 查询此项目所包含的文件
	 * @param xmbm 项目编码
	 * @return 返回文件对象集合
	 */
	public List<Plan_upload> queryFileByXmbm(String xmbm);
	/**
	 * 删除对应项目信息
	 * @param xmbm 项目编码
	 * @return 返回执行结果
	 */
	public boolean deleteLmgzByXmbm(String xmbm);
	/**
	 * 查询路面升级项目列表
	 * @param cbsj 初步设计数据对象
	 * @param page 页码
	 * @param rows 每页数据数量
	 * @return 返回数据集合
	 */
	public List<Cbsj> queryCbsjLmsj(Cbsj cbsj, int page, int rows);
	/**
	 * 查询路面升级项目总数量
	 * @param cbsj 初步设计数据对象
	 * @return 返回总数
	 */
	public int queryCbsjLmsjCount(Cbsj cbsj);
	/**
	 * 根据项目编码查询详细信息
	 * @param xmbm
	 * @return
	 */
	public Cbsj queryCbsjLmsjByXmbm(String xmbm);
	/**
	 * 修改升级项目
	 * @param cbsj 升级项目对象
	 * @return 执行结果
	 */
	public boolean updateCbsjLmsj(Cbsj cbsj);
	/**
	 * 删除升级项目
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean deleteLmsjByXmbm(String xmbm);
	/**
	 * 上报、审核流程，修改流程状态
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean shCbsjLmsjByXmbm(Cbsj cbsj,String sbzt,String shzt);
	/**
	 * 上报、审核流程，修改流程状态
	 * @param cbsj 项目编码
	 * @return 执行结果
	 */
	public boolean shCbsjLmgzByXmbm(Cbsj cbsj,String sbzt,String shzt);
	/**
	 * 查询新建项目列表信息
	 * @param cbsj 初步设计对象
	 * @param page 页码
	 * @param rows 每页条数
	 * @return
	 */
	public List<Cbsj> queryCbsjXj(Cbsj cbsj, int page, int rows);
	/**
	 * 新建项目总数
	 * @param cbsj 初步设计对象
	 * @return 总条数
	 */
	public int queryCbsjXjCount(Cbsj cbsj);
	/**
	 * 根据项目编码查询新建工程信息
	 * @param xmbm 项目编码
	 * @return 新建项目对象
	 */
	public Cbsj queryCbsjXjByXmbm(String xmbm);
	/**
	 * 修改新建项目信息
	 * @param cbsj 新建项目对象
	 * @return 执行结果
	 */
	public boolean updateCbsjXj(Cbsj cbsj);
	/**
	 * 删除新建项目信息
	 * @param xmbm 新建项目编码
	 * @return 执行结果
	 */
	public boolean deleteXjByXmbm(String xmbm);
	/**
	 * 上报、审核新建项目
	 * @param cbsj
	 * @param sbzt1
	 * @param shzt1
	 * @return
	 */
	public boolean shCbsjXjByXmbm(Cbsj cbsj, String sbzt1, String shzt1);
}
