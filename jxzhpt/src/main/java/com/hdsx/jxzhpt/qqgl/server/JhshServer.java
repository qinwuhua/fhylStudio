package com.hdsx.jxzhpt.qqgl.server;

import com.hdsx.jxzhpt.qqgl.bean.Jhsh;

public interface JhshServer {
	/**
	 * 根据项目编码，把需要的信息插入到计划审核表中
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean insertJhshLmsjFromCbsj(String xmbm);
}
