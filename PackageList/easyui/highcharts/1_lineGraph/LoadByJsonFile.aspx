<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoadByJsonFile.aspx.cs" Inherits="easyui_highcharts_1_lineGraph_LoadByHandler" %>

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
        $(document).ready(function () {
            var options = {
                chart: {
                    renderTo: 'container',
                    type: 'spline'
                },
                series: [{}]
            };
            $.getJSON('../../../Data/data.json', function (data) {
                options.series[0].data = data;
                var chart = new Highcharts.Chart(options);
            });
        });
      
    </script>
</body>
</html>
