<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Book_Detail.ascx.cs"
    Inherits="InternetPark.FrontEnd.Center.Module.Book_Detail" %>
<%@ Import Namespace="InternetPark.Core" %>
<div class="slide">
    <div class="slide_top">
        <div class="content_top_left">
        </div>
        <div class="content_top_body">
            Chi tiết sách
        </div>
        <div class="content_top_right">
        </div>
    </div>
    <div class="slide_body">
        <asp:Repeater ID="rptBook" runat="server">
            <ItemTemplate>
                <div class="book">
                    <div class="photo-grid">
                        <a href="?<%=InternetPark.Core._No_Change_Query.cate%>=<%# DataBinder.Eval(Container.DataItem,"CategoryID")%>&&<%=InternetPark.Core._No_Change_Query.book%>=<%# DataBinder.Eval(Container.DataItem,"BookID")%>&&<%=InternetPark.Core._No_Change_Query._view%>=true">
                            <div class="pg-album grid_4 alpha">
                                <img src="<%# DataBinder.Eval(Container.DataItem,"Image")%>" border="1px" alt="image" />
                            </div>
                        </a>
                    </div>
                    <div class="bookdetails">
                        <span class="booktitle"><a href="?<%=InternetPark.Core._No_Change_Query.cate%>=<%# DataBinder.Eval(Container.DataItem,"CategoryID")%>&&<%=InternetPark.Core._No_Change_Query.book%>=<%# DataBinder.Eval(Container.DataItem,"BookID")%>&&<%=InternetPark.Core._No_Change_Query._view%>=true">
                            <%#DataBinder.Eval(Container.DataItem,"Title")%></a></span>
                        <br />
                        <br />
                        <span class="bookdetail">Ngày cập nhật:
                            <%#DataBinder.Eval(Container.DataItem,"Created")%>
                            Lượt xem:
                            <%#DataBinder.Eval(Container.DataItem,"Hits")%>
                            Lượt tải:
                            <%#DataBinder.Eval(Container.DataItem,"Downloads")%>
                        </span>
                    </div>
                    <div class="bookintro">
                        <%#DataBinder.Eval(Container.DataItem, "IntroText")%>
                    </div>
                    <div class="bookintro" style="width: 100%; float: left;">
                        Nội dung:
                        <br />
                        <%#DataBinder.Eval(Container.DataItem,"FullText")%>
                    </div>
                    <div class="bookdownload1">
                        <a href="?<%=InternetPark.Core._No_Change_Query._down%>=download&<%=InternetPark.Core._No_Change_Query.book%>=<%#DataBinder.Eval(Container.DataItem,"BookID")%>"
                            target="_blank" title="Tải sách">
                            <img src="Images/img_button_download.png" border="0" align="Download" /></a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <%if (release > 0)
          { %>
        <div class="bookdownload1" style="text-align: left; padding: 10px 0px 0px 0px;">
            File đính kèm:
            <ul style="padding: 10px 0px 3px 25px;">
                <asp:Repeater ID="rptExtensionFile" runat="server">
                    <ItemTemplate>
                        <li style="padding: 5px 0px 5px 0px;"><a href="<%#DataBinder.Eval(Container.DataItem,"_AttributeValue.Value")%>"
                            target="_blank">
                            <%#DataBinder.Eval(Container.DataItem,"_Attribute.Name")%></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <%} %>
        <div class="book_release">
            <hr align="center" width="90%" />
            Các sách liên quan:
            <ul>
                <asp:Repeater ID="rptRelease" runat="server">
                    <ItemTemplate>
                        <li>
                            <img src="../../../Images/collapse.gif" alt="icon" border="0" />&nbsp;&nbsp;&nbsp;
                            <a href="?<%=InternetPark.Core._No_Change_Query.cate%>=<%# DataBinder.Eval(Container.DataItem,"CategoryID")%>&&<%=InternetPark.Core._No_Change_Query.book%>=<%# DataBinder.Eval(Container.DataItem,"BookID")%>&&<%=InternetPark.Core._No_Change_Query._view%>=true">
                                <%# DataBinder.Eval(Container.DataItem,"Title")%></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>        
    </div>
    <div class="slide_bottom">
        <div class="content_bottom_left">
        </div>
        <div class="content_bottom_body">
        </div>
        <div class="content_bottom_right">
        </div>
    </div>
</div>
