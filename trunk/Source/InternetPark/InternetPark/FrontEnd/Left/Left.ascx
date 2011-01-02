<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Left.ascx.cs" Inherits="InternetPark.FrontEnd.Left.Left" %>
<%@ Register Src="Module/Categories.ascx" TagName="Categories" TagPrefix="uc1" %>
<%@ Register Src="Module/Books_Hightlight.ascx" TagName="Books_Hightlight" TagPrefix="uc2" %>
<uc1:Categories ID="Categories1" runat="server" />
<br />
<br />
<uc2:Books_Hightlight ID="Books_Hightlight1" runat="server" />
