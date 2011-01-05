<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs"
    Inherits="InternetPark.FrontEnd.Left.Module.WebUserControl1" %>
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

//ddtreemenu.createTree(treeid, enablepersist, opt_persist_in_days (default is 1))
ddtreemenu.createTree("treemenu1", true)



    </script>