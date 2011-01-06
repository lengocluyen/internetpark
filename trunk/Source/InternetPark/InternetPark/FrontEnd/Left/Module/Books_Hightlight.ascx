<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Books_Hightlight.ascx.cs"
    Inherits="InternetPark.FrontEnd.Left.Module.Books_Hightlight" %>
<%@ Import Namespace="InternetPark.Core" %>
<div class="widget">
    <h2>
        Danh mục sách</h2>
    <img src="Images/line_category.png" height="6px" />
    <ul class="treeview">
        <li><a href="?<%=InternetPark.Core._No_Change_Query._more%>=new_books">Sách mới cập nhật</a></li>
        <li><a href="?<%=InternetPark.Core._No_Change_Query._more%>=more_view">Xem nhiều nhất</a></li>
        <li><a href="?<%=InternetPark.Core._No_Change_Query._more%>=more_download">Tải nhiểu nhất</a></li>
    </ul>
</div>
