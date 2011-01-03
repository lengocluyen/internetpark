<%@ Page Language="C#" MasterPageFile="~/MasterPage_FE.Master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ Register Src="FrontEnd/Center/Center.ascx" TagName="Center" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:Center ID="Center1" runat="server" />
</asp:Content>
