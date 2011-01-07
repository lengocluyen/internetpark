using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InternetPark.Core
{
    public partial class Extension_File
    {
        public static List<Extension_File> GetAttributeOfBook(int idBook)
        {
            if (BookAttributeValue.GetBookAttribute_ByIdBook(idBook).Count > 0)
            {
                var bav = from bk in BookAttributeValue.All()
                          where bk.BookID==idBook
                          select bk;

                var query = from av in AttributeValue.All()
                        join k in bav on av.AttributeValueID equals k.AttributeValueID
                        join at in Attribute.All() on av.AttributeID equals at.AttributeID
                        select new { _Attribute = at, _AttributeValue = av, _BookAttributeValue = k };
                List<Extension_File> list = new List<Extension_File>();
                foreach (var item in query)
                {
                    Extension_File ef = new Extension_File();
                    ef._Attribute=item._Attribute;
                    ef._AttributeValue=item._AttributeValue;
                    ef._BookAttributeValue=item._BookAttributeValue;
                    list.Add(ef);
                }
                return list;
            }
            return null;
        }
    }
}
