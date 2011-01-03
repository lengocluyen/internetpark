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
    public partial class CMSBooks : System.Web.UI.Page
    {
        public IConfiguration _configuration;
        public CMSBooks()
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
            this.LoadBookPaging(InternetPark.Core.Book.GetBookPaging(pager.CurrentIndex, pager.PageSize));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadBookPaging(InternetPark.Core.Book.GetBookPaging(pager.CurrentIndex, pager.PageSize));
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
                            InternetPark.Core.Book.Delete(adsID);
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
            Response.Redirect("~/CMS/CMSBooks.aspx");
        }
        public void btApply_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem i in rptBooks.Items)
            {
                CheckBox cbox = i.FindControl("idCheck") as CheckBox;
                if (cbox.Checked)
                {
                    HiddenField hfield = i.FindControl("idHiddenField") as HiddenField;
                    int id = int.Parse(hfield.Value);
           
                    //xóa các đối tượng được chọn
                    if (ddlAct.Items[0].Selected)
                    {
                        InternetPark.Core.Book.Delete(int.Parse(hfield.Value.ToString()));
                    }
                    //kích hoạt các đối tượng được chọn
                    if (ddlAct.Items[1].Selected)
                    {
                        InternetPark.Core.Book book = InternetPark.Core.Book.Single(int.Parse(hfield.Value.ToString()));
                        book.IsActive = true;
                        InternetPark.Core.Book.Update(book);
                    }
                    if (ddlAct.Items[2].Selected)
                    {
                        InternetPark.Core.Book book = InternetPark.Core.Book.Single(int.Parse(hfield.Value.ToString()));
                        book.IsActive = false;
                        InternetPark.Core.Book.Update(book);
                    }

                }
            }
            this.PreRenderComplete += new EventHandler(AdminCP_Course_PreRenderComplete);
        }
        //Method Fucntion

        void LoadControls()
        {
            Control addEditCategory = (Control)Page.LoadControl("~/CMS/UCFunction/AddEditBook.ascx");
            this.phAddEditCategory.Controls.Add(addEditCategory);
        }
        public void LoadBookPaging(PagedList<Book> books)
        {
            PagedList<Book> list = books;
            if (pager != null)
            {
                pager.ItemCount = list.TotalCount;
            }
            rptBooks.DataSource = books;
            rptBooks.DataBind();
        }
        public string GetCategoryBook(object id)
        {
            return Category.Single(BookCategory.Single(b => b.BookID == int.Parse(id.ToString())).BookCategoryID).Name;
        }
    }
}
