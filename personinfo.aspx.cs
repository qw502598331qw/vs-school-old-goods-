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

public partial class personinfo : System.Web.UI.Page
{

    
    DataAccess MarketBase = new DataAccess();
    protected void Page_Load(object sender, EventArgs e)
    {
        string useridNo = Session["UserId"].ToString();
        SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
        conn.Open();
        DataTable dt = new DataTable();
        dt = MarketBase.DisPlayList_Ds("select * from goods where userid='" + useridNo + "'", conn);
        person.DataSource = dt.DefaultView;
        person.DataBind();    
    }


    protected void person_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string useridNo = Session["UserId"].ToString();
        int index = Convert.ToInt32(e.CommandArgument);
        string id = person.Rows[index].Cells[0].Text;
        SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
        conn.Open();
        int state = MarketBase.DeleteInfo("delete from goods where goodsid='" + id + "'", conn);
        if (state == 1)
        {
            lbinfo.Text = "删除成功!";
            DataTable dt = new DataTable();
            dt = MarketBase.DisPlayList_Ds("select * from goods where userid='" + useridNo + "'", conn);
            person.DataSource = dt.DefaultView;
            person.DataBind();
        }
        else
            lbinfo.Text = "删除失败!";
    }



}
