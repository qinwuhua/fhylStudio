//
function fileShow(xmbm,type){
	$.ajax({
		type:'post',
//		url:'/jxzhpt/qqgl/queryFileByXmbm.do',
//		data:'file.parentid='+xmbm+'&file.filetype='+type,
//		dataType:'json',
		url:'/jxzhpt/jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#qlzmTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  |  <a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
					$("#qlzmTable").append(tr);
				}
			}
		}
	});
}
function fileShow1(xmbm,type){
	$.ajax({
		type:'post',
//		url:'../../../qqgl/queryFileByXmbm.do',
//		data:'file.parentid='+xmbm+'&file.filetype='+type,
//		dataType:'json',
		url:'/jxzhpt/jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#qlcmTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  |  <a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				$("#qlcmTable").append(tr);
				}
			}
		}
	});
}
function fileShow2(xmbm,type){
	$.ajax({
		type:'post',
//		url:'../../../qqgl/queryFileByXmbm.do',
//		data:'file.parentid='+xmbm+'&file.filetype='+type,
//		dataType:'json',
		url:'/jxzhpt/jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#qlzmTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  </td></tr>";
				$("#qlzmTable").append(tr);
				}
			}
		}
	});
}
function fileShow3(xmbm,type){
	$.ajax({
		type:'post',
//		url:'../../../qqgl/queryFileByXmbm.do',
//		data:'file.parentid='+xmbm+'&file.filetype='+type,
//		dataType:'json',
		url:'/jxzhpt/jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#qlcmTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  </td></tr>";
				$("#qlcmTable").append(tr);
				}
			}
		}
	});
}
/**
 * 下载文件
 * @param id 文件ID
 */
function downFile(id){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.id="+id;
}
/**
 * 删除文件
 * @param id 文件ID
 */
function deleteFile(id){
	if(confirm('确定删除所选数据？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/deleteFile.do",
			 dataType : 'json',
			 data : 'uploads.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('删除成功！');
					 fileShow(xmbm,'桥梁正面文件');
					 fileShow1(xmbm,'桥梁侧面文件');
				 }else{
					 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}