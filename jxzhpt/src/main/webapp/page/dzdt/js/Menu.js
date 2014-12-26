function loadDataunit(){
	$("#dataunit_tree").treegrid({
		border : false,
		rownumbers: false,
		animate:true,
		collapsible:true,
		fit:true,
		fitColumns : true,
		pagination : false,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectXzqhList.do',
		queryParams : {
			"unit.id":$.cookie("unit")
		},
		idField:'id',
		treeField:'name',
		showFooter:false,
		columns:[[
            {field:'name',width:200}
		]],
		onBeforeExpand:function(row){
			if(row.sjlx=="0"){
				var child=$("#dataunit_tree").treegrid("getChildren",row.id);
				if(child == ""){
					$('#dataunit_tree').treegrid('append',{
						parent: row.id,
						data: [{
							id: row.id+'lx',name: '路线',state:'closed',iconCls:'icon-none'
						  	},{
							id: row.id+'sfz',name: '收费站',state:'closed',iconCls:'icon-none'
							}
						]
					});
				}
			}else{
				$("#dataunit_tree").treegrid("getChildren",row.id);
			}
		},onDblClickRow:function(row){
			if(row.id.length>=14){
				if(row.sjlx==1) drawLine(row.id);
				else drawPoint(row.id);
			}
		},onClickRow:function(row){
			if(row.id.length>=14){
				if(row.sjlx==1) drawLine(row.id);
				else drawPoint(row.id);
			}
		}
	});
}