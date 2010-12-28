using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Configuration;
using StructureMap;
using SubSonic.Repository;
using InternetPark.Core;

namespace InternetPark
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["Default"];

            ObjectFactory.Initialize(x =>
            {
                x.For(typeof(IGenericRepository<>))
                      .LifecycleIs(InstanceScope.PerRequest)
                      .Use(typeof(GenericRepository<>))
                      .CtorDependency<string>("connectionStringName").Is(settings.Name)
                      .CtorDependency<SimpleRepositoryOptions>("options").Is(SimpleRepositoryOptions.None);
                //.WithCtorArg("connectionStringName").EqualTo(settings.Name)
                //.WithCtorArg("options").EqualTo(SimpleRepositoryOptions.None);

                x.For(typeof(IRedirector)).LifecycleIs(InstanceScope.PerRequest).Use(typeof(Redirector));

                x.For(typeof(IUserSession)).LifecycleIs(InstanceScope.PerRequest).Use(typeof(UserSession));


                x.For(typeof(IWebContext)).LifecycleIs(InstanceScope.PerRequest).Use(typeof(WebContext));

                x.For(typeof(IConfiguration)).LifecycleIs(InstanceScope.PerRequest).Use(typeof(InternetPark.Core.Configuration));

                x.For(typeof(ICaptcha)).LifecycleIs(InstanceScope.PerRequest).Use(typeof(Captcha));


                //x.For(typeof(SubSonic.Caching.ICacheConfigReader))
                //  .LifecycleIs(InstanceScope.PerRequest)
                //  .Use(typeof(SubSonic.Caching.CacheConfigFromXml));

            });

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}