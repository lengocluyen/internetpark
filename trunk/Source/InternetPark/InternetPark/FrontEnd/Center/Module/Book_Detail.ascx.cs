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
    
    public partial class Book_Detail : System.Web.UI.UserControl
    {
        protected int release = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string bookId = QueryHelper.GetQueryString(Request, _No_Change_Query.book);
            if (bookId != "")
            {
                // hien thi chi tiet sach
                List<Book> book = Book.GetBookById(LibConvert.ConvertToInt(bookId, 0),true);
                rptBook.DataSource = book;
                rptBook.DataBind();
                
                // hien thi cac sach cungthe loai
                List<Book> releaseBooks = Book.GetBooks_Release(LibConvert.ConvertToInt(bookId, 0));
                rptRelease.DataSource = releaseBooks;
                rptRelease.DataBind();

                // hien thi cac file phu neu co
                release = BookAttributeValue.GetBookAttribute_ByIdBook(LibConvert.ConvertToInt(bookId, 0)).Count;
                if (release > 0)
                {
                    rptExtensionFile.DataSource = Extension_File.GetAttributeOfBook(LibConvert.ConvertToInt(bookId, 0));
                    rptExtensionFile.DataBind();
                }
            }
        }

        public string GetBook()
        {
            string str = "";
            string bookId = QueryHelper.GetQueryString(Request, _No_Change_Query.book);
            if (bookId != "")
            {
                Book book = Book.GetBookById(LibConvert.ConvertToInt(bookId, 0));
                str+=string.Format(@"
                    <div class=""book"">
                    <div class=""bookdetails""
                        <span class=""booktitle"">{0}</span><br />
                        <br />
                        <span class=""bookdetail"">Ngày cập nhật: {1} Lượt xem: {2} Lượt tải: {3}</span>
                    </div>",book.Title,LibConvert.ConvertToDateTime(book.Created).ToShortDateString(),book.Hits,book.Downloads);
                str+=string.Format(@"
                    <div class=""bookdownload"" style=""text-align:left;padding:10px 0px 5px 0px;"">
                        <a href=""{0}"">Download</a>
                    </div>
                    <div style=""min-height:200px;"">
                        <div>
                            <table class=""photo-grid"">
                                <tr>
                                    <td>                                
                                            <div class=""pg-album grid_4 alpha"">
                                                <img src=""{1}"" alt=""image"" /></div>                                
                                    </td>
                                </tr>
                            </table>
                        </div>",book.Url,book.Image);
                str+=string.Format(@"
                    <div class=""bookintro"">
                        {0}
                    </div>",book.FullText);
                str+=@"
                    </div>
                    </div>
                    <hr />";
            }
            return str;
        }
    }
}