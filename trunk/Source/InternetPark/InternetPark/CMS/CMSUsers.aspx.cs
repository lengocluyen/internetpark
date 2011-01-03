using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StructureMap;
using InternetPark.Core;
using SubSonic.Schema;

namespace InternetPark.CMS
{
    public partial class CMSUsers : System.Web.UI.Page
    {
        public IConfiguration _configuration;
        public CMSUsers()
        {
            _configuration = ObjectFactory.GetInstance<IConfiguration>();
        }

        protected override void OnInit(EventArgs e)
        {

            base.OnInit(e);
            pager.Command += new CommandEventHandler(pager_Command);
        }

        void pager_Command(object sender, CommandEventArgs e)
        {
            this.LoadUserPaging(InternetPark.Core.User.GetUserPaging(pager.CurrentIndex, pager.PageSize));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadUserPaging(InternetPark.Core.User.GetUserPaging(pager.CurrentIndex, pager.PageSize));
            }
            if (Request.Params["do"] != null)
            {
                string aDo = Request.Params["do"];
                switch (aDo)
                {
                    case "edit":
                        if (Request.Params["aid"] != null)
                            LoadControls();
                        break;
                    case "add":
                        LoadControls();
                        break;
                    case "del":
                        if (Request.Params["aid"] != null)
                        {
                            int adsID = 0;
                            try
                            {
                                adsID = int.Parse(Request.Params["aid"].ToString());
                            }
                            catch { }
                            InternetPark.Core.User.Delete(adsID);
                            this.PreRenderComplete += new EventHandler(AdminCP_Course_PreRenderComplete);
                        }
                        break;
                    default:
                        break;
                }
            }
        }

        void AdminCP_Course_PreRenderComplete(object sender, EventArgs e)
        {
            Response.Redirect("~/CMS/CMSUsers.aspx");
        }
        public void btApply_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem i in rptUsers.Items)
            {
                CheckBox cbox = i.FindControl("idCheck") as CheckBox;
                if (cbox.Checked)
                {
                    HiddenField hfield = i.FindControl("idHiddenField") as HiddenField;
                    int id = int.Parse(hfield.Value);
                    //Thực thi xóa user ở đay
                    //xóa các đối tượng được chọn
                    if (ddlAct.Items[0].Selected)
                    {
                        InternetPark.Core.User.Delete(int.Parse(hfield.Value.ToString()));
                    }
                    //kích hoạt các đối tượng được chọn
                    if (ddlAct.Items[1].Selected)
                    {
                        InternetPark.Core.User user = InternetPark.Core.User.Single(int.Parse(hfield.Value.ToString()));
                        user.IsEnabled = true;
                        InternetPark.Core.User.Update(user);
                    }
                    if (ddlAct.Items[2].Selected)
                    {
                        InternetPark.Core.User user = InternetPark.Core.User.Single(int.Parse(hfield.Value.ToString()));
                        user.IsEnabled = false;
                        InternetPark.Core.User.Update(user);
                    }

                }
            }
            this.PreRenderComplete += new EventHandler(AdminCP_Course_PreRenderComplete);
        }
        //Method Fucntion

        void LoadControls()
        {
            Control addEditCourse = (Control)Page.LoadControl("~/CMS/UCFunction/AddEditUser.ascx");
            this.phAddEditUser.Controls.Add(addEditCourse);
        }
        public void LoadUserPaging(PagedList<InternetPark.Core.User> users)
        {
            PagedList<User> list = users;
            if (pager != null)
            {
                pager.ItemCount = list.TotalCount;
            }
            rptUsers.DataSource = users;
            rptUsers.DataBind();
        }
        public string GetRoleName(object id)
        {
            return Role.Single(int.Parse(id.ToString())).Name;
        }
    }
}
