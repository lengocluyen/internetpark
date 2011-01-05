<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SystemSettings.ascx.cs"
    Inherits="InternetPark.CMS.UCFunction.SystemSettings" %>
<div id="right">
    <div class="box">
        <div class="title">
            <h5>
                Danh sách các thiết lập</h5>
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
                            Tên thiết lập
                        </th>
                        <th>
                            Thông số
                        </th>
                        <th style="width: 70px;">
                            Chỉnh sửa
                        </th>
                        <th class="selected last">
                            <input type="checkbox" class="checkall" />
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="name">
                            Số Item trên một trang người dùng
                        </td>
                        <td class="value">
                            <%=itemUser %>
                        </td>
                        <td align="center" class="edit">
                            <a href="Default.aspx?do=setting&type=ItemperPageUser">
                                <img src="../Images/edit.jpg" height="12px" alt="Chỉnh sửa" /></a>
                        </td>
                        <td class="selected last">
                            <input type="checkbox" />
                        </td>
                    </tr>
                    <tr>
                        <td class="name">
                            Số Item trên một trang quản trị
                        </td>
                        <td class="value">
                            <%=itemAdmin %>
                        </td>
                        <td align="center" class="edit">
                            <a href="Default.aspx?do=setting&type=ItemperPageAdmin">
                                <img src="../Images/edit.jpg" height="12px" alt="Chỉnh sửa" /></a>
                        </td>
                        <td class="selected last">
                            <input type="checkbox" />
                        </td>
                    </tr>
                    <tr>
                        <td class="name">
                            Địa chỉ gốc trang người dùng
                        </td>
                        <td class="value">
                            <%=rootURL%>
                        </td>
                        <td align="center" class="edit">
                            <a href="Default.aspx?do=setting&type=RootURL">
                                <img src="../Images/edit.jpg" height="12px" alt="Chỉnh sửa" /></a>
                        </td>
                        <td class="selected last">
                            <input type="checkbox" />
                        </td>
                    </tr>
                    <tr>
                        <td class="name">
                            Địa chỉ gốc trang quản trị
                        </td>
                        <td class="value">
                            <%=rootAdmin%>
                        </td>
                        <td align="center" class="edit">
                            <a href="Default.aspx?do=setting&type=AdminSiteURL">
                                <img src="../Images/edit.jpg" height="12px" alt="Chỉnh sửa" /></a>
                        </td>
                        <td class="selected last">
                            <input type="checkbox" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="action">
                <select name="action">
                    <option value="" class="locked">Comming soon</option>
                    <option value="" class="unlocked">Comming soon</option>
                    <option value="" class="folder-open">Comming soon</option>
                </select>
                <div class="button">
                    <input type="submit" name="submit" value="Thực thi lựa chọn" />
                </div>
            </div>
            <!-- end table action -->
        </div>
        <!--Edit Value-->
    </div>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
                <asp:Panel ID="pnItemUser" runat="server" Visible="false">
                    <div class="box">
                        <div class="title">
                            <h5>
                                Chỉnh sửa thiết lập</h5>
                        </div>
                        <div class="form">
                            <div class="fields">
                                <div class="field">
                                    <div class="label">
                                        <label for="input-medium">
                                            Nhập giá trị:</label>
                                    </div>
                                    <div class="input">
                                        <asp:TextBox ID="txtPages" runat="server" CssClass="medium"></asp:TextBox>
                                        &nbsp;&nbsp;
                                        <asp:RequiredFieldValidator ID="rfvUrl" runat="server" ControlToValidate="txtPages"
                                            SetFocusOnError="True" ErrorMessage="Chưa nhập!" Font-Bold="True" ValidationGroup="UsersGroup"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Nhập số &gt;0!"
                                            ControlToValidate="txtPages" MaximumValue="10000" MinimumValue="0" Type="Integer"
                                            Display="Dynamic" ValidationGroup="UsersGroup"></asp:RangeValidator>
                                    </div>
                                </div>
                                <div class="buttons">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"
                                        ValidationGroup="UsersGroup" />
                                    <input type="reset" id="ireset" name="reset" value="Reset" />
                                </div>

                                <script type="text/javascript">
                                    $(document).ready(function() {
                                        $("#ireset").Click(function() {
                                            $("#ctl00_Content_ctl00_txtPages").Value = "";
                                        })
                                    });
                                </script>

                            </div>
                        </div>
                    </div>
                </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<!-- end table -->
