<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>权限管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

 
<table class="layui-hide" id="test" lay-filter="test"></table>


<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">分配权限</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
layui.use(['table','laydate','form','tree', 'util'], function(){
  var table = layui.table;
  var laydate = layui.laydate;
  var form = layui.form;
  var tree = layui.tree
  ,layer = layui.layer
  ,util = layui.util
//模拟数据
  ,data = [{
    title: '一级2'
    ,id: 2
    ,spread: true
    ,children: [{
      title: '二级2-1'
      ,id: 5
      ,spread: true
      ,children: [{
        title: '三级2-1-1'
        ,id: 11
      },{
        title: '三级2-1-2'
        ,id: 12
      }]
    },{
      title: '二级2-2'
      ,id: 6
      ,spread: true	//打开
      ,children: [{
        title: '三级2-2-1'
        ,id: 13
      },{
        title: '三级2-2-2'
        ,id: 14
        ,disabled: true
      }]
    }]
  },{
    title: '一级3'
    ,id: 16
    ,spread: true	//打开
    ,children: [{
      title: '二级3-1'
      ,id: 17
      ,fixed: true
      ,children: [{
        title: '三级3-1-1'
        ,id: 18
        ,spread: true	//打开
      },{
        title: '三级3-1-2'
        ,id: 19
      }]
    },{
      title: '二级3-2'
      ,id: 27
      ,spread: true	//打开
      ,children: [{
        title: '三级3-2-1'
        ,id: 28
      },{
        title: '三级3-2-2'
        ,id: 29
      }]
    }]
  }]
  
  
	//基本演示
  tree.render({
    elem: '#test12'
    ,data: data
    ,showCheckbox: true  //是否显示复选框
    ,id: 'demoId1'
    ,isJump: true //是否允许点击节点时弹出新窗口跳转
    ,click: function(obj){
      var data = obj.data;  //获取当前点击的节点数据
      layer.msg('状态：'+ obj.state + '<br>节点数据：' + JSON.stringify(data));
    }
  });
  table.render({
    elem: '#test'
    ,url:'demo1.json'
    ,toolbar: '#toolbarDemo'
    ,title: '领料单'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'id', title:'部门编号', unresize:true}
      ,{field:'username', title:'部门名称',unresize:true}
      ,{field:'sex', title:'描述', unresize:true}
      ,{
		fixed: 'right', align:'center', toolbar: '#barDemo',unresize:true
      }
    ]]
    ,page: true
  });
  
  
//监听工具条
  table.on('tool(test)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
    	layer.open({
			title : '权限管理',//标题
			type : 1,//样式
			content :$("#test12"),
			success : function(layero) {
				var mask = $(".layui-layer-shade");
				mask.appendTo(layero.parent());
				//其中：layero是弹层的DOM对象
			},
			end : function() {
				
			}
		});
		
		
	} else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ JSON.stringify(data))
    }
  });
  
});
</script>

<div id="test12" class="demo-tree-more" style="display:none;"></div>



</body>
</html>