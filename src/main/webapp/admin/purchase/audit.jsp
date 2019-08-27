<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>审核</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
  <link rel="stylesheet" href="layui/css/main.css" >
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
 <div id="audit" style="display: none;">
 	<table>
 		<tr>
 			<td colspan="3"><label class="layui-form-label" style="font-size:13px;">原因：</label>
    <div class="layui-input-block" >
      <input name="a" class="layui-input" type="text" autocomplete="off" lay-verify="title" style="width: 300px;" id="cause">
    </div></td>
 		</tr>
 		<tr>
 			<td> <label class="layui-form-label"></label></td>
 			<td> <label class="layui-form-label"></label></td>
 			<td> <label class="layui-form-label"></label></td>
 		</tr>
 		<tr>
 			<td><label class="layui-form-label"></label>
 			<div class="layui-input-block" >
 			<button class="layui-btn" type="button">审核通过</button>
 			</div></td>
 			<td><label class="layui-form-label"></label></td>
 			<td>
 			<button class="layui-btn" type="button">&nbsp;&nbsp;不通过&nbsp;&nbsp;</button>
 			</td>
 		</tr> 
 	</table>
 	
   
 </div>
 <div style="display: none;" id="purchaseOrderDetails">
 	<table class="layui-hide" id="demo" lay-filter="demo"></table>
 </div>
<table class="layui-hida" id="test" lay-filter="test"></table>
 
<script id="barDemo" type="text/html">
  <a class="layui-btn layui-btn-xs" lay-event="edit">审核</a>
</script>
              
          
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 
<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
	  elem: '#test'
		    ,url:'admin/json/demo1.json'
		    ,toolbar: '#toolbarDemo'
		    ,title: '用户数据表'
		    /* ,parseData:function(res){
		    	console.log(res);
		    	return{
		    		code: 0, //解析接口状态
		    		msg:"", //解析提示文本
		    		count: 1000, //解析数据长度
		    		data: res //解析数据列表
		    	}
		    } */
    ,cols: [[
      {field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
      ,{field:'username', title:'用户名', width:120}
      ,{field:'email', title:'邮箱', width:150, templet: function(res){
        return '<em>'+ res.email +'</em>'
      }}
      ,{field:'sex', title:'性别', width:80,  sort: true}
      ,{field:'city', title:'城市', width:100}
      ,{field:'sign', title:'签名'}
      ,{field:'experience', title:'积分', width:80, sort: true}
      ,{field:'ip', title:'IP', width:120}
      ,{field:'logins', title:'登入次数', width:100, sort: true}
      ,{field:'joinTime', title:'加入时间', width:120}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:80}
    ]]
    ,page: true
  });
  
  table.on('rowDouble(test)', function(obj){
	    var layer = layui.layer;
	    layer.open({
	    	type: 1, 
	    	title:'详细信息',
	    	area: ['auto', 'auto'],
	    	content: $('#purchaseOrderDetails') //这里content是一个普通的String
	    });
		$("#cause").prop("value","");
	});
  
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //console.log(obj)
    if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
    	var layer = layui.layer;
	    layer.open({
	    	type: 1, 
	    	area: ['500px', '150px'],
	    	content: $('#audit') //这里content是一个普通的String
	    });
	    $("#cause").prop("value","");
    }
  });
});
layui.use('table', function(){
	  var table = layui.table;
	  table.render({
	    elem: '#demo'
	    ,url:'admin/json/demo1.json'
	    ,title: '用户数据表'
	    ,parseData:function(res){
	    	console.log(res);
	    	return{
	    		code: 0, //解析接口状态
	    		msg:"", //解析提示文本
	    		count: 1000, //解析数据长度
	    		data: res //解析数据列表
	    	}
	    }
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'stuid', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
	      ,{field:'stuName', title:'用户名', width:120, edit: 'text'}
	      ,{field:'stuAge', title:'邮箱', width:150, edit: 'text'}
	      ,{field:'stuSex', title:'性别', width:80, edit: 'text', sort: true}
	      ,{field:'claId', title:'城市', width:100}
	      ,{field:'sign', title:'签名'}
	      ,{field:'experience', title:'积分', width:80, sort: true}
	      ,{field:'ip', title:'IP', width:120}
	      ,{field:'logins', title:'登入次数', width:100, sort: true}
	      ,{field:'joinTime', title:'加入时间', width:120}
	    ]]
	    ,page: true
	  });
	  
	});
</script>

</body>
</html>