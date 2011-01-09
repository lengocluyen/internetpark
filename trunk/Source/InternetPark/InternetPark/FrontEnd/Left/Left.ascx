<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Left.ascx.cs" Inherits="InternetPark.FrontEnd.Left.Left" %>
<%@ Register Src="Module/Categories.ascx" TagName="Categories" TagPrefix="uc1" %>
<%@ Register Src="Module/Books_Hightlight.ascx" TagName="Books_Hightlight" TagPrefix="uc2" %>
<%@ Register Src="Module/Books_More.ascx" TagName="Books_More" TagPrefix="uc3" %>
<div class="left">
    <uc1:Categories ID="Categories1" runat="server" />
    <div class="left_space">
        &nbsp;</div>
    <uc3:Books_More ID="Books_More1" runat="server" />
    <div class="left_space">
        &nbsp;
    </div>
    <uc2:Books_Hightlight ID="Books_Hightlight1" runat="server" />
</div>
