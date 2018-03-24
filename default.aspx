<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="Deskop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register TagPrefix="uc1" TagName="Search" Src="Search.ascx" %>
<%@ Register TagPrefix="uc1" TagName="left" Src="left.ascx" %>
<%@ Register TagPrefix="uc1" TagName="HotProductor" Src="HotProductor.ascx" %>
<%@ Register TagPrefix="uc1" TagName="TOP10" Src="TOP10.ascx" %>
<%@ Register TagPrefix="uc1" TagName="cj" Src="cj.ascx" %>
<%@ Register TagPrefix="uc1" TagName="GL" Src="GL.ascx" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="head_foot.css" rel="Stylesheet" type="text/css" />
<style type="text/css">


#content #body1 {
	height: 500px;
	width: 780px;
}
#content #body2 {
	height: 1000px;
	width: 760px;
	padding-right: 20px;
}

#content #body1 #body1left {
	float: left;
	width: 150px;
	height: 500px;
	border:1px solid #FF7600;
}
#content #body1 #body1right {
	float: right;
	height: 500px;
	width: 150px;
	text-decoration: none;
	border:1px solid #FF7600;
	
}




#content #body1 #body1left #body1left1 {
	height: 162px;
        width: 186px;
    }
.title {
	height: 26px;
}
#content #body1 #body1middle {
	float: right;
	width: 460px;
}
.jiange {
	float: right;
	height: 500px;
	width: 10px;
}

#content #body1 #body1middle #body1middle2 {
	height: 200px;
}

#content #body2 #body2Left {
	float: left;
	height: 500px;
	width: 150px;
}
#content #body2 .body2content {
	height: 1000px;
	width: 285px;
	float: right;
}
#content #advertisement {
	height: 60px;
}
#content #body2 #body2Left .leftContent {
	height: 220px;
}
#content #body2 .body2content .body2Feilei {
	height: 174px;
	line-height:20px;
}


 .auto-style1 {
            width: 220px;
            height: 107px;
        }
    



    </style>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>校园旧货交易</title>
</head>
<body>
    <form id="form1" runat="server">
<div id="content">
	<div id="head">
		<ul>
		<li class="daohang"><a href="default.aspx" class="cssA">首页</a></li>		
		<li class="daohang"><a href="AddProductor.aspx" class="cssA">信息发布</a></li>
		<li class="daohang"><a href="aboutus.aspx" class="cssA">关于网站</a></li>
		<li class="daohang"><a href="register.aspx" class="cssA">注册</a></li>
		    <li class="daohang"><a href="help.aspx" class="cssA">帮助</a></li>
		
	        <li></li>
		
	</ul>

	    <img alt="logo" class="auto-style1" src="images/logo.png" /></div>
	<div id="logo">
	
	</div>
	<div id="body1">
		<div id="body1left">
			<div id="body1left1">
				<div class="title"><img alt="pic" src="images/in_le_top_01.gif" width="150" height="26" /></div>
				<div>
				    <uc1:left ID="left" runat ="server" />
				</div>
			</div>
			<div id="body1left2">
				<div class="title"><img alt="pic" src="images/in_le_top_02.gif" width="150" height="26" /></div>
				<uc1:Search ID="Search" runat ="server" />
			</div>
		</div>
		<div id="body1right">
			<div class="title"><img alt="pic" src="images/fe_le_top_02.gif" width="150" height="26" /></div>
			<div><uc1:HotProductor ID="HotProductor" runat="server" /></div>
		</div>
		<div id="body1middle">
			<div id="body1middle1">
				<div class="title"><img alt="pic" src="images/fe_le_top_01.gif" width="170" height="26" /><asp:ImageButton ID="ImageButton1" runat="server" Height="23px" ImageUrl="~/images/denglu.gif" PostBackUrl="~/admin_login.aspx" Width="75px" />
                </div>
				<div id="newPro">
				    <uc1:TOP10 ID="TOP10" runat ="server" />
				</div>
			</div>
		</div>
		
	</div>
	<div style="width:780px;">
	<div>
    <table border="0" cellspacing="0" cellpadding="0" style="font-size:12px;">
      <tr>
        <td style="width:120px; height:115px"><%=picImg[0]%></td>
        <td style="width:120px"><%=picImg[1] %></td>
        <td style="width:120px"><%=picImg[2]%></td>
        <td style="width:120px"><%=picImg[3]%></td>
        <td style="width:120px"><%=picImg[4]%></td>
        <td style="width:120px"><%=picImg[5]%></td>
        <td style="width:120px"><%=picImg[6]%></td>
      </tr>
      <tr>
        <td style="text-align:center"><%= picName[0] %></td>
        <td style="text-align:center"><%= picName[1] %></td>
        <td style="text-align:center"><%= picName[2] %></td>
        <td style="text-align:center"><%= picName[3] %></td>
        <td style="text-align:center"><%= picName[4] %></td>
        <td style="text-align:center"><%= picName[5] %></td>
        <td style="text-align:center"><%= picName[6] %></td>
      </tr>
    </table>
    </div>

	</div>
	<div id="friendweb">
	    友情链接/>
	    <a href="http://jwxt.nit.net.cn/default2.aspx" target="_blank">浙江大学宁波理工教务系统</a>
	    <a href="http://xgxt.nit.net.cn/xgxt/" target="_blank">浙江大学宁波理工学工系统</a>
	</div>

	<div id="foot">
	   计算机152&nbsp;&copy;&nbsp;鲍宸&nbsp;徐一成
	     
        <br />
	    <a href="admin_login.aspx">管理员登录</a>
	</div>
</div>
    </form>
</body>
</html>
