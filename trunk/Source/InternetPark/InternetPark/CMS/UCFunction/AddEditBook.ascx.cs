using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InternetPark.Core;
using AjaxControlToolkit;
using System.IO;

namespace InternetPark.CMS.UCFunction
{
    public partial class AddEditBook : System.Web.UI.UserControl
    {
        string uDo = "";
        public int aid = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Set Event Upload data
            AsyncFileUploadImage.UploadedComplete += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUploadImage_UploadedComplete);
            AsyncFileUploadImage.UploadedFileError += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUploadImage_UploadedFileError);
            AsyncFileUploadBook.UploadedComplete += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUploadBook_UploadedComplete);
            AsyncFileUploadBook.UploadedFileError += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUploadBook_UploadedFileError);

            uDo = Request.Params["do"];
            if (uDo != null)
                InitControl();
        }
        #region Handle Event Upload
        void AsyncFileUploadImage_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "size", "top.$get(\"" + uploadResultImage.ClientID + "\").innerHTML = 'Uploaded size: " + AsyncFileUploadImage.FileBytes.Length.ToString() + "';", true);

            // Uncomment to save to AsyncFileUpload\Uploads folder.
            // ASP.NET must have the necessary permissions to write to the file system.
            string savePath = MapPath("~/Uploads/" + Path.GetFileName(e.filename));
            AsyncFileUploadImage.SaveAs(savePath);
        }


        void AsyncFileUploadImage_UploadedFileError(object sender, AsyncFileUploadEventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "error", "top.$get(\"" + uploadResultImage.ClientID + "\").innerHTML = 'Error: " + e.statusMessage + "';", true);
        }
        void AsyncFileUploadBook_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "size", "top.$get(\"" + uploadResultBook.ClientID + "\").innerHTML = 'Uploaded size: " + AsyncFileUploadBook.FileBytes.Length.ToString() + "';", true);

            // Uncomment to save to AsyncFileUpload\Uploads folder.
            // ASP.NET must have the necessary permissions to write to the file system.
            string savePath = MapPath("~/Uploads/" + Path.GetFileName(e.filename));
            AsyncFileUploadBook.SaveAs(savePath);
        }
        void AsyncFileUploadBook_UploadedFileError(object sender, AsyncFileUploadEventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "error", "top.$get(\"" + uploadResultBook.ClientID + "\").innerHTML = 'Error: " + e.statusMessage + "';", true);
        }
        #endregion


        void InitControl()
        {
            //load Category
            List<Category> catlist = Category.All().ToList();
            this.ddlCategory.Items.Clear();
            foreach (Category i in catlist)
            {
                this.ddlCategory.Items.Add(i.Name);
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
                    Book book = Book.Single(aid);
                    if (book == null)
                        return;

                    this.txtName.Text = book.Title;
                    this.txtIntro.Text = book.IntroText;
                    this.txtSumary.Text = book.FullText;
                    //this.fuImage.v = book.Image;
                    //this.fuBook.FileName = book.Url;
                    this.txtPages.Text = book.Pages.ToString();
                    this.txtISBN.Text = book.ISBN;
                    this.txtPublisher.Text = book.Publisher;
                    this.cbActive.Checked = book.IsActive;
                    //Category Change
                    this.ddlCategory.Text = Category.Single(BookCategory.Single(b => b.BookID == aid).BookCategoryID).Name;
                    break;
                case "add":
                    break;
                default:
                    break;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string title = this.txtName.Text.Trim();
            string intro = this.txtIntro.Text.Trim();
            string fulltext = this.txtSumary.Text.Trim();
            DateTime create = DateTime.Now;
            string image = AsyncFileUploadImage.FileName;
            string url = AsyncFileUploadBook.FileName;
            long size = AsyncFileUploadBook.FileBytes.Count();
            int pages= int.Parse(txtPages.Text.Trim());
            int downloads = 0;
            int hits = 0;
            string filetype = AsyncFileUploadBook.FileName.Substring(AsyncFileUploadBook.FileName.Length - 4, 4);
            string isbn = this.txtISBN.Text.Trim();
            string publisher = this.txtPublisher.Text.Trim();
            bool checkbox = cbActive.Checked;
            //Category Changed
            string category = this.ddlCategory.Text;
            if (uDo == "edit")
            {
                Book book = Book.Single(aid);
                //if (Book.Single(u => u.Title== title) != null)
                //{
                //    this.idNotice.Visible = true;
                //    return;
                //}
                book.Title = title;
                book.IntroText = intro;
                book.FullText = fulltext;
                book.Image = image;
                book.Size = size;
                book.Pages = pages;
                book.FileType = filetype;
                book.ISBN = isbn;
                book.Publisher = publisher;
                book.IsActive = checkbox;
                book.Url = url;
                BookCategory bookcat = BookCategory.Single(u => u.BookID == aid);
                bookcat.BookCategoryID = Category.Single(p => p.Name == category).CategoryID;
                BookCategory.Update(bookcat);

                Book.Update(book);


            }
            else if (uDo == "add")
            {
                Book book = new Book();
                //if (Book.Single(u => u.Title== title) != null)
                //{
                //    this.idNotice.Visible = true;
                //    return;
                //}
                book.Title = title;
                book.IntroText = intro;
                book.FullText = fulltext;
                book.Image = image;
                book.Size = size;
                book.Pages = pages;
                book.FileType = filetype;
                book.ISBN = isbn;
                book.Publisher = publisher;
                book.IsActive = checkbox;
                book.Url = url;
                book.Downloads = 0;
                book.Hits = 0;
                book.Created = create;
                BookCategory bookcat = new BookCategory();
                bookcat.BookCategoryID = Category.Single(p => p.Name == category).CategoryID;
                BookCategory.Add(bookcat);
                Book.Add(book);
            }
            Response.Redirect("CMSBooks.aspx");
        }
    }
}