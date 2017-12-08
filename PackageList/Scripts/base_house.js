
$(document).ready(function () {
    showColumn();

    $('#inlineRadio_column').click(function () {
        console.log("加载柱形图");
        showColumn();
    }); 

    $('#inlineRadio_pie').click(function () {
        console.log("加载饼图");
        showPie();
    });

    var options_column = {
        chart: {
            renderTo: 'hcContainer',
            type: 'column',
            className: 'hcPopulation',
            //borderColor: '#f1f1f1',
            //borderRadius: 2,
            //borderWidth: 2,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                viewDistance: 25,
                depth: 100
            }
        },
        title: {
            text: '住户统计分析/堆叠柱形图'
        },
        xAxis: {
            title: {
                text: '社区'
            },
            categories: ['社区一', '社区二', '社区三', '社区四', '社区五', '社区六', '社区七', '社区八', '社区九', '社区十',
                '社区十一', '社区十二', '社区十三', '社区十四', '社区十五', '社区十六', '社区十七', '社区十八', '社区十九', '社区二十']
        },
        yAxis: {
            labels: {
                formatter: function () {
                    return this.value;
                }
            },
            title: {
                text: '人数(个)'
            }
        },        
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y} 个</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0,
                depth: 40,
                stacking: true,
                grouping: false,
                groupZpadding: 10
            }
        },
        series: [{ name: '户籍人口', stack: 0 },
        { name: '非户籍人口', stack: 0 }
                /*{ name: '住户', stack: 1 }*/],
        credits: {
            enabled: false//禁用版权信息
        }
    };

    var options_pie = {
        chart: {
            renderTo: 'hcContainer',
            type: 'pie',
            className: 'hcPopulation',
            borderColor: '#f1f1f1',
            borderRadius: 2,
            borderWidth: 2,
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0,
            }
        },
        title: {
            text: '人口统计分析/饼图'
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y} 个</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                },
                showInLegend: true
            }
        },
        series: [{
            type: 'pie',
            name: '户籍人口', stack: 0
        },
        { name: '非户籍人口', stack: 0 }],
        credits: {
            enabled: false//禁用版权信息
        }
    };

    //function showColumn() {
    //    var actionObj = {Action:"showColumn"};
    //    $.getJSON('../../../Handler/Population_Column.ashx', actionObj, function (data) {
    //        var dataObj = eval(data);
    //        //console.log(dataObj);
    //        options_column.series[0].data = dataObj[0];
    //        options_column.series[1].data = dataObj[1];
    //        //options.series[2].data = dataObj[2];
    //        var chart = new Highcharts.Chart(options_column);
    //    });
    //};

    function showColumn() {
        $.getJSON('../../../Handler/HighchartDemo.ashx', null, function (data) {
            var dataObj = eval(data);
            //console.log(dataObj);
            options_column.series[0].data = dataObj[0];
            options_column.series[1].data = dataObj[1];
            //options.series[2].data = dataObj[2];
            var chart = new Highcharts.Chart(options_column);
        });
    };
    
    function showPie() {
        $.getJSON('../../../Handler/HighchartDemo.ashx', null, function (data) {
            var dataObj = eval(data);
            //console.log(dataObj);
            options_pie.series[0].data = dataObj[0];
            options_pie.series[1].data = dataObj[1];
            var chart = new Highcharts.Chart(options_pie);
        });
    };


});



