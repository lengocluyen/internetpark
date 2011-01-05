<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Statistics.ascx.cs"
    Inherits="InternetPark.CMS.UCFunction.Statistics" %>
<div id="right">
    <div class="box box-left">
        <!-- box / title -->
        <div class="title">
            <h5>
                Thống kê người dùng website</h5>
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
                        <th class="left">
                            Tên thông tin
                        </th>
                        <th class="last">
                            Thông số
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="title">
                            Tổng số truy cập
                        </td>
                        <td class="last">
                            <%=Application["totalvisits"]%>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">
                            Số người online
                        </td>
                        <td class="last">
                            <%=Application["online"]%>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">
                            Số truy cập trong ngày
                        </td>
                        <td class="last">
                            <%=Application["totalvisitsday"]%>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">
                            Số truy cập trong tuần
                        </td>
                        <td class="last">
                            <%=Application["totalvisitsweek"]%>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">
                            Số truy cập trong tháng
                        </td>
                        <td class="last">
                            <%=Application["totalvisitsmonth"]%>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="box box-right">
        <!-- box / title -->
        <div class="title">
            <h5>
                Thống kê danh mục sách</h5>
            <div class="search">
                <div class="input">
                    <input type="text" id="Text1" name="search" />
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
                        <th class="left">
                            Tên thông tin
                        </th>
                        <th class="last">
                            Số lượng
                        </th>
                    </tr>
                </thead>
               
                <asp:Repeater ID="rpCategory" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="title">
                                <%# DataBinder.Eval(Container.DataItem,"Name") %>
                            </td>
                            <td class="last">
                                <%# this.GetCountBookByCategory(DataBinder.Eval(Container.DataItem,"CategoryID")) %>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
    <div class="box box-left">
    <!-- box / title -->
    <div class="title">
        <h5>
        Thông tin người dùng
            </h5>
      <div class="search">
                    <div class="input">
                        <input type="text" id="Text2" name="search" />
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
                    <th class="left">
                        Thông tin
                    </th>
                    <th class="last">
                        Thông số
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="title">
                        Email người dùng
                    </td>
                    <td class="last">
                    <%=this._userSession.CurrentMember.Email %>
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        Quyền người dùng
                    </td>
                    <td class="last">
                    <%=this._userSession.RoleCurrentUser.Name %>
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        Thời điểm đăng nhập
                    </td>
                    <td class="last">
                    <%= this._userSession.TimeUserLogin.ToString("hh:ss - dd/MM/yyyy")%>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="box box-right">
    <!-- box / title -->
    <div class="title">
        <h5>
        Thống kê thông tin kho sách
            </h5>
      <div class="search">
                    <div class="input">
                        <input type="text" id="Text3" name="search" />
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
                    <th class="left">
                        Thông tin
                    </th>
                    <th class="last">
                        Thông số
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="title">
                        Tổng số sách trong hệ thống
                    </td>
                    <td class="last">
                    <%=totalBook %>
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        Tổng số lượt tải sách
                    </td>
                    <td class="last">
                    <%=totalDownload %>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</div>
