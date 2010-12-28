using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SubSonic.BaseClasses;
using SubSonic.Extensions;
using SubSonic.SqlGeneration.Schema;

namespace InternetPark.Core
{
    [SubSonicTableNameOverride("AttributeValues")]
    public partial class AttributeValue : EntityBase<AttributeValue>
    {
        #region Properties


        public override object Id
        {

            get { return AttributeValueID; }
            set { AttributeValueID = (int)value; }
        }

        [SubSonicPrimaryKey]
        public int AttributeValueID { get; set; }
        public int AttributeID{ get; set; }
        public string Value{ get; set; }

        #endregion

        public AttributeValue()
        {

        }

        public AttributeValue(object id)
        {
            if (id != null)
            {
                AttributeValue entity = Single(id);
                if (entity != null)
                    entity.CopyTo<AttributeValue>(this);
                else
                    this.AttributeValueID = 0;
            }
        }

        public bool Save()
        {
            bool rs = false;
            if (AttributeValueID > 0)
                rs = Update(this) > 0;
            else
                rs = Add(this) != null;
            return rs;
        }
    }
}
