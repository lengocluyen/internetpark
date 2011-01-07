using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InternetPark.Core
{
    public class _No_Change_Control
    {
        public const string root = "FrontEnd/";
        //banner
        public const string banner = root + "Banner/Banner.ascx";
        //center
        public const string rootCenter = "Module/";
        public const string books = rootCenter + "Books.ascx";
        public const string books_new = rootCenter + "Books_New.ascx";
        public const string books_Search = rootCenter + "Books_Search.ascx";
        public const string index = rootCenter + "Index.ascx";
        public const string book_detail = rootCenter + "Book_Detail.ascx";
        public const string book_topten = rootCenter + "Books_TopTen.ascx";
        // left
        public const string rootLeft = "Left/Module/";
        public const string category = root + rootLeft + "Categories.ascx";
        public const string book_hightlight = root + rootLeft + "Books_Hightlight.ascx";

        // right
        public const string rootRight = "Right/Module/";
        public const string book_interesting = root + rootRight + "Interesting_Books.ascx";
        
    }
}
