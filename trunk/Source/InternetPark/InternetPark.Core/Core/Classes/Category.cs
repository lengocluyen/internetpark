using System;
using System.Collections.Generic;
using System.Linq;
using SubSonic.Extensions;
using SubSonic.BaseClasses;
using SubSonic.SqlGeneration.Schema;
using SubSonic.Schema;

namespace InternetPark.Core
{
    public partial class Category
    {
        // all method is static 
        public static PagedList<Category> GetCategoryPaging(int page, int pagesize)
        {
            return Category.GetPaged(page - 1, pagesize);
        }
    }
}


