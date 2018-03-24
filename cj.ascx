<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cj.ascx.cs" Inherits="cj"%>

<asp:Panel ID="commonProblems" runat="server" Height="160px" Width="150px">
    <asp:DataList ID="DtProblems" runat="server">
    <ItemTemplate>
        <a href='cjdetails.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>' style="text-decoration: none" >·
				<%# Limit((string)DataBinder.Eval(Container.DataItem,"titles")) %>
			</a>
	</ItemTemplate>
    </asp:DataList>
</asp:Panel>
