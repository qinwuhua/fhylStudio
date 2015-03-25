package com.hdsx.jxzhpt.gcbb.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface DbbbServer {
	//危桥
	List<Jckwqgz> selectWqjc(Jckwqgz wqgz);
	int selectWqjcCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_wqjc(Jckwqgz wqgz);
	List<Sckwqgz> selectWqsc(Jckwqgz wqgz);
	int selectWqscCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_wqsc(Jckwqgz wqgz);
	List<Plan_wqgz> selectWqjh(Jckwqgz wqgz);
	int selectWqjhCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_wqjh(Jckwqgz wqgz);
	//安保
	List<Jckabgc> selectAbjc(Jckwqgz wqgz);
	int selectAbjcCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_abjc(Jckwqgz wqgz);
	List<Sckabgc> selectAbsc(Jckwqgz wqgz);
	int selectAbscCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_absc(Jckwqgz wqgz);
	List<Plan_abgc> selectAbjh(Jckwqgz wqgz);
	int selectAbjhCount(Jckwqgz wqgz);
}
