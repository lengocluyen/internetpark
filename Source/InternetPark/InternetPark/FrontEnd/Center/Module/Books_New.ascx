<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Books_New.ascx.cs" Inherits="InternetPark.FrontEnd.Center.Module.Books_New" %>
<%@ Import Namespace="InternetPark.Core" %>
<div class="widget_center">
    <h2 style="text-transform: capitalize;">
        Sách Mới</h2>
    <img src="Images/line_center.png" />
    <br />
    <br />
    <div class="listbooks">
        <asp:Repeater ID="rptBooks" runat="server">
            <ItemTemplate>
                <div class="book">
                    <table class="photo-grid">
                        <tr>
                            <td>
                                <a href="?<%=InternetPark.Core._No_Change_Query.cate%>=<%# DataBinder.Eval(Container.DataItem,"CategoryID")%>&&<%=InternetPark.Core._No_Change_Query.book%>=<%# DataBinder.Eval(Container.DataItem,"BookID")%>&&<%=InternetPark.Core._No_Change_Query._view%>=true">
                                    <div class="pg-album grid_4 alpha">
                                        <img src="<%# DataBinder.Eval(Container.DataItem,"Image")%>" alt="image" /></div>
                                </a>
                            </td>
                        </tr>
                    </table>
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
                        <%#DataBinder.Eval(Container.DataItem,"IntroText")%>
                    </div>
                    <div class="bookdownload">
                        <a href="?<%=InternetPark.Core._No_Change_Query._down%>=download&<%=InternetPark.Core._No_Change_Query.book%>=<%#DataBinder.Eval(Container.DataItem,"BookID")%>"
                            target="_blank">Download</a> &nbsp; <a href="?<%=InternetPark.Core._No_Change_Query.cate%>=<%# DataBinder.Eval(Container.DataItem,"CategoryID")%>&&<%=InternetPark.Core._No_Change_Query.book%>=<%# DataBinder.Eval(Container.DataItem,"BookID")%>&&<%=InternetPark.Core._No_Change_Query._view%>=true">
                                Learn more</a>
                    </div>
                </div>
                <hr />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="clear">
    </div>
    <!--end List book-->
    <!-- pagination -->
    <div id="content">
        <div class="box">
            <%=this.paggingCollection %>
        </div>
    </div>
    <!--end pagination-->
    <div class="clear">
    </div>
</div>
