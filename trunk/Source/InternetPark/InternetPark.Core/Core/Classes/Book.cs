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
        public static List<BookCategory> GetBookCategoryByCategory(int idCate)
        {
            return BookCategory.Find(b => b.BookCategoryID == idCate);
        }
        public static List<Book> GetBookByCategory(int idCate)
        {
            List<BookCategory> listBookCate = GetBookCategoryByCategory(idCate);
            List<Book> listBooks = new List<Book>();
            foreach (BookCategory bc in listBookCate)
            {
                listBooks.Add(Book.Single(bc.BookID));
            }
            return listBooks;
        }

    }
}
