<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GL.ascx.cs" Inherits="GL" %>
<asp:Panel ID="gonglue" runat="server" Height="200px" Width="150px">
    <asp:DataList ID="Dt_gonglue" runat="server" Width="150px" Height="200px">
    <ItemTemplate>
        <a href="gldetails.aspx?id=<%# DataBinder.Eval(Container.DataItem,"id") %>">.
        <%# Limit( (string)DataBinder.Eval(Container .DataItem ,"titles")) %> </a>
    </ItemTemplate>   
    
    </asp:DataList>

</asp:Panel>
