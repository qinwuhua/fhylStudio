package com.hdsx.jxzhpt.xtgl.server;

import java.util.List;

import com.hdsx.jxzhpt.xtgl.bean.Dzdt;
import com.hdsx.jxzhpt.xtgl.bean.Param;

public interface DzdtServer {

	List<Dzdt> selLines(Dzdt dzdt);

	List<Param> xmlxCountTj(Param param);
	
}
