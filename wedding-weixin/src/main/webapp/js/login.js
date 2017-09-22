var times = Date.parse(new Date());
var intervalId1 = 0;
var intervalId2 = 0;
var intervalId3 = 0;
var timeOutId = 0;
var intervalStatus = false;
$(function(){
    start();
    $("body").bind("touchstart", function(){
        times = Date.parse(new Date());
        if (intervalStatus == false) {
            start();
        }
    })
})

function start(){
    if (intervalStatus == false) {
        intervalId1 = setInterval(updateEndTime, 30000);
        intervalId2 = setInterval(checkTime, 60000)
        if ($("#readStatus").val() == '1') {
            intervalId3 = setInterval(updateReadEndTime, 40000);
        }
        intervalStatus = true;
    }
}

function updateReadEndTime(){
    var readId = $("#readId").val();
    if (readId == undefined || readId == '') {
        return;
    }
    $.getJSON("/wedding/wx/statistics/updateReadEndTime.action",{readId : readId, moduleId : $("#moduleId").val(), materialId : $("#materialId").val()},function(data){
        var rId = parseInt(data.readId);
        if (rId > 0) {
            $("#readId").val(rId);
        }
    })
}

function readTimeOut(){
    clearTimeout(timeOutId);
    var readId = $("#readId").val();
    if (readId == undefined || readId == '') {
        return;
    }
    $.getJSON("/wedding/wx/statistics/updateReadTimeOut.action", {readId : readId}, function(data){
    })
}

function updateEndTime(){
    var loginId = $("#loginId").val();
    if (loginId == undefined || loginId == '') {
        return;
    }
    $.getJSON("/wedding/wx/statistics/updateLoginEndTime.action",{loginId : loginId, moduleId : $("#moduleId").val()},function(data){
        var lId = parseInt(data.loginId);
        if (lId > 0) {
            $("#loginId").val(lId);
        }
    })
}

function checkTime(){
    var nowTimes = Date.parse(new Date());
    if (nowTimes - times > 20*1000) {
        clearAllInterval();
        intervalStatus = false;
        timeOut();
        if ($("#readStatus").val() == '1') {
            timeOutId = setTimeout(readTimeOut, 2000)
        }
    }
}

function timeOut(){
    $.getJSON("/wedding/wx/statistics/updateLoginTimeOut.action", {loginId : $("#loginId").val()}, function(data){
    })
}

function clearAllInterval(){
    clearInterval(intervalId1);
    clearInterval(intervalId2);
    clearInterval(intervalId3)
}


function formatTime(times){
    var d = new Date(times);
    var years = d.getFullYear()
    var mon = d.getMonth() + 1;
    if (mon < 10) {
        mon = "0" + mon;
    }
    var days = d.getDate();
    if (days < 10) {
        days = "0" + days;
    }
    var hours = d.getHours();
    if (hours < 10) {
        hours = "0" + hours;
    }
    var min = d.getMinutes();
    if (min < 10) {
        min = "0" + min;
    }
    var s = d.getSeconds();
    if (s < 10) {
        s = "0" + s;
    }
    return  years + "-" + mon + "-" + days + " " + hours + ":" + min;
}