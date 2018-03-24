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

public partial class ajaxServer : System.Web.UI.Page
{
    DataAccess MarketBase = new DataAccess();
    protected void Page_Load(object sender, EventArgs e)
    {
        string xmltext = "<seconds>";
        string first = Request["first"];
        SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
        conn.Open();
        DataTable dt = new DataTable();
        //dt = MarketBase.DisPlayList_Ds("select GoodType2Name from GoodType,GoodType2 where GoodType.GoodTypeID=GoodType2.GoodTypeID and GoodType.TypeName='" + first + "'", conn);
        dt = MarketBase.DisPlayList_Ds("select GoodType2Name from GoodType2 where GoodTypeID='" + first + "'", conn);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            xmltext += "<second>";
            xmltext += dt.Rows[i][0].ToString();
            xmltext += "</second>";
        }
        xmltext += "</seconds>";
        Response.ContentType = "text/xml";
        Response.Write(xmltext);


    }
}
