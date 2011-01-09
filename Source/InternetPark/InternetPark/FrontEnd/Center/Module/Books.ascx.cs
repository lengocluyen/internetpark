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
        int pageIndex = 1;
        int indexCurrent = 1;
        string type = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            type = QueryHelper.GetQueryString(Request, _No_Change_Query.type);
            pageIndex = LibConvert.ConvertToInt(QueryHelper.GetQueryString(Request, "p"), 1);
            indexCurrent = LibConvert.ConvertToInt(QueryHelper.GetQueryString(Request, "index"), 1);
            switch (type)
            {
                case _No_Change_Query.cate:
                    cate = QueryHelper.GetQueryString(Request, _No_Change_Query.cate);
                    if (cate != "")
                    {
                        title = Category.GetCategoryById(LibConvert.ConvertToInt(cate, 0)).Name;
                        booksList = Book.GetBookByCategory(int.Parse(cate), pageIndex, _No_Change_Query.pageSize);
                    }
                    break;
                case _No_Change_Query.searchBooks:
                    title = "";
                    string name_value = LibConvert.ConvertToString(QueryHelper.GetQueryString(Request, _No_Change_Query.searchValue), "NULL");
                    booksList=Book.GetBooks_ByName(name_value,pageIndex,_No_Change_Query.pageSize);
                    break;
                case _No_Change_Query.viewMore:
                    title = "xem nhiều";
                    booksList = Book.GetBooks_MoreView(pageIndex,_No_Change_Query.pageSize);
                    break;
                case _No_Change_Query.downloadMore:
                    title = "tải nhiều";
                    booksList = Book.GetBooks_MoreDownload(pageIndex, _No_Change_Query.pageSize);
                    break;
                case _No_Change_Query.newBooks:
                    title = "mới";
                    booksList = Book.GetBooks_NewBooks(pageIndex, _No_Change_Query.pageSize);
                    break;
                default:// mac dinh load sach moi
                    title = "mới";
                    booksList = Book.GetBooks_NewBooks(pageIndex, _No_Change_Query.pageSize);
                    break;
            }                       
           
            if (!IsPostBack)
            {
                ShowInfomationPaging();
                rptBook.DataSource = booksList;
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
            Paging p = new Paging(pageIndex);
            int totalPage;
            if ((Book.GetBookByCategory(LibConvert.ConvertToInt(cate, 0)).Count % _No_Change_Query.pageSize == 0))
            {
                totalPage = (Book.GetBookByCategory(LibConvert.ConvertToInt(cate, 0)).Count / _No_Change_Query.pageSize);
            }
            else
            {
                totalPage = (Book.GetBookByCategory(LibConvert.ConvertToInt(cate, 0)).Count / _No_Change_Query.pageSize) + 1;
            }
            paggingCollection = p.ShowPaging(query, false, totalPage, 2, "p", "index", indexCurrent);            
        }
    }
}