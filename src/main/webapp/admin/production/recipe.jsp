<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>成品及配方管理</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>    
		<table class="layui-hide" id="demo" lay-filter="test"></table>
		<div style="display: none" id="divTable">
			<table class="layui-hide" id="detailsTable" lay-filter="test"></table>
		</div>

				<script type="text/html" id="toolbarDemo">
  					<div class="layui-btn-container" style="margin-top:10px;padding-left:20px;">
    					<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="addWarehouse"><i class="layui-icon layui-icon-add-1"></i>新增药品</button>
    					<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="updateDetails"><i class="layui-icon layui-icon-add-1"></i>新增配方</button>
   					 	<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="removeWarehouse"><i class="layui-icon layui-icon-friends"></i>审核药品</button>
						<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="capacityWarning"><i class="layui-icon layui-icon-friends"></i>审核配方</button>
  					</div>
	
				</script>
				
				<script type="text/html" id="toolbarDemo2">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px;">
  <legend>添加原料配方</legend>
</fieldset>
	<label width="120px" style="margin:0 5px 0 0px;font-size:13px;">请输入原料名</label>
      <div class="layui-input-inline">
        <input type="text" name="username" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input">
      </div>
	
	<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">原料克重</label>
	<div class="layui-input-inline">
		 <input type="text" name="username" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input">
	</div>
	<button type="button" class="layui-btn layui-btn-normal">添加</button>
  </div>
	
</script>

		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="manageMe">管理药品</a>
			<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="manageAe">管理配方</a>
		</script>


		<script type="text/html" id="barDemo2">
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="">删除</a>
		</script>
		<script>
			layui.use(['table', 'laydate', 'form'], function() {
				var table = layui.table; //表格
				var laydate = layui.laydate;
				var form = layui.form;
				laydate.render({
					elem: '#test1', //指定元素
				});
				laydate.render({
					elem: '#test5', //指定元素
				});
				laydate.render({
					elem: '#test66', //指定元素
				});
				//执行一个 table 实例
				table.render({
					elem: '#demo',
					url: '../json/demo1.json', //数据接口
					title: '药品表',
					toolbar: '#toolbarDemo', //开启工具栏
					totalRow: false, //开启合计行
					cols: [
						
						[ //表头
								{
								type: 'checkbox',
								fixed: 'left',
							}, {
								field: 'id',
								title: '药品编号',
								unresize : true
							}, {
								field: 'username',
								title: '药品名称',
								unresize : true
							}, {
								field: 'experience',
								title: '药品审核状态',
								unresize : true
							}, {
								field: 'sex',
								title: '有无配方',
								unresize : true
							}, {
								field: 'sex',
								title: '配方审核状态',
								unresize : true
							}, {
								field: 'sex',
								title: '制定人',
								unresize : true
							}, {
								field: 'sex',
								title: '药品制定时间',
								unresize : true
							}, {
								title: '操作',
								width : 178,
								align: 'center',
								toolbar: '#barDemo',
								unresize : true
							}
						]
					],page: true, //开启分页
				});

				//监听弹出层头部工具栏
				table.on('toolbar(test)', function(obj) {
					var checkStatus = table.checkStatus(obj.config.id);
					//获得选择的对象
					var data = checkStatus.data;
					switch (obj.event) {
						case 'addWarehouse':	//新增药品
							
							layer.open({
								title: '新增药品',
								type: 1, //Page层类型
								//area: ['500px', '520px'], //宽高
								closeBtn: 0,
								btn: ['确定', '关闭'], //可以无限个按钮
								yes: function(index, layero) {
									layer.close(index);
									//执行清空
									$("#warehouseOperator").empty();
									$("#storageWarehouse").empty();
									form.render("select");
									if(index > 0){
										//添加
										layer.msg('添加成功');
									}
								},
								content: $("#addDetails"),
								success: function(layero, index){
									  form.render();
									  }
							});
							break;
						case 'updateDetails':	//新增配方
						if(data.length == 1){
							table.render({
								elem: '#detailsTable',
								url: '../json/demo1.json', //数据接口
								title: '用户表',
								totalRow: false, //开启合计行
								toolbar :"#toolbarDemo2",
								cols: [
									[ //表头
										{
											type: 'checkbox',
											fixed: 'left'
										}, {
											field: 'id',
											title: '原料编号',
											sort: true,
										}, {
											field: 'username',
											title: '原料名称',
											sort: true
										}, {
											field: 'experience',
											title: '原料量',
											sort: true,
										}, {
											field: 'sex',
											title: '仓库剩余量',
											sort: true
										}, {
											title: '操作',
											align: 'center',
											toolbar: '#barDemo2'
										}
										]
									]
								});
								var index = layer.open({
									title: '新增原料配方',
									type: 1, //Page层类型
									area: ['880px', '550px'],
									closeBtn: 0,
									btn: ['确定', '关闭'], //可以无限个按钮
									content: $("#divTable"),
									yes: function(index, layero){
										var index2 = layer.confirm('你确认制定该配方？', {
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
														  layer.msg('配方制定成功');
														}
													  ,btn2: function(index, layero){
															  layer.close(index88);
														}
												});
												
											});
									}
									,btn2: function(index, layero){
										//按钮【按钮二】的回调
										  layer.close(index);
										 //return false 开启该代码可禁止点击该按钮关闭
									}
								});
							}else if(data.length > 1){
								layer.msg('最多只能选择一件药品');
							}else{
								layer.msg('请选择要制定配方的药品');
							}
							break;
						case "removeWarehouse":	//审核药品
							if(data.length == 1){
								//判断月计划审核状态
								if(data[0].sex == '男'){
									var index2 = layer.confirm('你确认审核该药品？', {
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
													  layer.msg('审核成功');
													}
												  ,btn2: function(index, layero){
														  layer.close(index88);
													}
											});
											
										});
								}else{
									layer.msg('该药品已审核');
								}
								
							}else if(data.length >1){
								layer.msg('最多只能审核一件商品');
							}else {
								layer.msg('请选择一件商品');
							}
							break;
						case "capacityWarning":	//审核配方
							if(data.length == 1){
								//判断月计划审核状态
								if(data[0].sex == '男'){
									var index2 = layer.confirm('你确认审核该配方？', {
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
													  layer.msg('审核成功');
													}
												  ,btn2: function(index, layero){
														  layer.close(index88);
													}
											});
											
										});
								}else{
									layer.msg('该配方已审核');
								}
								
							}else if(data.length >1){
								layer.msg('一次只能为一件药品审核配方');
							}else {
								layer.msg('请选择一件要审核配方的商品');
							}
							break;
						
					};
				});

				//监听查看详情事件
				table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data, //获得当前行数据
						layEvent = obj.event; //获得 lay-event 对应的值
						//管理药品
					if (layEvent === 'manageMe') {
						form.val("formAuthority", {
					    	  "id": "21321321" // "name": "value"
					    	  ,"name": "销售部门"
					    	  ,"specification": "克"
					    	  ,"price": "99"
					    	  ,"time": "2018-12-11"
					    	  ,"staffName": "2"
					    	  ,"time2": "2018-12-11"
					    	});
						
						var index = layer.open({
							title : '管理药品',//标题
							type : 1,//样式
							shade: 0,
							btn: ['确认', '取消'],
							yes: function(index, layero){
								layer.close(index);
								layer.msg('修改成功');
							}
							,btn2: function(index, layero){
								  layer.close(index);
							},
							content :$("#addDetails"),
						});
						
					}else if(layEvent === 'manageAe') {	//管理配方
						table.render({
							elem: '#detailsTable',
							url: '../json/demo1.json', //数据接口
							title: '用户表',
							totalRow: true, //开启合计行
							toolbar :"#toolbarDemo2",
							cols: [
								[ //表头
									{
										type: 'checkbox',
										fixed: 'left'
									}, {
										field: 'id',
										title: '原料编号',
										sort: true,
									}, {
										field: 'username',
										title: '原料名称',
										sort: true
									}, {
										field: 'experience',
										title: '原料量',
										sort: true,
									}, {
										field: 'sex',
										title: '仓库剩余量',
										sort: true
									}, {
										title: '操作',
										align: 'center',
										toolbar: '#barDemo2'
									}
								]
							]
						});
						layer.open({
							title: '原料配方',
							type: 1, //Page层类型
							area: ['1000px', '520px'], //宽高
							closeBtn: 0,
							btn: ['确定', '关闭'], //可以无限个按钮
							content: $("#divTable")
						});
					}
				});
			});
		</script>
		
		<div class="site-text" style="margin: 5%; display: none" id="addDetails" target="test123">
		<form class="layui-form" lay-filter="formAuthority" id="formIdOne">
			<div class="layui-input-inline">
				<label style="margin:0 10px 0 20px;font-size:13px;">药品编号</label>
				<div class="layui-input-inline">
      				<input type="text" name="id" lay-verify="required"  disabled placeholder="自动生成" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">药品名称</label>
				<div class="layui-input-inline">
      				<input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">药品规格</label>
				<div class="layui-input-inline">
      				<input type="text" name="specification" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">药品价格</label>
				<div class="layui-input-inline">
      				<input type="text" name="price" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">质保日期</label>
				<div class="layui-input-inline">
      				<input type="text" name="time" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">制定员工</label>
				<div class="layui-input-inline">
					<select name="staffName" lay-verify="required" lay-search="">
          				<option value="">请选择</option>
         			 	<option value="1">张三</option>
          				<option value="2">王五</option>
        			</select>
				</div>
			</div>
			<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">制定时间</label>
				<div class="layui-input-inline">
					<input type="text" class="layui-input" id="test1" name="time2" placeholder="yyyy-MM-dd">
				</div>
			</div>
			</form>
		</div>


	
	<!-- 制定人和制定时间 -->
<div style="display:none;" id="nameAndTimeDiv" >

<form class="layui-form" lay-filter="formAuthority2" id="formIdOne2">	  
<div class="layui-inline" style="padding-left:0px;margin-top:20px;">
	<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">制定日期</label>
	<div class="layui-input-inline">
		<input type="text" class="layui-input" id="test66" placeholder="yyyy-MM-dd">
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

<form class="layui-form" lay-filter="formAuthority3" id="formIdOne3">	  

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