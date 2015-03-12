package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Zdycx;

public interface ZdycxServer {
	List selZdyList(Zdycx zdycx);
	int selZdyCount(Zdycx zdycx);
}
