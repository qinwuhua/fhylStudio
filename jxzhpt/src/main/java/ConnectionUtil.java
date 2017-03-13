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
	//static int a[][]=new int[4][83];
 /**
  * 1
  *�ڷ����й̻����Ӳ���
  * @return  ��ݿ�����
  */
	//获取数据库链接的，不用看
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
  //就是我给你发的sql文件里面的sql语句。
  String sql="select t2.value, t2.name, t1.co, t2.hight, t2.rowxh from (select substr1 value, count(*) co from zdybbbt where value in ('21v_36','21v_37','21v_38','21v_39','21v_40','21v_41','21v_42','21v_43','21v_44','21v_45','22v_46','23v_47','241v_48','241v_49','241v_50','241v_51','241v_52','242v_53','242v_54','243v_55','3v_56','3v_57','3v_58','41v_59','41v_60','41v_61','41v_62','41v_63','41v_64','41v_65','41v_66','41v_67','41v_68','42v_69','431v_70','431v_71','431v_72','431v_73','431v_74','432v_75','432v_76','433v_77','44v_78','45v_79','46v_80','47v_81') group by substr1 union all select substr2 value, count(*) co from zdybbbt where value in ('21v_36','21v_37','21v_38','21v_39','21v_40','21v_41','21v_42','21v_43','21v_44','21v_45','22v_46','23v_47','241v_48','241v_49','241v_50','241v_51','241v_52','242v_53','242v_54','243v_55','3v_56','3v_57','3v_58','41v_59','41v_60','41v_61','41v_62','41v_63','41v_64','41v_65','41v_66','41v_67','41v_68','42v_69','431v_70','431v_71','431v_72','431v_73','431v_74','432v_75','432v_76','433v_77','44v_78','45v_79','46v_80','47v_81') and substr2 is not null group by substr2 union all select substr3 value, count(*) co from zdybbbt where value in ('21v_36','21v_37','21v_38','21v_39','21v_40','21v_41','21v_42','21v_43','21v_44','21v_45','22v_46','23v_47','241v_48','241v_49','241v_50','241v_51','241v_52','242v_53','242v_54','243v_55','3v_56','3v_57','3v_58','41v_59','41v_60','41v_61','41v_62','41v_63','41v_64','41v_65','41v_66','41v_67','41v_68','42v_69','431v_70','431v_71','431v_72','431v_73','431v_74','432v_75','432v_76','433v_77','44v_78','45v_79','46v_80','47v_81') and substr3 is not null group by substr3 union all select value, count(*) co from zdybbbt where value in ('21v_36','21v_37','21v_38','21v_39','21v_40','21v_41','21v_42','21v_43','21v_44','21v_45','22v_46','23v_47','241v_48','241v_49','241v_50','241v_51','241v_52','242v_53','242v_54','243v_55','3v_56','3v_57','3v_58','41v_59','41v_60','41v_61','41v_62','41v_63','41v_64','41v_65','41v_66','41v_67','41v_68','42v_69','431v_70','431v_71','431v_72','431v_73','431v_74','432v_75','432v_76','433v_77','44v_78','45v_79','46v_80','47v_81') group by value) t1, zdybbbt t2 where t1.value = t2.value order by t2.xh";
  		//"select t2.value,t2.name,t1.co,t2.hight,t2.rowxh from(select substr1 value,count(*) co from ZDYBBBT where INSTR(value, 'v_', -1, 1)>0 group by substr1 union all select substr2 value,count(*) co from ZDYBBBT where INSTR(value, 'v_', -1, 1)>0 and substr2 is not null group by substr2 union all select substr3 value,count(*) co from ZDYBBBT where INSTR(value, 'v_', -1, 1)>0 and substr3 is not null group by substr3 union all select value,count(*) co from ZDYBBBT where INSTR(value, 'v_', -1, 1)>0 group by value )t1,ZDYBBBT t2 where t1.value=t2.value order by t2.xh";

  try {  
      ps = conn.prepareStatement(sql);  
      
      rs = ps.executeQuery();  
      List<AA> list=new ArrayList<AA>();
      if (null != rs) {  
    	  
              while (rs.next()) {  
            	 //System.out.println(rs.getString(1)+"--"+rs.getString(2)+"--"+rs.getString(3)+"--"+rs.getString(4)+"--"+rs.getString(5)+"--"); ;
            	  AA aa=new AA(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5));
            	  list.add(aa);
              }
              
      }
      
     /*//以上代码就是为了获取SQL语句的查询结果，并且封装到了一个实体里面。以下的这一段代码是在拼接表头。
      String html="<tr>";
      int rowxh=0;
      for(int i=0;i<list.size();i++){
    	  if(rowxh!=list.get(i).getRowxh()){
    		  html=html+"</tr><tr>";
    		  rowxh=list.get(i).getRowxh();
    	  }
    	  html=html+"<td rowspan='"+list.get(i).getHi()+"'  colspan='"+list.get(i).getCol()+"'>"+list.get(i).getName()+"</td>";
      }
      html=html+"</tr>";
      //把拼接的内容复制到了html里面，查看效果
      System.out.println(html);*/
      
      //int col11=0,col12=0,col21=0,col22=0,col31=0,col32=0,col41=0,col42=0;
      int rowxh=0,col1=0,col2=0;
      int colint=0;
      int a[][]=new int[4][83];
      int flag=0;
      for(int i=0;i<list.size();i++){
    	  if(rowxh!=list.get(i).getRowxh()-1){
    		  rowxh=list.get(i).getRowxh()-1;
    		  System.out.println("rowxh:"+rowxh+":"+colint);
    		  col1=colint;
    		  flag=0;
    	  }
    	  list.get(i).setRow1(list.get(i).getRowxh()-1);
    	  list.get(i).setRow2(list.get(i).getRowxh()-1+list.get(i).getHi()-1);
    	  while(a[rowxh][col1]!=0){
    		  col1=col1+a[rowxh][col1];
    	  }
    	  
    	  if(list.get(i).getHi()!=1){
    		  for(int j=1;j<list.get(i).getHi();j++){
    			  a[rowxh+j][col1]=list.get(i).getCol();
    		  }
    	  }else{
    		  if(flag==0){
    			  colint=col1;
    			  flag=1;
    		  }
    	  }
    	  
    	  
    	  list.get(i).setCol1(col1);
    	  col2=col1+list.get(i).getCol()-1;
    	  list.get(i).setCol2(col2);
    	  col1=col1+list.get(i).getCol();
      }
      for(int i=0;i<list.size();i++){
    	  System.out.println(list.get(i).getName()+":"+list.get(i).getRow1()+":"+list.get(i).getRow2()+":"+list.get(i).getCol1()+":"+list.get(i).getCol2());
      }
      
  
  } catch (SQLException e) {  
      // TODO Auto-generated catch block  
      e.printStackTrace();  
  }
 }

 
}

class AA{
	String value;
	String name;
	int col;
    int hi;
    int rowxh;
    
    int row1,row2,col1,col2;
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
	
	
	
	
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}
	public int getHi() {
		return hi;
	}
	public void setHi(int hi) {
		this.hi = hi;
	}
	public int getRowxh() {
		return rowxh;
	}
	public void setRowxh(int rowxh) {
		this.rowxh = rowxh;
	}
	public int getRow1() {
		return row1;
	}
	public void setRow1(int row1) {
		this.row1 = row1;
	}
	public int getRow2() {
		return row2;
	}
	public void setRow2(int row2) {
		this.row2 = row2;
	}
	public int getCol1() {
		return col1;
	}
	public void setCol1(int col1) {
		this.col1 = col1;
	}
	public int getCol2() {
		return col2;
	}
	public void setCol2(int col2) {
		this.col2 = col2;
	}
	public AA(String value, String name, int col, int hi, int rowxh) {
		super();
		this.value = value;
		this.name = name;
		this.col = col;
		this.hi = hi;
		this.rowxh = rowxh;
	}
    
}