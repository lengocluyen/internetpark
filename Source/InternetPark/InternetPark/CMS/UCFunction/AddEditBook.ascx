<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddEditBook.ascx.cs"
    Inherits="InternetPark.CMS.UCFunction.AddEditBook" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!-- forms -->
<%--<ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />--%>
<div class="box">
    <!-- box / title -->
    <div class="title">
        <h5>
            Thêm sách mới</h5>
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
                        <span>.................</span>
                    </div>
                    <div class="dismiss">
                        <a href="#message-notice"></a>
                    </div>
                </div>
            </div>
            <div class="field">
                <div class="label">
                    <label for="input-medium">
                        Tên sách:</label>
                </div>
                <div class="input">
                    <asp:TextBox ID="txtName" runat="server" CssClass="medium"></asp:TextBox>&nbsp;&nbsp;
                    <span style="padding-top: 20px;">
                        <asp:RequiredFieldValidator CssClass="require" ID="rfvName" runat="server" ControlToValidate="txtName"
                            Display="Dynamic" ErrorMessage="Chưa nhập!" Font-Bold="True" SetFocusOnError="True"
                            ValidationGroup="UsersGroup"></asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="field">
                <div class="label">
                    <label for="input-medium">
                        Thể loại:</label>
                </div>
                <div class="input">
                    <asp:DropDownList ID="ddlCategory" runat="server" />
                </div>
            </div>
            <div class="field">
                <div class="label label-textarea">
                    <label for="textarea">
                        Mô tả ngắn:</label>
                </div>
                <div class="textarea textarea-editor">
                    <asp:TextBox ID="txtIntro" TextMode="MultiLine" runat="server" Columns="50" Rows="12"
                        CssClass="editor"></asp:TextBox>&nbsp;&nbsp; <span style="padding-top: 20px;">
                            <asp:RequiredFieldValidator CssClass="require" ID="rfvIntro" runat="server" ControlToValidate="txtIntro"
                                Display="Dynamic" ErrorMessage="Chưa nhập!" Font-Bold="True" SetFocusOnError="True"
                                ValidationGroup="UsersGroup"></asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="field">
                <div class="label label-textarea">
                    <label for="textarea">
                        Giới thiệu:</label>
                </div>
                <div class="textarea textarea-editor">
                    <asp:TextBox ID="txtSumary" runat="server" TextMode="MultiLine" Columns="50" Rows="12"
                        CssClass="editor"></asp:TextBox>&nbsp;&nbsp; <span style="padding-top: 20px;">
                            <asp:RequiredFieldValidator CssClass="require" ID="rfvSumary" runat="server" ControlToValidate="txtSumary"
                                Display="Dynamic" ErrorMessage="Chưa nhập!" Font-Bold="True" SetFocusOnError="True"
                                ValidationGroup="UsersGroup"></asp:RequiredFieldValidator></span>
                </div>
            </div>
            <div class="field">
                <div class="label">
                    <label for="input-medium">
                        Số trang:</label>
                </div>
                <div class="input">
                    <asp:TextBox ID="txtPages" runat="server" CssClass="medium"></asp:TextBox>&nbsp;&nbsp;
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Nhập số &gt;0!"
                        ControlToValidate="txtPages" MaximumValue="10000" MinimumValue="0" Type="Integer"
                        Display="Dynamic" ValidationGroup="UsersGroup"></asp:RangeValidator>
                </div>
            </div>
            <div class="field">
                <div class="label">
                    <label for="input-medium">
                        ISBN:</label>
                </div>
                <div class="input">
                    <asp:TextBox ID="txtISBN" runat="server" CssClass="medium"></asp:TextBox>&nbsp;&nbsp;
                    <%--<span style="padding-top: 20px;">
                        <asp:RequiredFieldValidator CssClass="require" ID="rfvISBN" runat="server" ControlToValidate="txtISBN"
                            Display="Dynamic" ErrorMessage="Chưa nhập!" Font-Bold="True" SetFocusOnError="True"
                            ValidationGroup="UsersGroup" ></asp:RequiredFieldValidator></span>--%>
                </div>
            </div>
            <div class="field">
                <div class="label">
                    <label for="input-medium">
                        Publisher:</label>
                </div>
                <div class="input">
                    <asp:TextBox ID="txtPublisher" runat="server" CssClass="medium"></asp:TextBox>&nbsp;&nbsp;
                    <%--<span style="padding-top: 20px;">
                        <asp:RequiredFieldValidator CssClass="require" ID="rfvPublisher" runat="server" ControlToValidate="txtPublisher"
                            Display="Dynamic" ErrorMessage="Chưa nhập!" Font-Bold="True" SetFocusOnError="True"
                            ValidationGroup="UsersGroup"></asp:RequiredFieldValidator></span>--%>
                </div>
            </div>
            <%--<script type="text/javascript">
                function fillCell(row, cellNumber, text) {
                    var cell = row.insertCell(cellNumber);
                    cell.innerHTML = text;
                    cell.style.borderBottom = cell.style.borderRight = "solid 1px #aaaaff";
                }
               

                function uploadError(sender, args) {
                    addToClientTable(args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>");
                }
                function uploadComplete(sender, args) {
                    var contentType = args.get_contentType();
                    var text = args.get_length() + " bytes";
                    if (contentType.length > 0) {
                        text += ", '" + contentType + "'";
                    }
                    addToClientTable(args.get_fileName(), text);
                }
            </script>--%>
            <div class="field">
                <div class="label">
                    <label for="file">
                        Upload bìa sách:</label>
                </div>
                <div class="input">
                    <asp:TextBox ID="txtImage" CssClass="medium" runat="server"></asp:TextBox>
                        <div class="highlight">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="Chọn hình" onclick="open('ImageManager.aspx?location=images&idFill=<%=Server.UrlEncode(this.txtImage.ClientID) %>','','menubar,width=640,height=480');" /></div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorImage" runat="server" ControlToValidate="txtImage"
                        SetFocusOnError="True" Font-Bold="True" ValidationGroup="UsersGroup"></asp:RequiredFieldValidator>
                    <%--<asp:FileUpload ID="FileUploadImage" runat="server" />
                <asp:RequiredFieldValidator CssClass="require" ID="rfvfuImage" runat="server" ControlToValidate="FileUploadImage"
                            Display="Dynamic" ErrorMessage="Chưa nhập!" Font-Bold="True" SetFocusOnError="True"
                            ValidationGroup="UsersGroup" ></asp:RequiredFieldValidator>--%>
                    <%--<ajaxToolkit:AsyncFileUpload OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete"
                        runat="server" ID="AsyncFileUploadImage" Width="400px" UploaderStyle="Modern"
                        UploadingBackColor="#CCFFFF" ThrobberID="myThrobberImage" />
                    &nbsp;<asp:Label runat="server" ID="myThrobberImage" Style="display: none;"><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label>--%>
                </div>
            </div>
            <div id="message-success" class="message message-success">
                <div class="image">
                    <img src="../../resources/images/icons/success.png" alt="Success" height="32" />
                </div>
                <div class="text">
                    <h6>
                        Trạng thái</h6>
                    <span>
                        <asp:Label runat="server" Text="&nbsp;" ID="uploadResultImage" /></span>
                </div>
                <div class="dismiss">
                    <a href="#message-success"></a>
                </div>
            </div>
            <div class="field">
                <div class="label">
                    <label for="file">
                        Upload Book:</label>
                </div>
                <div class="input">
                <asp:TextBox ID="txtUrl" CssClass="medium" runat="server"></asp:TextBox>
                        <div class="highlight"><input type="reset" name="reset" value="Chọn sách" onclick="open('FileManager.aspx?location=books&idFill=<%=Server.UrlEncode(this.txtUrl.ClientID) %>&idSize=<%=Server.UrlEncode(this.txtSize.ClientID)%>','','menubar,width=640,height=480');" /></div>
                    <asp:RequiredFieldValidator ID="rfvUrl" runat="server" ControlToValidate="txtUrl"
                        SetFocusOnError="True" Font-Bold="True" ValidationGroup="UsersGroup"></asp:RequiredFieldValidator>
                    <%--<asp:FileUpload ID="FileUploadBook" runat="server" />
                    <asp:RequiredFieldValidator CssClass="require" ID="rfvFuBook" runat="server" ControlToValidate="FileUploadBook"
                        Display="Dynamic" ErrorMessage="Chưa nhập!" Font-Bold="True" SetFocusOnError="True"
                        ValidationGroup="UsersGroup"></asp:RequiredFieldValidator>--%>
                    <%-- <ajaxToolkit:AsyncFileUpload OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete"
                        runat="server" ID="AsyncFileUploadBook" Width="400px" UploaderStyle="Modern"
                        UploadingBackColor="#CCFFFF" ThrobberID="myThrobberBook" />
                    &nbsp;<asp:Label runat="server" ID="myThrobberBook" Style="display: none;"><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label>--%>
                </div>
            </div>
            <div class="field">
                <div class="label">
                    <label for="file">
                        Kích thước tập tin:</label>
                </div>
                <div class="input">
                <asp:TextBox ID="txtSize" CssClass="medium" runat="server"></asp:TextBox>
                  </div>
            </div>
            <div id="Div1" class="message message-success">
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
            </div>
            <div class="field">
                <div class="label label-checkbox">
                    <label>
                        Hoạt động:</label>
                </div>
                <div class="checkboxes">
                    <div class="checkbox">
                        <asp:CheckBox ID="cbActive" runat="server" />
                    </div>
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
                        $("#ctl00_Content_ctl00_txtName").Value = "";
                        $("#ctl00_Content_ctl00_txtIntro").Value = "";
                        $("#ctl00_Content_ctl00_txtSumary").Value = "";
                        $("#ctl00_Content_ctl00_txtPages").Value = "";
                        $("#ctl00_Content_ctl00_txtISBN").Value = "";
                        $("#ctl00_Content_ctl00_txtPublisher").Value = "";
                        $("#ctl00_Content_ctl00_txtISBN").Value = "";
                        $("#ctl00_Content_ctl00_txtImage").Value = "";
                        $("#ctl00_Content_ctl00_txtUrl").Value = "";
                        $("#ctl00_Content_ctl00_cbActive").Checked = false;
                    })
                });
            </script>

        </div>
    </div>
</div>
<!-- end forms -->
