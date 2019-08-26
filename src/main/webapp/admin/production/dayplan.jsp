<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>菜单</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>    

<script type="text/html" id="toolbarDemo">

 
<div class="layui-input-inline">
  <div class="layui-btn-container" style="margin-top:10px;padding-left:20px;">
	<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckData"><i class="layui-icon layui-icon-friends"></i>审核日计划 </button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckLength"><i class="layui-icon layui-icon-add-1"></i>制定生产订单</button>
  </div>


</div>
<div class="layui-input-inline" style="margin-top:10px;">
<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">状态查询</label>
	<div class="layui-input-inline">
		<select name="city" lay-verify="">
  			<option value="">审核状态</option>
  			<option value="010" >未审核</option>
  			<option value="021">审核未通过</option>
 			<option value="0571">审核通过</option>
		</select>  
	</div>
</div>
	
</script>


<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
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
    ,title: '日生产计划'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'id', title:'日生产计划编号', unresize:true}
      ,{field:'username', title:'月生产计划编号',unresize:true}
      ,{field:'email', title:'制定日期',unresize:true}
      ,{field:'experience', title:'负责人', unresize:true}
      ,{field:'experience', title:'药品种数', unresize:true}
      ,{field:'experience', title:'生产总数', unresize:true}
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
  
//监听工具条
  table.on('tool(test)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
    	layer.open({
  		  title: '计划详情',
  		  type:1,
  		  shadeClose : true,
  		  area : [ '700px', '460px' ],//大小
  		  content: $("#dibId"),
  		  end : function() {
					$('[lay-id="test2"]').css("display", "none");
			  }
  		});
  	  
  	  table.render({
		    elem: '#test2'
		    ,url:'../json/demo1.json'
		    ,totalRow: true
		    ,cols: [[
		      {type: 'numbers',totalRowText: '合计'}
		      ,{field:'id', title:'药品编号', unresize:true}
		      ,{field:'username', title:'药品名称',unresize:true}
		      ,{field:'experience', title:'日生产数量', totalRow: true,unresize:true}
		      
		    ]]
		});    
  	} else if(obj.event === 'del'){
      layer.confirm('确认删除该计划？', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
    	layer.open({
    		  title: '修改日计划',
    		  type:1,
    		  shadeClose : true,
    		  content: $("#dibId"),
    		  end : function() {
  					$('[lay-id="test2"]').css("display", "none");
  			  }
    		});
    }
  });
});
</script>



 
<table class="layui-hide" id="test" lay-filter="test"></table>
<div  id="dibId">
	<table class="layui-hide" id="test2"  lay-filter="test2" style="display:none;"></table>
	
</div>
</body>
</html>
