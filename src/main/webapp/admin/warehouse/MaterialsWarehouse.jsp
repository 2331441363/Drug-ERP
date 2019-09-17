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
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
	<table class="layui-hide" id="test" lay-filter="test"></table>

	<script type="text/javascript">
		$(function() {
			show();
		})

		function show() {
			$
					.ajax({
						url : '../../selectMaterialsWarehouseype.do',
						dataType : 'json',
						success : function(back) {
							var sum = "<div class='layui-input-inline'> <select name='warehouseName' id='warehouseName' layui-verify=''><option value=''>请选择一个仓库</option> ";
							var jake = back.data;
							for (var i = 0; i < jake.length; i++) {
								sum += "<option value="+jake[i].warehouseName+">"
										+ jake[i].warehouseName + "</option>";
							}
							sum += "</select></div>";
							$('#divs').append(sum);
						}
					})
		};
	</script>

	<script type="text/html" id="toolbarDemo">
			<div class="layui-form-item" id="divs" name="divs">
				<div class="layui-inline">
					<div class="layui-input-inline">
						<input type="text" id="MaterialsWarehouseName" name="MaterialsWarehouseName" required lay-verify="required" placeholder="请输入药物名称" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<div class="layui-input-inline">
						 <button class='layui-btn layui-btn-sm layui-btn-normal'
				            lay-event='Cxknmsl' style='font-size: 13px;'>搜索</button>
					</div>
				</div>
			</div>
</script>

	<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="edit">详情</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>
		layui.use('table', function() {
			var table = layui.table;

			table.render({
				elem : '#test',
				url : '../../selectMaterialsWarehouse.do',
				toolbar : '#toolbarDemo',
				title : '用户数据表',
				cols : [ [ {
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'MaterialsWarehouseId',
					title : 'ID',
					width : 80,
					fixed : 'left',
				}, {
					field : 'MaterialsWarehouseName',
					title : '药物名称'
				}, {
					field : 'MaterialsWarehouseQuantity',
					title : '药物数量'
				}, {
					field : 'MaterialsWarehouseType',
					title : '药物类型'
				}, {
					field : 'warehouseName',
					title : '入库仓库'
				} ] ],
				page : true
			});

			//头工具栏事件
			table.on('toolbar(test)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id);
				switch (obj.event) {
				case 'Cxknmsl':
					var warehouseName = $("#warehouseName").val();
					var materialsWarehouseName = $("#MaterialsWarehouseName")
							.val();
					show();
					table.reload('test', {
						where : {
							warehouseName : warehouseName,
							materialsWarehouseName : materialsWarehouseName
						}
					});
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