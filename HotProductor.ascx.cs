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

public partial class HotProductor : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccess MarketBase = new DataAccess();
        SqlConnection conn = new SqlConnection(MarketBase .SqlBase );
        conn.Open();
        DataTable GetHotPro = new DataTable();
        GetHotPro = MarketBase.DisPlayList_Ds("select  top 15 GoodsTitle,goodsid,downcount from goods order by downcount desc", conn);
        HotProDl.DataSource = GetHotPro.DefaultView;
        HotProDl.DataBind();
    }

    public string Limit(string ValContent)
    {
        string Result_Limit;

        if (ValContent.Length <= 6)
        {

            //Result_Limit= ValContent.Substring(0,10);

            Result_Limit = ValContent;

            return Result_Limit;

        }

        else
        {

            Result_Limit = ValContent.Substring(0, 6);

            return Result_Limit + "<font color=blue>..</font>";
        }
    }
}
