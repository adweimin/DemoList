<%@ Page Language="C#" AutoEventWireup="true" CodeFile="basic.aspx.cs" Inherits="easyui_highcharts_1_lineGraph_basic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="/Scripts/jquery-1.11.3.min.js"></script>
    <script src="/Scripts/highcharts/highcharts.js"></script>
    <script src="/Scripts/highcharts/exporting.js"></script>
    <script src="/Scripts/highcharts/dark-unica.js"></script>
</head>
<body>
    <form id="form1" runat="server">
       <div id="container" style="min-width:400px;height:400px"></div>
    </form>

    <script>
        var firstSeries = '<%=Value %>';
        var xAxis = '<%=Name %>';
        var banksname;
        var seriesOne = new Array();
        seriesOne = firstSeries.split(',');
        for (var i = 0; i < seriesOne.length; i++) {

            seriesOne[i] = parseInt(seriesOne[i]);
        }
        var xAxisSeries = new Array();
        xAxisSeries = xAxis.split(',');
        for (var i = 0; i < xAxisSeries.length; i++) {
            banksname = banksname + xAxisSeries[i];
        }


        var _MyArray = seriesOne;
        var _MyArray2 = banksname;
        Highcharts.setOptions({
            lang: {
                contextButtonTitle: "图表导出菜单",
                decimalPoint: ".",
                downloadJPEG: "下载JPEG图片",
                downloadPDF: "下载PDF文件",
                downloadPNG: "下载PNG文件",
                downloadSVG: "下载SVG文件",
                drillUpText: "返回 {series.name}",
                loading: "加载中",               
                noData: "没有数据",
                printChart: "打印图表",
                resetZoom: "恢复缩放",
                resetZoomTitle: "恢复图表",
            }
        });

        $(function () {
            $('#container').highcharts({
                title: {
                    text: '水果消费',
                    x: -20
                },
                subtitle: {
                    text: '数据交互类型:服务端直接渲染',
                    x: -20
                },
                xAxis: {
                    categories: _MyArray2
                },
                yAxis: {
                    title: {
                        text: '吃水果个数'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '个'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [{
                    name: '2014年',
                    data: _MyArray
                }]
            });
        });

    </script>
</body>
</html>
