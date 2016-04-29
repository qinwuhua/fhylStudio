package com.hdsx.jxzhpt.gcbb.server;

import java.util.List;

import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface SjbbServer {

	List<SjbbMessage> getLwjgjsgzb(SjbbMessage sjbb) throws Exception;

	List<SjbbMessage> getGzgcjz(SjbbMessage sjbb) throws Exception;

	List<SjbbMessage> getGdzctzjs(SjbbMessage sjbb) throws Exception;

	List<Excel_list> getLwjgjsgzb1(SjbbMessage sjbb) throws Exception;

	List<SjbbMessage> getJckhzbAds(SjbbMessage sjbb);

	List<SjbbMessage> getJckhzbAgsxx(SjbbMessage sjbb) throws Exception;

	List<SjbbMessage> getSckhzbAds(SjbbMessage sjbb);

	List<SjbbMessage> getSckhzbAgsxx(SjbbMessage sjbb) throws Exception;

}
