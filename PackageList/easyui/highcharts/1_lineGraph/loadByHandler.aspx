<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loadByHandler.aspx.cs" Inherits="easyui_highcharts_1_lineGraph_loadByHandler" %>

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
        <%--<button id="searchButton">搜索</button>--%>
    </form>

    <script>
        $(document).ready(function () {
            var options = {
                chart: {
                    renderTo: 'container',
                    type: 'spline'
                },
                title: {
                    text: 'data transfer by handler'
                },
                series: [{ name: '今年'},
                        { name: '去年'},
                        { name: '前年'}]
            }

            $.getJSON('../../../Handler/HighchartDemo.ashx', null, function (data) {
                var dataObj = eval(data);
                //console.log(dataObj);
                options.series[0].data = dataObj[0];
                options.series[1].data = dataObj[1];
                options.series[2].data = dataObj[2];
                var chart = new Highcharts.Chart(options);                
            });
        });
    </script>

</body>
</html>
