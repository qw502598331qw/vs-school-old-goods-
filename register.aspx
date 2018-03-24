<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="uc1" TagName="Search" Src="Search.ascx" %>
<%@ Register TagPrefix="uc1" TagName="left" Src="left.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>注册用户</title>
    <link href="head_foot.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">

#content #body1 {
	width: 755px;
	padding: 0px 20px 0 5px;
}
}
#content #foot {
	height: 50px;
	width: 780px;
}
#content #body1 #body1left {
	float: left;
	width: 150px;
	height: 500px;
	border: 1px solid #FF6600;
}
#content #body1 #body1right {
	float: right;
	height: 500px;
	width: 150px;
}

#content #body1 #body1left #body1left1 {
	height: 162px;
}
.title {
	height: 29px;
	line-height: 26px;
	font-weight: bold;
	font-size: 13px;

}
#content #body1 #body1middle {
	float: right;
	width: 590px;
	height: 500px;
	border: 1px solid #FF6600;
	line-height: 25px;
}

#content #body1 #body1middle .fillTable {
	padding-top: 10px;
	padding-left: 20px;
	list-style: none;
	
}
#content #body1 #body1middle .fillTable .fillTitle {
	float: left;
	width: 80px;
	display: block;
	
}

li{height:40px}
        .auto-style1 {
            width: 220px;
            height: 107px;
        }
    </style>
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
		
	</ul>

	    <img alt="logo" class="auto-style1" src="images/logo.png" /></div>
		<div id="logo">
	&nbsp;</div>
	<div id="body1">
		<div id="body1left">
			<div id="body1left1">
				<div class="title"><img src="images/in_le_top_01.gif" width="150" height="26" /></div>
				<uc1:left ID="left" runat ="server" />
			</div>
			<div id="body1left2">
				<div class="title"><img src="images/in_le_top_02.gif" width="150" height="26" /></div>
			    <uc1:Search ID="Search" runat ="server" />
			</div>
		</div>
		<div id="body1middle">
			<div class="title" style="border-bottom:1px #FF6600 solid"><img src="images/fe_ce_top_02.gif" style=" display:block; float:left;" />个人资料注册</div>
			<ul class="fillTable">
				<li ><span class="fillTitle">用户名*</span><input id="txtName" type="text" runat ="server" />
				<asp:RequiredFieldValidator ID="rvName" runat="server" EnableClientScript="true" ControlToValidate ="txtName" Text ="(必要栏位)"></asp:RequiredFieldValidator>
				</li>
				<li><span class="fillTitle">密码*</span><input id="txtPassword" type="password" runat ="server" />
				<asp:RequiredFieldValidator ID="rvPassword" runat="server" EnableClientScript="true" ControlToValidate ="txtPassword" Text ="(必要栏位)"></asp:RequiredFieldValidator>
				</li>
				<li><span class="fillTitle">确认密码*</span><input id="txtConfirmPassword" type="password" runat ="server"/>
				<asp:RequiredFieldValidator ID="rvConfirm" runat="server" EnableClientScript="true" ControlToValidate ="txtConfirmPassword" Text ="(必要栏位)"></asp:RequiredFieldValidator>
				</li>
				<li><span class="fillTitle">手机号码*</span><input id="txtPhone" type="text" runat ="server"/>
                <asp:RangeValidator ID="rvPhone" runat="server" ErrorMessage="请输入数字,并且保证位数!" ControlToValidate ="txtPhone" Type ="Double" MinimumValue="10000000000" MaximumValue="19000000000"></asp:RangeValidator>
				</li>
				<li><span class="fillTitle">用户性别</span><select id="dropdownSex" runat ="server">
				  <option value="m">男</option>
				  <option value="f">女</option></select></li>
				<li><span class="fillTitle">证件号码*</span><input id="txtNumber" type="text" runat ="server"/>
				<asp:RequiredFieldValidator ID="rvNumber" runat="server" EnableClientScript="true" ControlToValidate ="txtNumber" Text ="(必要栏位)"></asp:RequiredFieldValidator>
				</li>
				<li><span class="fillTitle">电子邮件*</span><input id="txtEMail" type="text" runat ="server"/>
                <asp:RegularExpressionValidator ID="rvMail" runat="server" ErrorMessage="(E-Mail格式错误!)" ControlToValidate ="txtEMail" ValidationExpression="^[a-zA-Z0-9]{1,}@[a-zA-Z0-9]{1,}\.(com|net|org|edu|mil|cn|cc)$"></asp:RegularExpressionValidator>
			</li>
			</ul>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="取消" CausesValidation="False" /> 
                <asp:Button ID="Button3" runat="server" Text="返回上页" CausesValidation="False" OnClick="Button3_Click" />
                <asp:Button ID="Button1" runat="server" Text="注册" OnClick="Button1_Click" Height="27px" /> <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbInfo" runat="server" Text="" ForeColor="Red"></asp:Label>
		    </div>
	</div>
	<div id="friendweb">
	    一<br />      
	   <a href="http://jwxt.nit.net.cn/default2.aspx" target="_blank">浙江大学宁波理工教务系统</a>
	    <a href="http://xgxt.nit.net.cn/xgxt/" target="_blank">浙江大学宁波理工学工系统</a>
	</div>

	<div id="foot">
	    计算机152&nbsp;&copy;&nbsp;鲍宸&nbsp;徐一成
	</div>
</div>
    </form>
</body>
</html>
