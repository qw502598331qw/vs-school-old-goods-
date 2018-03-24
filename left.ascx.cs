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

public partial class left : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session == null || Session["User"] == null)
        {
            UserInfo.Text = "";
            UserInfo.Text = "欢迎您,请登录!";
            WelPanel.Visible = true;
            UserDetails.Visible = false;
        }
        else
        {
            UserInfo.Text = "";
            UserInfo.Text = "欢迎您!"+Session ["User"];
            WelPanel.Visible = false;
            UserDetails.Visible = true;
        }
    }
    protected void LoginButton_Click(object sender, ImageClickEventArgs e)
    {
        DataAccess MarketBase = new DataAccess();
        SqlConnection conn = new SqlConnection(MarketBase .SqlBase);
        if (txtUserName.Text == "" || txtPassword.Text == "")
        {
            Response.Write("<script language='javascript'>alert('请填写完整信息再点击登录')</script>");
            Response.Redirect("default.aspx");
        }
        else
        {
            try
            {
                conn.Open();
                DataTable GetUserInfoDt = new DataTable();
                GetUserInfoDt = MarketBase.DisPlayList_Ds("select * from userinfo where username='" + txtUserName.Text + "'and userpassword='" + txtPassword.Text + "'",conn);
                int CheckNum = GetUserInfoDt.Rows.Count;
                if (CheckNum == 1)
                {
                    Response.Write("<script language='javascript'>alert('登录成功!')</script>");
                    Session["User"] = GetUserInfoDt.Rows[0]["UserName"].ToString();
                    Session["UserId"] = GetUserInfoDt.Rows[0]["UserId"].ToString();
                    Response.Redirect("default.aspx");
                }
                else
                {
                    Response.Write("<script language='javascript'>alert('登录失败!请与数据管理员联系!')</script>");
                    Response.Redirect("default.aspx");
                }
            }
            catch (SqlException err)
            {
                Response.Write("<script language='javascript'>alert('" + err.Message + "')</script>");
            }
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProductor.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("PersonInfo.aspx");
    }
     protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Personbuy.aspx");
    }
    protected void RegInfoButton_Click(object sender, ImageClickEventArgs e)
    {
        txtPassword.Text = "";
        txtUserName.Text = "";
        Response.Redirect("register.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Session["UserId"] = null;
        WelPanel.Visible =true;
        UserDetails.Visible = false;
        UserInfo.Text = "欢迎您,请登录!";
    }
}
