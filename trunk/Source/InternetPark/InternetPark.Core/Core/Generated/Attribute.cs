using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SubSonic.BaseClasses;
using SubSonic.Extensions;
using SubSonic.SqlGeneration.Schema;

namespace InternetPark.Core
{
    [SubSonicTableNameOverride("Attributes")]
    public partial class Attribute : EntityBase<Attribute>
    {
        #region Properties


        public override object Id
        {

            get { return AttributeID; }
            set { AttributeID = (int)value; }
        }

        [SubSonicPrimaryKey]
        public int AttributeID { get; set; }
        public string Name { get; set; }
        public int Type { get; set; }

        #endregion

        public Attribute()
        {

        }

        public Attribute(object id)
        {
            if (id != null)
            {
                Attribute entity = Single(id);
                if (entity != null)
                    entity.CopyTo<Attribute>(this);
                else
                    this.AttributeID = 0;
            }
        }

        public bool Save()
        {
            bool rs = false;
            if (AttributeID > 0)
                rs = Update(this) > 0;
            else
                rs = Add(this) != null;
            return rs;
        }
    }
}
