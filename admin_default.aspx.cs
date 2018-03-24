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

public partial class admin_default : System.Web.UI.Page
{
    DataAccess db=new DataAccess ();
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["aid"] == null)
            {
                Response.Redirect("admin_login.aspx");
                return;
            }
            dt = db.GetDataTable("select goodsid,goodstitle,email,contractman,phone,address,content,buysell,price,protime,downcount from goods order by downcount desc");
            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int num = e.RowIndex;
        string gid = GridView1.Rows[num].Cells[0].Text.ToString();
        int result = db.ExecuteSQL("delete from goods where goodsid='" + gid + "'");
        dt = db.GetDataTable("select goodsid,goodstitle,email,contractman,phone,address,content,buysell,price,protime,downcount from goods order by downcount desc");
        GridView1.DataSource = dt.DefaultView;
        GridView1.DataBind();
        if (result == 1)
            Response.Write("<script language='javascript'>alert('删除成功!')</script>");
        else
            Response.Write("<script language='javascript'>alert('删除失败!')</script>");

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        dt = db.GetDataTable("select goodsid,goodstitle,email,contractman,phone,address,content,buysell,price,protime,downcount from goods order by downcount desc");
        GridView1.DataSource = dt.DefaultView;
        GridView1.DataBind();
    }
}
