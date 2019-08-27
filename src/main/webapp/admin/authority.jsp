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

	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container" style="padding-left:20px;">
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckData"><i class="layui-icon layui-icon-add-1"></i>新增部门 </button>
  </div>
	
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">管理权限</a>
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
    title: 'ALL'
    ,id: 2
    ,spread: true
    ,children: [{
      title: '系统信息管理'
      ,id: 5
      ,spread: true
      ,children: [{
        title: '员工管理'
        ,id: 11
        ,spread: true
        ,children: [{
            title: '新增'
            ,id: 11
          },{
        	  title:'删除'
        	  ,id:22
          }]
      },{
          title: '部门管理'
              ,id: 11
              ,spread: true
              ,children: [{
                  title: '新增'
                  ,id: 11
                },{
              	  title:'删除'
              	  ,id:22
                }]
            }]
    },{
        title: '采购管理'
            ,id: 5
            ,spread: true
            ,children: [{
              title: '采购申请'
              ,id: 11
              ,spread: true
              ,children: [{
                  title: '新增'
                  ,id: 11
                },{
              	  title:'删除'
              	  ,id:22
                }]
            },{
                title: '采购计划'
                    ,id: 11
                    ,spread: true
                    ,children: [{
                        title: '新增'
                        ,id: 11
                      },{
                    	  title:'删除'
                    	  ,id:22
                      }]
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
    ,url:'json/demo1.json'
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
			shade: 0,
			area: ['350px', '500px'],
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
      layer.confirm('确认删除该部门吗', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
    	
    	//formTest 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
    	form.val("formAuthority", {
    	  "id": "21321321" // "name": "value"
    	  ,"name": "销售部门"
    	  ,"des": "我爱layui"
    	})
    	
    	var index = layer.open({
			title : '编辑部门',//标题
			type : 1,//样式
			shade: 0,
			offset: ['15%', '35%'],//设置位移
			btn: ['确认', '取消'],
			yes: function(index, layero){
				layer.close(index);
				layer.msg('编辑成功');
			}
			,btn2: function(index, layero){
				  layer.close(index);
			},
			content :$("#branch"),
		});
    }
  });
  
  
//工具栏事件
	table.on('toolbar(test)', function(obj) {
		var checkStatus = table.checkStatus(obj.config.id);
		switch (obj.event) {
		case 'getCheckData':
            $("#formIdOne")[0].reset();
			var index = layer.open({
				title : '新增部门',//标题
				type : 1,//样式
				shade: 0,
				offset: ['15%', '35%'],//设置位移
				btn: ['确认', '取消'],
				yes: function(index, layero){
					layer.close(index);
					layer.msg('新增成功');
				}
				,btn2: function(index, layero){
					  layer.close(index);
				},
				
				content :$("#branch"),
			});
			break;
		};
	});
  
});
</script>

		<div id="test12" class="demo-tree-more" style="display:none;"></div>

		<div class="site-text" style="margin: 5%; display: none" id="branch" target="test123">
		<form class="layui-form" lay-filter="formAuthority" id="formIdOne">
			<div class="layui-input-inline">
				<label style="margin:0 10px 0 20px;font-size:13px;">部门编号</label>
				<div class="layui-input-inline">
      				<input type="text" name="id" lay-verify="required" disabled placeholder="自动生成" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">部门名称</label>
				<div class="layui-input-inline">
      				<input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">部门描述</label>
				<div class="layui-input-inline">
      				<textarea name="des" required lay-verify="required" cols="25px" placeholder="请输入部门描述" class="layui-textarea"></textarea>
    			</div>
			</div>
			</form>
		</div>

</body>
</html>