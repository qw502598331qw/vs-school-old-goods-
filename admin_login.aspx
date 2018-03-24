<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员登录</title>
     <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
    	#admin_denglu
		{
			width:340px;
			height:153px;
			background-image:url(images/new_denglu.jpg);
			background-repeat: no-repeat;
			padding:120px 0 0 140px;
			font-size:12px;
			margin:100px auto;
		}
    </style>
</head>
<body>
    <form id="form1" runat="server">
<div id="admin_denglu">
    用户名: <asp:TextBox ID="userNameTxt" runat="server" Width="125px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rv1" runat="server" ErrorMessage="请先填写用户名" ControlToValidate="userNameTxt" Display="dynamic"></asp:RequiredFieldValidator><br /><br />
    密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<asp:TextBox ID="userPwdTxt" runat="server" Width="125px" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rv2" runat="server" ErrorMessage="请先输入密码" ControlToValidate="userPwdTxt" Display="dynamic"></asp:RequiredFieldValidator><br /><br />
    <span style=" width:20px; display:block; float:left"></span>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="loginBt" runat="server" ImageUrl="~/images/denglu.gif" OnClick="loginBt_Click" />
   <br />
    <asp:Label ID="infornlabel" runat="server" ForeColor="Red"></asp:Label>
</div>
    </form>
</body>
</html>
