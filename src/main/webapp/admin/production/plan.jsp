<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>月生产计划</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
  

<style>
/*table外边距*/
.layui-table, .layui-table-view {
    margin: 0px 0;
}
/*弹出层table外边距*/
  .layui-table, .layui-table-view {
    margin: 0px;
    padding:0px;
    margin-bottom:0px;
}
</style>
</head>
<body>    
	<table class="layui-hide" id="test" lay-filter="test"></table>
	<div id="table2Div">
		<table class="layui-hide" style="display:none" id="test2" lay-data="{id: 'idTest'}" lay-filter="test2"></table>
	</div>
	
	
	<script type="text/html" id="toolbarDemo">
  <div class="layui-inline" style="padding-left:20px;">
      <label width="120px" style="margin:0 5px 0 0px;font-size:13px;">请选择月份</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" id="test3" placeholder="yyyy-MM">
      </div>
	
	<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">请选择状态</label>
	<div class="layui-input-inline">
		<select name="city" lay-verify="">
  			<option value="">审核状态</option>
  			<option value="010">未审核</option>
  			<option value="021">审核未通过</option>
 			<option value="0571">审核通过</option>
		</select>  
	</div>
	<button type="button" class="layui-btn layui-btn-normal">查询</button>

  </div>

  <div class="layui-btn-container" style="margin-top:20px;padding-left:20px;">
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckData"><i class="layui-icon layui-icon-add-1"></i>制定月计划 </button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckLength"><i class="layui-icon layui-icon-add-1"></i>制定日计划</button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="isAll"><i class="layui-icon layui-icon-friends"></i>审核月计划</button>
  </div>
	
</script>

	<script type="text/html" id="toolbarDemo2">


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px;">
  <legend>添加采购商品</legend>
</fieldset>
	<div class="layui-inline" style="padding-left:0px;">
	<label width="120px" style="margin:0 5px 0 0px;font-size:13px;">药品选择</label>
      <div class="layui-input-inline">
        <select name="modules" lay-verify="required" lay-search="">
          <option value="">请选择</option>
          <option value="1">阿莫西林</option>
          <option value="2">板蓝根</option>
          <option value="3">肤痒颗粒</option>
          <option value="4">维C</option>
          <option value="5">脑白金</option>
          <option value="6">upload</opt
          <option value="7">laydate</option>
          <option value="8">laypage</option>
          <option value="9">flow</option>
          <option value="10">util</option>
          <option value="11">code</option>
          <option value="12">tree</option>
          <option value="13">layedit</option>
          <option value="14">nav</option>
          <option value="15">tab</option>
          <option value="16">table</option>
          <option value="17">select</option>
          <option value="18">checkbox</option>
          <option value="19">switch</option>
          <option value="20">radio</option>
        </select>
      </div>
	
	<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">输入生产数量</label>
	<div class="layui-input-inline">
		 <input type="text" name="username" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input">
	</div>
	<button type="button" class="layui-btn layui-btn-normal">添加</button>
  </div>
	
</script>







	<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="barDemo2">
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="manageMe">删除</a>
		</script>
	<script>
		layui.use([ 'table', 'laydate', 'element','form','layer'], function() {
			var layer = layui.layer;
			var element = layui.element;
			var table = layui.table;
			var laydate = layui.laydate;
			var form = layui.form;
			
			table.render({
				elem : '#test',
				url : '../json/demo1.json',
				toolbar : '#toolbarDemo',
				title : '用户数据表',
				cols : [ [ {
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'id',
					title : '月计划编号',
					unresize : true
				}, {
					field : 'username',
					title : '主题',
					unresize : true
				}, {
					field : 'email',
					title : '制定日期',
					unresize : true
				}, {
					field : 'experience',
					title : '负责人',
					unresize : true
				}, {
					field : 'sex',
					title : '审核状态',
					unresize : true
				}, {
					fixed : 'right',
					width : 178,
					align : 'center',
					toolbar : '#barDemo',
					unresize : true
				} ] ],
				page : true
			});

			//年月选择器
			laydate.render({
				elem : '#test3',
				type : 'month'
			});
			//常规用法
			laydate.render({
				elem : '#test5'
			});
			//常规用法
			laydate.render({
				elem : '#test1'
			});
			
			//工具栏事件
			table.on('toolbar(test)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id);
				switch (obj.event) {
				case 'getCheckData':
					
					var index = layer.open({
						title : '制定计划详情',//标题
						type : 1,//样式
						shade: 0,
						offset: ['5%', '15%'],//设置位移
						btn: ['确认', '取消'],
						yes: function(index, layero){
							
							var index2 = layer.confirm('你确认制定该生产计划？', {
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
										  content: $('#nameAndTimeDiv'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
										  success: function(layero, index){
											  form.render();
											  },
										  btn: ['确认', '取消'],
										  yes: function(layero){
											  layer.close(index);
											  layer.close(index88);
											  layer.msg('计划制定成功');
											}
										  ,btn2: function(index, layero){
												  layer.close(index88);
											}
									});
									
								});
						}
						,btn2: function(index, layero){
							  layer.close(index);
						},
						area: ['880px', '550px'],
						content :$("#table2Div"),
						success : function(layero) {
							var mask = $(".layui-layer-shade");
							mask.appendTo(layero.parent());
						},
						end : function() {
							$('[lay-id="test2"]').css("display", "none");
						}
					});
					
					table.render({
						elem : '#test2',
						url : '../json/demo1.json',
						toolbar : '#toolbarDemo2',
						totalRow : true,
						cols : [ [  {
							type : 'numbers'
						}, {
							field : 'id',
							title : '药品编号',
							unresize : true
						}, {
							field : 'username',
							title : '药品名称',
							edit: 'text',
							unresize : true
						}, {
							field : 'experience',
							title : '生产数量',
							totalRow : true,
							edit: 'text',
							unresize : true
						}, {
						
							align : 'center',
							toolbar : '#barDemo2',
							unresize : true
						}
						]]
					});
					
					
					
					break;
				case 'getCheckLength':
					var data = checkStatus.data;
					if(data.length == 1){
						//判断月计划审核状态
						if(data[0].sex == '男'){
							var index2 = layer.confirm('你确认制定该生产计划？', {
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
										  content: $('#nameAndTimeDiv'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
										  success: function(layero, index){
											  form.render();
											  },
										  btn: ['确认', '取消'],
										  yes: function(layero){
											  layer.close(index);
											  layer.close(index88);
											  layer.msg('计划制定成功');
											}
										  ,btn2: function(index, layero){
												  layer.close(index88);
											}
									});
									
								});
						}else{
							layer.msg('该月计划未审核');
						}
						
					}else if(data.length >1){
						layer.msg('最多只能选择一条月计划');
					}else {
						layer.msg('请选择一条月计划');
					}
					
					break;
				case 'isAll':
					var data = checkStatus.data;
					if(data.length == 1){
						//判断月计划审核状态
						if(data[0].sex == '男'){
							var index2 = layer.confirm('你确认审核该生产计划？', {
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
											  layer.close(index);
											  layer.close(index88);
											  layer.msg('计划审核成功');
											}
										  ,btn2: function(index, layero){
												  layer.close(index88);
											}
									});
									
								});
						}else{
							layer.msg('该月计划已审核');
						}
						
					}else if(data.length >1){
						layer.msg('最多只能审核一条月计划');
					}else {
						layer.msg('请选择一条要审核月计划');
					}
					
					
					break;
					
				}
				;
			});
			
			
			//监听工具条
			  table.on('tool(test)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'detail'){
			    	layer.open({
						title : '计划详情',//标题
						type : 1,//样式
						shade: 0,
						offset: ['5%', '15%'],//设置位移
						area: ['880px','433px'],
						content :$("#table2Div"),
						success : function(layero) {
							var mask = $(".layui-layer-shade");
							mask.appendTo(layero.parent());
							//其中：layero是弹层的DOM对象
						},
						end : function() {
							$('[lay-id="test2"]').css("display", "none");
						}
					});
			    	table.render({
						elem : '#test2',
						url : '../json/demo1.json',
						totalRow : true,
						cols : [ [  {
							type : 'numbers'
						}, {
							field : 'id',
							title : '药品编号',
							unresize : true
						}, {
							field : 'username',
							title : '药品名称',
							unresize : true
						}, {
							field : 'experience',
							title : '生产数量',
							totalRow : true,
							unresize : true
						}
						]]
					});
					
				} else if(obj.event === 'del'){
			      layer.confirm('确认删除该计划吗？', function(index){
			        obj.del();
			        layer.close(index);
			      });
			    } else if(obj.event === 'edit'){
					if(data.sex == '男'){
						layer.alert('当前订单已审核,无法修改', {icon: 2});
					}else if(data.sex == '女'){
						
						var index = layer.open({
							title : '修改计划详情',//标题
							type : 1,//样式
							shade: 0,
							offset: ['5%', '15%'],//设置位移
							btn: ['确认', '取消'],
							yes: function(index, layero){
								layer.confirm('确定修改该计划？', function(index){
									layer.close(index);
									alert("好的已修改");
							    });
							}
							,btn2: function(index, layero){
								  layer.close(index);
							},
							area: ['880px', '550px'],
							content :$("#table2Div"),
							success : function(layero) {
								var mask = $(".layui-layer-shade");
								mask.appendTo(layero.parent());
								//其中：layero是弹层的DOM对象
							},
							end : function() {
								$('[lay-id="test2"]').css("display", "none");
							}
						});
						table.render({
							elem : '#test2',
							url : '../json/demo1.json',
							toolbar : '#toolbarDemo2',
							totalRow : true,
							cols : [ [  {
								type : 'numbers'
							}, {
								field : 'id',
								title : '药品编号',
								unresize : true
							}, {
								field : 'username',
								title : '药品名称',
								edit: 'text',
								unresize : true
							}, {
								field : 'experience',
								title : '生产数量',
								totalRow : true,
								edit: 'text',
								unresize : true
							}, {
							
								align : 'center',
								toolbar : '#barDemo2',
								unresize : true
							}
							]]
						});
						
					}
			    }
			  });
		});
	</script>
	
	<!-- 制定人和制定时间 -->
<div style="display:none;" id="nameAndTimeDiv" >

<form class="layui-form" lay-filter="formAuthority" id="formIdOne">	  
<div class="layui-inline" style="padding-left:0px;margin-top:20px;">
	<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">制定日期</label>
	<div class="layui-input-inline">
		<input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
	</div>
</div>
<div style="padding-left:0px;margin-top:15px;">
<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">制定人员</label>
	<div class="layui-input-inline">
		<select name="city" lay-verify="" lay-search="">
  			<option value="">制定人</option>
  			<option value="010">张三</option>
  			<option value="021">李四</option>
 			<option value="0571">王五</option>
		</select>  
	</div>
<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">计划描述</label>
				<div class="layui-input-inline" style="margin-left:-5px;">
      				<textarea name="des" required lay-verify="required" cols="35px" rows="4px" placeholder="请输入计划描述" class="layui-textarea"></textarea>
    			</div>
			</div>	
</div>
</form>
 </div>	
 
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
