using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using InternetPark.Core;

namespace InternetPark.FrontEnd.Left.Module
{
    public partial class Books_Hightlight : System.Web.UI.UserControl
    {
        public List<Book> listBooks;
        protected void Page_Load(object sender, EventArgs e)
        {
            listBooks = Book.GetBooks_MoreView();
            string js = "<script language=\"javascript\" type=\"text/javascript\">";
            js += "var arrAdsImage = new Array(); var arrAdsUrl = new Array();";
            int count = 0;
            foreach (Book ad in listBooks)
            {
                js += "arrAdsImage[" + count + "] = '" + ad.Image.Replace(@"\", @"/") + "';";
                js += "arrAdsUrl[" + count + @"] = '" + string.Format(@"?{0}={1}&&{2}={3}&&{4}={5}",_No_Change_Query.cate,ad.CategoryID,_No_Change_Query.book,ad.BookID,_No_Change_Query._view,"true")+"';";
                //js += "arrAdsUrl[" + count + "] = '" + "?php=DTPRO&pID=" + ad._Id + "';";
                count++;
            }
            js += "</script>";
            this.scriptAds.InnerHtml = js;
        }
    }
}