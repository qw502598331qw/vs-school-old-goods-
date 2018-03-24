<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HotProductor.ascx.cs" Inherits="HotProductor" %>
<asp:Panel ID="Panel1" runat="server" Height="128px" Width="150px" HorizontalAlign="left">
    <asp:DataList ID="HotProDl" runat="server" Height ="104px" Width="145px" RepeatLayout="flow">
    <HeaderTemplate>
    <asp:Label ID="Label2"
        runat="server" Text="点击量"></asp:Label>
    </HeaderTemplate>
        <ItemTemplate>
        
            <a href='Detail.aspx?goodsid=<%# DataBinder.Eval(Container.DataItem,"goodsid") %>' style="text-decoration: none; line-height:30px">
            &nbsp;&nbsp;<%#DataBinder.Eval(Container.DataItem,"downcount")%>&nbsp;&nbsp;&nbsp;&nbsp;<%#Limit ((string)DataBinder.Eval(Container .DataItem ,"goodstitle")) %></a>
           
        </ItemTemplate>
    </asp:DataList>
</asp:Panel>
