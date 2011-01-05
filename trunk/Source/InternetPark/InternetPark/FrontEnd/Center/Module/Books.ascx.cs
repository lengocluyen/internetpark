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

namespace InternetPark.FrontEnd.Center.Module
{
    public partial class Books : System.Web.UI.UserControl
    {
        protected string title = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetAllBooksOfCategory()
        {
            string str = "";
            string cate = QueryHelper.GetQueryString(Request, _No_Change_Query.cate);
            if (cate != "")
            {
                string link = "#";
                foreach (Book book in Book.GetBookByCategory(int.Parse(cate)))
                {
                    link = string.Format(@"?{0}={1}&&{2}={3}", _No_Change_Query.cate, cate, _No_Change_Query.book, book.BookID);
                    str += string.Format(@"<div class=""book"">
                <table class=""photo-grid"">
                    <tr>
                        <td>
                            <a href=""{0}"">
                                <div class=""pg-album grid_4 alpha"">
                                    <img src=""{1}"" alt=""image"" /></div>
                            </a>
                        </td>
                    </tr>
                </table>", link, book.Image);
                    str += string.Format(@"<div class=""bookdetails"">
                        <span class=""booktitle""><a href=""{0}"">Professional ASP.NET Design Patterns</a></span><br />
                        <br />
                        <span class=""bookdetail"">Ngày cập nhật: {1} Lượt xem: {2} Lượt tải: {3} </span>
                    </div>", link, book.Created, book.Hits, book.Downloads);
                    str += string.Format(@"<div class=""bookintro"">
                        {0}
                    </div>", book.IntroText);
                    str += string.Format(@"<div class=""bookdownload"">
                            <a href=""{0}"">Download</a>
                            &nbsp;
                            <a href=""{1}"">Learn more</a>
                        </div>", book.Url, link);
                    str += @"
                    </div>
                    <hr />";
                }
            }
            return str;
        }
    }
}