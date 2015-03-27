package com.hdsx.jxzhpt.gcbb.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
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
	List<SjbbMessage> exportExcel_abjh(Jckwqgz wqgz);
	//灾害
	List<Jckzhfz> selectZhjc(Jckwqgz wqgz);
	int selectZhjcCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_zhjc(Jckwqgz wqgz);
	List<Sckzhfz> selectZhsc(Jckwqgz wqgz);
	int selectZhscCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_zhsc(Jckwqgz wqgz);
	List<Plan_zhfz> selectZhjh(Jckwqgz wqgz);
	int selectZhjhCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_zhjh(Jckwqgz wqgz);
	//危桥开工
	List<Plan_wqgz> selectWqkg(Jckwqgz wqgz);
	int selectWqkgCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_wqkg(Jckwqgz wqgz);
	//安保开工
	List<Plan_abgc> selectAbkg(Jckwqgz wqgz);
	int selectAbkgCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_abkg(Jckwqgz wqgz);
	//灾害开工
	List<Plan_zhfz> selectZhkg(Jckwqgz wqgz);
	int selectZhkgCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_zhkg(Jckwqgz wqgz);
	//危桥进展
	List<Gcglwqgz> selectWqjz(Jckwqgz wqgz);
	int selectWqjzCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_wqjz(Jckwqgz wqgz);
	//安保进展
	List<Gcglabgc> selectAbjz(Jckwqgz wqgz);
	int selectAbjzCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_abjz(Jckwqgz wqgz);
	//灾害进展
	List<Gcglzhfz> selectZhjz(Jckwqgz wqgz);
	int selectZhjzCount(Jckwqgz wqgz);
	List<SjbbMessage> exportExcel_zhjz(Jckwqgz wqgz);
}
