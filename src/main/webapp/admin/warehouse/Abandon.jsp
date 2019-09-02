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

	<div id="v3" style="display: none;">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">药物名称</label>
					<div class="layui-input-inline"">
						<input type=" tel" name="phone" lay-verify="required|phone"
							autocomplete="off" class="layui-input" disabled="disabled"
							value="">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">药物编号</label>
					<div class="layui-input-inline">
						<input type="text" name="email" lay-verify="email"
							autocomplete="off" class="layui-input" disabled="disabled"
							value="">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">药物类型</label>
					<div class="layui-input-inline">
						<input type="text" name="email" lay-verify="email"
							autocomplete="off" class="layui-input" disabled="disabled"
							value="">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">药物数量</label>
					<div class="layui-input-inline">
						<input type="tel" name="phone" lay-verify="required|phone"
							autocomplete="off" class="layui-input" disabled="disabled"
							value="">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">药物单价</label>
					<div class="layui-input-inline">
						<input type="tel" name="phone" lay-verify="required|phone"
							autocomplete="off" class="layui-input" disabled="disabled"
							value="">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">入库部门</label>
					<div class="layui-input-inline">
						<input type="text" name="email" lay-verify="email"
							autocomplete="off" class="layui-input" disabled="disabled"
							value="">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">入库时间</label>
					<div class="layui-input-inline">
						<input type="text" name="number" lay-verify="required|number"
							autocomplete="off" class="layui-input" disabled="disabled"
							value="">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">入库时间</label>
					<div class="layui-input-inline">
						<input type="text" name="number" lay-verify="required|number"
							autocomplete="off" class="layui-input" disabled="disabled"
							value="">
					</div>
				</div>
			</div>
		</form>
	</div>



	<script type="text/html" id="toolbarDemo">
			<div class="layui-form-item">
        		<div class="layui-input-inline">
					<select name="city" layui-verify="">
					 <option value="">请选择一个仓库</option>
						<option value="021"> 废弃1 </option>
						<option value="0571"> 废弃2 </option>
					</select>  
				</div>
				<div class="layui-inline">
					<div class="layui-input-inline">
						  <a href="http://www.layui.com" class="layui-btn layui-btn-sm layui-btn-normal" style="font-size:13px;">搜索</a>
					</div>
				</div>

				<div class="layui-inline">
					<div class="layui-input-inline">
						<input type="text" name="title" required lay-verify="required" placeholder="请输入订单编号" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<div class="layui-input-inline">
						  <a href="http://www.layui.com" class="layui-btn layui-btn-sm layui-btn-normal" style="font-size:13px;">搜索</a>
					</div>
				</div>
			</div>
</script>

	<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="edit">详情</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>



	<script>
		layui.use('table', function() {
			var table = layui.table;

			table.render({
				elem : '#test',
				url : '../json/FinishedGoodsSheet.json',
				toolbar : '#toolbarDemo',
				title : '用户数据表',
				cols : [ [ {
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'Id',
					title : 'ID',
					fixed : 'left',
					unresize : true
				}, {
					field : 'Name',
					title : '入库编号'
				}, {
					field : 'Serial',
					title : '药物名称 '
				}, {
					field : 'Theme',
					title : '药物类型'
				}, {
					field : 'Quantity',
					title : '药物数量'
				}, {
					field : 'Department',
					title : '入库仓库'
				}, {
					field : 'Time',
					title : '入库时间'
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
					layer.alert(JSON.stringify(data));
					break;
				}
				;
			});

			//监听行工具事件
			table.on('tool(test)', function(obj) {
				var data = obj.data;
				//console.log(obj)
				if (obj.event === 'del') {
					layer.confirm('真的删除行么', function(index) {
						obj.del();
						layer.close(index);
					});
				} else if (obj.event === 'edit') {
					layer.open({
						type : 1,
						content : $('#v3')
					});
				}
			});
		});
	</script>

</body>
</html>

