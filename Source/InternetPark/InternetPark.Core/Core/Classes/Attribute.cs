using System;
using System.Collections.Generic;
using System.Linq;
using SubSonic.Extensions;
using SubSonic.BaseClasses;
using SubSonic.SqlGeneration.Schema;

namespace InternetPark.Core
{
    public partial class Attribute
    {
        // all method is static
        public static Attribute GetAttributeByID(int id)
        {
            return Single(id);
        }
        public static IQueryable<Attribute> GetAllAttribute()
        {
            return All();
        }
    }
}