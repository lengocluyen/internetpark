using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SubSonic.BaseClasses;
using SubSonic.Extensions;
using SubSonic.SqlGeneration.Schema;

namespace InternetPark.Core
{
    [SubSonicTableNameOverride("Books")]
    public partial class Book:EntityBase<Book>
    {
         #region Properties

		
        public override object Id
        {

            get { return BookID; }
            set { BookID = (int)value; }
        }

		[SubSonicPrimaryKey]
		public int BookID { get; set; }
		public string Title { get; set; }
		public string IntroText { get; set; }
		public string FullText { get; set; }
		public DateTime? Created{ get; set; }
        public string Image {get;set;}
        public long Size {get;set;}
        public int Pages {get;set;}
        public int Downloads {get;set;}
        public int Hits {get;set;}
        public string FileType {get;set;}
        public string ISBN {get;set;}
        public string Publisher {get;set;}
        public string Url {get;set;}
        public bool IsActive {get;set;}
        #endregion

        public Book()
        {

        }

        public Book(object id)
        {
			if (id != null)
            {
				Book entity = Single(id);
				if (entity != null)
                    entity.CopyTo<Book>(this);
				else
                    this.BookID = 0;
			}
        }

        public bool Save()
        {
            bool rs = false;
            if (BookID > 0)
                rs = Update(this) > 0;
            else
                rs = Add(this) != null;
            return rs;
        }
    }
}
