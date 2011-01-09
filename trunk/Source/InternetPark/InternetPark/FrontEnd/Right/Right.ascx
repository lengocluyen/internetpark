<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Right.ascx.cs" Inherits="InternetPark.FrontEnd.Right.Right" %>
<%@ Register Src="Module/Interesting_Books.ascx" TagName="Interesting_Books" TagPrefix="uc1" %>
<%@ Register Src="Module/Link.ascx" TagName="Link" TagPrefix="uc2" %>
<div style="float: left; width: 185px;">
    <uc1:Interesting_Books ID="Interesting_Books1" runat="server" />
    <div class="left_space">
        &nbsp;
    </div>
    <uc2:Link ID="Link1" runat="server" />
</div>
