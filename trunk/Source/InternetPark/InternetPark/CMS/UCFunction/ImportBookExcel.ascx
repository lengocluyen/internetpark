<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImportBookExcel.ascx.cs"
    Inherits="InternetPark.CMS.UCFunction.ImportBookExcelascx" %>
<div class="box">
    <!-- box / title -->
    <div class="title">
        <h5>
            Import thông tin sách từ Excel</h5>
    </div>
    <!-- end box / title -->
    <div class="form">
        <div class="fields">
           
            <div class="field">
                <div class="label">
                    <label for="file">
                        File Excel Import:</label>
                </div>
                <div class="input">
                    <asp:TextBox ID="txtUrl" CssClass="medium" runat="server"></asp:TextBox>
                    <div class="highlight">
                        <input type="reset" name="reset" value="Chọn file" onclick="open('FileManager.aspx?location=excel&idFill=<%=Server.UrlEncode(this.txtUrl.ClientID) %>&idSize=<%=Server.UrlEncode(this.txtSize.ClientID)%>','','menubar,width=640,height=480');" /></div>
                    <asp:RequiredFieldValidator ID="rfvUrl" runat="server" ControlToValidate="txtUrl"
                        SetFocusOnError="True" Font-Bold="True" ValidationGroup="UsersGroup"></asp:RequiredFieldValidator>
                </div>
            </div>
              <div class="field">
                <div class="label">
                    <label for="file">
                        Kích thước tập tin:</label>
                </div>
                <div class="input">
                    <asp:TextBox ID="txtSize" ReadOnly =true CssClass="small" runat="server"></asp:TextBox>
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
                    $("#ctl00_Content_ctl00_txtUrl").Value = "";
                    })
                });
            </script>

        </div>
    </div>
</div>
<asp:PlaceHolder ID="phListBook" Visible="false" runat="server">
<div class="box">
            <!-- box / title -->
            <div class="title">
                <h5>
                    Danh sách book</h5>
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
             <div runat="server" visible="false" id="idListbook">
                <div id="Div2" class="message message-notice">
                    <div class="image">
                        <img src="../../resources/images/icons/notice.png" alt="Notice" height="32" />
                    </div>
                    <div class="text">
                        <h6>
                            Thông báo</h6>
                        <span><asp:Label runat="server" ID="txtLable" Text=""></asp:Label></span>
                    </div>
                    <div class="dismiss">
                        <a href="#message-notice"></a>
                    </div>
                </div>
            </div>
            <div class="table">
                <table>
                    <thead>
                        <tr>
                            <th class="left">
                                Tên sách
                            </th>
                            <th>
                                Giới thiệu
                            </th>
                            <th class="last">URL</th>
                            
                           <%-- <th style="width: 80px;">
                                Hoạt động
                            </th>
                            <th style="width: 70px;">
                                Chỉnh sửa
                            </th>
                            <th style="width: 50px;">
                                Xóa
                            </th>--%>
                            <th class="selected last">
                                <input type="checkbox" class="checkall" />
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptBooks" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="title">
                                    <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                </td>
                                 <td class="type">
                                    <%#DataBinder.Eval(Container.DataItem,"IntroText")%>
                                </td>
                                <td class="last">
                                    <%#DataBinder.Eval(Container.DataItem, "URL")%>
                                </td>
                                <%--<td align="center" class="enable">
                                    <asp:RadioButton ID="rdButton" runat="server" Checked=true />
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
                                </td>--%>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <!-- pagination -->
                <div class="pagination pagination-left">
                    <div class="results">
                    
                      <%--<UCPager:Pager ID="pager" runat="server" />  --%>
                      
                    </div>
                    <!-- table action -->
                    <div class="action" style="margin-top: 0px;">
                    <b>Chọn Category cho Book</b>&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlAct" runat="server">
                            <%--<asp:ListItem>Xóa item đánh dấu</asp:ListItem>
                            <asp:ListItem>Kích hoạt item đánh dấu</asp:ListItem>
                            <asp:ListItem>Hủy kích hoạt item đánh dấu</asp:ListItem>--%>
                        </asp:DropDownList>
                          <div class="button">
                            <asp:Button ID="btApply" runat="server" Text="Lưu vào cơ sở dữ liệu" OnClick="btApply_Click" />
                        </div>
                    </div>
                    <!-- end table action -->
                </div>
                <!-- end pagination -->
            </div>
        </div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="phListBookError" Visible="false" runat="server">
<div class="box">
            <!-- box / title -->
            <div class="title">
                <h5>
                    Danh sách book thiếu thông tin</h5>
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
                                Tên sách
                            </th>
                            <th>
                                Giới thiệu
                            </th>
                            <th class="last">URL</th>
                            
                             <th class="selected last">
                                <input type="checkbox" class="checkall" />
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptListBookError" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="title">
                                    <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                </td>
                                 <td class="type">
                                    <%#DataBinder.Eval(Container.DataItem,"IntroText")%>
                                </td>
                                <td class="last">
                                    <%#DataBinder.Eval(Container.DataItem, "URL")%>
                                </td>
                                 </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <!-- pagination -->
                <div class="pagination pagination-left">
                   <!-- table action -->
                    <div class="action" style="margin-top: 0px;">
                        <asp:DropDownList ID="ddlActbookError" runat="server">
                            <asp:ListItem>Export ra file Excel mới</asp:ListItem>
                            <asp:ListItem>----------</asp:ListItem>
                            <asp:ListItem>----------</asp:ListItem>
                        </asp:DropDownList>
                        <div class="button">
                            <asp:Button ID="btApply2" runat="server" Text="Thực thi lựa chọn" OnClick="btApply2_Click" />
                        </div>
                    </div>
                    <!-- end table action -->
                </div>
                <!-- end pagination -->
            </div>
        </div>
</asp:PlaceHolder>
<!-- end forms -->
