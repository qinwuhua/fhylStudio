package com.hdsx.jxzhpt.qqgl.server;

import java.util.List;

import com.hdsx.jxzhpt.qqgl.bean.CbsjLmsj;

public interface CbsjServer {
	/**
	 * 分页查询初步申请
	 * @param lmsj 路面升级对象
	 * @param page 页码
	 * @param rows 行数
	 * @return 集合
	 */
	public List<CbsjLmsj> queryCbsjLmsj(CbsjLmsj lmsj,int page,int rows);
	
	/**
	 * 查询总个数
	 * @param lmsj 路面升级项目对象
	 * @return 个数
	 */
	public int queryCbsjLmsjCount(CbsjLmsj lmsj);
}
