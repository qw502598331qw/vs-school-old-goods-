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


public partial class admin_login : System.Web.UI.Page
{
    DataAccess db = new DataAccess();
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginBt_Click(object sender, ImageClickEventArgs e)
    {
        string sqlstring = "select * from admin where adminname='" + userNameTxt.Text.Trim() + "'and adminpass='" + userPwdTxt.Text.Trim() + "'";
        DataRow drow = db.GetDataRow(sqlstring);
        if (drow == null)
        {
            infornlabel.Text = "用户名不存在或密码错误!";
            userNameTxt.Text = "";
            return;
        }
        else
        {

            Session["aid"] = userNameTxt.Text.Trim();
            Response.Redirect("admin_default.aspx");
        }

    }
}
