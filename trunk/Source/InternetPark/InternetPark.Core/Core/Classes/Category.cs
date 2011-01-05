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

        public static List<Category> GetParentCategory()
        {
            return Category.Find(c => c.ParentID == 0);
        }

        public static List<Category> GetCategoryByParentId(int idParent)
        {
            return Category.Find(c => c.ParentID == idParent);
        }
    }
}


