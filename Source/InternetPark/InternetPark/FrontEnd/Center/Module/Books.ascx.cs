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
    public partial class Books : System.Web.UI.UserControl
    {
        protected string title = "";
        ArrayList al = new ArrayList();
        protected string paggingCollection;
        List<Book> booksList = new List<Book>();
        List<Book> booksListPagging = new List<Book>();
        string cate = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            cate = QueryHelper.GetQueryString(Request, _No_Change_Query.cate);
            if (cate != "")
            {
                title = Category.GetCategoryById(LibConvert.ConvertToInt(cate,0)).Name;
                booksList = Book.GetBookByCategory(int.Parse(cate),1,2);
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