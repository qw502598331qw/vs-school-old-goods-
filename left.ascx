<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="left" %>
<asp:Label ID="UserInfo" runat="server" Text="欢迎您,请登录!"></asp:Label>
<asp:Panel ID="WelPanel" runat="server" Height="136px" Width="164px">
<p style=" font-size:12px">&nbsp;用户名:<asp:TextBox ID="txtUserName" runat="server" BorderStyle="Groove" Width="96px"></asp:TextBox>&nbsp;&nbsp; </p>
<p style=" font-size:12px">&nbsp;密 码:&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPassword" runat="server" BorderStyle="Groove" Width="96px" TextMode="Password"></asp:TextBox></p>
    &nbsp;&nbsp;<asp:ImageButton ID="LoginButton" runat="server" ImageUrl="~/images/in_an_01.gif" OnClick="LoginButton_Click" CausesValidation="False" />&nbsp;&nbsp;<asp:ImageButton ID="RegInfoButton"
        runat="server" ImageUrl="~/images/in_an_02.gif" OnClick="RegInfoButton_Click" CausesValidation="False" /></asp:Panel>
<asp:Panel ID="UserDetails" runat="server" Height="128px" Width="144px" Visible="false">
    <p style=" line-height:32px; padding-left:25px; font-size:12px">
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CausesValidation="false">发布新的产品</asp:LinkButton><br />
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" CausesValidation="false">已购买产品</asp:LinkButton><br />
    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" CausesValidation="false">已发布信息</asp:LinkButton>
   </p>
    <p style=" line-height:32px; padding-left:25px; font-size:12px">
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClick="LinkButton1_Click">退出登录</asp:LinkButton>
        <br />
    </p>
</asp:Panel>
