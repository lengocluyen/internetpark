<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Center.ascx.cs" Inherits="FrontEnd_Center_Center" %>

<%@ Register src="Module/Book_Detail.ascx" tagname="Book_Detail" tagprefix="uc1" %>

<asp:Panel ID="CenterPanel" runat="server">
    <uc1:Book_Detail ID="Book_Detail1" runat="server" />
</asp:Panel>