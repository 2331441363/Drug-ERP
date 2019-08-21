<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>生产订单</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

 
<table class="layui-hide" id="test" lay-filter="test"></table>
<table class="layui-hide" id="test2"  style="display:none;"></table>


<script type="text/html" id="toolbarDemo">

 
<div class="layui-input-inline">
  <div class="layui-btn-container" style="margin-top:10px;padding-left:20px;">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">审核生产订单 </button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">生成领料单</button>
	<button class="layui-btn layui-btn-sm" lay-event="getCheckLength">开始生产</button>
	
  </div>


</div>
	
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
layui.use(['table','form'], function(){
  var table = layui.table;
  var form = layui.form;
  
  table.render({
    elem: '#test'
    ,url:'../json/demo1.json'
    ,toolbar: '#toolbarDemo'
    ,title: '生产订单'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'id', title:'生产订单号', unresize:true}
      ,{field:'username', title:'生产总数量',unresize:true}
      ,{field:'email', title:'生产总成本',unresize:true}
      ,{field:'username', title:'完成量',unresize:true}
      ,{field:'experience', title:'负责人', unresize:true}
      ,{field:'experience', title:'订单生成时间', unresize:true}
      ,{field:'sex', title:'生产状态', unresize:true}
      ,{field:'sex', title:'领料状态', unresize:true}
      ,{field:'sex', title:'审核状态', unresize:true}
      ,{
		fixed: 'right', width:178, align:'center', toolbar: '#barDemo',unresize:true
      }
    ]]
    ,page: true
  });
  
  
  
  //工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选')
      break;
    };
  });
});
</script>

</body>
</html>