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
using InternetPark.Core;
using System.Collections.Generic;
namespace InternetPark.FrontEnd.Right.Module
{
    public partial class Interesting_Books : System.Web.UI.UserControl
    {
        protected string book = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Book> listBooks = Book.GetBooks_MoreDownload();
            foreach (Book bk in listBooks)
            {
                book += string.Format(@"<div style=""width:100%;s""><a href=""?{0}={1}&&{2}={3}&&{4}={5}"" title=""{6}"">
                        <img src=""{7}"" border=""0"" alt=""Book"" width=""170px"" height=""200px"" align=""top"" style=""margin: 10px 2px 2px 5px;"" /></a></div>", _No_Change_Query.cate, bk.CategoryID, _No_Change_Query.book, bk.BookID, _No_Change_Query._view, "true", bk.Title, bk.Image);
            }
        }
    }
}