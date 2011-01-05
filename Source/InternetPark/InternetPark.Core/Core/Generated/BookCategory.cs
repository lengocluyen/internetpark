using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SubSonic.BaseClasses;
using SubSonic.Extensions;
using SubSonic.SqlGeneration.Schema;

namespace InternetPark.Core
{
    [SubSonicTableNameOverride("BookCategories")]
    public partial class BookCategory : EntityBase<BookCategory>
    {
        #region Properties


        public override object Id
        {

            get { return CategoryID; }
            set { CategoryID = (int)value; }
        }
        public object Id2 {
            get { return BookID; }
            set { BookID = (int)value; }
        
        }

        [SubSonicPrimaryKey]
        public int CategoryID { get; set; }
        [SubSonicPrimaryKey]
        public int BookID { get; set; }
        
        #endregion

        public BookCategory()
        {

        }

        public BookCategory(int? id, int? id2)
        {
            if (id != null && id2 != null)
            {
                BookCategory entity = Find(p => p.BookID == id2 && p.CategoryID == id).FirstOrDefault();
                if (entity != null)
                    entity.CopyTo<BookCategory>(this);
                else
                {
                    this.BookID = 0;
                    this.CategoryID = 0;
                }
            }
        }

        public bool Save()
        {
            bool rs = false;
            if (BookID > 0&&CategoryID>0)
                rs = Update(this) > 0;
            else
                rs = Add(this) != null;
            return rs;
        }
    }
}
