<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SystemSettings.ascx.cs"
    Inherits="InternetPark.CMS.UCFunction.SystemSettings" %>
<div class="right">
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
                    
                    </td>
                    <td align="center" class="edit">
                        <a href="Defaults.aspx?do=setting&sid=<%#DataBinder.Eval(Container.DataItem,"UserID")%>">
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
                    
                    </td>
                    <td align="center" class="edit">
                        <a href="Defaults.aspx?do=setting&sid=<%#DataBinder.Eval(Container.DataItem,"UserID")%>">
                            <img src="../Images/edit.jpg" height="12px" alt="Chỉnh sửa" /></a>
                    </td>
                    <td class="selected last">
                        <input type="checkbox" />
                    </td>
                </tr>
                <tr>
                    <td class="name">
                    Địa chỉ gốc trang người dùng:
                    </td>
                    <td class="value">
                    
                    </td>
                    <td align="center" class="edit">
                        <a href="Defaults.aspx?do=setting&sid=<%#DataBinder.Eval(Container.DataItem,"UserID")%>">
                            <img src="../Images/edit.jpg" height="12px" alt="Chỉnh sửa" /></a>
                    </td>
                    <td class="selected last">
                        <input type="checkbox" />
                    </td>
                </tr>
                <tr>
                    <td class="name">
                    Địa chỉ gốc trang quản trị:
                    </td>
                    <td class="value">
                    
                    </td>
                    <td align="center" class="edit">
                        <a href="Defaults.aspx?do=setting&sid=<%#DataBinder.Eval(Container.DataItem,"UserID")%>">
                            <img src="../Images/edit.jpg" height="12px" alt="Chỉnh sửa" /></a>
                    </td>
                    <td class="selected last">
                        <input type="checkbox" />
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- pagination -->
       <%-- <div class="pagination pagination-left">
            <div class="results">
                <span>showing results 1-10 of 207</span>
            </div>
            <ul class="pager">
                <li class="disabled">&laquo; prev</li>
                <li class="current">1</li>
                <li><a href="">2</a></li>
                <li><a href="">3</a></li>
                <li><a href="">4</a></li>
                <li><a href="">5</a></li>
                <li class="separator">...</li>
                <li><a href="">20</a></li>
                <li><a href="">21</a></li>
                <li><a href="">next &raquo;</a></li>
            </ul>
        </div>--%>
        <!-- end pagination -->
        <!-- table action -->
        <div class="action">
            <select name="action">
                <option value="" class="locked">Set status to Deleted</option>
                <option value="" class="unlocked">Set status to Published</option>
                <option value="" class="folder-open">Move to Category</option>
            </select>
            <div class="button">
                <input type="submit" name="submit" value="Apply to Selected" />
            </div>
        </div>
        <!-- end table action -->
    </div>
</div>
<!-- end table -->
