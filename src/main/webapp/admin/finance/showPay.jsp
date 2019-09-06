<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>付款单查询</title>
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

<script type="text/javascript">
	$("#addPay").on("click",function(){
		alert("sssss");
		//付款时间
		var date =$("#test1").val();
		alert(date);
		//付款人
		var payer =$("#payer").val();
		//部门
		var dept =$("#dept").val();
		//分店
		var branch =$("#branch").val();
		//公司账户
		var comAccount =$("#comAccount").val();
		//付款金额
		var money =$("#money").val();
		//付款类型
		var type =$("#type").val();
		//备注
		var text =$("#text").val();
		
		
		$.ajax({
			url:'insertPay.do',
			type:'post',
			data:'date='+date+'&payer='+payer+'&dept='+dept+
			'&branch='+branch+'&comAccount='+comAccount+'&money='+money
			+'&type='+type+'&text='+text,
			dataType:'json',
			success:function(back){
				
				if (back='ok') {
					//新增付款单成功	
					layer.msg("新增付款单成功");
				}
			}
		});
		
	});
</script>
</head>
<body>
<script src="../layui/layui.js"></script>
<script>
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
		//日期时间选择器
		  laydate.render({
		    elem: '#test5'
		    ,type: 'datetime'
		  });
	});
</script>
	<!-- <iframe src="Pay.html" width="890px" height= "400px" name="topFrame" scrolling="no" frameborder="0" id="topFrame" style="display: none;"></iframe> -->

	<table id="demo" lay-filter="test"></table>
	<script type="text/html" id="toolbarDemo">

	

	<div class="layui-inline" >
<form class="layui-form" action="" >
		<div class="layui-inline" style="margin-left:20px;">
			<label>付款时间：</label>
			<div class="layui-input-inline" style="margin-left:5px;">
				<input type="text" class="layui-input" id="test5"
					placeholder="年--月--日 ">
			</div>
		</div>

		<div class="layui-inline" style="margin-left:20px;">
			<label>分店：</label>
			<div class="layui-input-inline" style="margin-left:5px;">
				<select name="audit"  lay-search="required">
					<option value="1">请选择</option>
					<option value="2">王五</option>
				</select>
			</div>
		</div>

		<div class="layui-inline" style="margin-left:20px;">
			<label>付款类型：</label>
			<div class="layui-input-inline" style="margin-left:5px;">
				<select name="audit" lay-search="required">
					<option value="1">请选择</option>
					<option>采购付款</option>
					<option>分店退货</option>
				</select>
			</div>
		</div>

		<div class="layui-inline" >
			<button class="layui-btn  layui-btn-sm layui-btn-normal" data-type="reload">搜索</button>		
		</div> 
</form>

	<div id="layerDemo" class="layui-btn-group demoTable">
  		<button data-method="offset" class="layui-btn  layui-btn-sm layui-btn-normal" data-type="auto" lay-event="add"><i class="layui-icon"></i>新增付款单</button>
	</div>
</div>

	
	</script>
	
	<script>
		
	
		var table2 = null ;
		layui.use(['table','form','laydate'], function(){
			var table = layui.table, form = layui.form;
			var laydate = layui.laydate;
			var $ = layui.$;
		  
			laydate.render({
			    elem: '#test1'
			    ,type: 'datetime'
			  });
			
		  //执行一个 table 实例
 		 	table2 =  table.render({
		    elem: '#demo'
		    ,height:563
		    ,url: '../../listPay.do' //数据接口
		    ,method:'post'
		    ,title: '付款单查询'
		    ,page: true //开启分页
		    ,toolbar: '#toolbarDemo' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
		    ,totalRow: true //开启合计行
		    ,cols: [[ //表头
		    	{type: 'checkbox', fixed: 'left'}
		        ,{field: 'payId', title: '编号', width:150, sort: true, unresize:true}
		        ,{field: 'payPerson', title: '付款人', unresize:true}
		        , {field: 'payDate', title: '付款时间', unresize:true}
		        , {field: 'dept', title: '部门', unresize:true}
		        ,{field: 'payBranch', title: '分店', unresize:true}
		        , {field: 'companyAccount', title: '公司账户', unresize:true}
		        , {field: 'money', title: '付款金额', unresize:true}
		        ,{field: 'payType', title: '付款类型', unresize:true}
		        ,{field: 'payNote', title:'备注', unresize:true}
		        ,{
		    		fixed: 'right', title:'操作',width:178, align:'center', toolbar: '#barDemo',unresize:true
		          }
		        ]]
		  });
		  
		 	//头工具栏事件
		 	   table.on('toolbar(test)', function(obj){
		 	    var checkStatus = table.checkStatus(obj.config.id);
		 	     switch(obj.event){
		 	      case 'add':
		 	    		layer.open({
		 	    			 type: 1, 
		 	    		  title: '新增付款单'
		 	    		  ,content: $("#addPayForm")
		 	    		  ,area: ['70%', '95%']
		 	    		}); 
		 	    		form.render();
		 	      break;
		 	    }; 
		 	  }); 
		 	
		 	  
		 	$(function() {
			 	//查询
		 		$("#seachTable").on("click",function(){
		 			//iframe层
		 			console.info("111");
		 			table2.reload({
		 				where : {
		 					flowerName:$("#name").val(),
		 				},
		 				page : {
		 					curr : 1
		 				}
		 			});
		 		});
		 	});
		  
	 	
		//监听操作
		table.on('tool(test)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			var tr = obj.tr; //获得当前行 tr 的DOM对象
	
			if (layEvent === 'del') { //查看
				layer.confirm('真的删除行么',function(index) {
					obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
					layer.close(index);
					//向服务端发送删除指令
					var url = "flowerServlet?action=delect";
					var data$ = {flowerId : data.flowerId};
					$.post(url,data$,function(obj) {
						layer.msg(obj.msg);//提示
						table2.reload(); //也是刷新父页面的
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


<!-- <button class="layui-btn layui-btn-sm" lay-event="getCheckData"><i class="layui-icon" ></i>付款单</button> -->

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<form class="layui-form" action=""  id="addPayForm" style="display: none;">
	<table  style="font-size: 13px;width: 96%;height: 100%">
		<tr>
					<td class="trs">付款时间:</td>
					<td class="textTd"><input type="text"  lay-verify="required" lay-reqtext="付款日期是必填项" class="layui-input" id="test1" 
					autocomplete="off"	placeholder="年--月--日 ">
					</td>
					
     				<td class="trs"> 付款人:</td>
        <td class="textTd"><select name="audit" id="payer" lay-verify="required" lay-reqtext="付款人是必填项" lay-search="required">
          <option value="">请选择</option>
          <option value="1">王五</option>
        </select>
		</td>
		
     		<td class="trs">部门:</td>
        <td class="textTd"><select name="audit" id="dept" lay-verify="required" lay-reqtext="部门是必填项" lay-search="required">
          <option value="">请选择</option>
          <option value="1">财务部</option>
        </select>
    	</td>
    </tr>
    <tr> 
     		<td class="trs">分店:</td>
        <td class="textTd"><select name="audit" id="branch" lay-verify="required" lay-reqtext="分店是必填项" lay-search="required">
          <option value="">请选择</option>
          <option value="1">王五</option>
        </select>
        </td>

				<td class="trs">公司账户:</td>
					<td class="textTd"><select name="audit"  id="comAccount" lay-verify="required" lay-reqtext="公司账户是必填项" id="compAccount">
						<option value="">请选择</option>
						<option value="1">xx</option>
					</select>
				</td>

				<td class="trs">付款金额:</td>
					<td class="textTd"><input id="money" type="text" name="username"  lay-verify="required|number"
						lay-reqtext="付款金额是必填项" placeholder="请输入" autocomplete="off"
						class="layui-input">
					</td>
		</tr>
		<tr>

				<td class="trs">付款类型:</td>
					<td class="textTd"><select lay-verify="required" id="type" lay-reqtext="付款类型是必填项"  id="payType">
						<option value="">请选择</option>
						<option value="1">采购付款</option>
						<option value="2">分店退货</option>
					</select>
					</td>

				<!-- <td class="trs">付款方式:</td>
					<td class="textTd"><select lay-verify="required" lay-reqtext="付款方式是必填项" id="payMethod">
						<option value="">请选择</option>
						<option value="1">现金</option>
						<option value="2">网银</option>
						<option value="3">支付宝</option>
						<option value="4">刷卡</option>
					</select>
					</td> -->
			</tr>
					
			<tr>
			   <td class="trs">备注:</td>
			    <td style="padding-left: 10px;padding-top: 20px;" colspan="5" ><textarea placeholder="请输入内容"  cols="70px" rows="15px" id="text"></textarea>
			    </td>
			</tr>
		  </table>
		  
		  
			<div class="layui-form-item" style="margin-top:15px;">
				<button class="layui-btn  layui-btn-sm layui-btn-normal" lay-submit="" lay-filter="demo2" style="margin-left: 700px;" id="addPay">确定</button>
			</div>
	</form>
</body>
</html>