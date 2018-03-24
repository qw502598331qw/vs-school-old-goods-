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

public partial class Search : System.Web.UI.UserControl
{
    private void InitializeComponent()
    {
        base.Load += new EventHandler(this.Page_Load);
    }

    protected override void OnInit(EventArgs e)
    {
        this.InitializeComponent();
        base.OnInit(e);
    }   


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataAccess MarketBase = new DataAccess();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            conn.Open();
            DataTable dt_sort = new DataTable();
            dt_sort = MarketBase.DisPlayList_Ds("select * from GoodType", conn);
            DropFenlei.DataTextField = "TypeName";
            DropFenlei.DataValueField = "GoodTypeID";
            DropFenlei.DataSource = dt_sort.DefaultView;
            DropFenlei.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string Key;
        
        if (txtKeyword .Text == "" || txtKeyword .Text == null)
        {
           // Response.Write("<script>alert('请填写要查询的内容')</script>");
            infolabel.Text = "请填写要查询的内容";
        }
        else
        {

            Key = txtKeyword .Text;

            Response.Redirect("SearchResult.aspx?KeyWords=" + Key + "&&Type=" + SearchType.SelectedValue + "&&sort=" + DropFenlei.SelectedValue + "&&time=" + DropTime.SelectedValue);

        }
    }
}
