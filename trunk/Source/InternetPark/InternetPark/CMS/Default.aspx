﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/CMS/Admin.Master" CodeBehind="Default.aspx.cs" Inherits="InternetPark.CMS.Default" %>
<%@ Register Src="~/CMS/UserControl/ContentDemo.ascx" TagName="ContentDemo" TagPrefix="UC" %>

<asp:Content ID="header" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="icontent" ContentPlaceHolderID="Content" runat="server">
<UC:ContentDemo ID="idContent" runat="server" />
</asp:Content>