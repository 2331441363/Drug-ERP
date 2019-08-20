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
<body>    
		<table class="layui-hide" id="demo" lay-filter="test"></table>
		<div style="display: none" id="divTable">
			<table class="layui-hide" id="detailsTable" lay-filter="test"></table>
		</div>

				<script type="text/html" id="toolbarDemo">
  					<div class="layui-btn-container" style="margin-top:10px;padding-left:20px;">
    					<button class="layui-btn layui-btn-sm" lay-event="addWarehouse">新增药品</button>
    					<button class="layui-btn layui-btn-sm" lay-event="updateDetails">新增配方</button>
   					 	<button class="layui-btn layui-btn-sm" lay-event="removeWarehouse">审核药品</button>
						<button class="layui-btn layui-btn-sm" lay-event="capacityWarning">审核配方</button>
  					</div>
	
				</script>
				
				<script type="text/html" id="toolbarDemo2">

	<label width="120px" style="margin:0 5px 0 0px;">请输入原料名</label>
      <div class="layui-input-inline">
        <input type="text" name="username" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input">
      </div>
	
	<label width="120px" style="margin:0 5px 0 20px;">原料克重</label>
	<div class="layui-input-inline">
		 <input type="text" name="username" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input">
	</div>
	<button type="button" class="layui-btn layui-btn-normal">添加</button>
  </div>
	
</script>

		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="manageMe">管理药品</a>
			<a class="layui-btn layui-btn-xs" lay-event="manageAe">管理配方</a>
		</script>


		<script type="text/html" id="barDemo2">
			<a class="layui-btn layui-btn-xs" lay-event="manageMe">删除</a>
		</script>
		<script>
			layui.use(['table', 'laydate', 'form'], function() {
				var table = layui.table; //表格
				var laydate = layui.laydate;
				var form = layui.form;
				//执行一个 table 实例
				table.render({
					elem: '#demo',
					url: 'demo1.json', //数据接口
					title: '药品表',
					page: true, //开启分页
					toolbar: '#toolbarDemo', //开启工具栏
					totalRow: true, //开启合计行
					cols: [
						
						[ //表头
								{
								type: 'checkbox',
								fixed: 'left'
							}, {
								field: 'id',
								title: '药品编号',
								sort: true,
							}, {
								field: 'username',
								title: '药品名称',
							}, {
								field: 'experience',
								title: '药品审核状态',
								align: 'center',
							}, {
								field: 'sex',
								title: '有无配方',
								align: 'center',
							}, {
								field: 'sex',
								title: '配方审核状态',
								align: 'center',
							}, {
								field: 'sex',
								title: '制定人',
								align: 'center',
							}, {
								field: 'sex',
								title: '药品制定时间',
								align: 'center',
							}, {
								field: 'sex',
								title: '操作',
								align: 'center',
								toolbar: '#barDemo'
							}
						]
					]
				});

				var operator = '<option value="">请选择或者(输入)入库仓库</option>';
				$.ajax({
					url: 'json/qualityInspector.json',
					//pe: "post",
					dataType: "json",
					async: false, //这得注意是同步
					success: function(result) {
						console.log(result)
						for (var x in result) {
							operator += '<option value = "' + result[x].id + '">' + result[x].name + '</option>'
						}
						$("#warehouseOperator").html(operator);
					}
				});


				var operator = '<option value="">请选择或者(输入)入库仓库</option>';
				$.ajax({
					url: 'demo1.json',
					//pe: "post",
					dataType: "json",
					async: false, //这得注意是同步
					success: function(result) {
						console.log(result)
						for (var x in result) {
							operator += '<option value = "' + result[x].id + '">' + result[x].name + '</option>'
						}
						$("#warehouseOperator1").html(operator);
					}
				});
				form.render('select'); //需要渲染一下


				laydate.render({
					elem: '#test1', //指定元素
				});
				laydate.render({
					elem: '#test2', //指定元素
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
								content: $("#addDetails")
							});
							break;
						case 'updateDetails':	//新增配方
						if(data.length == 1){
							table.render({
								elem: '#detailsTable',
								url: 'demo1.json', //数据接口
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
						}else if(data.length > 1){
							layer.msg('只能同时选择一行数据');
						}else{
							layer.msg('请选择一行');
						}
						break;
						case "removeWarehouse":
							//判断是否选择一行以上的
							if (data.length != 0) {
								layer.confirm('确认删除？', function(index) {
									var id = new Array(); //声明数组
									for (var i in data) {
										id[i] = data[i].fpId; //得到复选框的值
										console.log(id[i])
									}
									/* $.ajax({
										url: "controller路径",
										type: "POST",
										traditional: true, //传数组一定要加的
										data: {
											"id": id
										},
										dataType: "json",
										success: function(result) {
									
										}
									}); */
								});
							} else {
								layer.msg("请选择一行以上的选项");
							}
							break;
						case "capacityWarning":
							alert("刷新警报")
							break;
							//监听头部工具栏
							case 'add':
								layer.open({
									title: '添加原材料信息',
									type: 1, //Page层类型
									area: ['450px', '390px'], //宽高
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
									content: $("#warehousingDescription")
								});
								break;
							case 'update':
								if (data.length === 0) {
									layer.msg('请选择一行');
								} else if (data.length > 1) {
									layer.msg('只能同时编辑一个');
								} else {
									layer.open({
										title: '修改原材料信息',
										type: 1, //Page层类型
										area: ['450px', '520px'], //宽高
										closeBtn: 0,
										btn: ['确定', '关闭'], //可以无限个按钮
										yes: function(index, layero) {
											layer.close(index);
											//执行清空
											$("#warehouseOperator").empty();
											$("#storageWarehouse").empty();
											form.render("select");
											if(index > 0){
												//确认修改
												layer.msg('修改成功');
											}
										},
										content: $("#warehousingDescription")
									});
									layer.alert('编辑 [id]：' + checkStatus.data[0].id);
								}
								break;
							case 'delete':
								if (data.length === 0) {
									layer.msg('请选择一行');
								} else {
									layer.confirm('确认删除？', function(index) {
										var id = new Array(); //声明数组
										for (var i in data) {
											id[i] = data[i].fpId; //得到复选框的值
											console.log(id[i])
										}
										/* $.ajax({
											url: "controller路径",
											type: "POST",
											traditional: true, //传数组一定要加的
											data: {
												"id": id
											},
											dataType: "json",
											success: function(result) {
										
											}
										}); */
										layer.msg('删除');
									});
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
						
					}else if(layEvent === 'manageAe') {	//管理配方
						table.render({
							elem: '#detailsTable',
							url: 'demo1.json', //数据接口
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
			<div class="layui-input-inline">
				<label class="layui-form-label layui-bg-orange">药品名称</label>
				<div class="layui-input-inline">
      				<input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline">
				<label for="" class="layui-form-label layui-bg-orange">药品规格</label>
				<div class="layui-input-inline">
      				<input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline">
				<label for="" class="layui-form-label layui-bg-orange">药品价格</label>
				<div class="layui-input-inline">
      				<input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline">
				<label for="" class="layui-form-label layui-bg-orange">药品质保期</label>
				<div class="layui-input-inline">
      				<input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    			</div>
			</div>
			<div class="layui-input-inline">
				<label for="" class="layui-form-label layui-bg-orange">制定人</label>
				<div class="layui-input-inline">
					<select name="modules" lay-verify="required" lay-search="">
          				<option value="">请选择</option>
         			 	<option value="1">张三</option>
          				<option value="2">王五</option>
        			</select>
				</div>
			</div>
			<div class="layui-input-inline">
				<label for="" class="layui-form-label layui-bg-orange">制定时间</label>
				<div class="layui-input-inline">
					<input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
				</div>
			</div>
		</div>

</body>
</html>