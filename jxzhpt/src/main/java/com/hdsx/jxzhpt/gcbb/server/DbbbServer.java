package com.hdsx.jxzhpt.gcbb.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface DbbbServer {
	List<Jckwqgz> selectWqjc(Jckwqgz wqgz);
	int selectWqjcCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_wqjc(Jckwqgz wqgz);
	List<Sckwqgz> selectWqsc(Jckwqgz wqgz);
	int selectWqscCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_wqsc(Jckwqgz wqgz);
	List<Plan_wqgz> selectWqjh(Jckwqgz wqgz);
	int selectWqjhCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_wqjh(Jckwqgz wqgz);
}
