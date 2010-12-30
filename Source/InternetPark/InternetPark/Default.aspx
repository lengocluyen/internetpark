<%@ Page Language="C#" MasterPageFile="~/MasterPage_FE.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="InternetPark.Default" Title="Untitled Page" %>

<%@ Register Src="FrontEnd/Center/Center.ascx" TagName="Center" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Center ID="Center1" runat="server" />
</asp:Content>
