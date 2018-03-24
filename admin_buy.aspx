<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_buy.aspx.cs" Inherits="admin_user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>买卖信息管理</title>
     <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="margin:0; padding:0; font-size:13px">
    <form id="form1" runat="server">
    <div>
    <h3 align="center" style="font-family: 华文行楷">后台管理</h3>
    <div style="width:100%; height:50px; line-height:50px; font-family: 华文隶书; font-size: 20px;" align="center">
   <a href="admin_default.aspx">商品信息管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="admin_buy.aspx" style="font-family: 华文彩云">买卖信息管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="admin_user.aspx">用户信息管理</a>
    
    </div>
    
    <div style="width:100%; height:500px" align="center" >
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackImageUrl="~/images/beijing1.jpg" DataSourceID="SqlDataSource1" EnableModelValidation="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="319px">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="用户ID" SortExpression="username" />
                <asp:BoundField DataField="goodtitle" HeaderText="商品名称" SortExpression="goodtitle" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:marketConnectionString %>" SelectCommand="SELECT * FROM [buy]"></asp:SqlDataSource>
      
    </div>
    </div>
    </form>
</body>
</html>
