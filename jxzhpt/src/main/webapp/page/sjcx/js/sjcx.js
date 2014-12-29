var checkValues;
function cxzd(jsp,w,h){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表',jsp,'zd_xz',w,h);
}
//基础库管理
function zdy(){
	$("#grid").datagrid({    
		 url:"../js/lwxm1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	});  
}

