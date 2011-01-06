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

namespace InternetPark.FrontEnd.Center.Module
{
    public partial class Books_TopTen : System.Web.UI.UserControl
    {
        protected string titile = "";
        ArrayList al = new ArrayList();
        protected string paggingCollection;
        List<Book> booksList = new List<Book>();
        List<Book> booksListPagging = new List<Book>();
        string more = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            more = QueryHelper.GetQueryString(Request, _No_Change_Query._more);
            switch (more)
            {
                case "new_books":
                    booksList = Book.GetBooks_NewBooks();
                    titile = "Sách mới";
                    break;
                case "more_view":
                    booksList = Book.GetBooks_MoreView();
                    titile = "Sách xem nhiều";
                    break;
                case "more_download":
                    booksList = Book.GetBooks_MoreDownload();
                    titile = "Sách download nhiều";
                    break;
                default:
                    break;
            }
            if (booksList.Count>0)
            {                
                foreach (Book bk in booksList)
                { al.Add(bk); }
            }
            if (!IsPostBack)
            {
                ShowInfomationPaging();
                rptBook.DataSource = booksListPagging;
                rptBook.DataBind();
            }
        }

        public void ShowInfomationPaging()
        {

            string query = Request.Url.ToString();
            try
            {
                query = query.Substring(0, Request.Url.ToString().LastIndexOf("&p"));
            }
            catch { }

            if (booksList.Count > 2)
            {
                PageCollection p = new PageCollection(2, 3, al);
                paggingCollection = p.ShowInformation(query, false, "p");
                foreach (Book info in p.DataSource)
                { booksListPagging.Add(info); }
            }
            else
            {
                booksListPagging = booksList;
            }

        }

        public string GetAllBooksOfCategory()
        {
            string str = "";
            ShowInfomationPaging();

            string link = "#";
            BookCategory bc = new BookCategory();
            foreach (Book book in booksListPagging)
            {
                bc = BookCategory.GetBookCategoryByIdBook(book.BookID);
                link = string.Format(@"?{0}={1}&&{2}={3}", _No_Change_Query.cate, bc.CategoryID, _No_Change_Query.book, book.BookID);
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

            return str;
        }
    }
}