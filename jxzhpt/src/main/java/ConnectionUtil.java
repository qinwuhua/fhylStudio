/**
*ConnectionUtil .java
*
*
*/

import java.beans.Statement;
import java.sql.Connection; 
import java.util.*;
import java.sql.*;
import java.util.Properties ;
public class ConnectionUtil {
 /**
  * 1
  *�ڷ����й̻����Ӳ���
  * @return  ��ݿ�����
  */
 public Connection getConnection(){
  Connection conn = null ;
  try{

   Class.forName("oracle.jdbc.driver.OracleDriver") ;

   conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "jxzhpt", "jxzhpt") ;

   return conn ;

  }catch(Exception e){
   e.printStackTrace() ;
  }
  return null ;
 }


 public static void main(String []args){
  ConnectionUtil cu = new ConnectionUtil() ;
  PreparedStatement ps = null;  
  Connection conn = cu.getConnection();  
  ResultSet rs = null;  
  String sql=" select t2.value, t2.name, t1.co, t2.hight, t2.rowxh  from (select substr1 value, count(*) co  from aaa  where value in   ('41v_59', '41v_60', '41v_61', '41v_62', '41v_63', '41v_64',   '42v_69', '431v_70', '431v_71', '431v_72', '431v_73', '431v_74', '432v_75',  '432v_76', '433v_77', '44v_78', '45v_79', '46v_80', '47v_81')"+
		  " group by substr1  union all select substr2 value, count(*) co  from aaa  where value in ('41v_59', '41v_60', '41v_61', '41v_62', '41v_63', '41v_64','42v_69', '431v_70',  '431v_71', '431v_72', '431v_73', '431v_74', '432v_75', '432v_76', '433v_77', '44v_78', '45v_79', '46v_80', '47v_81')"+
		  " and substr2 is not null  group by substr2 union all select substr3 value, count(*) co from aaa where value in ('41v_59', '41v_60', '41v_61', '41v_62', '41v_63', '41v_64','42v_69', '431v_70', '431v_71', '431v_72', '431v_73', '431v_74', '432v_75','432v_76', '433v_77', '44v_78', '45v_79', '46v_80', '47v_81')"+
		  " and substr3 is not null group by substr3  union all select value, count(*) co from aaa where value in ('41v_59', '41v_60', '41v_61', '41v_62', '41v_63', '41v_64',  '42v_69', '431v_70', '431v_71', '431v_72', '431v_73', '431v_74', '432v_75','432v_76', '433v_77', '44v_78', '45v_79', '46v_80', '47v_81')"+
		  " group by value) t1, aaa t2 where t1.value = t2.value order by t2.xh";
		   
		  //"select t2.value,t2.name,t1.co,t2.hight,t2.rowxh from(select substr1 value,count(*) co from aaa where INSTR(value, 'v_', -1, 1)>0 group by substr1 union all select substr2 value,count(*) co from aaa where INSTR(value, 'v_', -1, 1)>0 and substr2 is not null group by substr2 union all select substr3 value,count(*) co from aaa where INSTR(value, 'v_', -1, 1)>0 and substr3 is not null group by substr3 union all select value,count(*) co from aaa where INSTR(value, 'v_', -1, 1)>0 group by value )t1,aaa t2 where t1.value=t2.value order by t2.xh";

  try {  
      ps = conn.prepareStatement(sql);  
      
      rs = ps.executeQuery();  
      List<AA> list=new ArrayList<AA>();
      if (null != rs) {  
    	  
              while (rs.next()) {  
            	 //System.out.println(rs.getString(1)+"--"+rs.getString(2)+"--"+rs.getString(3)+"--"+rs.getString(4)+"--"+rs.getString(5)+"--"); ;
            	  AA aa=new AA(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
            	  list.add(aa);
              }
              
      }
      String html="<tr>";
      String rowxh="0";
      for(int i=0;i<list.size();i++){
    	  System.out.println(list.get(i).getName());
    	  if(!rowxh.equals(list.get(i).getRowxh())){
    		  html=html+"</tr><tr>";
    		  rowxh=list.get(i).getRowxh();
    	  }
    	  html=html+"<td rowspan='"+list.get(i).getHi()+"'  colspan='"+list.get(i).getCol()+"'>"+list.get(i).getName()+"</td>";
      }
      html=html+"</tr>";
      System.out.println(html);
  } catch (SQLException e) {  
      // TODO Auto-generated catch block  
      e.printStackTrace();  
  }
 }

 
}

class AA{
	String value;
	String name;
	String col;
    String hi;
    String rowxh;
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCol() {
		return col;
	}
	public void setCol(String col) {
		this.col = col;
	}
	public String getHi() {
		return hi;
	}
	public void setHi(String hi) {
		this.hi = hi;
	}
	public String getRowxh() {
		return rowxh;
	}
	public void setRowxh(String rowxh) {
		this.rowxh = rowxh;
	}
	public AA(String value, String name, String col, String hi, String rowxh) {
		super();
		this.value = value;
		this.name = name;
		this.col = col;
		this.hi = hi;
		this.rowxh = rowxh;
	}
    
}