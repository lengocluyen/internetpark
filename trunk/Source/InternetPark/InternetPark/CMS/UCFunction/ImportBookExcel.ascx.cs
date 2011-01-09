using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using InternetPark.Core;
using System.Data.Common;
using StructureMap;
using SubSonic;
using SubSonic.Schema;

namespace InternetPark.CMS.UCFunction
{
    public partial class ImportBookExcelascx : System.Web.UI.UserControl
    {
        public IConfiguration _configuration;
        public ImportBookExcelascx()
        {
            _configuration = ObjectFactory.GetInstance<IConfiguration>();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            idListbook.Visible = false;
        }
        public void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string folder = Server.MapPath("~/Upload/");
                string file = Server.MapPath("~" + txtUrl.Text.Trim().Substring(2, txtUrl.Text.Trim().Length - 2));
                LibExcel exceLib = new LibExcel(file, "", Path.Combine(folder, txtUrl.ClientID));
                //HandleDataImport(exceLib.GetAllBook());
            }
            catch
            {
            }
        }
        public List<Book> listBook;
        List<Book> listError;
        List<Book> result;
        //event handle save data into database
        public void btApply_Click(object sender, EventArgs e)
        {
            try
            {


                if (ddlAct.Text.Trim() == "")
                    return;

                List<Book> list = Session["result"] as List<Book>;

                Category a = Category.Find(c => c.Name == ddlAct.Text.Trim()).FirstOrDefault();
                foreach (Book i in list)
                {
                    i.CategoryID = a.CategoryID;
                }

                Book.AddMany(list);
                idListbook.Visible = true;
                txtLable.Text = "Thêm thành công " + list.Count + " sách";
                phListBook.Visible = true;
            }
            catch
            {
                idListbook.Visible = true;
                txtLable.Text = "Lỗi thêm sách!";
            }

        }
        //export to excel
        public void btApply2_Click(object sender, EventArgs e)
        {
            string folder = Server.MapPath("~/Upload/");
            string file = "temp.xls";
            string link = Path.Combine(folder, file);
            if (File.Exists(link)) File.Delete(link);
            FileStream fs = new FileStream(link, FileMode.CreateNew);
            fs.Close();
            //LibExcel exceLib = new LibExcel(link);
            //exceLib.Export1Data2Exel(Session["listError"] as List<Book>);
            Response.Redirect(_configuration.RootURL + "Upload/temp.xls");
        }
        public void HandleDataImport(List<Book> listbooks)
        {
            List<Book> listError = new List<Book>();
            List<Book> result = new List<Book>();
            foreach (var i in listbooks)
            {
                if (i.Title != "" && i.Url != "" && i.IntroText != "")
                {
                    result.Add(i);
                }
                else
                {
                    listError.Add(i);
                }
            }
            Session["result"] = result;
            Session["listError"] = listError;
            List<Category> catlist = Category.Find(c => c.ParentID != 0);
            this.ddlAct.Items.Clear();
            foreach (Category i in catlist)
            {
                this.ddlAct.Items.Add(i.Name);
            }
            phListBook.Visible = true;
            rptBooks.DataSource = result;
            rptBooks.DataBind();

            phListBookError.Visible = true;
            rptListBookError.DataSource = listError;
            rptListBookError.DataBind();
        }
    }
}