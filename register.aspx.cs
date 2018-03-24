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

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataAccess MarketBase = new DataAccess();
        int State;
        string time;
        if (txtName.Value == "" || txtPassword.Value == "")
        {
            //Response.Write("<script language='javascript'>alert('')</script>");
            lbInfo .Text ="请你务必填写必要的项!";
        }
        if (txtPassword.Value != txtConfirmPassword.Value)
            lbInfo.Text = "两次密码不一致,请核实!";
        SqlConnection conn = new SqlConnection(MarketBase .SqlBase);
        try
        {
            conn.Open();
            if(MarketBase.DisPlayList_Ds("select * from userinfo where username='" + txtName.Value + "'", conn).Rows.Count != 0)
                lbInfo.Text = "你注册的用户名已经被别人注册,请改其它的名字注册";
            else if (MarketBase.DisPlayList_Ds("select * from userinfo where Email='" + txtEMail.Value + "'", conn).Rows.Count != 0)
                lbInfo.Text = "你注册的EMail已经被别人注册,请改其它的EMail注册";
            else
            {
                conn.Open();
                time = DateTime.Now.ToString("yyyy-MM-dd-hh-mm");
                string connString = "insert into userinfo(username,userpassword,regtime,sex,codeNumber,Email,MPhone)values('"+txtName.Value +"','"+txtPassword .Value +"','"+time +"','"+dropdownSex.Value +"','"+txtNumber.Value+"','"+txtEMail .Value +"','"+txtPhone.Value +"')";
                State = MarketBase.AddInfo(connString ,conn);
                if (State == 1)
                {
                   // Response.Write("<script language='javascript'>alert('操作成功!')</script>");
                    // Response.Redirect("regsucess.aspx");
                    lbInfo.Text = "操作成功!";
                }
                else
                    lbInfo.Text = "操作失败!请与数据管理员联系!";
            }
        }
        catch(SqlException err)
        {
            lbInfo.Text = err.Message.ToString();
        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("default.aspx");
    }
}
