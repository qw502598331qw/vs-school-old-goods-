<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="SearchResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="uc1" TagName="left" Src="~/left.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Search" Src="~/search.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="head_foot.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">

#content #body1 {
	height: 490px;
	width: 755px;
	padding: 10px 20px 0 5px;
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
	height: 500px;
	border: 1px solid #FF6600;

}


#content #body1 #body1middle .proName {
	font-family: "黑体";
	line-height: 40px;
	font-size: 16px;
	color: #666666;
}
.backimage {
	background-image: url(images/title.gif);
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
	<img alt="logo" src="images/logo.jpg" />
	</div>
	<div id="body1">
		<div id="body1left">
			<div id="body1left1">
				<div class="title"><img src="images/in_le_top_01.gif"  width="150" height="26" /></div>
				<uc1:left ID="left" runat="server" />
			</div>
			<div id="body1left2">
				<div class="title"><img src="images/in_le_top_02.gif" width="150" height="26" /></div>
				<uc1:Search ID="Search" runat="server" />
			</div>
		</div>
		<div id="body1middle">
			<div class="title" style="border-bottom:1px #ff6600 solid"><img src="images/fe_ce_top_02.gif" style=" display:block; float:left;" />信息内容</div>
			<span class="proName">搜索结果</span>			
			<div class="title backimage" >商品</div>
            <asp:GridView ID="searchreusltgv" runat="server" Width="590px" AutoGenerateColumns="false" AllowPaging="true" PageSize="3" OnPageIndexChanging="searchreusltgv_PageIndexChanging" ShowFooter="True">
                <AlternatingRowStyle BackColor="LightGray" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>方式</HeaderTemplate>
                        <ItemTemplate><%# DataBinder.Eval(Container .DataItem,"buysell") %></ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField>
                    <HeaderTemplate>标题</HeaderTemplate>
                    <ItemTemplate><a href='detail.aspx?goodsid=<%# DataBinder.Eval(Container.DataItem,"goodsid") %>'><%# DataBinder.Eval(Container.DataItem,"goodstitle") %></a></ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="contractman" HeaderText="姓名" />
                   <asp:BoundField DataField="DownCount" HeaderText="单击" />
                   <asp:BoundField DataField ="protime" HeaderText="日期" />
                </Columns>
            </asp:GridView>
			
		</div>
		
	</div>
	<div id="friendweb">
	    友情链接<br />
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
