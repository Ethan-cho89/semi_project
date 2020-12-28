<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %><!-- <body> -->    
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	.content{
		position:relative;
		height:800px;
	}
	#chart_div{
		position:absolute;
		width: 1000px; 
		height: 500px;
		top:50%; 
		left:50%;
		transform: translate(-50%, -50%);
	}
	
	#chart_menu{
		position:absolute;
		top:15%; 
		left:25%;
		transform: translate(-50%, -50%);
	}
	
</style>

<div class="content">
	
	<div id="chart_menu">
		<a href="d" class="col" >일별</a>
		<a href="m" class="col">월별</a>
		<a href="y" class="col">연도별</a>
	</div>
	<div id="chart_div">
		
	</div>

</div>
 <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
   google.charts.setOnLoadCallback(getChartData);
    
    var map = new Map();
    const chartTitle = '매출 통계'
    var mon = new Date().getMonth()+1;
    var year = new Date().getFullYear();
    
    $(document).ready(function(){
    	
    	$('.content .col').on('click',function(e){
    		e.preventDefault();
			var term = $(this).attr('href');
			getChartData(term);
    	});
    });
    
    function getChartData(col='d'){
    	   	
    	$.ajax({
			data : {'col':col},
			type : 'get',
			url : "/admin/chart",
			success : function(data) {
				var obj = JSON.parse(data);
				var arr = new Array(obj.length+1);
				arr[0] = ['기간', '매출' ];
				for(var i =1 ; i < arr.length; i++){
					arr[i] = [obj[i-1].colName,obj[i-1].value];
				}
				
				if(col=='d'){
					drawChart(arr,mon+'월 일별' );
				}else if(col=='m'){
					drawChart(arr,year+'년 월별' );
				}else if(col=='y'){
					drawChart(arr,'연도별 ');
				}
				
				
			}
		});
    }
    
    function drawChart(arr,term){
    	
    	  var data = google.visualization.arrayToDataTable(arr);

           var options = {
             title : chartTitle,
             vAxis: {title: '매출'},
             hAxis: {title: term+' 매출'},
             seriesType: 'bars',
             series: {1: {type: 'line'}}
           };
           
           drawVisualization(data,options);
    }
    
    function drawVisualization(data,options) {
        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
  </script>

 
<%@include file="../include/footer.jsp" %><!-- </body> -->