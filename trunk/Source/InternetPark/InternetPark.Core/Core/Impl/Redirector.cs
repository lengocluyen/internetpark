using System;
using System.Web;

namespace InternetPark.Core
{
    public class Redirector : IRedirector
    {
      
        public void GoToHomePage()
        {
            Redirect("~/Default.aspx");
        }
        public void GoToErrorPage()
        {
            Redirect("~/Error.aspx");
        }
        private void Redirect(string path)
        {
            HttpContext.Current.Response.Redirect(path);
        }
     
    }
}
