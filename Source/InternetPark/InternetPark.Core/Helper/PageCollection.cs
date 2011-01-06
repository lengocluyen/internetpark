using System;
using System.Collections;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

namespace InternetPark.Core
{
    /// <summary>
    /// Summary description for PageCollection
    /// </summary>
    public class PageCollection
    {
        public PageCollection()
        {
        }
        public PageCollection(int pageSize, int numberPageView, ArrayList listItem)
        {
            this.dataSource = null;           
            this.listItem = null;
            this.count = 0;
            this.current = 0;
            this.totalPage = 0;
            this.pageSize = 0;
            this.numberPageView = 0;
            this.PageSize = pageSize;
            this.NumberPageView = numberPageView;
            this.ListItem = listItem;
        }
     
        private int count;
        private int Count
        {
            get
            {
                return this.count;
            }
            set
            {
                this.count = value;
            }
        }
        private int current;
        private int Current
        {
            get
            {
                return this.current;
            }
            set
            {
                this.current = value;
            }
        }
        private ArrayList dataSource;
        public ArrayList DataSource
        {
            get
            {
                return this.Paging();
            }
            set
            {
                this.dataSource = value;
            }
        }
       
        private ArrayList listItem;
        private ArrayList ListItem
        {
            get
            {
                return this.listItem;
            }
            set
            {
                this.listItem = value;
            }
        }
        private int numberPageView;
        private int NumberPageView
        {
            get
            {
                return this.numberPageView;
            }
            set
            {
                if (this.numberPageView > 0)
                {
                    this.numberPageView = value;
                }
                else
                {
                    this.numberPageView = 4;
                }
            }
        }
        private int pageSize;
        private int PageSize
        {
            get
            {
                if (this.pageSize > 0)
                {
                    return this.pageSize;
                }
                return 1;
            }
            set
            {
                this.pageSize = value;
            }
        }
        private int totalPage;
        private int TotalPage
        {
            get
            {
                return this.totalPage;
            }
            set
            {
                this.totalPage = value;
            }
        }
        public string ShowInformation(string query, bool ajax, string parameter)
        {
            string str = "";
            if (this.ListItem.Count <= 0)
            {
                return str;
            }
            string str2 = ")";
            if (!ajax)
            {
                query = "" + query + "&" + parameter + "=";
                str2 = "";
            }
            int num = 0;
            int pageSize = this.PageSize;
            int count = this.ListItem.Count;
            this.count = count;
            int num4 = count / pageSize;
            if ((num4 * pageSize) < count)
            {
                num4++;
            }
            this.totalPage = num4;
            if (HttpContext.Current.Request.QueryString[parameter] != null)
            {
                num = this.ConvertToInt(HttpContext.Current.Request.QueryString[parameter].ToString());
            }
            if ((num <= 0) || (num > num4))
            {
                num = 1;
            }
            this.current = num;
            object obj2 = str;
            str = string.Concat(new object[] { obj2, "<div align=\"center\">" });
            //if (num > 1)
            //{
            string str4 = str;
            obj2 = str4 + "<a class=\"num1\" href=\"" + query + "1" + str2 + "\"  ></a>";
            str = string.Concat(new object[] { obj2, "<a class=\"num1\" href=\"", query, num - 1, str2, "\" >  &laquo;</a>" });
            //}
            //else
            //{
            //    //str = str + "<span  class=\"num1\">" +"«"+" &nbsp;&nbsp;<&nbsp;&nbsp;&nbsp;</span>";
            //}
            int num5 = this.NumberPageView / 2;
            int num6 = 0;
            int num7 = 0;
            num6 = num - num5;
            if (num == num4)
            {
                num6--;
            }
            if (num6 <= 0)
            {
                num6 = 1;
            }
            if (num6 == 1)
            {
                num7 = num6 + this.NumberPageView;
            }
            else
            {
                num7 = num + (this.NumberPageView / 2);
            }
            if ((num7 * pageSize) < num4)
            {
                num7++;
            }
            if (num7 > num4)
            {
                num7 = num4;
                num6 = num4 - this.NumberPageView;
                if (num6 <= 0)
                {
                    num6 = 1;
                }
            }
            for (int i = num6; i <= num7; i++)
            {
                if (i == num)
                {
                    obj2 = str;
                    str = string.Concat(new object[] { obj2, "&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"num1\" >", i, "</span>" });
                }
                else
                {
                    obj2 = str;
                    str = string.Concat(new object[] { obj2, "&nbsp;&nbsp;&nbsp;&nbsp;<a class=\"num1\" href=\"", query, i, str2, "\">", i, "</a>" });
                }
            }
            if (num < num4)
            {
                obj2 = str;
                obj2 = string.Concat(new object[] { obj2, "<a class=\"num1\" href=\"", query, num + 1, str2, "\">&nbsp;</a>" });
                str = string.Concat(new object[] { obj2, "<a class=\"num1\" href=\"", query, num4, str2, "\">&nbsp;&nbsp;&nbsp;&nbsp;&raquo;</a>" });
            }
            else
            {
                //str = str + "<a class=\"num1\">&raquo;</span>";
            }
            return (str + "</div>");
        }
        private ArrayList Paging()
        {
            ArrayList list = new ArrayList();
            if (this.ListItem.Count >= 1)
            {
                int num;
                if (this.Current == 1)
                {
                    if (this.Count > this.PageSize)
                    {
                        for (num = 0; num < this.PageSize; num++)
                        {
                            list.Add(this.ListItem[num]);
                        }
                        return list;
                    }
                    num = 0;
                    while (num < this.Count)
                    {
                        list.Add(this.ListItem[num]);
                        num++;
                    }
                    return list;
                }
                if (this.Current == this.TotalPage)
                {
                    for (num = (this.TotalPage - 1) * this.PageSize; num < this.Count; num++)
                    {
                        list.Add(this.ListItem[num]);
                    }
                    return list;
                }
                int num2 = (this.Current - 1) * this.PageSize;
                if (num2 > this.ListItem.Count)
                {
                    num2 = 0;
                }
                int count = this.Current * this.PageSize;
                if (count > this.ListItem.Count)
                {
                    count = num2 * this.PageSize;
                }
                if (count > this.ListItem.Count)
                {
                    count = this.ListItem.Count;
                }
                for (num = num2; num < count; num++)
                {
                    list.Add(this.ListItem[num]);
                }
            }
            return list;
        }
        private int ConvertToInt(object obj)
        {
            try
            {
                return Convert.ToInt32(obj);
            }
            catch
            {
                return 0;
            }
        }
    }
}