namespace InternetPark.Core
{
    public interface IConfiguration
    {
        int ItemperPageAdmin { get; }
        int ItemperPageUser { get; }
        string RootURL { get; }
        string AdminSiteURL { get; }
    }
}