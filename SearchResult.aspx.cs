using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class SearchResult : System.Web.UI.Page
{
    DataAccess MarketBase = new DataAccess();
    DataTable GetKeyInfo = new DataTable();
    string sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
            string KeyWords=Request["KeyWords"];
            string SearchTypeTemp=Request["type"];
            string SortType=Request["sort"];
            string GoodTime=Request["time"];
            int day = int.Parse(GoodTime);
            TimeSpan ts=new TimeSpan(day,0,0,0,0);
           
            DateTime today=DateTime.Now;
            DateTime searchtime = today.Subtract(ts);
            if (SearchTypeTemp == "title")
            {
                SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
                conn.Open();
                if (GoodTime == "8" && SortType == "13")
                {
                    sql = "select * from goods where GoodsTitle like'%" + KeyWords + "%'";
                    GetKeyInfo = MarketBase.DisPlayList_Ds(sql, conn);
                }
                else if (GoodTime == "8")
                {
                    sql = "select * from goods where GoodsTitle like'%" + KeyWords + "%' and GoodTypeID='" + SortType + "'";
                    GetKeyInfo = MarketBase.DisPlayList_Ds(sql, conn);
                }
                
                else if(SortType=="13")
                {
                    sql = "select * from goods where goodstitle like '%" + KeyWords + "%' and ProTime between '" + searchtime + "'and '" + today + "'";
                    GetKeyInfo = MarketBase.DisPlayList_Ds(sql, conn);    
                }
                else
                {
                    sql = "select * from goods where goodstitle like '%" + KeyWords + "%' and GoodTypeID='" + SortType + "' and ProTime between '" + searchtime + "'and '" + today + "'";
                    GetKeyInfo = MarketBase.DisPlayList_Ds(sql,conn);
                }
            }
            else if (SearchTypeTemp == "content")
            {
                SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
                conn.Open();
                if (GoodTime == "8" && SortType == "13")
                {
                    sql = "select * from goods where content like'%" + KeyWords + "%'";
                    GetKeyInfo = MarketBase.DisPlayList_Ds(sql, conn);
                }
                
                else if (GoodTime == "8")
                {
                    sql = "select * from goods where content like'%" + KeyWords + "%' and GoodTypeID='" + SortType + "'";
                    GetKeyInfo = MarketBase.DisPlayList_Ds(sql, conn);
                }
                else if(SortType=="13")
                {
                    sql = "select * from goods where content like '%" + KeyWords + "%' and ProTime between '" + searchtime + "'and '" + today + "'";
                    GetKeyInfo = MarketBase.DisPlayList_Ds(sql, conn);   
                }
                else
                {
                    sql = "select * from goods where content like '%" + KeyWords + "%' and GoodTypeID='" + SortType + "' and ProTime between '" + searchtime + "'and '" + today + "'";
                    GetKeyInfo = MarketBase.DisPlayList_Ds(sql, conn);
                }
            }
            searchreusltgv.DataSource = GetKeyInfo.DefaultView;
            searchreusltgv.DataBind();
        }
    }
    protected void searchreusltgv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        searchreusltgv.PageIndex = e.NewPageIndex;
        searchreusltgv.DataSource = GetKeyInfo.DefaultView;
        searchreusltgv.DataBind();
    }
}
