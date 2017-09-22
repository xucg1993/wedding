$(function tabar(){
	 var btnnaver=$(".weui_dateitem .col_btn");
	 var container_item=$(".data_min div");
	 btnnaver.click(function(){
	 	var index=btnnaver.index(this);
	 	btnnaver.removeClass("btnbg").siblings().eq(index).addClass("btnbg");

	 	container_item.css('display','none');
	 	container_item.eq(index).css('display','block');
	 });

});

$(document).ready(function week() {
	//折线图示例
	    var chart;
	    chart = new Highcharts.Chart({
	        chart: {
	            renderTo: 'container',          //放置图表的容器
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            defaultSeriesType: 'line'   
	        },
	        title: {
	            text: '周统计'
	        },
	        subtitle: {
	            text: '副标题'
	        },
	        xAxis: {//X轴数据
	            categories: ['一月份', '二月份', '三月份', '四月份'],
	            labels: {
	                rotation: -45, //字体倾斜
	                align: 'right',
	                style: { font: 'normal 13px 宋体' }
	            }
	        },
	        yAxis: {//Y轴显示文字
	            title: {
	                text: '产量/百万'
	            }
	        },
	        tooltip: {
	            enabled: true,
	            formatter: function() {
	                return '<b>' + this.x + '</b><br/>' + this.series.name + ': ' + Highcharts.numberFormat(this.y, 1);
	            }
	        },
	        plotOptions: {
	            line: {
	                dataLabels: {
	                    enabled: true
	                },
	                enableMouseTracking: true//是否显示title
	            }
	        },
	        series: [ {
		            name: '江西',
		            data: [4.0, 2.9, 5.5, 24.5],
		           
        	}]
	    });
});

$(document).ready(function moth() {
	//折线图示例
	    var chart;
	    chart = new Highcharts.Chart({
	        chart: {
	            renderTo: 'container_moth',          //放置图表的容器
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            defaultSeriesType: 'line'   
	        },
	        title: {
	            text: '月统计'
	        },
	        subtitle: {
	            text: '副标题'
	        },
	        xAxis: {//X轴数据
	            categories: ['一月份', '二月份', '三月份', '四月份'],
	            labels: {
	                rotation: -45, //字体倾斜
	                align: 'right',
	                style: { font: 'normal 13px 宋体' }
	            }
	        },
	        yAxis: {//Y轴显示文字
	            title: {
	                text: '产量/百万'
	            }
	        },
	        tooltip: {
	            enabled: true,
	            formatter: function() {
	                return '<b>' + this.x + '</b><br/>' + this.series.name + ': ' + Highcharts.numberFormat(this.y, 1);
	            }
	        },
	        plotOptions: {
	            line: {
	                dataLabels: {
	                    enabled: true
	                },
	                enableMouseTracking: true//是否显示title
	            }
	        },
	        series: [{
	            name: '杭州',
	            data: [7.0, 6.9, 9.5, 14.5]
	        }]
	    });
});

$(document).ready(function year() {
	//折线图示例
	    var chart;
	    chart = new Highcharts.Chart({
	        chart: {
	            renderTo: 'container_year',          //放置图表的容器
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            defaultSeriesType: 'line'   
	        },
	        title: {
	            text: '年统计'
	        },
	        subtitle: {
	            text: '副标题'
	        },
	        xAxis: {//X轴数据
	            categories: ['一月份', '二月份', '三月份', '四月份'],
	            labels: {
	                rotation: -45, //字体倾斜
	                align: 'right',
	                style: { font: 'normal 13px 宋体' }
	            }
	        },
	        yAxis: {//Y轴显示文字
	            title: {
	                text: '产量/百万'
	            }
	        },
	        tooltip: {
	            enabled: true,
	            formatter: function() {
	                return '<b>' + this.x + '</b><br/>' + this.series.name + ': ' + Highcharts.numberFormat(this.y, 1);
	            }
	        },
	        plotOptions: {
	            line: {
	                dataLabels: {
	                    enabled: true
	                },
	                enableMouseTracking: true//是否显示title
	            }
	        },
	        series: [{
	            name: '杭州',
	            data: [7.0, 6.9, 9.5, 14.5]
	        }]
	    });
});
