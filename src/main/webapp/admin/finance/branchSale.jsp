<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>分店销量报表</title>
    <!--引入echarts.js-->
    <script src="<%=request.getContextPath()%>/js/echarts.js"></script>
</head>
<body>
    <!--为ECharts准备一个具备大小（宽高）的Dom-->
    <div id = "main" style = "width:600px;height:400px;margin-left: 150px;margin-top: 70px;"></div>
    <script type = "text/javascript">
        //基于准备好的dom，初始化echarts实例
        var myChar =
            echarts.init(document.getElementById('main'));
 
         // 指定图表的配置项和数据
        var option = {
            title: {
                text: '分店销售报表'
            },
            tooltip: {},
            legend: {
                data:['销量']
                ,itemGap:20
            },
            xAxis: {
            	 name: '时间',
                data: ["第1周","第2周","第3周","第4周","第5周"]
            },
            yAxis: {
            	name: '销量'
            	},
            series: [{
                name: '销量',
                type: 'bar',
                barGap:'20%',
                data: [500, 1020, 1360, 1000,  2046]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChar.setOption(option);
    </script>
 
</body>
</html>