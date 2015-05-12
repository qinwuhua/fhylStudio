package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcgltz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface GcglaqybServer {

	Boolean insertAqybb(Gcglaqyb gcglaqyb);

	int selectaqyblistCount(Gcglaqyb gcglaqyb);

	List<Gcglaqyb> selectaqyblist(Gcglaqyb gcglaqyb);

	List<TreeNode> selAllBm3(String yhdw);

	boolean uploadAqybFile(Gcglaqyb gcglaqyb);

	Gcglaqyb selectAqybById(Gcglaqyb gcglaqyb);

	Boolean insertAqybb1(Gcglaqyb gcglaqyb);

	boolean uploadAqybFile1(Gcglaqyb gcglaqyb);

	boolean deleteAqybb(Gcglaqyb gcglaqyb);

	boolean uploadMbglFile(Gcglaqyb gcglaqyb);

	boolean uploadMbglFile1(Gcglaqyb gcglaqyb);

	Boolean insertMbgl(Gcglaqyb gcglaqyb);

	Boolean insertMbgl1(Gcglaqyb gcglaqyb);

	int selectmbgllistCount(Gcglaqyb gcglaqyb);

	List<Gcglaqyb> selectmbgllist(Gcglaqyb gcglaqyb);

	Gcglaqyb selectMbglById(Gcglaqyb gcglaqyb);

	boolean deleteMbgl(Gcglaqyb gcglaqyb);

	boolean uploadTzFile(Gcgltz gcgltz);

	Boolean insertTz1(Gcgltz gcgltz);

	Boolean insertTz(Gcgltz gcgltz);

	Boolean deleteTzfile(Gcgltz gcgltz);

	Boolean deleteTzfile1(Gcgltz gcgltz);

	int selectxxtzlistCount(Gcgltz gcgltz);

	List<Gcgltz> selectxxtzlist(Gcgltz gcgltz);

	Gcgltz selecttzById(Gcgltz gcgltz);

	List<Gcgltz> selectTzfile(Gcgltz gcgltz);

	Boolean deleteTzByid(Gcgltz gcgltz);

	Boolean deleteTzByid1(Gcgltz gcgltz);

	Boolean insertTzck(Gcgltz gcgltz);

	List<Gcgltz> selectxxtzlist1(Gcgltz gcgltz);

	int selectxxtzlist1Count(Gcgltz gcgltz);

	Boolean deleteTzckByid(Gcgltz gcgltz);

	Boolean xgTzzt(Gcgltz gcgltz);

	Gcgltz selectxxtzById(Gcgltz gcgltz);

	List<TreeNode> selAllXzqh1(String yhdw);

	List<TreeNode> selAllUnit1(String replaceAll);

	int selectmbgllistCount1(Gcglaqyb gcglaqyb);

	List<Gcglaqyb> selectmbgllist1(Gcglaqyb gcglaqyb);

}
