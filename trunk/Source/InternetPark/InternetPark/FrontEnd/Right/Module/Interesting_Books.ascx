<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Interesting_Books.ascx.cs"
    Inherits="InternetPark.FrontEnd.Right.Module.Interesting_Books" %>
<div class="cate_left1">
    <div class="cate_top">
        <div class="cate_top_left">
        </div>
        <div class="cate_top_body">
            Sách tải nhiều</div>
        <div class="cate_top_right">
        </div>
    </div>
    <div class="cate_body1">
        <marquee scrollamount="2" behavior="scroll" direction="up" onmouseover="this.stop();"
            onmouseout="this.start();">
            
            <%=this.book %></div>
            <%--<div style="width:100%;">
            <a href="#">
                        <img src="Images/bia.jpeg" border="0" alt="Book" width="170px" height="200px" align="top" style="margin: 10px 0px 2px 5px;" /></a>
                        </div>
            <div style="width:100%;">
            <a href="#">
                        <img src="Images/bia.jpeg" border="0" alt="Book" width="170px" height="200px" align="top" style="margin: 10px 0px 2px 5px;" /></a>
            </div>
            <asp:Repeater ID="rptBook" runat="server">
                <ItemTemplate>
                    <a href="?<%=InternetPark.Core._No_Change_Query.cate%>=<%# DataBinder.Eval(Container.DataItem,"CategoryID")%>&&<%=InternetPark.Core._No_Change_Query.book%>=<%# DataBinder.Eval(Container.DataItem,"BookID")%>&&<%=InternetPark.Core._No_Change_Query._view%>=true" title="<%# DataBinder.Eval(Container.DataItem,"Title")%>">
                        <img src="<%# DataBinder.Eval(Container.DataItem,"Image")%>" border="0" alt="Book" width="170px" height="200px" align="top" style="margin: 10px 0px 2px 5px;" /></a>
                </ItemTemplate>
            </asp:Repeater>--%>
        </marquee>
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
