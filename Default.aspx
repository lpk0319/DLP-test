<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>智慧纪检监督平台系统</title>
    <link href="home/style/reset_css.css" type="text/css" rel="stylesheet" />

    <link href="home/style/layout.css" type="text/css" rel="stylesheet" />
    <link href="Home/style/dialog.css?v=1" rel="stylesheet" />
    <link href="CommonUI/Css/Default.css" rel="stylesheet" />
    <script src="Home/js/base64.js" type="text/javascript"></script>
    <link href="CommonUI/MiniCalendar/skins/terrace/dhtmlxcalendar.css" rel="stylesheet" />
    <link href="Home/ZTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
    <script src="CommonUI/MiniCalendar/dhtmlxcommon.js" type="text/javascript"></script>
    <script src="CommonUI/MiniCalendar/dhtmlxcalendar.js" type="text/javascript"></script>
    <link href="Home/style/scrollBar.css" rel="stylesheet" />
    <style>
        .level_name {
            color: rgb(24, 167, 159);
            font-weight: bold;
            font-size: 20px;
        }

        .level_line {
            width: 120px;
            height: 2px;
            background-color: #e9e9e9;
        }

        .level_img {
            margin-left: 20px;
        }

        .level1_span {
            margin-left: 16px;
            cursor: pointer;
            font-size: 16px;
        }

            .level1_span:hover {
                color: #18A79F;
            }

        .level_div {
            padding-left: 20px;
        }

        .level_div_ul {
            float: left;
            width: 33%;
        }

        .level_img0 {
        }

        .level2_span {
            color: rgb(96, 98, 102);
            font-size: 19px;
        }

        .level2_span2 {
            margin-left: 20px;
            cursor: pointer;
            font-size: 19px;
        }

            .level2_span2:hover {
                color: #18A79F;
            }
    </style>
    <script>
        function refresh() {
            var frameId = window.frameElement && window.frameElement.id || '';
            if (frameId !== '') {
                window.parent.location.reload();
            }
        }
        window.onload = refresh();
    </script>
    <script>
        function Router() {
            this.currentUrl = '';
        }

        Router.prototype.route = function (path, callback) {
            this.routes[path] = callback || function () { };
        };

        Router.prototype.refresh = function () {
            var base = new Base64();
            var locHash = base.decode(location.hash.slice(1));
            this.currentUrl = locHash || '/';
            var reg1 = /^\/m(\d+)\/I(\d+)/;
            var reg2 = /^\/p(\d+)/;
            var menuId = null, rightSrc = null;
            var icon = (this.currentUrl).match(reg1);
            var menu = (this.currentUrl).match(reg2);
            if (icon === null && menu === null) {
                document.querySelector("#left").src = "Home/LeftWindow.aspx";
                document.querySelector("#mainWindow").src = "Home/RightWindow.aspx"
                return;
            }
            if (icon !== null) {
                menuId = icon[1];

            } else {
                menuId = this.currentUrl.match(reg2)[1];

            }
            document.querySelector("#left").src = "Home/LeftWindow.aspx?MenuId=" + menuId;
        };

        function showCancelLink() {
            document.getElementById('aCancel').style.display = "inline";
        }
        Router.prototype.init = function () {
            window.addEventListener('load', this.refresh.bind(this), false);
            //window.addEventListener('hashchange', this.refresh.bind(this), false);
        }
        window.Router = new Router();
        window.Router.init();

    </script>
</head>
<body>

    <!--[if lt IE 9]><div>您的浏览器版本过旧，请升级后再试！</div><![endif]-->
    <div id="doc" style="visibility: hidden">
        <header class="on">

            <div class="logo" style="float: none; z-index: 999">
                <%-- <form onsubmit="return false">
                <input type="text" name="" id="txt" class="inp txt" placeholder="功能查找" autocomplete="off" />
                <button type="submit" id="sobut" onclick="window.frames[0].GetSearchFunction();">
                </button>
            </form>--%>
            </div>
            <div id="RightTop" class="inlineb">
                <%--<img  src="Home/Imgs/log.png"  style=" vertical-align:  middle;margin-top: 40px; margin-left: 40px;"/>--%>
                <div class="user_right inlineb">
                    智慧纪检监督平台系统
                </div>

                <span style="right: 600px;">欢迎您，<asp:Label ID="LName" runat="server"></asp:Label>！<a id='aCancel' style="display: none; text-decoration: underline; color: dodgerblue;" href="Default.aspx?Type=Cancel">退出模拟</a></span>


                <div class="fr inlineb" style="float: right;">
                    <ul class="u_top_nav" style="">

                        <li class="on"><a href="Default.aspx">
                            <div style="background-image: url(Home/Imgs/sy.png); background-size: 30px;">
                                <span>首页</span>
                            </div>
                        </a></li>

                        <li id="app" onclick="showLeftMenu();"><a href="#" onclick="return false;">
                            <div style="background-image: url(Home/Imgs/app.png); background-size: 30px;">
                                <span>应用</span>
                            </div>
                        </a></li>
                        <%-- <li><a href="#" onclick="showMenu(20009,'');return false;">
                        <div style="background-image: url(Home/Imgs/zbcs.png); background-size: 26px;">
                            <span>动态监管</span>
                        </div>
                    </a></li>--%>
                        <%--  <li><a href="#" onclick="window.open('lzjy/Default.aspx','_blank');return false;">
                        <div style="background-image: url(Home/Imgs/lzjy.png); background-size: 50px;">
                            <span>廉洁教育</span>
                        </div>
                    </a></li>
                    <li><a href="#" onclick="showMenu2(20048,'');return false;">
                        <div style="background-image: url(Home/Imgs/hxbg.png); background-size: 30px;">
                            <span>画像报告</span>
                        </div>
                    </a></li>--%>
                        <li><a href="#" onclick="showOpt();">
                            <div style="background-image: url(Home/Imgs/opt.png); background-size: 30px;">
                                <span>设置</span>
                            </div>

                        </a></li>
                        <li><a href="Home/Logout.aspx">
                            <div style="background-image: url(Home/Imgs/i_zx.png); background-size: 30px;">
                                <span>注销</span>
                            </div>
                        </a></li>
                    </ul>
                </div>
            </div>

        </header>
        <div class="usermain" id="tttt">

            <div id="LeftWindow" class="user_left fl">

                <iframe id="left" name="c" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0"></iframe>

            </div>
            <div id="RightWindow">
                <div class="scrollcontainer">

                    <div class="scrollcontainer rightdown">
                        <div id="RightDown">
                            <iframe id="mainWindow" name="MainWindow" class="scrollcontainer" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" style="border-left: 1px solid #e9e9e9;"></iframe>
                            
                            <div id="menuContent" style="height: 100%; width: 850px; position: absolute; top: 0px; left: 0px; display: none; border-right: 1px solid #e9e9e9; border-bottom: 1px solid #e9e9e9; border-top: 1px solid #e9e9e9; background-color: #F1F6F4;">
                                <%-- 滚动条 --%>
                                <div style="padding: 2px 20px 20px 20px; height: 92%;">
                                    <div class="scrollBox" id="box1" style="width: 100%; height: 100%; position: relative; overflow: hidden;">
                                        <div class="zl-scrollContentDiv" style="top: 0px;">

                                            <div id="contentBox1">
                                            </div>
                                        </div>
                                        <div class="zl-scrollBarBox" style="height: 100%; top: 0; width: 20px; right: 0; width: 10px;">
                                            <div class="zl-scrollBar zl-verticalBar" style="width: 10px; border-radius: 2.5px; height: 132.139px; width: 10px;"></div>
                                        </div>
                                    </div>
                                </div>
                                <%--  --%>
                            </div>
                            <div id="optContent" style="height: 100%; width: 780px; position: absolute; top: 0px; right: 0px; display: none; border-left: 1px solid #e9e9e9; border-bottom: 1px solid #e9e9e9; background-color: #F1F6F4;">
                                <%-- 滚动条 --%>
                                <div style="padding: 2px 20px 20px 20px; height: 93%;">
                                    <div class="scrollBox2" id="box2" style="width: 100%; height: 100%; position: relative; overflow: hidden;">
                                        <div class="zl-scrollContentDiv" style="top: 0px;">
                                            <div id="contentBox2">
                                                <ul>
                                                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="zl-scrollBarBox" style="height: 100%; top: 0; width: 20px; right: 0; width: 10px;">
                                            <div class="zl-scrollBar zl-verticalBar" style="width: 10px; border-radius: 2.5px; height: 132.139px; width: 10px;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--  --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%-- <script src="home/js/jquery.js" type="text/javascript"></script>--%>
        <script src="Home/js/jquery.min.js"></script>
        <script src="Scripts/common.js" type="text/javascript"></script>
        <script src="Scripts/dialog.js" type="text/javascript"></script>
        <script>
            var isLeftWindowShow = true;

            $(document).ready(function load() {



                var url = window.location.href;
                if (url.indexOf("#") == "-1") {
                    //$("header").toggleClass("on");
                    $(".usermain").toggleClass("on");
                }

                $(".ck_toggle span").click(function () {
                    $(".usermain").toggleClass("on");
                    $("header").toggleClass("on");
                    isLeftWindowShow = !isLeftWindowShow;
                });
            });
            var showFlag = false;
            function showLeftMenu() {
                //window.frames["left"].contentWindow.refreshNode();
                if (document.getElementById('left') != null) {
                    document.getElementById('left').contentWindow.refreshNode();
                }
                $("#mainWindow").attr("src", "CommonUI/WebForm/Blank.aspx?t=" + new Date().getTime());
                var a = $("#tttt").attr("class");
                if (a.indexOf("on") != -1) {
                    $("#tttt").attr("class", "usermain");
                } else {
                    //$("#tttt").attr("class", "usermain on");
                }
                document.getElementById('left').contentWindow.BindClick();
            }

            $(".u_top_nav li").click(function () {

                $(".u_top_nav li.on").removeClass("on");
                $(this).addClass("on");
                if ($(this).hasClass("leftClose")) {
                    if (isLeftWindowShow === true) {
                        $(".usermain").toggleClass("on");
                        $("header").toggleClass("on");

                        isLeftWindowShow = false;
                    }
                } else {
                    if (isLeftWindowShow === false) {
                        $(".usermain").toggleClass("on");
                        $("header").toggleClass("on");

                        isLeftWindowShow = true;
                    }
                }
                window.location.hash = "";
            });



            function PageTrans(menuId, extendType) {
                var a = $("#tttt").attr("class");
                if (a.indexOf("on") != -1) {
                    $("#tttt").attr("class", "usermain");
                } else {
                    //$("#tttt").attr("class", "usermain on");
                }

                //$(".usermain").toggleClass("on");
                if (menuId == "20048") {
                    $("#tttt").attr("class", "usermain on");
                }
                var treeObj = document.getElementById("left").contentWindow.GetTree("treeMenu");
                var node = treeObj.getNodeByParam("id", menuId, null);
                document.getElementById("left").contentWindow.HashChange(node);


                if (node != null) {
                    treeObj.expandNode(node, true, true, false);
                    treeObj.selectNode(node);
                    var url = "Navigate.aspx?IsRemind=-1&MenuID=" + menuId + "&ExtendType=" + extendType + "&t=" + new Date().getTime();
                    window.open(url, 'MainWindow');
                }
                document.getElementById("left").contentWindow.setClickNode(node);
                if (node.level == 1) {
                    document.getElementById("left").contentWindow.setLevel2Node(node);
                }
                if (node.level == 2) {
                    document.getElementById("left").contentWindow.setLevel3Node(node);
                }
            }
            function PageTrans2(menuId, extendType) {
                var a = $("#tttt").attr("class");
                if (a.indexOf("on") != -1) {
                    $("#tttt").attr("class", "usermain");
                } else {
                    //$("#tttt").attr("class", "usermain on");
                }

                //$(".usermain").toggleClass("on");
                if (menuId == "20048") {
                    $("#tttt").attr("class", "usermain on");
                }
                var treeObj = document.getElementById("left").contentWindow.GetTree("treeMenu");
                var node = treeObj.getNodeByParam("id", menuId, null);
                document.getElementById("left").contentWindow.HashChange(node);


                if (node != null) {
                    treeObj.expandNode(node, true, true, false);
                    treeObj.selectNode(node);
                    var url = "Home/Navigate.aspx?IsRemind=-1&MenuID=" + menuId + "&ExtendType=" + extendType + "&t=" + new Date().getTime();
                    window.open(url, 'MainWindow');
                }
                document.getElementById("left").contentWindow.setClickNode(node);
                if (node.level == 1) {
                    document.getElementById("left").contentWindow.setLevel2Node(node);
                }
                if (node.level == 2) {
                    document.getElementById("left").contentWindow.setLevel3Node(node);
                }
            }
            var optFlag = false;
            function showOpt() {
                if (!optFlag) {
                    $("#optContent").css("display", "block");
                    optFlag = true;
                } else {
                    $("#optContent").css("display", "none");
                    optFlag = false;
                }

            }

        </script>
    </div>
    <script src="Home/ZTree/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
    <script src="Home/ZTree/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
    <script>
        function video() {
            //setTimeout(function () {
            $("#welcVideo").css("display", "none");
            $("#doc").css("visibility", "visible");
            setCookie("videoFlag", "0", 1);
            delCookie("videoFlag");
            //}, 3000);
        }
        function hiddenControls() {
            $(".combotreeCtnr").css("display", "none");
            $(".combotreeCtnr").css("display", "none");
            $(".dhtmlxcalendar_dhx_terrace").css("display", "none");
            var webComboList = window.top.document.getElementsByClassName('webComboListContent'); for (var i = 0; i < webComboList.length; i++) { window.top.document.body.removeChild(webComboList[i]); } var comboTreeList = window.top.document.getElementsByClassName('combotreeCtnr'); for (var i = 0; i < comboTreeList.length; i++) { window.top.document.body.removeChild(comboTreeList[i]); } var datePickerList1 = window.top.document.getElementsByClassName('dhtmlxcalendar_dhx_terrace'); for (var i = 0; i < datePickerList1.length; i++) { window.top.document.body.removeChild(datePickerList1[i]); } var datePickerList2 = window.top.document.getElementsByClassName('datePickerRemoteInput'); for (var i = 0; i < datePickerList2.length; i++) { window.top.document.body.removeChild(datePickerList2[i]); }
        }
    </script>
    <script type="text/javascript" src="Home/js/scrollbar.js"></script>
    <script>

        $(document).ready(function () {
            $("#welcVideo").css("display", "none");
            $("#doc").css("visibility", "visible");
            //var videoFlag = getCookie("videoFlag");
            //if (videoFlag == null && videoFlag!="-1") {
            //    document.getElementById("video").pause();
            //    //$("#videoSrc").attr("src", "");
            //    $("#welcVideo").css("display", "none");
            //    $("#doc").css("visibility", "visible");
            //} else {
            //    //$("#videoSrc").attr("src", "Home/doc/test.mp4");
            //    document.getElementById("video").play();
            //    $("#doc").css("visibility", "hidden");
            //    $("#welcVideo").css("display", "block");
            //    setCookie("videoFlag","0",1);
            //    delCookie("videoFlag");
            //}

            $('.scrollBox').scrollBar();
            $('.scrollBox2').scrollBar();
            //$("#menuContent").hover(function () {
            //    //移入
            //}, function () {
            //    //移出
            //    $("#menuContent").css("display", "none");
            //    if (lastTreeNode != null) {
            //        document.getElementById("left").contentWindow.ChangeMeneNodeColor(lastTreeNode);
            //        document.getElementById("left").contentWindow.ResetLevelSpanColor(lastTreeNode);
            //    }
            //});
            //$("#optContent").click(function () {
            //    //移入
            //}, function () {
            //    //移出
            //    $("#optContent").css("display", "none");
            //});
        });
        var lastTreeNode = null;
        var showFlag = false;
        var lastClickMenuId = null;
        function MenuMouseOver(treeNode) {
            //移入
            $("#optContent").css("display", "none");
            var h = $(document.getElementById("left").contentWindow.document.getElementById(treeNode.tId + "_span")).offset().top;
            var menuId = treeNode.id;
            if (menuId != 1515286 && treeNode.name.indexOf("监管闭环")==-1 && menuId != 20031 && menuId != 20032 && menuId != 20096 && treeNode.name != "活动统计" && treeNode.name != "离任审计" && treeNode.name != "投稿管理") {
                if (lastClickMenuId != null && menuId != lastClickMenuId) {
                    showFlag = false;
                }
                if (!showFlag) {

                    if (menuId == 20010) {
                        $("#menuContent").css("display", "none");
                        document.getElementById("left").contentWindow.ChangeMeneNodeColor(treeNode);
                        return;
                    }
                    if (lastTreeNode != null) {
                        document.getElementById("left").contentWindow.ChangeMeneNodeColor(lastTreeNode);
                        document.getElementById("left").contentWindow.ResetLevelSpanColor(lastTreeNode);
                    }

                    lastTreeNode = treeNode;
                    document.getElementById("left").contentWindow.ChangeMeneNodeColor2(treeNode);
                    document.getElementById("left").contentWindow.ChangeLevelSpanColor(lastTreeNode);
                    $.ajax({
                        url: "Home/GetMenuContent.ashx",
                        type: "POST",
                        async: false,
                        data: { "menuId": menuId, "userId":<%=userId%> },
                        success: function (data) {
                            $("#contentBox1").html("");
                            $("#contentBox1").html(data);
                            $("#menuContent").css({ "top": (h - 15) + "px", "display": "block" });
                            $("#menuContent").css("height", $("#contentBox1").height() + 35);
                            $(".zl-scrollContentDiv").css("top", "0px");
                            showFlag = true;
                        },
                        error: function (data) {
                            showFlag = true;
                        }
                    });
                    document.getElementById("left").contentWindow.ChangeTreeMenuHeight(treeNode);

                } else {
                    $("#menuContent").css("display", "none");
                    if (lastTreeNode != null) {
                        document.getElementById("left").contentWindow.ChangeMeneNodeColor(lastTreeNode);
                        document.getElementById("left").contentWindow.ResetLevelSpanColor(lastTreeNode);
                    }

                    showFlag = false;
                }
                lastClickMenuId = menuId;
            } else {
                //if (!showFlag) {
                //    if (lastTreeNode != null) {
                //        document.getElementById("left").contentWindow.ChangeMeneNodeColor2(lastTreeNode);
                //        document.getElementById("left").contentWindow.ResetLevelSpanColor(lastTreeNode);
                //    }
                //    lastTreeNode = treeNode;
                //    document.getElementById("left").contentWindow.ChangeLevelSpanColor(lastTreeNode);
                //    showFlag = true;
                //} else {
                //    if (lastTreeNode != null) {
                //        document.getElementById("left").contentWindow.ChangeMeneNodeColor(lastTreeNode);
                //        document.getElementById("left").contentWindow.ResetLevelSpanColor(lastTreeNode);
                //    }
                //    lastTreeNode = treeNode;
                //    //document.getElementById("left").contentWindow.ChangeLevelSpanColor(lastTreeNode);
                //    showFlag = false;
                //}
                $("#menuContent").css("display", "none");
                if (lastClickMenuId != null && menuId != lastClickMenuId) {
                    showFlag = false;
                }
                if (!showFlag) {
                    if (menuId == 20010) {
                        $("#menuContent").css("display", "none");
                        document.getElementById("left").contentWindow.ChangeMeneNodeColor(treeNode);
                        return;
                    }
                    if (lastTreeNode != null) {
                        document.getElementById("left").contentWindow.ChangeMeneNodeColor(lastTreeNode);
                        document.getElementById("left").contentWindow.ResetLevelSpanColor(lastTreeNode);
                    }

                    lastTreeNode = treeNode;
                    document.getElementById("left").contentWindow.ChangeMeneNodeColor2(treeNode);
                    document.getElementById("left").contentWindow.ChangeLevelSpanColor(lastTreeNode);
                    showFlag = true;
                    document.getElementById("left").contentWindow.ChangeTreeMenuHeight(treeNode);

                } else {

                    if (lastTreeNode != null) {
                        document.getElementById("left").contentWindow.ChangeMeneNodeColor(lastTreeNode);
                        document.getElementById("left").contentWindow.ResetLevelSpanColor(lastTreeNode);
                    }

                    showFlag = false;
                }
                lastClickMenuId = menuId;
            }
        }
        function scrollMainContent() {
            if (lastTreeNode != null) {
                var h = $(document.getElementById("left").contentWindow.document.getElementById(lastTreeNode.tId + "_span")).offset().top;
                $("#menuContent").css({ "top": (h - 15) + "px" });
            }
        }
        function MenuMouseOut(treeNode) {
            //移出
            $("#optContent").css("display", "none");
            $("#menuContent").css("display", "none");
            showFlag = false;
        }
        function showMenu(menuId, from) {
            showFlag = false;
            var a = $("#tttt").attr("class");
            if (a.indexOf("on") != -1) {
                $("#tttt").attr("class", "usermain");
            } else {
                //$("#tttt").attr("class", "usermain on");
            }
            if (menuId != null) {
                $("#menuContent").css("display", "none");
                var url = "Home/Navigate.aspx?IsRemind=" + from + "&MenuID=" + menuId + "&ExtendType=&t=" + new Date().getTime();
                window.open(url, 'MainWindow');
            }
            if (lastTreeNode != null) {
                document.getElementById("left").contentWindow.ChangeMeneNodeColor(lastTreeNode);
                document.getElementById("left").contentWindow.ResetLevelSpanColor(lastTreeNode);
            }
        }
        function showMenu2(menuId, from) {
            var a = $("#tttt").attr("class");
            if (a.indexOf("on") != -1) {
                $("#tttt").attr("class", "usermain");
            } else {
                //$("#tttt").attr("class", "usermain on");
            }
            if (menuId == "20048") {
                $("#tttt").attr("class", "usermain on");
            }
            if (menuId != null) {
                $("#menuContent").css("display", "none");
                var url = "Home/Navigate.aspx?IsRemind=" + from + "&MenuID=" + menuId + "&ExtendType=&t=" + new Date().getTime();
                window.open(url, 'MainWindow');
            }
            if (lastTreeNode != null) {
                document.getElementById("left").contentWindow.ChangeMeneNodeColor(lastTreeNode);
                document.getElementById("left").contentWindow.ResetLevelSpanColor(lastTreeNode);
            }
        }
        function showMenu3(menuId, from,extendtype) {
            var a = $("#tttt").attr("class");
            if (a.indexOf("on") != -1) {
                $("#tttt").attr("class", "usermain");
            } else {
                //$("#tttt").attr("class", "usermain on");
            }
            if (menuId != null) {
                $("#menuContent").css("display", "none");
                if (menuId == 1515404 || menuId == 20031)
                    var url = "Navigate.aspx?IsRemind=" + from + "&MenuID=" + menuId + "&ExtendType=" + extendtype + "&t=" + new Date().getTime();
                else
                    var url = "Navigate.aspx?IsRemind=" + from + "&MenuID=" + menuId + "&ExtendType=&t=" + new Date().getTime();
                window.open(url, 'MainWindow');
            }
            if (lastTreeNode != null) {
                document.getElementById("left").contentWindow.ChangeMeneNodeColor(lastTreeNode);
                document.getElementById("left").contentWindow.ResetLevelSpanColor(lastTreeNode);
            }
        }
        function setCookie(name, value, days) {
            var date = new Date();
            date.setTime(date.getTime() + days * 24 * 3600 * 1000);//这里是微秒,格式化时间
            var expiresStr = "expires=" + date.toGMTString() + ';';
            document.cookie = name + "=" + encodeURIComponent(value) + ';' + expiresStr;
        }
        function getCookie(name) {
            var arr = document.cookie
                .match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
            if (arr != null)
                return decodeURIComponent(arr[2]);
            return null;
        }
        function delCookie(name) {
            var exp = new Date();
            exp.setTime(exp.getTime() - 1);
            var cval = getCookie(name);
            if (cval != null)
                document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
        }

    </script>
    <script type="text/javascript" src="Home/js/default.js"></script>
</body>
</html>
