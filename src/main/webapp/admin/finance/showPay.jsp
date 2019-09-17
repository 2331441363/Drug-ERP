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
 
</head>
<body>
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
            $('#branchName').append("<option value='"+item+"'>"+item+"</option>");//往下拉菜单里添加元素
        });
 
        form.render();//菜单渲染 把内容加载进去
    }
});

</script>

	<div class="demoTable" >
<form class="layui-form" onsubmit="return false;">
		<div class="layui-inline" style="margin-left:20px;">
			<label>付款时间：</label>
			<div class="layui-input-inline" style="margin-left:5px;">
				<input type="text" name="payDate" class="layui-input" id="payDate"
					placeholder="年--月--日 " autocomplete="off">
			</div>
		</div>

		<div class="layui-inline" style="margin-left:20px;">
			<label>分店：</label>
			<div class="layui-input-inline" style="margin-left:5px;">
				<select name="branchName" id="branchName"  lay-search="">
				<option value="">请选择</option>
				</select>
			</div>
		</div>

		<div class="layui-inline" style="margin-left:20px;">
			<label>付款类型：</label>
			<div class="layui-input-inline" style="margin-left:5px;">
				<select name="payType" id="payType" lay-search="">
					<option value="">请选择</option>
					<option value="采购付款">采购付款</option>
					<option value="分店退货">分店退货</option>
				</select>
			</div>
		</div>

		<div class="layui-inline" >
			<button class="layui-btn  layui-btn-sm layui-btn-normal" data-type="reload" >搜索</button>		
		</div> 
</form>
</div>


<script src="../layui/layui.js"></script>
	<!-- <iframe src="Pay.html" width="890px" height= "400px" name="topFrame" scrolling="no" frameborder="0" id="topFrame" style="display: none;"></iframe> -->

	<table id="demo" class="layui-hide" lay-filter="test"></table>
	<script type="text/html" id="toolbarDemo">
	</script>
	
	
	<script>
		layui.use(['table','form','laydate'], function(){
			var table = layui.table, form = layui.form;
			var laydate = layui.laydate;
			var $ = layui.$;
		  

			
			//日期时间选择器
			  laydate.render({
			    elem: '#payDate'
			    ,type: 'datetime'
			  });
			
		  //执行一个 table 实例
 		 	table.render({
		    elem: '#demo'
		    ,height:563
		    ,url: '../../listPay.do' //数据接口
		    ,title: '付款单查询'
		    ,page: true //开启分页
		    ,toolbar: '#toolbarDemo' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
		    ,cols: [[ //表头
		    	{type: 'checkbox', fixed: 'left'}
		        ,{field: 'payId', title: '编号', width:150, sort: true, unresize:true}
		        ,{field: 'empName', title: '付款人', unresize:true}
		        , {field: 'payDate', title: '付款时间', unresize:true}
		        , {field: 'departmentName', title: '部门', unresize:true}
		        ,{field: 'branchName', title: '分店', unresize:true}
		        , {field: 'money', title: '付款金额', unresize:true}
		        ,{field: 'payType', title: '付款类型', unresize:true}
		        ,{field: 'payNote', title:'备注', unresize:true}
		        ,{
		    		fixed: 'right', title:'操作',width:178, align:'center', toolbar: '#barDemo',unresize:true
		          }
		        ]]
 		 	,id:'testReload'
		  });
		  
		  
 		 //头部搜索框，查询
 		 	 var $ = layui.$,active = {
 		 			reload: function(){
 		 		    	
 		 		     var dat = $('#payDate').val();
 		 		   var sbranch = $('#branchName').val();
 		 		 var spayType = $('#payType').val();
 		 		   
 		 		alert(dat);
 		 		alert(sbranch);
 		 		alert(spayType);
 		 		      //执行重载
 		 		      table.reload('testReload', {
 		 		        page: {
 		 		          curr: 1 //重新从第 1 页开始
 		 		        }
 		 		        ,where: {
 		 		        	payDate :$('#payDate').val(),
 		 		        	branchName: $('#branchName').val(),
 		 		        	payType:$('#payType').val()
 		 		        	
 		 		        }
 		 		    }, 'data');
 		 		    }
 		 		  };
 		 		  
 		 		  $('.demoTable .layui-btn').on('click', function(){
 		 		    var type = $(this).data('type');
 		 		    active[type] ? active[type].call(this) : '';
 		 		  }); 
		  
			 	
 		 		/*   $(function(){
 		 			//修改操作
	 		 			$("#editPayBtn").on("click",function(){
	 		 				alert('00000');
	 		 				//编号
	 		 				var payId=$("#payId").val();
	 		 				alert(payId);
	 		 				// 付款人
	 		 				var empName=$("#empName").val();
	 		 				//付款时间
	 		 				var payDate=$("#payDate").val();
	 		 				//部门
	 		 				var departmentName=$("#departmentName").val();
	 		 				alert(departmentName);
	 		 				//分店
	 		 				var branchName=$("#branchName").val();
	 		 				//>付款金额
	 		 				var money=$("#money").val();
	 		 				//付款类型
	 		 				var payType=$("#payType").val();
	 		 				//备注
	 		 				var payNote=$("#payNote").val();
	 		 				$.ajax({
	 		 					url:'../../updPay.do',
	 		 					method:'post',
	 		 					data:'payId='+payId+'&empName='+empName+'&payDate='+payDate+
	 		 					'&departmentName='+departmentName+'&branchName='+branchName+
	 		 				'&money='+money+'&payType='+payType+'&payNote='+payNote,
	 		 					dataType:'json',
	 		 					success:function(back){
	 		 						/*修改成功，清空表单，
	 		 						关闭修改页面，提示修改成功*/
	 		 						//$("input").val("");
	 		 						/*if(back='ok'){
	 		 							$("#editPayForm").reset();
	 	 		 						layer.close(index);
	 	 		 						layer.msg('修改成功');//提示	
	 		 						}
	 		 						
	 		 					}
	 		 				});
	 		 			});
	 		 		  	  
 		 		  });
 		 		 */
 		 		  
		 		
 		 		 //监听弹出框表单提交，massage是修改界面的表单数据'submit(demo11),是修改按钮的绑定
 		        function setFormValue(obj,data){
 		            form.on('submit(editPayBtn)', function(massage) {
 		                $.ajax({
 		                    url:'../../updPay.do',
 		                    type:'POST',
 		                    data:{payId:data.payId,empName:data.empName,payDate:data.payDate,departmentName:data.departmentName,
 		                    	branchName:data.branchName,money:data.money,payType:data.payType,payNote:data.payNote},
 		                    success:function (msg) {
 		                        var returnCode = msg.returnCode;//取得返回数据（Sting类型的字符串）的信息进行取值判断
 		                        if(returnCode==200){
 		                            layer.closeAll('loading');
 		                            layer.load(2);
 		                            layer.msg("修改成功", {icon: 6});
 		                            setTimeout(function(){
 		                               obj.update({
 		                                     eqptType:massage.field.neweqptType,
 		                                     eqptIdCode:massage.field.neweqptIdCode,
 		                                     eqptName:massage.field.neweqptName
 		                                 });//修改成功修改表格数据不进行跳转
 		                                 layer.closeAll();//关闭所有的弹出层
 		                            }, 1000);
 		                            //加载层-风格
 		                        }else{
 		                            layer.msg("修改失败", {icon: 5});
 		                        }
 		                    }
 		                });
 		            });

 		        }

 		 		 
		//监听行工具事件操作
		 table.on('tool(test)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			var tr = obj.tr; //获得当前行 tr 的DOM对象
	
			if (layEvent === 'del') { //查看
				layer.confirm('真的删除行么',function(index) {
					obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
					layer.close(index);
					//向服务端发送删除指令
					var url = "../../delPay.do";
					var data$ = {payId : data.payId};
					$.post(url,data$,function(obj) {
						layer.msg(obj.msg);//提示
						table2.reload(); //也是刷新父页面的
					},"json");
				});
			} else if (layEvent === 'edit') { //编辑
				var data = obj.data;//行数据
				//alert(data);
				//iframe层
				layer.open({
					type : 1,
					title : '修改页面',//标题
					shade : 0.3,//背景阴影
					area : [ '60%', '80%' ],//大小
					content :  $("#editPayForm"), //iframe的url
					end : function() {
						table2.reload();
					}
				});
				form.render();
			}
		});
	});
</script>


<!-- <button class="layui-btn layui-btn-sm" lay-event="getCheckData"><i class="layui-icon" ></i>付款单</button> -->

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<form class="layui-form" action=""  id="editPayForm" style="display: none;" onsubmit="return false;">
	<table  style="font-size: 13px;width: 96%;height: 100%">
		<tr>
					<td class="trs">编号:</td>
					<td class="textTd"><input type="text" class="layui-input" id="payId" 
					autocomplete="off" readonly="readonly">
					</td>
					
     				<td class="trs"> 付款人:</td>
        <td class="textTd"><input type="text" readonly="readonly" class="layui-input" id="empName" 
					autocomplete="off"	>
		</td>
		
     		<td class="trs">付款时间:</td>
        <td class="textTd"><input type="text" class="layui-input" id="payDate" 
					autocomplete="off"	>
    	</td>
    </tr>
    <tr>
     		<td class="trs">部门:</td>
        <td class="textTd"><input type="text"  readonly="readonly"  class="layui-input" id="departmentName" 
					autocomplete="off">
        </td>

				<td class="trs">分店:</td>
					<td class="textTd"><input type="text"  readonly="readonly"  class="layui-input" id="branchName" 
					autocomplete="off">
				</td>

				<td class="trs">付款金额:</td>
					<td class="textTd"><input  type="text" name="money" id="money" autocomplete="off"
						class="layui-input">
					</td>
		</tr>
		<tr>

				<td class="trs">付款类型:</td>
					<td class="textTd"><input type="text"  class="layui-input" id="payType" 
					autocomplete="off"	>
					</td>
					
			</tr>
			<tr>

			   <td class="trs">备注:</td>
			    <td style="padding-left: 10px;padding-top: 20px;" colspan="5" ><textarea placeholder="请输入内容"  cols="70px" rows="15px" id="payNote"></textarea>
			    </td>
			</tr>
		  </table>
		  
		  
			<div class="layui-form-item" style="margin-top:15px;">
				<button class="layui-btn  layui-btn-sm layui-btn-normal" lay-filter="demo2" style="margin-left: 700px;" id="editPayBtn">确定</button>
			</div>
	</form>
</body>
</html>