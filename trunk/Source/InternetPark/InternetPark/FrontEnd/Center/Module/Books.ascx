<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Books.ascx.cs" Inherits="InternetPark.FrontEnd.Center.Module.Books" %>
<%@ Import Namespace="InternetPark.Core" %>
<div class="slide">
    <div class="slide_top">
        <div class="content_top_left">
        </div>
        <div class="content_top_body">
            Sách
            <%=this.title %></div>
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
                    </a> </div>
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
                            target="_blank" title="Tải sách">
                            <img src="Images/img_button_download.png" border="0" align="Download" /></a>
                        &nbsp; <a href="?<%=InternetPark.Core._No_Change_Query.cate%>=<%# DataBinder.Eval(Container.DataItem,"CategoryID")%>&&<%=InternetPark.Core._No_Change_Query.book%>=<%# DataBinder.Eval(Container.DataItem,"BookID")%>&&<%=InternetPark.Core._No_Change_Query._view%>=true"
                            title="Xem chi tiết sách">
                            <img src="Images/img_button_more.png" border="0" alt="Learn More" /></a>
                    </div>
                    <hr />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        
        <div id="paging_content">
            <div class="box">
                <div class="pagination pagination-left">
                    <%=this.paggingCollection %>
                    <%--<div class="results">
                        <span style="text-align: right;">Page 1/206</span>
                    </div>
                    <ul class="pager grid_8">
                        <li class="disabled">&laquo;</li>
                        <li class="current">1</li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                        <li class="separator">...</li>
                        <li><a href="">206</a></li>                        
                        <li><a href="">&raquo;</a></li>
                    </ul>--%>
                </div>
            </div>
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
<%--<div class="widget_center">
    <h2 style="text-transform:capitalize;">
        Sách <%=this.title %></h2>
    <img src="Images/line_center.png" />
    <br />
    <br />
    <div class="listbooks">        
        <asp:Repeater ID="rptBook" runat="server">
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
                        <span class="bookdetail">Ngày cập nhật: <%#DataBinder.Eval(Container.DataItem,"Created")%> Lượt xem: <%#DataBinder.Eval(Container.DataItem,"Hits")%> Lượt tải:
                    <%#DataBinder.Eval(Container.DataItem,"Downloads")%> </span>
                    </div>
                    <div class="bookintro">
                        <%#DataBinder.Eval(Container.DataItem,"IntroText")%>
                    </div>
                    <div class="bookdownload">
                        <a href="?<%=InternetPark.Core._No_Change_Query._down%>=download&<%=InternetPark.Core._No_Change_Query.book%>=<%#DataBinder.Eval(Container.DataItem,"BookID")%>" target="_blank">Download</a> &nbsp; <a href="?<%=InternetPark.Core._No_Change_Query.cate%>=<%# DataBinder.Eval(Container.DataItem,"CategoryID")%>&&<%=InternetPark.Core._No_Change_Query.book%>=<%# DataBinder.Eval(Container.DataItem,"BookID")%>&&<%=InternetPark.Core._No_Change_Query._view%>=true">
                            Learn more</a>
                    </div>
                </div>
                <hr />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="clear">
    </div>
    
    <div id="content">
        <div class="box">
            
            <div class="pagination pagination-left">
            <%=this.paggingCollection %>
                <div class="results">
                    <span style="text-align:right;">Page 1/206</span>
                </div>
                <ul class="pager grid_8">
                    <li class="disabled">&laquo;</li>
                    <li class="current">1</li>
                    <li><a href="">2</a></li>
                    <li><a href="">3</a></li>
                    <li><a href="">4</a></li>
                    <li><a href="">5</a></li>
                    <li class="separator">...</li>
                    <li><a href="">206</a></li>
                    <!--<li><a href="">207</a></li>-->
                    <li><a href="">&raquo;</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="clear">
    </div>
</div>--%>
