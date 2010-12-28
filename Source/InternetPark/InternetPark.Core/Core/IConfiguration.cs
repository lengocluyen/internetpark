namespace InternetPark.Core
{
    public interface IConfiguration
    {
        int ItemperPage { get; }
        string RootURL { get; }
        string AdminSiteURL { get; }
    }
}