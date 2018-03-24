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

public partial class Deskop : System.Web.UI.Page
{
    public string[] picImg = new string[7];
    public string[] picName = new string[7];
    DataAccess MarketBase = new DataAccess();
    SqlConnection conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            conn = new SqlConnection(MarketBase.SqlBase);
            conn.Open();
          
            DataTable dt1 = MarketBase.DisPlay_DT("select top 7 goodstitle,picpath,goodsid,protime from goods where flag='1' order by protime desc",conn);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                picImg[i] = "<a href='detail.aspx?goodsid="+ dt1.Rows[i][2] +"'><img src='" + dt1.Rows[i][1] + "' alt='查看详细' height='90' width='105' style='border:1px solid #848684'/></a>";
                picName[i] = dt1.Rows[i][0].ToString();
            }
       } 
    }

    public string Limit(string ValContent)
    {
        string Result_Limit;
        if (ValContent.Length <= 15)
            Result_Limit = ValContent;
        else
            Result_Limit = ValContent.Substring(0,15)+"...";
        return Result_Limit;
    }
}
