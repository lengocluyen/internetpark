<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="InternetPark.FrontEnd.Banner.Menu" %>
<div style="width: 100%">
    <div class="topmenu_left">
    </div>
    <div class="topmenu_body">
        <div class="menu_item">
            <a href="?<%=InternetPark.Core._No_Change_Query.menu%>=1">Trang chủ</a></div>
        <div class="menu_item">
            <a href="http://it.dlu.edu.vn" target="_blank">Elearning</a></div>
        <div class="menu_item">
            <a href="http://it.dlu.edu.vn" target="_blank">Trung tâm CNTT</a></div>
        <div class="menu_item" style="float: right;">
            <div style="float: left; width: 100%; height: 7px">
                &nbsp;</div>
            <div style="float: left;">
                <div class="search_textbox_left">
                </div>
                <div class="search_textbox_body">
                    <input type="text" class="search_textbox_body" style="border: 0px;" id="txtNameBook" />
                </div>
                <div class="search_textbox_right">
                </div>
            </div>
            <div class="search_btn">
                <a href="?<%=InternetPark.Core._No_Change_Query.type%>=<%=InternetPark.Core._No_Change_Query.searchBooks%>&&<%=InternetPark.Core._No_Change_Query.searchValue%>=sach">
                    <img src="Images/btn_search.png" alt="search" border="0" />
                </a>
            </div>
        </div>
    </div>
    <div class="topmenu_right">
    </div>
</div>
