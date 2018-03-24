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

public partial class TOP10 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccess MarketBase = new DataAccess();
        SqlConnection conn = new SqlConnection(MarketBase .SqlBase);
        conn.Open();
        DataTable GetHotPro = new DataTable();
        GetHotPro = MarketBase.DisPlayList_Ds("select top 50 GoodsTitle,goodsid,buysell from goods order by ProTime desc",conn);
        HotProDl.DataSource = GetHotPro.DefaultView;
        HotProDl.DataBind();
    }

    public string Limit(string ValContent, string Flag)
    {
        string Result_Limit;

        string Result_Flag;

        if (Flag == "求")
        {

            Result_Flag = "<font color=red>【卖】</font>";
        }
        else
        {

            Result_Flag = "<font color=red>【卖】</font>";
        }


        if (ValContent.Length <=7)
        {


            Result_Limit = ValContent;

            return Result_Flag + Result_Limit;

        }

        else
        {

            Result_Limit = ValContent.Substring(0, 7);

            return Result_Flag + Result_Limit + "..";
        }
    }
}
