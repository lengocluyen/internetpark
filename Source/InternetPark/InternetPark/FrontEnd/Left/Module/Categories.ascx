<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Categories.ascx.cs"
    Inherits="InternetPark.FrontEnd.Left.Module.Categories" %>
<div class="widget">
    <h2>
        Thể loại sách</h2>
    <img src="Images/line_category.png" height="6px" />
    
<ul id="treemenu1" class="treeview">
        <li>Item 1</li>
        <li>Item 2</li>
        <li>Folder 1
            <ul>
                <li>Sub Item 1.1</li>
                <li>Sub Item 1.2</li>
            </ul>
        </li>
        <li>Item 3</li>
        <li>Folder 2
            <ul>
                <li>Sub Item 2.1</li>
                <li>Folder 2.1
                    <ul>
                        <li>Sub Item 2.1.1</li>
                        <li>Sub Item 2.1.2</li>
                    </ul>
                </li>
            </ul>
        </li>
        <li>Item 4</li>
    </ul>
    <script type="text/javascript">
        ddtreemenu.createTree("treemenu1",true);
    </script>

</div>
