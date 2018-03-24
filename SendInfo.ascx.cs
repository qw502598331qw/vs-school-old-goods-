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

public partial class SendInfo : System.Web.UI.UserControl
{
    string TempId;
    int state;
    public string contentsav;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
            txtNetName.Text = Session["User"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView liuyanDl = (GridView)Session["liuyan"];
        DataAccess MarketBase = new DataAccess();
        TempId =Request ["goodsid"];
        contentsav = txtContent.Value.ToString();
        //if (contentsav.Length > 8)
        //    contentsav = contentsav.Substring(0, 8);

        if (txtNetName.Text == "" || txtContent.Value == "")
           // Response.Write("<script language='javascript'>alert('请你务必填写必要的项')</script>");
            lbInfo .Text ="请你务必填写必要的项";
        else
        {
            SqlConnection conn = new SqlConnection(MarketBase .SqlBase);
            try
            {
                conn.Open();

                string TempTime = DateTime.Now.ToString("yyyy-MM-dd");
                state = MarketBase.AddInfo("insert into message(titlecontent,username,phone,sendtime,goodsid)values('" + this.contentsav + "','" + txtNetName.Text + "','" + txtPhone.Text + "','" + TempTime + "','" + TempId + "')", conn);
                if (state == 1)
                {
                    //Response.Write("<script language='javascript'>alert('操作成功!')</script>");
                    lbInfo.Text = "操作成功!";
                  //  Response.Redirect("Detail.aspx?goodsid=" + TempId);
                    txtNetName.Text = "";
                    txtContent.Value = "";
                    txtPhone.Text = "";
                    DataSet ds = new DataSet();
                    SqlDataAdapter adpter = new SqlDataAdapter("select * from message where goodsid='" + TempId + "'", conn);

                    adpter.Fill(ds);
                    liuyanDl.DataSource = ds.Tables[0].DefaultView;
                    liuyanDl.DataBind();
                }
                else
                { 
                 //   Response.Write("<script language='javascript'>alert('操作失败,请与数据管理员联系')</script>");
                    lbInfo.Text = "操作失败,请与数据管理员联系!";
                   // Server.Transfer("Detail.aspx?goodsid=" + TempId);
                    txtNetName.Text = "";
                    txtContent.Value = "";
                    txtPhone.Text = "";
                }

            }
            catch (SqlException err)
            {
                lbInfo.Text = err.Message.ToString();
             //   Response.Write("<script language='javascript'>alert('"+err .Message+"')</script>");   
            }

        }
    }
}
