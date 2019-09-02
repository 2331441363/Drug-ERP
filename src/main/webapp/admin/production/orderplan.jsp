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
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckData"><i class="layui-icon layui-icon-friends"></i>审核生产订单 </button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckLength"><i class="layui-icon layui-icon-add-1"></i>生成领料单</button>
	<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckLength"><i class="layui-icon layui-icon-template-1"></i>开始生产</button>
	
  </div>


</div>
	
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
layui.use(['table','form','laydate'], function(){
  var table = layui.table;
  var form = layui.form;
  var laydate = layui.laydate;
//常规用法
	laydate.render({
		elem : '#test5'
	});
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
		fixed: 'right', width:145, align:'center', toolbar: '#barDemo',unresize:true
      }
    ]]
    ,page: true
  });
  
  
  
  //工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    var data = checkStatus.data;
    switch(obj.event){
      case 'getCheckData':
    	  if(data.length == 1){
				//判断订单审核状态
				if(data[0].sex == '男'){
					var index2 = layer.confirm('你确认审核该生产订单？', {
						  btn: ['确认', '取消'] //可以无限个按钮
						  ,btn2: function(index, layero){
						    layer.close(index2);
						  }
						}, function(layero){
							layer.close(index2);
							var index88 = layer.open({
								  type: 1,
								  shade: 0.25,
								  area: ['400px', '350px'],
								  content: $('#nameAndTimeDiv2'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
								  success: function(layero, index){
									  form.render();
									  },
								  btn: ['确认', '取消'],
								  yes: function(layero){
									  layer.close(index88);
									  layer.msg('订单审核成功');
									}
								  ,btn2: function(index, layero){
										  layer.close(index88);
									}
							});
							
						});
				}else{
					layer.msg('该订单已审核');
				}
				
			}else if(data.length >1){
				layer.msg('最多只能审核一个订单');
			}else {
				layer.msg('请选择要审核的订单');
			}
      break;
      case 'getCheckLength':	//生成领料单
    	  if(data.length == 1){
				//判断日计划审核状态
				if(data[0].sex == '男'){
					 var index2 = layer.confirm('你确认为该订单生成领料订单？', {
						  btn: ['确认', '取消'] //可以无限个按钮
						  ,btn2: function(index, layero){
						    layer.close(index2);
						  }
						}, function(layero){
							layer.close(index2);
							layer.msg('领料订单生成成功');
							
						});
				}else{
					layer.msg('该生产订单未审核');
				}
				
			}else if(data.length >1){
				layer.msg('一次只能为一个订单生产领料单');
			}else {
				layer.msg('请选择要生成领料单的生产订单');
			}
      break;
      case 'isAll':
    	  if(data.length == 1){
				//判断日计划审核状态
				if(data[0].sex == '男'){
					 var index2 = layer.confirm('确认开始生产该订单？', {
						  btn: ['确认', '取消'] //可以无限个按钮
						  ,btn2: function(index, layero){
						    layer.close(index2);
						  }
						}, function(layero){
							layer.close(index2);
							layer.msg('该订单已开始生产');
							
						});
				}else{
					layer.msg('该订单未审核或未领料');
				}
				
			}else if(data.length >1){
				layer.msg('只能生产一个订单');
			}else {
				layer.msg('请选择要开始生产的订单');
			}
      break;
    };
  });
});
</script>


<!-- 审核人和审核时间 -->
<div style="display:none;" id="nameAndTimeDiv2" >

<form class="layui-form" lay-filter="formAuthority2" id="formIdOne2">	  

<div class="layui-inline" style="padding-left:0px;margin-top:20px;">
	<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">审核日期</label>
	<div class="layui-input-inline">
		<input type="text" class="layui-input" id="test5" placeholder="yyyy-MM-dd">
	</div>
</div>
<div style="padding-left:0px;margin-top:15px;">
<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">审核人员</label>
	<div class="layui-input-inline">
		<select name="city" lay-verify="" lay-search="">
  			<option value="">制定人</option>
  			<option value="010">张三</option>
  			<option value="021">李四</option>
 			<option value="0571">王五</option>
		</select>  
	</div>
<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">备注信息</label>
				<div class="layui-input-inline" style="margin-left:-5px;">
      				<textarea name="des" required lay-verify="required" cols="35px" rows="4px" placeholder="请输入计划描述" class="layui-textarea"></textarea>
    			</div>
			</div>	
</div>
</form>
 </div>	
 
</body>
</html>