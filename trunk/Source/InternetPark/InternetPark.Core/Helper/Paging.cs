using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace InternetPark.Core
{
    public class Paging
    {
        int pageIndex;

        public int PageIndex
        {
            get { return pageIndex; }
            set { pageIndex = value; }
        }
        public Paging(int pageIndex)
        {
            this.pageIndex = pageIndex;
        }


        public string ShowPaging(string query, bool ajax, int totalPage, int pageView, string para, string indexSymbol, int index)
        {
            string str = "";
            string queryIndex = "";
            int totalIndex;
            string type = "";

            if (totalPage % pageView == 0)
            { totalIndex = (totalPage / pageView); }
            else
            { totalIndex = (totalPage / pageView) + 1; }

            type = QueryHelper.GetQueryString(HttpContext.Current.Request, _No_Change_Query.type);
            if (HttpContext.Current.Request.QueryString[para] != null)
            {
                pageIndex = LibConvert.ConvertToInt(HttpContext.Current.Request.QueryString[para].ToString(), 0);                
            }
            if (!ajax)
            {
                if (type == "")
                {
                    queryIndex = "" + query + "?" + _No_Change_Query.type + "=" + _No_Change_Query.newBooks + "&" + para + "=" + pageIndex + "&" + indexSymbol + "=";
                    query = "" + query + "?" + _No_Change_Query.type + "=" + _No_Change_Query.newBooks + "&" + para + "=";
                }
                else
                {
                    queryIndex = "" + query  + "&" + para + "=" + pageIndex + "&" + indexSymbol + "=";
                    query = "" + query + "&" + para + "=";
                }
            }
            if (totalPage <= 0)
            {
                return str;
            }

            str += string.Format(@"
                <div class=""results"">
                    <span style=""text-align:right;"">Page {0}/{1}</span>
                </div>", pageIndex, totalPage);
            str += "";
            str += string.Format(@"
                <ul class=""pager grid_8"">");
            if (totalPage > pageView)
            {
                if (index > 1)
                {
                    str += string.Format(@"<li><a href=""{0}{1}"">&laquo;</a></li>", queryIndex, index - 1);
                }
                else
                {
                    str += string.Format(@"<li><a href=""{0}{1}"">&laquo;</a></li>", queryIndex, index);
                }

                //str += string.Format(@"<li class=""current"">{0}</li>", pageIndex);

                int numBegin = ((index - 1) * pageView) + 1;
                int k;
                if (index * pageView > totalPage)
                {
                    k = (totalPage - ((index - 1) * pageView)) + pageView;
                }
                else
                { k = index * pageView; }
                for (int i = numBegin; i <= k; i++)
                {
                    if (i != pageIndex)
                    {
                        str += string.Format(@"
                    <li><a href=""{0}{1}&{2}={3}"">{4}</a></li>", query, i, indexSymbol, index, i);
                    }
                    else
                    { str += string.Format(@"<li class=""current"">{0}</li>", pageIndex); }
                }
                if (index < totalIndex)
                {
                    str += string.Format(@"<li><a href=""{0}{1}"">&raquo;</a></li>", queryIndex, index + 1);
                }
                else
                { str += string.Format(@"<li><a href=""{0}{1}"">&raquo;</a></li></ul>", queryIndex, index); }

            }
            else
            {
                for (int i = 1; i <= totalPage; i++)
                {
                    if (i != pageIndex)
                    {
                        str += string.Format(@"
                    <li><a href=""{0}{1}"">{1}</a></li>", query, i, i);
                    }
                    else
                    { str += string.Format(@"<li class=""current"">{0}</li>", pageIndex); }
                }
                str += @"</ul>";
            }

            return str;
        }
    }
}
