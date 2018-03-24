<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SendInfo.ascx.cs" Inherits="SendInfo" %>
<div style="width:360px; height:104px; font-size:12px; background-color: whitesmoke;">
    网名:<asp:TextBox ID="txtNetName" runat="server"></asp:TextBox>(必要栏位)<br />
    电话:<asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    <asp:RangeValidator ID="phoneva" runat="server" ErrorMessage="请输入数字,并且保证位数!" ControlToValidate ="txtPhone" Type="double" MinimumValue="10000" MaximumValue="14000000000" Display="dynamic" EnableClientScript="false"></asp:RangeValidator><br />
    留言:
    <textarea id="txtContent" style="width: 230px; height: 50px" runat ="server"></textarea>(必要栏位)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
        ID="Button1" runat="server" Text="留言" OnClick="Button1_Click" /><br />
    <asp:Label ID="lbInfo" runat="server" Text=""></asp:Label></div>
