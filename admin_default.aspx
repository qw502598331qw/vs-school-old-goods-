<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_default.aspx.cs" Inherits="admin_default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
      <title>商品信息管理</title>
     <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="margin:0; padding:0;font-size:13px">
    <form id="form1" runat="server">
    <div>
    <h3 align="center" style="font-family: 华文行楷">后台管理</h3>
    <div style="width:100%; height:50px; line-height:50px; font-family: 华文隶书; font-size: 20px;" align="center">
    <a href="admin_default.aspx" style="font-family: 华文彩云">商品信息管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="admin_buy.aspx">买卖信息管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="admin_user.aspx">用户信息管理</a>
    
    </div>
    
    <div style="border-color: #00FF00; width:100%; height:500px" align="center" dir="ltr" lang="ab" >
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="15"  HeaderStyle-BackColor="#DEE8F4" HeaderStyle-BorderColor="#9FB6D5" BorderStyle="Solid" BorderColor="#A1B6D5" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" BackImageUrl="~/images/beijing1.jpg" >
            <Columns>
            <asp:BoundField HeaderText="商品id" DataField="Goodsid"/>
        <asp:BoundField HeaderText="商品标题" DataField="Goodstitle"/>
        <asp:BoundField HeaderText="内容" DataField="content" />
        <asp:BoundField HeaderText="联系人" DataField="contractman" />
        <asp:BoundField HeaderText="电话" DataField="phone" />
        <asp:BoundField HeaderText="电子邮件" DataField="email" />
        <asp:BoundField HeaderText="地址" DataField="address" />
        <asp:BoundField HeaderText="供求" DataField="buysell" />
        <asp:BoundField HeaderText="价格" DataField="price" />
        <asp:BoundField HeaderText="点击率" DataField="downcount" />
        <asp:BoundField HeaderText="发布日期" DataField="protime" DataFormatString="{0:yyyy-M-d}" HtmlEncode="False" />
        
        <asp:ButtonField CommandName="Delete" ButtonType="Button" Text="删除" HeaderText="操作" />
    </Columns>
        </asp:GridView>
    </div>
    </div>
    </form>
</body>
</html>
