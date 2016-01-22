package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Zdycx;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Zdycxqb;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface ZdycxServer {
	List selZdyList(Zdycx zdycx);
	int selZdyCount(Zdycx zdycx);
	List<SjbbMessage> exportExcel_zdy(Zdycx zdycx);
	List<Gcglwqgz> selwqgzsjZdy(Zdycx zdycx);
	int selwqgzsjZdyCount(Zdycx zdycx);
	List<SjbbMessage> exportExcel_wqsjzdy(Zdycx zdycx);
	List<Zdycxqb> selqbZdy(Zdycx zdycx);
	int selqbZdyCount(Zdycx zdycx);
	List<SjbbMessage> exportExcel_qbzdy(Zdycx zdycx);
}
