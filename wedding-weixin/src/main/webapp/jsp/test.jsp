<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试</title>
    <script src="../lib/jquery-latest.min.js"></script>
</head>
<body>
    <div id="time">
        <h2>服务器返回的时间戳:</h2>

    </div>
    <div>
        <button onclick="start()">开始</button>
    </div>
</body>
<script>
    var times = Date.parse(new Date());
    var intervalId1 = 0;
    var intervalId2 = 0;
    var intervalStatus = false;
    $(function(){
        $("body").bind("touchstart", function(){
            times = Date.parse(new Date());
            if (intervalStatus == false) {
                start();
            }
        })
    })

   function start(){
       intervalId1 = setInterval(count, 3000);
       intervalId2 = setInterval(checkTime, 10000)
       alert(intervalId1 + "-" + intervalId2)
       intervalStatus = true;
   }

   function count(){
       $.getJSON("/wedding/wx/statistics/test.action",{page : "test"},function(data){
            $("#time").append("<p style='color: #ff0000'>" + data.time + "</p>")
       })
   }

    function checkTime(){
        var nowTimes = Date.parse(new Date());
        if (nowTimes - times > 20*1000) {
            timeOut();
        }
    }

   function timeOut(){
       $.getJSON("/wedding/wx/statistics/timeOut.action",{page : "test"}, function(){
           clearInterval(intervalId1);
           clearInterval(intervalId2);
           intervalStatus = false;
       })
   }

</script>
</html>