<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Books_Hightlight.ascx.cs"
    Inherits="InternetPark.FrontEnd.Left.Module.Books_Hightlight" %>
<%@ Import Namespace="InternetPark.Core" %>
<div class="cate_left">
    <div class="cate_top">
        <div class="cate_top_left">
        </div>
        <div class="cate_top_body">
            Sách xem nhiều</div>
        <div class="cate_top_right">
        </div>
    </div>
    <div class="cate_body">
        <a id="url" href="" onclick="">
            <img alt="" width="170px" title="" height="200px" border="0" style="margin: 10px 0px 2px 5px;
                filter: progid:DXImageTransform.Microsoft.Fade(duration=1);" id="ads" /></a>
        <%--<img src="Images/bia.jpeg" alt="Book" width="170px" height="200px" align="top" style="margin: 10px 0px 2px 5px;" />--%>
    </div>
    <div id="scriptAds" runat="server">
    </div>
    <div class="cate_bottom">
        <div class="cate_bottom_left">
        </div>
        <div class="cate_bottom_body">
        </div>
        <div class="cate_bottom_right">
        </div>
    </div>
</div>
<script language="javascript" type="text/javascript">
var indexAds = 0;
var totalAds =<%=listBooks.Count %>;

DisplayAds();
setInterval("DisplayAds()",3000);

function DisplayAds()
{
    //document.getElementById("ads").innerHTML = "<a href=\"" + arrAdsUrl[indexAds] + "\"><img style=\"filter:progid:DXImageTransform.Microsoft.Fade(duration=3);\" width=\"180px\" height=\"255px\" src=\"./Images/Ads/" + arrAdsImage[indexAds] + "\" /></a>";    
    ads = document.getElementById("ads");
    ads.src = arrAdsImage[indexAds];
    document.getElementById("url").href = arrAdsUrl[indexAds];
    if (ads.filters)
    {
        ads.filters[0].Apply();
        ads.filters[0].Play();
    }
    indexAds++;
    if (indexAds == totalAds)
        indexAds = 0;        
}       
</script>
