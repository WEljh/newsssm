<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
<title>新闻添加</title>

<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">

<!--<link rel="stylesheet" type="text/css" href="<%=basePath%>styles.css">-->

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>include/css/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>include/css/themes/default/easyui.css">
	
<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>include/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>include/js/easyui-lang-zh_CN.js"></script>
<script>
	var base = "<%=basePath%>";
</script>
<link rel="shortcut icon" type="text/css"
	href="<%=basePath%>include/img/timg.png">
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

<body>

	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="新闻添加" style="width:1600px">
		<div style="padding:10px 60px 20px 60px">

			<table cellpadding="5">
				<tr>
					<td>新闻标题:</td>
					<td style="width:1200px"><input class="easyui-textbox" type="text" id="title"
						data-options="required:true" style="width:80%"></input></td>
				</tr>
				<tr>
					<td>新闻发布人:</td>
					<td style="width:1200px"><input class="easyui-textbox" type="text" id="cruser"
						data-options="required:true" style="width:80%"></input></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">新闻内容：</td>
					<td><script id="content" type="text/plain"
							style="width:89%;height:300px;"></script></td>
				</tr>


			</table>

			<div style="text-align:center;padding:5px">
				<a id="savenews" href="javascript:void(0)" class="easyui-linkbutton">保存</a>
			</div>

		</div>
	</div>
</body>

<script type="text/javascript">
	var ue;
	$(function() {
		ue = UE.getEditor('content');
		$("#savenews").click(function() {
			var title = $("#title").textbox("getValue");
			var cruser = $("#cruser").textbox("getValue");
			var content = ue.getContent();

			if (title == "") {
				parent.$.messager.alert("系统提示", "请输入新闻标题", "warning");
				return;
			}
			if(cruser == ""){
				parent.$.messager.alert("系统提示","必须填写新闻发布人或者发布机构名称","warning");
				return;
			}
            if(content == ""){
				parent.$.messager.alert("系统提示","必须填写新闻内容","warning");
				return;
			} 
			$.ajax({
				url : "<%=basePath%>news/saveAdd",
				//只封装和传输指定的数据
				data : {
					"title" : title,
					"content" : content,
					"cruser" : cruser
					
				},
				type : "POST",
				success : function(res) {
					if (res.ok) {
						parent.$.messager.alert("系统提示", "添加成功", "info");
					} else {
						parent.$.messager.alert("系统提示", res, "warning");
					}
					return false;
				},
				error : function(res) {
					parent.$.messager.alert("系统提示", "系统错误！", "error");
				}
			});

		});
	});
</script>



</html>
