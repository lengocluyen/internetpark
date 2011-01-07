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
    public partial class Books_New : System.Web.UI.UserControl
    {
        ArrayList al = new ArrayList();
        protected string paggingCollection;
        List<Book> booksList = new List<Book>();
        List<Book> booksListPagging = new List<Book>();

        protected void Page_Load(object sender, EventArgs e)
        {
            booksList = Book.GetBooks_NewBooks();
            if (booksList.Count > 0)
            {
                foreach (Book bk in booksList)
                { al.Add(bk); }
            }
            if (!IsPostBack)
            {
                ShowInfomationPaging();               
                rptBooks.DataSource = booksListPagging;
                rptBooks.DataBind();                
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