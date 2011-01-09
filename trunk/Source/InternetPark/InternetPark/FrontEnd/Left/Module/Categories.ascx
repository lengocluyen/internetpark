<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Categories.ascx.cs"
    Inherits="InternetPark.FrontEnd.Left.Module.Categories" %>
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
            <%=this.GetParentCategory() %>
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
<%--<div class="widget">
    <h2>
        Thể loại sách</h2>
    <img src="Images/line_category.png" height="6px" />
    <ul id="treemenu1" class="treeview">
        <%=this.GetParentCategory() %>        
    </ul>

    <script type="text/javascript">
        ddtreemenu.createTree("treemenu1",true);
    </script>

</div>--%>
