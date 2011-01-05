<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftContent.ascx.cs"
    Inherits="InternetPark.CMS.UserControl.LeftContent" %>
<!-- end content / left -->
<div id="left">
    <div id="menu">
        <h6 id="h-menu-ebook" class="selected">
            <a href="#ebook"><span>Ebook</span></a></h6>
        <ul id="menu-ebook" class="opened">
            <li><a href="../CMS/CMSBooks.aspx">Danh sách EBook</a></li>
            <li><a href="../CMS/CMSBooks.aspx?do=addmany">Import Ebook</a></li>
            <li><a href="../CMS/CMSBooks.aspx?do=add">Thêm Ebook</a></li>
        </ul>
        <h6 id="h-menu-category">
            <a href="#category"><span>Category</span></a></h6>
        <ul id="menu-category" class="closed">
            <li><a href="../CMS/CMSCategories.aspx">Danh sách Category</a></li>
            <li><a href="../CMS/CMSCategories.aspx?do=add">Thêm Category</a></li>
        </ul>
        <h6 id="h-menu-user">
            <a href="#user"><span>Người dùng</span></a></h6>
        <ul id="menu-user" class="closed">
            <li><a href="../CMS/CMSUsers.aspx">Danh sách người dùng</a></li>
            <li class="last"><a href="../CMS/CMSUsers.aspx?do=add">Thêm người dùng</a></li>
        </ul>
        <h6 id="h-menu-role">
            <a href="#role"><span>Quyền</span></a></h6>
        <ul id="menu-role" class="closed">
            <li><a href="../CMS/CMSRoles.aspx">Danh sách quyền</a></li>
            <li class="last"><a href="../CMS/CMSRoles.aspx?do=add">Quyền người dùng</a></li>
        </ul>
        <h6 id="h-menu-settings">
            <a href="#settings"><span>Settings</span></a></h6>
        <ul id="menu-settings" class="closed">
            <li class="last"><a href="../CMS/Default.aspx?do=setting">Manage Settings</a></li>
        </ul>
    </div>
    <div id="date-picker">
    </div>
</div>
<!-- end content / left -->
