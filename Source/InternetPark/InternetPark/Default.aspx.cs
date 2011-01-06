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
using StructureMap;
using SubSonic;
public partial class _Default : System.Web.UI.Page
{
    public IConfiguration _configuration;
    public _Default()
    {
        _configuration = ObjectFactory.GetInstance<IConfiguration>();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        // kiem tra va cap nhat download
        if (QueryHelper.GetQueryString(Request, _No_Change_Query._down) == "download")
        {
            int id = int.Parse(QueryHelper.GetQueryString(Request, _No_Change_Query.book));
            Book ebook = Book.Single(id);
            ebook.Downloads++;
            Book.Update(ebook);
            Response.Redirect(_configuration.RootURL + ebook.Url);
        }

        // kiem tra va cap nhat luot xem sach
        if (QueryHelper.GetQueryString(Request, _No_Change_Query._view) == "true")
        {
            int id = int.Parse(QueryHelper.GetQueryString(Request, _No_Change_Query.book));
            Book ebook = Book.Single(id);
            ebook.Hits++;
            Book.Update(ebook);            
        }
    }
    void HanldeAction()
    {
        if (QueryHelper.GetQueryString(Request, _No_Change_Query._down) == "download")
        {
            int id = int.Parse(QueryHelper.GetQueryString(Request, _No_Change_Query.book));
            Book ebook = Book.Single(id);
            ebook.Downloads++;
            Book.Update(ebook);
            Response.Redirect(ebook.Url);
        }
    }
}
