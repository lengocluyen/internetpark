using System;
using System.Collections.Generic;
using System.Web;

namespace InternetPark.Core
{
    public interface IWebContext
    {
        void ClearSession();
        bool ContainsInSession(string key);
        void RemoveFromSession(string key);
        string RootUrl { get; }
        bool LoggedIn { get; set; }
        string Username { get; set;  }
        User CurrentUser { get; set; }
        string CaptchaImageText { get; set; }
      
    }
}