using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InternetPark.Core;
using SubSonic.Schema;

namespace InternetPark.CMS.UCFunction
{
    public partial class AddEditCategory : System.Web.UI.UserControl
    {
        string uDo = "";
        public int aid = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            uDo = Request.Params["do"];
            if (uDo != null)
                InitControl();
        }
        void InitControl()
        {
            this.ddlOrderNo.Items.Clear();
            this.ddlParent.Items.Clear();
            for (int i = 1; i <= 20; i++)
            {
                this.ddlParent.Items.Add(i.ToString());
                this.ddlOrderNo.Items.Add(i.ToString());
            }

            ////if (Session["Membership"] != null && !(Session["Membership"] as Agri_UserInfo).IsAdministrator())
            //this.btnOK.Visible = true;

            // Validation        

            // Job
            if (Request.Params["aid"] != null)
                aid = int.Parse(Request.Params["aid"]);
            switch (uDo)
            {
                case "edit":
                    Category category = Category.Single(aid);
                    if (category == null)
                        return;

                    this.txtName.Text = category.Name;
                    this.ddlOrderNo.Text = category.OrderNo.ToString();
                    this.cbActive.Checked = category.IsActive;
                    this.ddlParent.Text = category.ParentID.ToString();
                    break;
                case "add":
                    break;
                default:
                    break;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = this.txtName.Text.Trim();
            int orderNo = int.Parse(ddlOrderNo.Text);
            int parentNo = int.Parse(ddlParent.Text);
            bool checkbox = cbActive.Checked;
            if (uDo == "edit")
            {
                Category category = Category.Single(aid);
                if (Category.Single(u => u.Name== name) != null)
                {
                    this.idNotice.Visible = true;
                    return;
                }
                category.Name = name;
                category.IsActive = checkbox;
                category.OrderNo = orderNo;
                category.ParentID = parentNo;
                Category.Update(category);
            }
            else if (uDo == "add")
            {
                Category category = new Category();
                if (Category.Single(u => u.Name == name) != null)
                {
                    this.idNotice.Visible = true;
                    return;
                }
                category.Name = name;
                category.IsActive = checkbox;
                category.OrderNo = orderNo;
                category.ParentID = parentNo;
                Category.Add(category);
            }
            Response.Redirect("CMSCategories.aspx");
        }
    }
}