<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pager.ascx.cs" Inherits="InternetPark.CMS.UCFunction.Pager" %>
<style type="text/css">
/* Pager */
.pagerLeft
{
	float: left;
	width: 0%;
	text-align: left;
}
.pagerRight
{
	float: right;
	width: 100%;
	text-align: right;
	padding-top: 5px;
	padding-left: 5px;
}
.pagerCurrentPage 
{
	padding:3px 7px 3px 7px;
	text-decoration: none; 
	color:#098928; 
	background:#E2FEEC;
	border:1px solid #677537;
	font-weight:bold;
}
.pager a 
{
	padding:3px 7px 3px 7px;
	width:20px;
	height:18px;
	color:#E2FEEC;
	background:url('../Images/Num.JPG') no-repeat;
	text-decoration: none;
	border:1px solid #677537;
	background:#098928;
}
.pager a baPager
{
	padding:3px 5px 3px 5px;
	width:35px;
	height:18px;
	background:url('../Images/BaPager.JPG') no-repeat;
	text-decoration: none;
	border:1px solid #677537;
	background:#098928;
}

.pager a:hover 
{
	text-decoration: none;
	color:#098928;
	background:white;
}
.pager 
{	padding-top:5px; 
	font-family: Arial, Helvetica, sans-serif;
	 font-size: 12pt;
	 width: 250px; 
	 text-align: right;
}
</style>
<div class="pager">
    <asp:Label ID="lblRight" runat="server"></asp:Label>
</div>