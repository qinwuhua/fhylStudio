package com.hdsx.jxzhpt.gcbb.server;

import java.util.List;

import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface SjbbServer {

	List<SjbbMessage> getLwjgjsgzb(SjbbMessage sjbb) throws Exception;

	List<SjbbMessage> getGzgcjz(SjbbMessage sjbb) throws Exception;

	List<SjbbMessage> getGdzctzjs(SjbbMessage sjbb) throws Exception;

}
