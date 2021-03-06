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
	<table class="layui-hide" id="test" lay-filter="test"></table>
	<div style="display: none;" id="v1">
		<form class="layui-form" action="../../insertWarehouse.do" id="form1">
			<div class="layui-form-item">

				<div class="layui-inline">
					<label class="layui-form-label">审核人</label>
					<div class="layui-input-inline">
						<select name="empId" lay-verify="">
							<option value="">审核人</option>
							<option value="" selected></option>
							<option value="101">张三</option>
							<option value="102">李四</option>
						</select>
					</div>
				</div>

				<div class="layui-inline">
					<label class="layui-form-label">仓库名称</label>
					<div class="layui-input-inline"">
						<input type="text" name="WarehouseName" id="WarehouseName"
							lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-inline">
					<label class="layui-form-label">仓库类型</label>
					<div class="layui-input-inline">
						<select name="WarehouseType" lay-verify="" id="WarehouseType">
							<option value="">仓库选择</option>
							<option value="成品仓库">成品仓库</option>
							<option value="原材料仓库">原材料仓库</option>
							<option value="废弃仓库">废弃仓库</option>
						</select>
					</div>
				</div>

				<div class="layui-inline">
					<label class="layui-form-label">创建时间</label>
					<div class="layui-input-inline">
						<input type="text" name="WarehouseTime" id="WarehouseTime"
							lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off"
							class="layui-input">
					</div>
				</div>

			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>


	<div style="display: none;" id="gg">
		<form class="layui-form" action="../../updatewarehouse.do" id="form2">
			<input type="text" name="warehouseId" id="warehouseId"
				style="display: none;" autocomplete="off" class="layui-input">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">仓库名称</label>
					<div class="layui-input-inline"">
						<input type="text" name="warehouseName" id="warehouseName"
							lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>



	<script type="text/html" id="toolbarDemo">
			<div class="layui-form-item">
				<div class="layui-input-inline">
					<select name="WarehouseType" id="WarehouseType" layui-verify="" style="font-size:13px;">
						<option value="仓库类型"> 全部仓库 </option>
						<option value="原材料仓库"> 原材料仓库 </option>
						<option value="成品仓库"> 成品仓库 </option>
						<option value="废弃仓库"> 废弃仓库 </option>
					</select>  
				</div>
				<div class="layui-inline">
					<div class="layui-input-inline">
                          <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="Cxknmsl" style="font-size:13px;"> 搜索</button>
					</div>
				</div>
				<div class="layui-inline">
					<div class="layui-input-inline">
						   <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckData" style="font-size:13px;"> 创建仓库</button>
					</div>
				</div>
			</div>
</script>

	<script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">修改</a>
</script>

	<script>
		layui.use('table', function() {
			var table = layui.table;

			table.render({
				elem : '#test',
				url : '../../getWarehouse.do',
				toolbar : '#toolbarDemo',
				title : '用户数据表',
				cols : [ [ {
					type : 'radio',
					fixed : 'left'
				}, {
					field : 'warehouseId',
					title : 'ID',
					fixed : 'left',
					unresize : true
				}, {
					field : 'warehouseSerial',
					title : '仓库编号'
				}, {
					field : 'warehouseName',
					title : '仓库名称'
				}, {
					field : 'warehouseType',
					title : '仓库类型'
				}, {
					field : 'warehouseTime',
					title : '仓库生成时间'
				}, {
					fixed : 'right',
					title : '操作',
					toolbar : '#barDemo'
				} ] ],
				page : true
			});

			//头工具栏事件
			table.on('toolbar(test)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id);
				switch (obj.event) {
				case 'getCheckData':
					var data = checkStatus.data;
					layer.open({
						type : 1,
						content : $('#v1')
					});
				case 'Cxknmsl':
					var WarehouseType = $("#WarehouseType").val();
					table.reload('test', {
						where : {
							WarehouseType : WarehouseType
						}
					});
					break;
				}

			});

			//监听行工具事件
			table.on('tool(test)', function(obj) {
				var data = obj.data;
				if (obj.event === 'del') {
					var warehouseId = obj.data.warehouseId;
					$("#warehouseId").val(warehouseId);
					layer.open({
						type : 1,
						content : $('#gg')
					});
				}
			});
		});
	</script>

	<script>
		layui
				.use(
						[ 'form', 'layedit', 'laydate' ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

							//日期
							laydate.render({
								elem : '#WarehouseTime'
							});
							laydate.render({
								elem : '#date1'
							});

							//创建一个编辑器
							var editIndex = layedit.build('LAY_demo_editor');

							//自定义验证规则
							form.verify({
								title : function(value) {
									if (value.length < 5) {
										return '标题至少得5个字符啊';
									}
								},
								pass : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ],
								content : function(value) {
									layedit.sync(editIndex);
								}
							});

							//监听指定开关
							form.on('switch(switchTest)', function(data) {
								layer.msg('开关checked：'
										+ (this.checked ? 'true' : 'false'), {
									offset : '6px'
								});
								layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
										data.othis)
							});

						});
	</script>

</body>
</html>