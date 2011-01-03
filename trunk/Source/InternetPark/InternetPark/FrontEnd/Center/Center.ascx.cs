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

public partial class FrontEnd_Center_Center : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string menu = InternetPark.Core.QueryHelper.GetQueryString(Request, _No_Change_Query.menu);
        string cate = InternetPark.Core.QueryHelper.GetQueryString(Request, _No_Change_Query.cate);
        if (cate != "")
        {
            this.CenterPanel.Controls.Add(LoadControl(_No_Change_Control.books));
        }
        else
        { QueryMenu(menu); }
    }

    private void QueryMenu(string menu)
    {

        switch (menu)
        {
            case "1":
                this.CenterPanel.Controls.Add(LoadControl(_No_Change_Control.index));
                break;
            //case "2":
            //    break;
            //case "3":
            //    break;
            default:
                this.CenterPanel.Controls.Add(LoadControl(_No_Change_Control.index));
                break;
        }

    }
}
