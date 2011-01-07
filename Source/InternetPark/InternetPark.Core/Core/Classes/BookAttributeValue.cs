using System;
using System.Collections.Generic;
using System.Linq;
using SubSonic.Extensions;
using SubSonic.BaseClasses;
using SubSonic.SqlGeneration.Schema;

namespace InternetPark.Core
{
    public partial class BookAttributeValue
    {
        public static List<BookAttributeValue> GetBookAttribute_ByIdBook(int idBook)
        {
            return BookAttributeValue.Find(p => p.BookID == idBook);
        }
    }
}

