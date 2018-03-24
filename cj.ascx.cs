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

public partial class cj : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            DataAccess MarketBase = new DataAccess();

            DataTable Dt_Pro = new DataTable();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);

            conn.Open();


            Dt_Pro = MarketBase .DisPlayList_Ds("select  top 10 TitleS,id,content from faqc  order by id desc", conn);

            DtProblems.DataSource = Dt_Pro.DefaultView;

            DtProblems.DataBind();
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
