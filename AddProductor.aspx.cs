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

public partial class AddProductor : System.Web.UI.Page
{
    DataAccess MarketBase = new DataAccess();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            conn.Open();
            DataTable dt1 = new DataTable();
            dt1 = MarketBase.DisPlayList_Ds("select * from GoodType", conn);
            firstKind.DataTextField = "TypeName";
            firstKind.DataValueField = "GoodTypeID";
            firstKind.DataSource = dt1.DefaultView;
            firstKind.DataBind();
            DataTable dt = new DataTable();
            int id = int.Parse(firstKind.Value);
            dt = MarketBase.DisPlayList_Ds("select * from GoodType2 where GoodTypeID='" + id + "'", conn);
            secondKind.DataTextField = "GoodType2Name";
            secondKind.DataValueField = "GoodType2ID";
            secondKind.DataSource = dt.DefaultView;
            secondKind.DataBind();
        }
        

    }
  protected void btSave_Click(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
            lbinforn.Text = "请先登录再发表新的信息";
        else
        {
            int state;
            string picpath;
            string useridnumber = Session["UserId"].ToString();
            string markeddate = DateTime.Now.ToString("yyyy-MM-dd");
            string time = txtTime.Value;
            string CheckFlag;
            string Pic;
                SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
                conn.Open();
                HttpPostedFile httpup = FileUp.PostedFile;
                if (httpup.ContentLength != 0)
                {
                    string PathFileName = httpup.FileName;
                    int i = PathFileName.LastIndexOf("\\");
                    string filename = PathFileName.Substring(i + 1);
                    httpup.SaveAs(Server.MapPath("images/pic/" + filename));
                    picpath = "images/pic/" + filename;
                    Pic = "1";
                    CheckFlag = "1";
                }
                else
                {
                    picpath = null;
                    Pic = "0";
                    CheckFlag = "0";
                }
                string test = "insert into goods(GoodsTitle,flag,Email,IsGoodsPic,ContractMan,Phone,Address,Content,BuySell,Price,PicPath,ProTime,ProTimeEnd,GoodTypeID,GoodType2ID,userid)"
                + "values('" + txtTitle.Value + " ','" + CheckFlag + "','" + txtEmail.Value + "' ,'" + Pic + " ','" + txtName.Value + "',' " + txtPhone.Value + "','" + txtAddress.Value + "','" + txtContent.Value + "','" + dropBuySell.Value + "','" + txtPrice.Value + "','" + picpath + "','" + markeddate + "','" + time +"','" + firstKind.Value + "','" + secondKind.Value + "','" + useridnumber + "')";
                state = MarketBase.AddInfo(test, conn);
                if (state == 1)
                {
                    lbinforn.Text = "添加成功!";

                    txtTitle.Value = "";
                    txtEmail.Value = "";
                    txtName.Value = "";
                    txtPhone.Value = "";
                    txtAddress.Value = "";
                    txtContent.Value = "";
                    txtPrice.Value = "";
                    txtTime.Value = "";
                }
                else
                    lbinforn.Text = "操作失败!";

        }
   }

    protected void fistkind_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
        conn.Open();
        DataTable dt = new DataTable();
        int id = int.Parse(firstKind.Value);
        dt = MarketBase.DisPlayList_Ds("select * from GoodType2 where GoodTypeID='"+id+"'", conn);
        secondKind.DataTextField = "GoodType2Name";
        secondKind.DataValueField = "GoodType2ID";
        secondKind.DataSource = dt.DefaultView;
        secondKind.DataBind();
    }
    protected void btBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("default.aspx");

    }
}
