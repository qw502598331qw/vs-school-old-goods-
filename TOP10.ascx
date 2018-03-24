<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TOP10.ascx.cs" Inherits="TOP10" %>
<asp:Panel ID="Panel1" runat="server" Height="128px" Width="120px" HorizontalAlign="left" >
    <asp:DataList ID="HotProDl" runat="server" RepeatColumns ="3" HorizontalAlign ="center" Width="460px" >
        <ItemTemplate>
            <a href='Detail.aspx?goodsid=<%#DataBinder.Eval(Container.DataItem,"goodsid") %>&goodstitle=<%#DataBinder.Eval(Container.DataItem,"goodstitle") %>' style="text-decoration: none; line-height:30px">
            <%#Limit ((string)DataBinder.Eval(Container.DataItem, "goodstitle"),DataBinder.Eval(Container.DataItem, "buysell").ToString ())%></a>
            
        </ItemTemplate>
    
    </asp:DataList>
</asp:Panel>
