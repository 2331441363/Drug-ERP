<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>生产领料</title>
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
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckData"><i class="layui-icon layui-icon-friends"></i>审核领料单 </button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckLength"><i class="layui-icon layui-icon-upload-circle"></i>申请领料</button>
  </div>
</div>
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
layui.use(['table','laydate','form','layer'], function(){
  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
  var table = layui.table;
  var laydate = layui.laydate;
  var form = layui.form;
  //常规用法
  laydate.render({
    elem: '#test1'
  });
  //年月选择器
  laydate.render({
    elem: '#test3'
    ,type: 'month'
  });
  
  table.render({
    elem: '#test'
    ,url:'../json/demo1.json'
    ,toolbar: '#toolbarDemo'
    ,title: '领料单'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'id', title:'领料单号', unresize:true}
      ,{field:'username', title:'生产订单号',unresize:true}
      ,{field:'experience', title:'负责人', unresize:true}
      ,{field:'experience', title:'申请时间', unresize:true}
      ,{field:'sex', title:'领料类型', unresize:true}
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
    	  
    	  layer.open({
    		  title: '计划详情',
    		  type:1,
    		  area : [ '600px', '400px' ],//大小
    		  content: $("#test2"),
				end : function() {
					$('[lay-id="test2"]').css("display", "none");
				}
    		  
    		});
    	  
    	  table.render({
  		    elem: '#test2'
  		    ,url:'../json/demo1.json'
  		    ,totalRow: true
  		    ,cols: [[
  		      {type: 'checkbox', fixed: 'left', totalRowText: '合计'}
  		      ,{type: 'numbers'}
  		      ,{field:'id', title:'药品编号', unresize:true}
  		      ,{field:'username', title:'药品名称',unresize:true}
  		      ,{field:'experience', title:'今日生产数量', totalRow: true,unresize:true}
  		      
  		    ]]
  		});
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