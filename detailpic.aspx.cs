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

public partial class detailpic : System.Web.UI.Page
{
    public string RegId;

    DataTable GetUserInfoDt = new DataTable();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        RegId = Request["idp"];
        if (!IsPostBack)
        {

            DataAccess MarketBase = new DataAccess();

            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            try
            {
                conn.Open();

                GetUserInfoDt = MarketBase.DisPlayList_Ds("select picpath from goods where goodsid='" + RegId + "'", conn);

                if (GetUserInfoDt.Rows[0]["picpath"].ToString() == null || GetUserInfoDt.Rows[0]["picpath"].ToString() == "")
                {
                    goodspic.Src = "images/pic/yunnan.gif";
                }
                else
                {
                    goodspic.Src =GetUserInfoDt.Rows[0]["picpath"].ToString();
                }
            }

            catch (SqlException err)
            {

                Response.Write("<script language='javascript'>alert('" + err.Message + "')</script>");
            }

        }

    }
}
