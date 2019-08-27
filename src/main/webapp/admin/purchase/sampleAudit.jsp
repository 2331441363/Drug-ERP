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
  <title>样品审核</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

 <div id="qualityTesting" style="display: none; width:1000px;height:150px">
 	<table  style="width: 980px;">
 	<tr><td height="10px"></td></tr>
 		<tr>
 			<td><label class="layui-form-label" style="font-size:13px;">质检员:</label>
     			 <div class="layui-input-inline">
        			<select name="modules" lay-search="" lay-verify="required" style="height: 37px;width: 180px;">
          					<option value="">直接选择或搜索选择</option>
          					<option value="1">layer</option>
          					<option value="2">form</option>
          					<option value="3">layim</option>
        			</select>
      			</div>

 			</td>
 			<td>
 			<label class="layui-form-label" style="font-size:13px;">质检日期:</label>
      <div class="layui-input-block">
        <input name="date" class="layui-input" id="date1" type="text" autocomplete="off">
      </div>
 			</td>
 			
 			<td>
 				<label class="layui-form-label" style="font-size:13px;">样品编号:</label>
     		 <div class="layui-input-inline">
       	 <input name="phone" class="layui-input" type="tel" autocomplete="off" lay-verify="required|phone">
      		</div>
 			</td>
 		</tr>
 		<tr>
 			<td>
 				<label class="layui-form-label" style="font-size:13px;">质检数量:</label>
     		 <div class="layui-input-inline">
       	 <input name="phone" class="layui-input" type="tel" autocomplete="off" lay-verify="required|phone" placeholder="单位：克">
      		</div>
 			</td>
 			<td>
 			<label class="layui-form-label" style="font-size:13px;">合格数量:</label>
     		 <div class="layui-input-inline">
       	 <input name="phone" class="layui-input" style="width: 280px" type="tel" autocomplete="off" lay-verify="required|phone" placeholder="单位：克">
      		</div>
 			</td>
 			<td>
 				<label class="layui-form-label" style="font-size:13px;">合格率:</label>
     		 <div class="layui-input-inline">
       	 <input name="phone" class="layui-input" type="tel" autocomplete="off" lay-verify="required|phone">
      		</div>
 			</td>
 		</tr>
 		<tr>
 			<td colspan="3" style="text-align:center; height: 80px">
 				<button class="layui-btn" type="button" style="width:150px;">确认</button>
 			</td>
 		</tr>
 	</table>
 </div>
<table class="layui-hide" id="test" lay-filter="test"></table>
 
<script id="toolbarDemo" type="text/html">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData"><i class="layui-icon layui-icon-edit"></i>质检</button>
  </div>
</script>
 
<script id="barDemo" type="text/html">
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
      {type: 'checkbox', fixed: 'left'}
      ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
      ,{field:'username', title:'用户名', width:120, edit: 'text'}
      ,{field:'email', title:'邮箱', width:150, edit: 'text', templet: function(res){
        return '<em>'+ res.email +'</em>'
      }}
      ,{field:'sex', title:'性别', width:80, edit: 'text', sort: true}
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
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
    	  layer.open({
  	    	type: 1, 
  	    	title:'详细信息',
  	    	area: ['auto', 'auto'],
  	    	content: $('#qualityTesting') //这里content是一个普通的String
  	    });
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
    }
  });
});
</script>

<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  
});
</script>
</body>
</html>