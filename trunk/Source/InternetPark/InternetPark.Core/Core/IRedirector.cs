using System;
using StructureMap;

namespace InternetPark.Core
{
    public interface IRedirector
    {
        void GoToHomePage();
        void GotoLoginPage();
        void GoToErrorPage();
        void GotoAdminPage();
    }
}