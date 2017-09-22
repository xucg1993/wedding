<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="dwz/themes/metro/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet" href="css/themes.css"/>
<link rel="stylesheet" href="css/newapend.css?3sscss=sds3"/>
<link rel="stylesheet" href="css/plyr.css"/>
<!--[if IE]>
<link href="dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="dwz/js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="dwz/js/jquery.cookie.js" type="text/javascript"></script>
<script src="dwz/js/jquery.validate.js" type="text/javascript"></script>
<script src="dwz/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="dwz/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="dwz/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="dwz/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="dwz/chart/raphael.js"></script>
<script type="text/javascript" src="dwz/chart/g.raphael.js"></script>
<script type="text/javascript" src="dwz/chart/g.bar.js"></script>
<script type="text/javascript" src="dwz/chart/g.line.js"></script>
<script type="text/javascript" src="dwz/chart/g.pie.js"></script>
<script type="text/javascript" src="dwz/chart/g.dot.js"></script>


<!-- 可以用dwz.min.js替换前面全部dwz.*.js (注意：替换是下面dwz.regional.zh.js还需要引入) -->
<script src="dwz/bin/dwz.min.js" type="text/javascript"></script>
<script src="dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript" src="js/colorpicker.min.js"></script>
<script type="text/javascript" src="js/plyr.js"></script>


<script type="text/javascript">

    var csrftoken = '${sessionScope.sessioncsrftoken}';
    function appendToken(){
//        console.log("dddd");
        updateForms();
        updateTags();
    }

    function updateForms() {

        $("form").each(function(){
            if ($(this).find('input[name="csrftoken"]').val() == undefined && $(this).attr("action").length > 0) {
//                console.log($(this).find('input[name="csrftoken"]').val());
//                console.log($(this).attr("action").length);
                $(this).append('<input type="hidden" name="csrftoken" value="' + csrftoken + '">');
            }
        })
//        // 得到页面中所有的 form 元素
//        var forms = document.getElementsByTagName('form');
//        for(var i=0; i<forms.length; i++) {
//            var url = forms[i].action;
//
//            // 如果这个 form 的 action 值为空，则不附加 csrftoken
//            if(url == null || url == "" ) continue;
//
//            // 如果已经有了token，就不添加了
//            var obj = $(forms[i] + ':input[name="csrftokena"]');
//            console.log("obj=" + obj.length);
//
//            // 动态生成 input 元素，加入到 form 之后
//            var e = document.createElement("input");
//            e.name = "csrftoken";
//            e.value = csrftoken;
//            e.type = "hidden";
//            forms[i].appendChild(e);
//        }
    }

    function updateTags() {
        var all = document.getElementsByTagName('a');
        var len = all.length;

        // 遍历所有 a 元素
        for(var i=0; i<len; i++) {
            var e = all[i];
            updateTag(e, 'href', csrftoken);
        }
    }

    function updateTag(element, attr, token) {
        var location = element.getAttribute(attr);

        if(location != null && location != '') {
            var actionIndex = location.indexOf(".action");
            if (actionIndex == -1) {
                return;
            }

            // 已经有这个参数了，就不添加了
            var tokenIndex = location.indexOf("csrftoken");
            if (tokenIndex > -1) {
//                console.log(location + ":" + tokenIndex);
                return;
            }

            var fragmentIndex = location.indexOf('#');
            var fragment = null;
            if(fragmentIndex != -1){

                //url 中含有只相当页的锚标记
                fragment = location.substring(fragmentIndex);
                location = location.substring(0,fragmentIndex);
            }

            var index = location.indexOf('?');

            if(index != -1) {
                //url 中已含有其他参数
                location = location + '&csrftoken=' + token;
            } else {
                //url 中没有其他参数
                location = location + '?csrftoken=' + token;
            }
            if(fragment != null){
                location += fragment;
            }

            element.setAttribute(attr, location);
        }
    }
</script>
