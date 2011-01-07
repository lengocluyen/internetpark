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
using System.ComponentModel;

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

            if (booksList.Count > _No_Change_Query.pageSize)
            {
                PageCollection p = new PageCollection(_No_Change_Query.pageSize, 3, al);
                paggingCollection = p.ShowInformation(query, false, "p");
                foreach (Book info in p.DataSource)
                { booksListPagging.Add(info); }
            }
            else
            {
                booksListPagging = booksList;
            }

        }        
    }
}