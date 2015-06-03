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
}
