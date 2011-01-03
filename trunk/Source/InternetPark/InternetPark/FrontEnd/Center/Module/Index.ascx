<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Index.ascx.cs" Inherits="FrontEnd_Center_Module_Index" %>
<%@ Register Src="Books_New.ascx" TagName="Books_New" TagPrefix="uc1" %>
<%@ Register Src="Books_ViewMore.ascx" TagName="Books_ViewMore" TagPrefix="uc2" %>
<div>
    <uc1:Books_New ID="Books_New1" runat="server" />
    
    <uc2:Books_ViewMore ID="Books_ViewMore1" runat="server" />
</div>
