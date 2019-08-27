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
  <title>供应商管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
 <div style="display: none;" id="material">
 	<table class="layui-hide" id="demo" lay-filter="demo"></table>
 </div>
<table class="layui-hide" id="test" lay-filter="test"></table>


<div id="div" style="display: none;">
 	<form class="layui-form" action="">
  <div class="layui-form-item">
    <label class="layui-form-label" style="font-size:13px;">单行输入框</label>
    <div class="layui-input-block">
      <input name="title" class="layui-input" type="text" placeholder="请输入标题" autocomplete="off" lay-verify="title">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label" style="font-size:13px;">验证必填项</label>
    <div class="layui-input-block">
      <input name="username" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？">
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="font-size:13px;">多规则验证</label>
      <div class="layui-input-inline">
        <input name="number" class="layui-input" type="text" autocomplete="off" lay-verify="required|number">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label" style="font-size:13px;">验证日期</label>
      <div class="layui-input-inline">
        <input name="date" class="layui-input" id="date" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label" style="font-size:13px;">验证链接</label>
      <div class="layui-input-inline">
        <input name="url" class="layui-input" type="tel" autocomplete="off" lay-verify="url">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label" style="font-size:13px;">验证身份证</label>
    <div class="layui-input-block">
      <input name="identity" class="layui-input" type="text" placeholder="" autocomplete="off" lay-verify="identity">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label" style="font-size:13px;">自定义验证</label>
    <div class="layui-input-inline">
      <input name="password" class="layui-input" type="password" placeholder="请输入密码" autocomplete="off" lay-verify="pass">
    </div>
    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="font-size:13px;">范围</label>
      <div class="layui-input-inline" style="width: 100px;">
        <input name="price_min" class="layui-input" type="text" placeholder="￥" autocomplete="off">
      </div>
      <div class="layui-form-mid">-</div>
      <div class="layui-input-inline" style="width: 100px;">
        <input name="price_max" class="layui-input" type="text" placeholder="￥" autocomplete="off">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label" style="font-size:13px;">单行选择框</label>
    <div class="layui-input-block">
      <select name="interest" lay-filter="aihao">
        <option value=""></option>
        <option value="0">写作</option>
        <option value="1" selected="">阅读</option>
        <option value="2">游戏</option>
        <option value="3">音乐</option>
        <option value="4">旅行</option>
      </select>
    </div>
  </div>
  
  
    <div class="layui-inline">
      <label class="layui-form-label" style="font-size:13px;">分组选择框</label>
      <div class="layui-input-inline">
        <select name="quiz">
          <option value="">请选择问题</option>
          <optgroup label="城市记忆">
            <option value="你工作的第一个城市">你工作的第一个城市</option>
          </optgroup>
          <optgroup label="学生时代">
            <option value="你的工号">你的工号</option>
            <option value="你最喜欢的老师">你最喜欢的老师</option>
          </optgroup>
        </select>
      </div>
    </div>
  
  <div class="layui-form-item" pane="">
    <label class="layui-form-label" style="font-size:13px;">原始复选框</label>
    <div class="layui-input-block">
      <input name="like1[write]" title="写作" type="checkbox" checked="" lay-skin="primary">
      <input name="like1[read]" title="阅读" type="checkbox" lay-skin="primary">
      <input name="like1[game]" title="游戏" disabled="" type="checkbox" lay-skin="primary">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label" style="font-size:13px;">开关-默认关</label>
    <div class="layui-input-block">
      <input name="close" type="checkbox" lay-skin="switch" lay-text="ON|OFF">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label" style="font-size:13px;">开关-默认开</label>
    <div class="layui-input-block">
      <input name="open" type="checkbox" checked="" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label" style="font-size:13px;">单选框</label>
    <div class="layui-input-block">
      <input name="sex" title="男" type="radio" checked="" value="男">
      <input name="sex" title="女" type="radio" value="女">
      <input name="sex" title="禁用" disabled="" type="radio" value="禁">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label" style="font-size:13px;">普通文本域</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" placeholder="请输入内容">请输入内容</textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-filter="demo1" lay-submit="">立即提交</button>
      <button class="layui-btn layui-btn-primary" type="reset">重置</button>
    </div>
  </div>
</form>
 </div>
 
 
 
 
 
<script id="toolbarDemo" type="text/html">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>新增</button>
	<input type="text" placeholder="请供应商姓名" class="layui-text"  id="select" style="width:150px;height:30px;">
	<button class="layui-btn layui-btn-sm" lay-event="select"><i class="layui-icon layui-icon-search"></i>搜索</button>
  </div>
</script>
 
<script id="barDemo" type="text/html">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
      {type: 'checkbox'}
      ,{field:'stuid', title:'ID', width:80,  sort: true}
      ,{field:'stuName', title:'用户名', width:120, edit: 'text',templet:'<div><img src="{{ d.stuName}}"></div>'}
      ,{field:'stuAge', title:'邮箱', width:150, edit: 'text'}
      ,{field:'stuSex', title:'性别', width:80, edit: 'text', sort: true}
      ,{field:'claId', title:'城市', width:100}
      ,{field:'sign', title:'签名'}
      ,{field:'experience', title:'积分', width:80, sort: true}
      ,{field:'ip', title:'IP', width:120}
      ,{field:'logins', title:'登入次数', width:100, sort: true}
      ,{field:'joinTime', title:'加入时间', width:120}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
    ]]
    ,page: true
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
    	case 'add':
  	  		layer.open({
  		  		type: 1, 
  		  		title:'新增',
  		  		area: ['500px', '300px'],
  				content: $('#div') 
  				
  				});
  	  		break;
    	case 'select':
    		
      	  break;
      	  
    };
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
    	layer.open({
		  	type: 1, 
		  	title:'修改',
		  	area: ['500px', '300px'],
			content: $('#div') 
				
			});
    }
  });
  table.on('rowDouble(test)', function(obj){
	    var layer = layui.layer;
	    layer.open({
	    	type: 1, 
	    	title:'详细信息',
	    	offset: ['0px', '50px'],
	    	area: ['1000px', '500px'],
	    	content: $('#material') //这里content是一个普通的String
	    });

	});
});
layui.use('table', function(){
	  var table = layui.table;
	  table.render({
	    elem: '#demo'
	    ,url: 'admin/json/demo1.json'
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
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
	      ,{field:'username', title:'用户名', width:120, edit: 'text'}
	      ,{field:'email', title:'邮箱', width:150, edit: 'text'}
	      ,{field:'sex', title:'性别', width:80, edit: 'text', sort: true}
	      ,{field:'city', title:'城市', width:100}
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