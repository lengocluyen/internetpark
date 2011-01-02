<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Banner.ascx.cs" Inherits="InternetPark.FrontEnd.Banner.Banner" %>
<div class="banner_container">
    <div class="space">
        &nbsp;</div>
    <div style="float: left; width: 100%">
        <div class="menu">
            <ul>
                <li>
                    <img src="Images/menu1.png" /></li>
                <li>
                    <img src="Images/menu2.png" /></li>
                <li>
                    <img src="Images/menu3.png" /></li>
            </ul>
        </div>
        <div class="search">
            <div style="width: 310px; text-align: left; float: left;">
                <asp:TextBox ID="txtSearch" runat="server" Width="300px"></asp:TextBox></div>
            &nbsp;&nbsp;
            <div style="width: 110px; float: left;text-align:right;">
                <asp:LinkButton ID="lnkSearch" runat="server" Height="25px">
                <img src="Images/btn_search.png" /></asp:LinkButton></div>
        </div>
    </div>
</div>
