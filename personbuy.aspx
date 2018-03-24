<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personbuy.aspx.cs" Inherits="personinfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="uc1" TagName="left" Src="~/left.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Search" Src="~/search.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
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

#content #body1 #body1left #body1left1 {
	height: 162px;
}
.title {
	height: 26px;
	line-height: 26px;
	font-weight: bold;
	font-size: 13px;

}
#content #body1 #body1middle {
	float: right;
	width: 590px;
	border: 1px solid #FF6600;
	line-height: 20px;
	height: 500px;
}

.button
{
    line-height:30px;
    text-decoration: none;
    text-align:center;
}
.table
{
    padding:10px 0 0 5px;
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

	</div>
		<div id="logo">
	
	</div>
	<div id="body1">
		<div id="body1left">
			<div id="body1left1">
				<div class="title"><img src="images/in_le_top_01.gif" alt="图片" width="150" height="26" /></div>
				<uc1:left ID="left" runat="server" />
			</div>
			<div id="body1left2">
				<div class="title"><img src="images/in_le_top_02.gif"  alt="图片" width="150" height="26" /></div>
				<uc1:Search ID="Search" runat="server" />
			</div>
		</div>
		<div id="body1middle">
			<div class="title" style="border-bottom:1px #ff6600 solid"><img src="images/fe_ce_top_02.gif" style=" display:block; float:left;"  alt="图片" />已发布信息</div>
            <div class="table">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="username" DataSourceID="SqlDataSource1" EnableModelValidation="True" Font-Size="30px" ForeColor="Black" GridLines="None" Width="500px">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" SortExpression="username" />
                        <asp:BoundField DataField="goodtitle" HeaderText="goodtitle" SortExpression="goodtitle" />
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:marketConnectionString %>" SelectCommand="SELECT * FROM [buy]"></asp:SqlDataSource>
            </div>
		    </div>
	</div>
	

	<div id="foot">
	   计算机152&nbsp;&copy;&nbsp;鲍宸&nbsp;徐一成
	</div>
</div>
    </form>
</body>
</html>
