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

namespace InternetPark.FrontEnd.Left.Module
{
    public partial class Categories : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetParentCategory()
        {
            string str = "";
            foreach (Category cate in Category.GetParentCategory())
            {
                if (Category.GetCategoryByParentId(cate.CategoryID).Count > 0)
                {
                    str += string.Format(@"<li>{0}", cate.Name);
                    str += GetCategoryOfParentCategory(cate.CategoryID);
                    str += "</li>";
                }
                else
                {
                    str += string.Format(@"<li>{0}</li>", cate.Name);
                }
            }
            return str;
        }

        private string GetCategoryOfParentCategory(int idParent)
        {
            string str = "<ul>";
            foreach (Category cate in Category.GetCategoryByParentId(idParent))
            {
                str += string.Format(@"<li><a href=""?{0}={1}&&{2}={3}"">{4}</a></li>",_No_Change_Query.type,_No_Change_Query.cate,_No_Change_Query.cate,cate.Id,cate.Name);
            }
            str += "</ul>";
            return str;
        }
    }
}