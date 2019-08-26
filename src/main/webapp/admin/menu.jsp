<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>菜单</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body style="margin:0;padding:0;">         
<table class="layui-hide" id="test" lay-filter="test"></table>         
<style>
.layui-table, .layui-table-view {
    margin: 0px 0;
}
</style>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
	,url: '../queryMenu.do'//数据接口
    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
    ,cols: [[
      {field:'menuId', title: '菜单ID', align:'center'}
      ,{field:'menuName', title: '菜单名称',edit: 'text',templet:function(d){
    	  var left = (d.menuType-1)*40;
    	  
    	  var num = "";
    	  if(d.menuType == 1){
    		  num = "bold";
    	  }else{
    		  num = "normal";
    	  }
    	  return '<span style="margin-left:'+left+'px;font-weight:'+num+';">'+d.menuName+'</span>'
      }}
      ,{field:'menuParent',title: '父级菜单ID',align:'center'}
      ,{field:'menuIcon',title: '菜单Icon',edit: 'text',align:'center'}
      ,{field:'menuType',title: '菜单类型',align:'center',templet:function(d){
    	  switch(d.menuType){
    	  	case 1: 
    	  		return '<span class="layui-badge layui-bg-blue">一级目录</span>'
    	  	case 2:
    	  		return '<span class="layui-badge">二级目录</span>'
    	  }
      }}
      ,{field:'menuType',title: '类型',edit: 'text',align:'center',hide:true}
      ,{field:'menuURL',edit: 'text',title: '菜单URL',align:'center'}
    ]]

  });
  
  //监听单元格编辑
  table.on('edit(test)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
	  $.ajax({
		  url:'../updateMenu.do',
		  data:obj.data,
		  type:'post',
		  dataType:'html',
		  success:function(data){
			if(data == '1'){
				layer.msg('修改成功');
			}else{
				layer.msg('修改失败');
			}
		  }
	  });
	});
});
</script>
</body>
</html>