
window.moveTo(0,0);
window.resizeTo(window.screen.width,window.screen.height);

var c1 = true;
var c2 = true;
var c3 = true;

var objHomeOpen={};


/*
 * 改变菜单.
 */
//Initialize Index Page.
$(function(){
	//默认加载的页面Index.html
	$("#Menu_1").addClass('now');
	$("#c1f").attr("src", "page/wjsjxt/lkpd.jsp");
	
	$("#Menu_1,#Menu_2,#Menu_3").click(function(e){
		$("#Menu_1,#Menu_2,#Menu_3").removeClass('now');
		$("#" + this.id).addClass('now');
	});
    
    $("#Menu_1").click(function () {
        $("#c2,#c3").hide();
        $("#c1").show();
        if (c1){
            $("#c1f").attr("src", "page/wjsjxt/lkpd.jsp");
        }
    });

    $("#Menu_2").click(function () {
        $("#c1,#c3").hide();
        $("#c2").show();
        if (c2) {
            $("#c2f").attr("src", "page/wjsjxt/jtltj.jsp");
        }

    });
    //计划管理
    $("#Menu_3").click(function () {
        $("#c1,#c2").hide();
        $("#c3").show();
        if (c3) {
            $("#c3f").attr("src", "page/wjsjxt/yhtj.jsp");
        }
    });

   
});