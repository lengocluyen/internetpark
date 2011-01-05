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
            <div runat="server" visible="false" id="idNotice">
                <div id="message-notice" class="message message-notice">
                    <div class="image">
                        <img src="../../resources/images/icons/notice.png" alt="Notice" height="32" />
                    </div>
                    <div class="text">
                        <h6>
                            Thông báo</h6>
                        <span>Lỗi import file excel</span>
                    </div>
                    <div class="dismiss">
                        <a href="#message-notice"></a>
                    </div>
                </div>
            </div>
            <div class="field">
                <div class="label">
                    <label for="file">
                        File Excel Import:</label>
                </div>
                <div class="input">
                    <asp:TextBox ID="txtUrl" CssClass="medium" runat="server"></asp:TextBox>
                    <div class="highlight">
                        <input type="reset" name="reset" value="Chọn file" onclick="open('FileManager.aspx?location=books&idFill=<%=Server.UrlEncode(this.txtUrl.ClientID) %>&idSize=<%=Server.UrlEncode(this.txtSize.ClientID)%>','','menubar,width=640,height=480');" /></div>
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
                    <asp:TextBox ID="txtSize" CssClass="small" runat="server"></asp:TextBox>
                </div>
            </div>
            <%--<div id="Div1" class="message message-success">
                <div class="image">
                    <img src="../../resources/images/icons/success.png" alt="Success" height="32" />
                </div>
                <div class="text">
                    <h6>
                        Trạng thái</h6>
                    <span>
                        <asp:Label runat="server" Text="&nbsp;" ID="uploadResultBook" /></span>
                </div>
                <div class="dismiss">
                    <a href="#message-success"></a>
                </div>
            </div>--%>
          
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
<!-- end forms -->
