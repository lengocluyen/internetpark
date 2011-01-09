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

namespace InternetPark.FrontEnd.Banner
{
    public partial class Banner : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkSearch_Click(object sender, EventArgs e)
        {
            //Response.Redirect(string.Format(@"?{0}={1}",_No_Change_Query.search,txtSearch.Text.Trim()));
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }
    }
}