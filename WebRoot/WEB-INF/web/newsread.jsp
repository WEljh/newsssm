<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>新闻阅读</title>


<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">

<!--<link rel="stylesheet" type="text/css" href="${ctxPath}/styles.css">-->

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>include/css/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>include/css/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css"
	href="<%=basePath%>include/css/assess.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>include/css/news.css">

<script type="text/javascript"
	src="<%=basePath%>include/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>include/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>include/js/easyui-lang-zh_CN.js"></script>

<link rel="shortcut icon" type="text/css"
	href="<%=basePath%>include/img/timg.png">
	<script>var base = "<%=basePath%>";</script>
<script type="text/javascript" charset="utf-8"
	src="<%=basePath%>include/ueditor/ueditor.config.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="<%=basePath%>include/ueditor/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="<%=basePath%>include/ueditor/lang/zh-cn/zh-cn.js">
	
</script>
	

</head>
<style>
#backtotop {
	width: 24px;
	color: white;
	padding: 12px 0px 12px 5px;
	display: none;
	position: fixed;
	cursor: pointer;
	text-align: center;
	z-index: 20;
	background-color: rgba(0, 188, 212, 0.65);
	border-radius: 12px 0px 0px 12px;
}
</style>
<div id="backtotop" style="right: 0px; display: none;">回到顶部</div>
<script>
	var $backtotop = $('#backtotop');
	var toplrw = $(window).height() - $backtotop.height() - 200;
	function moveBacktotop() {
		if (toplrw < 0)
			toplrw = 0;
		$backtotop.css({
			top : toplrw,
			right : 0
		});
	}
	$backtotop.click(function() {
		$('html,body').animate({
			scrollTop : 0
		});
		return false;
	});
	$(window).scroll(function() {
		var windowHeight = $(window).scrollTop();
		if (windowHeight > 200) {
			$backtotop.fadeIn();
		} else {
			$backtotop.fadeOut();
		}
	});
	moveBacktotop();
	$(window).resize(moveBacktotop);
</script>
<body>
	<div
		style="background:#B3DFDA;padding:0 10px 0
10px;vertical-align: middle;">
		<img src="<%=basePath%>include/img/logo.png" width="126" height="50" />
		<div
			style="float:right;line-height:50px;margin-right:10px;font-size: 9pt;">
			<span>【</span><a style="color:;"
				href="javascript:window.close();"><span>关闭窗口 </span></a><span>】</span>
		</div>
	</div>
	<div class="ndetail">
		<div class="ntitle">${news.title}</div>
		<div class="nauthor">
			<div>
				来源: &nbsp;<strong>${news.cruser} &nbsp;&nbsp; 
				发布时间:&nbsp; <strong><fmt:formatDate
							value="${news.date}" pattern="yyyy-MM-dd" /></strong>&nbsp;&nbsp;
				访问量:&nbsp;
					<strong>[<span>${news.hitnum}</span>]
				</strong>
			</div>
		</div>
		<div class="nbody">
			<div id="vsb_content">${news.content}</div>
		</div>
	</div>
	<div class="nlist">
		<table id="newstable" width="100%">
			<tbody>
				<tr id="trpp">
					<td colspan="3" align="left"></td>
				</tr>
			</tbody>
		</table>
		<div id="pp" style="background:#efefef;"></div>
	</div>
	<div class="ndetail">
	<div class="easyui-panel" title="添加回复" style="width:90%">
		<div style="padding:10px 60px 20px 60px;width:90%">
			<table cellpadding="5" style="width:90%">
				<tr>
					<td style="width:10%">学号:</td>
					<td><input class="easyui-textbox" type="text" id="cname"
						data-options="required:true" style="width:50%" ></input></td>
				</tr>
					<tr>
						<td style="vertical‐align: top;width: 10%">内容：</td>
						<td><script id="content" type="text/plain" style="width:100%;height:400px;"></script>
						<!-- <textarea rows="20" cols="100" id="neirong"></textarea> -->
						</td>
					</tr>
			</table>
			<div>
				<div style="text-align:center;padding:5px">
					<a id="savenews" href="javascript:void(0)"
						class="easyui-linkbutton" style="width:120px">保存</a>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
<script>
var bver,role="5";
var base="./"; 
var pageN=1,pageTotal=100;
var ue; 
$(function(){
ue = UE.getEditor('content');    
$.ajax({
	url:"<%=basePath%>comment/getCount",
	data:{"id":${news.id}},
	type:"post",
	success: function(res){
	pageTotal=res.newscount;
	listNews(1,10);loadPager();
	},
	error:function(res){
	$.messager.alert("系统提示","系统错误","error");
	}
	});
	$("#savenews").click(function(){   
      var a=$('#cname').val();
      var b=ue.getContent();
      
    
      if(b==""||b==undefined){alert("请输入内容");return;}
      $.ajax({
            url : "<%=basePath%>comment/addComment",
      //只封装和传输指定的数据
            data :{"id":${news.id},"cname":a,"comment":b},
            type:"POST",
            success : function (res) {
                  if (res.ok) {
                       parent.$.messager.alert("系统提示", "评论成功，感谢您的参与", "info");
                  }else {alert(res.msg);             }
                  return false;
            },
            error : function(res) {alert("系统错误！");      }
      });
});

});
	function listNews(pageNumber,pageSize){
	$.ajax({
	url:"<%=basePath%>comment/listComment",
	data:{"id":${news.id},"page":pageNumber,"rows":pageSize},
					type : "post",
					success : function(res) {
						$(".inews").remove();
						//res=JSON.parse(res);
						if (res.total <= 0) {
							var tr = "<div class='inews' height=\"25\"><td >";
							tr += "<div class='t'>暂无相关评论</div>";
							tr += "</td><td width='1%' nowrap=''><span >&nbsp;</span></td></tr>";
							$("#trpp").before(tr);
						} else {
							pageN=pageNumber;
							pageTotal = res.total;
							var rows = res.rows;
							for (var i = 0; i < rows.length;i++) {
							var row=rows[i];
				var tr='<div class="cell reply_area" ><div class="author_content"><div class="user_info">';
				tr+='<a class="reply_time" href="####">'+(i+1)+'楼•</a>';
				tr+='<a href="####"><img src="/newsssm/include/img/Octocat_32.png"></a>';
				tr+='<a class="dark reply_author" href="####">'+row.cname+'</a>';
				tr+='</div></div><div class="reply_content from-wendal"><div class="markdown-text"><p>';
				tr+=row.comment+'</p></div></div></div>'
 				$("#pp").before(tr);

							
								
							}
						}
					},
					error : function(res) {
						parent.dlg_ok(300, 140, "系统提示", "系统错误", null, "error");
					}
				})
	}
	
	function loadPager(){
	$('#pp').pagination({
	 total:pageTotal,
	 pageSize:10,
	 pageNumber:pageN,
	 displayMsg:'{from}/{to} 共{total}条',
	 onSelectPage:function(pageNumber, pageSize){
	 listNews(pageNumber,pageSize);
	 }
	});
	}

</script>
</html>
