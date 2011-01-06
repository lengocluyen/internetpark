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
        
        /// <summary>
        /// Lấy sách thuộc danh mục theo Category
        /// </summary>
        /// <param name="idCate"></param>
        /// <returns></returns>
        public static List<BookCategory> GetBookCategoryByCategory(int idCate)
        {
            return BookCategory.Find(b => b.CategoryID == idCate);
        }

        /// <summary>
        /// Lấy sách theo Category
        /// </summary>
        /// <param name="idCate"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Lấy sách theo Id của sách
        /// </summary>
        /// <param name="idBook"></param>
        /// <returns></returns>
        public static Book GetBookById(int idBook)
        { return Book.Single(idBook); }

        public static List<Book> GetBookById(int idBook, bool returnList)
        {
            if (returnList)
            {
                return Book.Find(b => b.BookID == idBook);
            }
            return null;
        }
        /// <summary>
        /// Tính lượt download của tất cả sách trong hệ thống
        /// </summary>
        /// <returns></returns>
        public static long CountTotalDownload()
        {
            long total = 0;
            foreach (Book i in All())
            {
                total += i.Downloads;
            }
            return total;
        }

        /// <summary>
        /// Lấy sách xem nhiều
        /// </summary>
        /// <returns></returns>
        public static List<Book> GetBooks_MoreView()
        {
            var a = (from i in Book.All()
                     select i).OrderByDescending(p => p.Hits).Take(10);
            return a.ToList();    
        }

        /// <summary>
        /// Lấy sách download nhiều
        /// </summary>
        /// <returns></returns>
        public static List<Book> GetBooks_MoreDownload()
        {
            var a = (from i in Book.All()
                     select i).OrderByDescending(p => p.Downloads).Take(10);
            return a.ToList();
        }

        /// <summary>
        /// Lấy sách mới
        /// </summary>
        /// <returns></returns>
        public static List<Book> GetBooks_NewBooks()
        {
            var a = (from i in Book.All()
                     select i).OrderByDescending(p => p.Created).Take(10);
            return a.ToList();
        }
    }
}
