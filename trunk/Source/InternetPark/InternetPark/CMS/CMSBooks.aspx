<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/CMS/Admin.Master" CodeBehind="CMSBooks.aspx.cs" Inherits="InternetPark.CMS.CMSBooks" %>


<%@ Register TagPrefix="UCPager" Namespace="InternetPark.Core" Assembly="InternetPark.Core" %>
<asp:Content ID="header" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="icontent" ContentPlaceHolderID="Content" runat="server">
    <div id="right" style="min-height: 550px;">
        <!-- table -->
        <div class="box">
            <!-- box / title -->
            <div class="title">
                <h5>
                    Danh sách</h5>
                <div class="search">
                    <div class="input">
                        <input type="text" id="search" name="search" />
                    </div>
                    <div class="button">
                        <input type="submit" name="submit" value="Search" />
                    </div>
                </div>
            </div>
            <!-- end box / title -->
            <div class="table">
                <table>
                    <thead>
                        <tr>
                            <th>Bìa sách
                            </th>
                            <th class="left">
                                Tên sách
                            </th>
                            <th>
                                Thể loại
                            </th>
                            <th>
                                Ngày Đăng
                            </th>
                            <th>Lượt tải</th>
                            <th>Điểm số</th>
                            <th style="width: 80px;">
                                Hoạt động
                            </th>
                            <th style="width: 70px;">
                                Chỉnh sửa
                            </th>
                            <th style="width: 50px;">
                                Xóa
                            </th>
                            <th class="selected last">
                                <input type="checkbox" class="checkall" />
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptBooks" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="Image">
                                    <%#DataBinder.Eval(Container.DataItem, "Image")%>
                                </td>
                                <td class="title">
                                    <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                </td>
                                 <td class="type">
                                    <%#this.GetCategoryBook(DataBinder.Eval(Container.DataItem,"BookID"))%>
                                </td>
                                <td class="created">
                                    <%#DataBinder.Eval(Container.DataItem, "Created")%>
                                </td>
                                <td class="download">
                                    <%#DataBinder.Eval(Container.DataItem, "Downloads")%>
                                </td>
                                <td class="hits">
                                    <%#DataBinder.Eval(Container.DataItem, "hits")%>
                                </td>
                                <td align="center" class="enable">
                                    <asp:RadioButton ID="rdButton" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "IsActive")%>' />
                                </td>
                                <td align="center" class="edit">
                                    <a href="CMSBooks.aspx?do=edit&aid=<%#DataBinder.Eval(Container.DataItem,"BookID")%>">
                                        <img src="../Images/edit.jpg" height="12px" alt="Chỉnh sửa" /></a>
                                </td>
                                <td align="center" class="delete">
                                    <a href="CMSBooks.aspx?do=del&aid=<%#DataBinder.Eval(Container.DataItem,"BookID")%>">
                                        <img src="../Images/delete.jpg" height="15px" alt="Xóa" /></a>
                                </td>
                                <td class="selected last">
                                    <asp:CheckBox ID="idCheck" runat="server" CssClass="delitem" />
                                    <asp:HiddenField ID="idHiddenField" Value='<%#DataBinder.Eval(Container.DataItem,"BookID")%>'
                                        runat="server" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <!-- pagination -->
                <div class="pagination pagination-left">
                    <div class="results">
                        <UCPager:Pager ID="pager" runat="server" />
                    </div>
                    <!-- table action -->
                    <div class="action" style="margin-top: 0px;">
                        <asp:DropDownList ID="ddlAct" runat="server">
                            <asp:ListItem>Xóa item đánh dấu</asp:ListItem>
                            <asp:ListItem>Kích hoạt item đánh dấu</asp:ListItem>
                            <asp:ListItem>Hủy kích hoạt item đánh dấu</asp:ListItem>
                        </asp:DropDownList>
                        <%-- <select name="action" id="ddlAction" runat="server">
                            <option value="" class="locked">Xóa item đánh dấu</option>
                            <option value="" class="unlocked">Kích hoạt item đánh dấu</option>
                            <option value="" class="folder-open">...</option>
                        </select>--%>
                        <div class="button">
                            <asp:Button ID="btApply" runat="server" Text="Thực thi lựa chọn" OnClick="btApply_Click" />
                        </div>
                    </div>
                    <!-- end table action -->
                </div>
                <!-- end pagination -->
            </div>
        </div>
        <!-- end table -->
        <asp:PlaceHolder ID="phAddEditCategory" runat="server" />
    </div>
</asp:Content>
