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

public partial class GL : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataAccess MarketBase = new DataAccess();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            conn.Open();
            DataTable DtGl = new DataTable();
            DtGl = MarketBase.DisPlayList_Ds("select top 10 titles,id,content from faqg order by id desc", conn);
            Dt_gonglue.DataSource = DtGl.DefaultView;
            Dt_gonglue.DataBind();
            conn.Close();
        }

    }

    public string Limit(string ValContent)
    {
        string Result_Limit;

        if (ValContent.Length < 25)
        {

            //Result_Limit= ValContent.Substring(0,10);

            Result_Limit = ValContent;

            return Result_Limit;

        }

        else
        {

            Result_Limit = ValContent.Substring(0, 20);

            return Result_Limit + "...";
        }
    }
}
