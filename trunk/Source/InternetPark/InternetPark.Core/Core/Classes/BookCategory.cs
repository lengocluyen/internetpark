using System;
using System.Collections.Generic;
using System.Linq;
using SubSonic.Extensions;
using SubSonic.BaseClasses;
using SubSonic.SqlGeneration.Schema;

namespace InternetPark.Core
{
    public partial class BookCategory
    {
        // all method is static 
        public static int CountBookByCategoryID(int idCategory)
        {
            return BookCategory.Find(p => p.CategoryID == idCategory).Count;
        }

        public static BookCategory GetBookCategoryByIdBook(int idBook)
        { //return BookCategory.Find(p=>p.BookID==idBook).FirstOrDefault(); 
            return BookCategory.Single(p=>p.BookID==idBook);
        }
    }
}


