<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Books_More.ascx.cs"
    Inherits="InternetPark.FrontEnd.Left.Module.Books_More" %>
<%@ Import Namespace="InternetPark.Core" %>
<div class="cate_left">
    <div class="cate_top">
        <div class="cate_top_left">
        </div>
        <div class="cate_top_body">
            Danh mục sách</div>
        <div class="cate_top_right">
        </div>
    </div>
    <div class="cate_body">
        <ul id="treemenu1" class="treeview">
            <li><a href="?<%=InternetPark.Core._No_Change_Query.type%>=<%=InternetPark.Core._No_Change_Query.newBooks%>">
                Sách mới</a></li>
            <li><a href="?<%=InternetPark.Core._No_Change_Query.type%>=<%=InternetPark.Core._No_Change_Query.viewMore%>">
                Sách xem nhiều</a></li>
            <li><a href="?<%=InternetPark.Core._No_Change_Query.type%>=<%=InternetPark.Core._No_Change_Query.downloadMore%>">
                Sách tải nhiều</a></li>
        </ul>

        <script type="text/javascript">
        ddtreemenu.createTree("treemenu1",true);
        </script>

    </div>
    <div class="cate_bottom">
        <div class="cate_bottom_left">
        </div>
        <div class="cate_bottom_body">
        </div>
        <div class="cate_bottom_right">
        </div>
    </div>
</div>
