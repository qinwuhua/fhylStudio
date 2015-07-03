package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;


public interface TjfxServer {

	Map<String, Object> queryByNfAndXzqhdm(String nf,String xzqhdm);

	List<Map<String, Object>> queryXzqhQsfx(String xzqhdm, String nf, String end);

	List<Map<String, Object>> queryXmlxtjqsfx(String xzqhdm, String nf, String end);
}
