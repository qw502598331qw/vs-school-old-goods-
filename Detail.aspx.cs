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

public partial class Detail : System.Web.UI.Page
{
    DataAccess MarketBase = new DataAccess();
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request["goodsid"];
        //  string id = "1";
        Session["liuyan"] = liuyanDl;
        DataAccess MarketBase = new DataAccess();
        SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
        conn.Open();
        if (!IsPostBack)
        {
            int state = MarketBase.ModInfo("update goods set downcount=downcount+1 where goodsid='" + id + "'", conn);
           

        }
        DataTable MarketDt = new DataTable();
        MarketDt = MarketBase.DisPlayList_Ds("select * from goods where goodsid='" + id + "'", conn);
        MarketDetailDl.DataSource = MarketDt.DefaultView;
        MarketDetailDl.DataBind();
        DataSet ds = new DataSet();
        SqlDataAdapter adpter = new SqlDataAdapter("select * from message where goodsid='" + id + "'", conn);

        adpter.Fill(ds);
        liuyanDl.DataSource = ds.Tables[0].DefaultView;
        liuyanDl.DataBind();

    }

    public string Checked(string path)
    {
        string Result;
        if (path == null || path == "")
            Result = "images/pic/yunnan.gif";
        else
            Result = path;
        // Result = "upload/" + path;
        return Result;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int state;
        int state1;
        string id = Request["goodstitle"];
        String useridnumber = Session["UserId"].ToString();
        SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
        conn.Open();
        state = MarketBase.AddInfo("insert into buy(username,goodtitle)values('" + useridnumber + "','" + id + "')", conn);
        SqlConnection conn1 = new SqlConnection(MarketBase.SqlBase);
        conn1.Open();
        state1 = MarketBase.ModInfo("update goods set con=con-1 where goodstitle='" + id + "'", conn1);
    }


}
