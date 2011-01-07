<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Book_Detail.ascx.cs"
    Inherits="InternetPark.FrontEnd.Center.Module.Book_Detail" %>
<%@ Import Namespace="InternetPark.Core" %>
<div class="widget_center">
    <h2>
        Chi tiết sách</h2>
    <img src="Images/line_center.png" />
    <br />
    <br />
    <div class="listbooks">
        <asp:Repeater ID="rptBook" runat="server">
            <ItemTemplate>
                <div class="book">
                    <div class="bookdetails">
                        <span class="booktitle">
                            <%#DataBinder.Eval(Container.DataItem,"Title")%></span><br />
                        <br />
                        <span class="bookdetail">Ngày cập nhật:
                            <%#DataBinder.Eval(Container.DataItem,"Created")%>
                            Lượt xem:
                            <%#DataBinder.Eval(Container.DataItem,"Hits")%>
                            Lượt tải:
                            <%#DataBinder.Eval(Container.DataItem,"Downloads")%>
                        </span>
                    </div>
                    <div class="bookdownload" style="text-align: left; padding: 10px 0px 5px 0px;">
                        <a href="?<%=InternetPark.Core._No_Change_Query._down%>=download&<%=InternetPark.Core._No_Change_Query.book%>=<%#DataBinder.Eval(Container.DataItem,"BookID")%>"
                            target="_blank">Download</a>
                    </div>
                    <div style="min-height: 200px;">
                        <div>
                            <table class="photo-grid">
                                <tr>
                                    <td>
                                        <a href="#">
                                            <div class="pg-album grid_4 alpha">
                                                <img src="<%# DataBinder.Eval(Container.DataItem,"Image")%>" alt="image" /></div>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="bookintro">
                            <%# DataBinder.Eval(Container.DataItem,"FullText")%>
                        </div>
                    </div>
                </div>
               
            </ItemTemplate>
        </asp:Repeater>
        <%if (release > 0)
          { %>
        <div class="bookdownload" style="text-align: left; padding: 10px 0px 0px 0px;">
            File đính kèm:
            <ul style="padding: 10px 0px 3px 25px;">
                <asp:Repeater ID="rptExtensionFile" runat="server">
                    <ItemTemplate>
                        <li style="padding: 5px 0px 5px 0px;"><a href="<%#DataBinder.Eval(Container.DataItem,"_AttributeValue.Value")%>"
                            target="_blank"><%#DataBinder.Eval(Container.DataItem,"_Attribute.Name")%></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <%} %>
         <hr />
        <div class="book_release">
            Các sách liên quan:
            <ul>
                <asp:Repeater ID="rptRelease" runat="server">
                    <ItemTemplate>
                        <li>
                            <img src="../../../Images/collapse.gif" alt="icon" border="0" />&nbsp;&nbsp;&nbsp;
                            <a href="?<%=InternetPark.Core._No_Change_Query.cate%>=<%#InternetPark.Core.BookCategory.GetBookCategoryByIdBook(LibConvert.ConvertToInt(DataBinder.Eval(Container.DataItem,"BookID"),0)).CategoryID%>&&<%=InternetPark.Core._No_Change_Query.book%>=<%# DataBinder.Eval(Container.DataItem,"BookID")%>&&<%=InternetPark.Core._No_Change_Query._view%>=true">
                                <%# DataBinder.Eval(Container.DataItem,"Title")%></a></li>
                        <%--<li>
                            <img src="../../../Images/collapse.gif" alt="icon" border="0" />&nbsp;&nbsp;&nbsp;<a
                                href="#">tap 1</a></li>
                        <li>
                            <img src="../../../Images/collapse.gif" alt="icon" border="0" />&nbsp;&nbsp;&nbsp;<a
                                href="#">tap 1</a></li>--%>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <div class="clear">
    </div>
</div>
