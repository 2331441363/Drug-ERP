<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 整个页面全部指定为这个地址 -->
<meta charset="UTF-8">
<title>收款单查询</title>
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<script src="../layui/layui.js"></script>
<style type="text/css">
body {
	margin: 0 auto;
	width: 100%;
	height: 100%;
}

.demoTable {
	width: 100%;
	height: 50px;
	margin: 0px auto;
	line-height: 50px;
}
label{
	font-size: 13px;
}
.textTd{
	padding-left: 10px;
	padding-top: 20px;
	width: 170px;
	height: 10px;
}
.trs{
	padding-top: 20px;
	text-align: right;
	padding-left: 30px;
}
</style>

</head>
<body>

		    	
		    	<table class="layui-table" lay-data="{url:'../../listReceipt.do', id:'testReload',page: true}" lay-filter="testReload">
		    	  <thead>
		    	    <tr>
		    	    <th lay-data="{type: 'checkbox', fixed: 'left'}">ID</th>
		    	    <th lay-data="{field: 'receiptId', width:150, sort: true}">编号</th>
		    	    <th lay-data="{field: 'empName',edit: 'text'  }">收款人</th>
		    	    <th lay-data="{field: 'receiptTime',edit: 'text' }">收款时间</th>
		    	    <th lay-data=" {field: 'departmentName',edit: 'text'  }">部门</th>
		    	    <th lay-data="{field: 'branchName',edit: 'text'  }">分店名称</th>
		    	    <th lay-data="{field: 'receiptMoney',edit: 'text'  }">收款金额</th>
		    	    <th lay-data="{field: 'receiptStatus',edit: 'text'  }">收款状态</th>
		    	    <th lay-data="{field: 'receiptType',edit: 'text'  }">收款类型</th>
		    	    <th lay-data="{field: 'receiptForm',edit: 'text'  }">收款备注</th>
		    	    <th lay-data="{fixed: 'right',width:178, align:'center', toolbar: '#barDemo'}">操作</th>
		        </tr>
		        </thead>
		      </table>
		  	  

 <script type="text/javascript">
//加载分店名称
$.ajax({
    url:'../../getAllBranchName.do',
    dataType:'json',
    type:'post',
    success:function(data){
 //alert(data);
        $.each(data,function(index,item){
        	//alert("ooooo");
            $('#sbranch').append("<option value='"+item+"'>"+item+"</option>");//往下拉菜单里添加元素
        });
 
        layui.use(['form'], function(){
	       	 var form = layui.form;
	        form.render();//菜单渲染 把内容加载进去
        });
    }
});

</script>

<div class="demoTable" >
	<form class="layui-form" onsubmit="return false;">
		<div class="layui-inline"  style="margin-left:20px;">
			<label >收款时间：</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="test5"
					placeholder="年--月--日 ">
			</div>
		</div>

		<div class="layui-inline"  style="margin-left:20px;">
			<label>分店：</label>
			<div class="layui-input-inline">
				<select name="branchName" id="sbranch" lay-search="">
					<option value="">请选择</option>
				</select>
			</div>
		</div>

		<div class="layui-inline"  style="margin-left:20px;">
			<label >收款类型：</label>
			<div class="layui-input-inline">
				<select name="sReceiptType" id="sReceiptType"  lay-search="required">
					<option value="">请选择</option>
					<option value="总店销售">总店销售</option>
					<option value="采购退货">采购退货</option>
				</select>
			</div>
		</div>
		<div class="layui-inline" >
			<button class="layui-btn layui-btn-sm  layui-btn-normal" data-type="reload" id="seachTable">搜索</button>		
		</div> 
	</form>
</div>


	<script type="text/html" id="toolbarDemo">
	</script>

	<table id="demo" lay-filter="test"></table>
	<script>
	
		layui.use(['table','form','laydate'], function(){
			var table = layui.table, form = layui.form;
			var laydate = layui.laydate;
			var $ = layui.$;
		  
			laydate.render({
			    elem: '#test5'
			    ,type: 'datetime'
			  });
			
			
			//单元格编辑事件
			  table.on('edit(testReload)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
			      //console.log(obj.value); //得到修改后的值
			      //console.log(obj.field); //当前编辑的字段名
			      var data = obj.data; //所在行的所有相关数据  
			      $.ajax({
	 					url:'../../updReceipt.do',
	 					method:'post',
	 					data:'receiptId='+data.receiptId+'&receiptTime='+data.receiptTime+
	 				'&receiptMoney='+data.receiptMoney+'&receiptType='+data.receiptType+'&receiptForm='+data.receiptForm,
	 					dataType:'json',
	 					success:function(back){
	 					}
	 				});
			    });
			
			
		  
		 	//头部搜索框，查询
		 	 var $ = layui.$,active = {
		 			reload: function(){
		 		    	
		 		     var dat =$('#test5').val();
		 		   var sbranch = $('#sbranch').val();
		 		 var spayType = $('#sReceiptType').val();
		 		   
		 		alert(dat);
		 		alert(sbranch);
		 		alert(spayType);
		 		      //执行重载
		 		      table.reload('testReload', {
		 		        page: {
		 		          curr: 1 //重新从第 1 页开始
		 		        }
		 		        ,where: {
		 		        	receiptTime :$('#test5').val(),
		 		        	branchName: $('#sbranch').val(),
		 		        	receiptType:$('#sReceiptType').val()
		 		        	
		 		        }
		 		    }, 'data');
		 		    }
		 		  };
		 		  
		 		  $('.demoTable .layui-btn').on('click', function(){
		 		    var type = $(this).data('type');
		 		    active[type] ? active[type].call(this) : '';
		 		  }); 
		  
		 	   
		//监听操作
		table.on('tool(testReload)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			var tr = obj.tr; //获得当前行 tr 的DOM对象
	
			if (layEvent === 'del') { //查看
				layer.confirm('真的删除行么',function(index) {
					obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
					layer.close(index);
					//向服务端发送删除指令
					var url = "../../delReceipt.do";
					var data$ = {receiptId : data.receiptId};
					$.post(url,data$,function(obj) {
						layer.msg(obj.msg);//提示
						testReload.reload(); //也是刷新父页面的
					},"json");
				});
			} else if (layEvent === 'edit') { //编辑
				var data = obj.data;//行数据
				//iframe层
				layer.open({
					type : 2,
					title : '修改页面',//标题
					shadeClose : true,
					shade : 0.3,//背景阴影
					area : [ '50%', '60%' ],//大小
					content : 'pages/flower/flowerFrom.jsp?id='
							+ data.flowerId, //iframe的url
					end : function() {
						table2.reload();
					}
				});
			}
		});
		 
	});
		
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

</body>
</html>