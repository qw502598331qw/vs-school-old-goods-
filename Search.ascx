<%@ Control Language="C#" AutoEventWireup="false" CodeFile="Search.ascx.cs" Inherits="Search" %>
<asp:Panel ID="SearchPanel" runat="server" Height="180px" Width="150px">
<div style=" font-size:12px;">
    <p>关键字&nbsp;<asp:TextBox ID="txtKeyword" runat="server" Width="92px"></asp:TextBox><br /><br />
        <br />
        <asp:RadioButtonList ID="SearchType" runat="server">
        <asp:ListItem Value="title" Selected="true" >信息标题</asp:ListItem>
        <asp:ListItem Value ="content" >信息内容</asp:ListItem>
        </asp:RadioButtonList><br /><br />分类&nbsp;<asp:DropDownList ID="DropFenlei" runat="server" Width="110px">
        
        </asp:DropDownList><br /><br />
        时间&nbsp;<asp:DropDownList ID="DropTime" runat="server" Width="110px">
            <asp:ListItem Value="1">近一天</asp:ListItem>
            <asp:ListItem Value="2">近二天</asp:ListItem>
            <asp:ListItem Value="3">近三天</asp:ListItem>
            <asp:ListItem Value="4">近四天</asp:ListItem>
            <asp:ListItem Value="5">近五天</asp:ListItem>
            <asp:ListItem Value="6">近六天</asp:ListItem>
            <asp:ListItem Value="7">近一周</asp:ListItem>
            <asp:ListItem Value="8">全部</asp:ListItem>
        
        </asp:DropDownList><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click" CausesValidation="False" /></p>

    <asp:Label ID="infolabel" runat="server" ForeColor="Red"></asp:Label>
</div>
</asp:Panel>
