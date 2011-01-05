﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="InternetPark.CMS.UserControl.Header" %>
<!-- header -->
		<div id="header">
			<!-- logo -->
			<div id="logo">
				<h1><a href="../Default.aspx" title="Công Viên Internet!"><img src="../../resources/images/logo.png" alt="Công Viên Internet" /></a></h1>
			</div>
			<!-- end logo -->
			<!-- user -->
			<ul id="user">
				<li class="first"><a href=""><%--<%= this._userSession.Username.Substring(0,this._userSession.Username.LastIndexOf('@')) %>--%></a></li>
				<li><a href="../CMS/login.aspx?do=logout">Logout</a></li>
				<li class="highlight last"><a href="../Default.aspx">View Site</a></li>
			</ul>
			<!-- end user -->
			<div id="header-inner">
				<div id="home">
					<a href="../CMS/Default.aspx" title="Home"></a>
				</div>
				<!-- quick -->
				<ul id="quick">
					<li>
						<a href="#" title="Books"><span class="normal">Book</span></a>
						<ul>
							<li><a href="../CMS/CMSBooks.aspx">Danh sách EBook</a></li>
							<li><a href="../CMS/CMSBooks.aspx?do=addmany">Import EBook</a></li>
							<li><a href="../CMS/CMSBooks.aspx?do=add">Thêm EBook</a></li>
						</ul>
					</li>
					<li>
						<a href="#" title="Categores"><span class="icon"><img src="../../resources/images/icons/application_double.png" alt="Products" /></span><span>Category</span></a>
						<ul>
							<li><a href="../CMS/CMSCategories.aspx">Danh sách Category</a></li>
							<li><a href="../CMS/CMSCategories.aspx?do=add">Thêm Category mới</a></li>
							
						</ul>
					</li>
					
					<li>
						<a href="" title="Users"><span class="icon"><img src="../../resources/images/icons/page_white_copy.png" alt="Pages" /></span><span>Người dùng</span></a>
						<ul>
							<li><a href="../CMS/CMSUsers.aspx">Danh sách gười dùng</a></li>
							<li><a href="../CMS/CMSUsers.aspx?do=add">Thêm người dùng</a></li>
							
						</ul>
					</li>
					<li>
						<a href="" title="Roles"><span class="icon"><img src="../../resources/images/icons/world_link.png" alt="Links" /></span><span>Quyền</span></a>
						<ul>
							<li><a href="../CMS/CMSRoles.aspx">Danh sách quyền</a></li>
							<li class="last"><a href="../CMS/CMSRoles.aspx?do=add">Thêm quyền người dùng</a></li>
						</ul>
					</li>
					<li>
						<a href="" title="Settings"><span class="icon"><img src="../../resources/images/icons/cog.png" alt="Settings" /></span><span>Settings</span></a>
						<ul>
							<li class="last"><a href="../CMS/Default.aspx?do=setting">Manage Settings</a></li>
						</ul>
					</li>
				</ul>
				<!-- end quick -->
				<div class="corner tl"></div>
				<div class="corner tr"></div>
			</div>
		</div>
		<!-- end header -->