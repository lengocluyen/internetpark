using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SubSonic.BaseClasses;
using SubSonic.Extensions;
using SubSonic.SqlGeneration.Schema;

namespace InternetPark.Core
{
    [SubSonicTableNameOverride("BookAttributeValues")]
    public partial class BookAttributeValue : EntityBase<BookAttributeValue>
    {
        #region Properties


        public override object Id
        {

            get { return AttributeValueID; }
            set { AttributeValueID = (int)value; }
        }
        public object Id2
        {
            get { return BookID; }
            set { BookID = (int)value; }

        }

        [SubSonicPrimaryKey]
        public int BookID { get; set; }
        [SubSonicPrimaryKey]
        public int AttributeValueID { get; set; }

        #endregion

        public BookAttributeValue()
        {

        }

        public BookAttributeValue(int? id, int? id2)
        {
            if (id != null && id2 != null)
            {
                BookAttributeValue entity = Find(p => p.BookID == id2 && p.AttributeValueID == id).FirstOrDefault();
                if (entity != null)
                    entity.CopyTo<BookAttributeValue>(this);
                else
                {
                    this.BookID = 0;
                    this.AttributeValueID = 0;
                }
            }
        }

        public bool Save()
        {
            bool rs = false;
            if (BookID > 0 && AttributeValueID > 0)
                rs = Update(this) > 0;
            else
                rs = Add(this) != null;
            return rs;
        }
    }
}
