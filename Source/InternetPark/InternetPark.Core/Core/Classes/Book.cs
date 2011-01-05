using System;
using System.Collections.Generic;
using System.Linq;
using SubSonic.Extensions;
using SubSonic.BaseClasses;
using SubSonic.SqlGeneration.Schema;
using SubSonic.Schema;

namespace InternetPark.Core
{
    public partial class Book
    {
        // all method is static
        public static PagedList<Book> GetBookPaging(int page, int pagesize)
        {
            return Book.GetPaged(page - 1, pagesize);
        }
        public static List<BookCategory> GetBooksByCategory(int idCate)
        {
            return BookCategory.Find(b => b.BookCategoryID == idCate);

        }
        
    }
}
