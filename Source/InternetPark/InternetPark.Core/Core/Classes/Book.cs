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
        /// Lấy sách theo Category
        /// </summary>
        /// <param name="idCate"></param>
        /// <returns></returns>
        public static List<Book> GetBookByCategory(int idCate,int page, int pageSize)
        {
            page--;
            return (from i in All() where i.CategoryID == idCate orderby i.BookID select i).Skip(page * pageSize).Take(pageSize).ToList();            
        }

        public static List<Book> GetBookByCategory(int idCate)
        {
            //page--;
            //return (from i in All() where i.CategoryID == idCate orderby i.BookID select i).Skip(page * pageSize).Take(pageSize).ToList();
            return Book.Find(p => p.CategoryID == idCate);
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
        public static List<Book> GetBooks_MoreView(int page,int pageSize)
        {
            page--;
            var a = (from i in Book.All()
                     select i).OrderByDescending(p => p.Hits).Skip(page*pageSize).Take(pageSize);
            return a.ToList();
        }

        /// <summary>
        /// Lấy sách download nhiều
        /// </summary>
        /// <returns></returns>
        public static List<Book> GetBooks_MoreDownload(int page,int pageSize)
        {
            page--;
            var a = (from i in Book.All()
                     select i).OrderByDescending(p => p.Downloads).Skip(page * pageSize).Take(pageSize);
            return a.ToList();            
        }

        /// <summary>
        /// Lấy sách mới
        /// </summary>
        /// <returns></returns>
        public static List<Book> GetBooks_NewBooks(int page,int pageSize)
        {
            page--;
            var a = (from i in Book.All()
                     select i).OrderByDescending(p => p.Created).Skip(page * pageSize).Take(pageSize);
            return a.ToList();               
        }

        /// <summary>
        /// Tìm sách theo tên, chức năng tìm sách
        /// </summary>
        /// <param name="nameBook"></param>
        /// <returns></returns>
        public static List<Book> GetBooks_ByName(string nameBook,int page,int pageSize)
        {
            page--;
            var a = (from i in Book.All()
                     where i.Title.Contains(nameBook)
                     orderby i.BookID
                     select i).Skip(page * pageSize).Take(pageSize);
            return a.ToList();
        }

        /// <summary>
        /// Lấy sách cùng thể loại với sách có mã là idBook
        /// </summary>
        /// <param name="idBook"></param>
        /// <returns></returns>
        public static List<Book> GetBooks_Release(int idBook)
        {
            int idCate = Book.Single(idBook).CategoryID;
            var a = (from i in All() where i.CategoryID == idCate && i.BookID != idBook select i).Take(5);
            return a.ToList();
        }
    }
}
