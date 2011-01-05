<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Categories.ascx.cs"
    Inherits="InternetPark.FrontEnd.Left.Module.Categories" %>
<div class="widget">
    <h2>
        Thể loại sách</h2>
    <img src="Images/line_category.png" height="6px" />
    <ul id="treemenu1" class="treeview">
        <%=this.GetParentCategory() %>
        <%--<li>Công nghệ phần mềm
            <ul>
                <li><a href="#">Công nghệ phần mềm</a></li>
                <li><a href="#">Hướng đối tượng</a></li>
            </ul>
        </li>
        <li>Mạng và truyền thông
            <ul>
                <li><a href="#">Routing</a></li>
                <li><a href="#">VPN</a></li>
            </ul>
        </li>
        <li>English
            <ul>
                <li><a href="#">TOEIC</a></li>
                <li><a href="#">iBT</a></li>
            </ul>
        </li>--%>
    </ul>

    <script type="text/javascript">
        ddtreemenu.createTree("treemenu1",true);
    </script>

</div>
