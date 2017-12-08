using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class easyui_highcharts_1_lineGraph_basic : System.Web.UI.Page
{
    DataSet dsSeries = new DataSet();
    public string Name;
    public string Value;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dsSeries = BindData();
        }
        foreach (DataRow dr in dsSeries.Tables[0].Rows)
        {
            Name = Name + dr["name"].ToString() + ",";
        }
        foreach (DataRow dr1 in dsSeries.Tables[0].Rows)
        {
            Value = Value + dr1["value"].ToString() + ",";
        }

    }

    private DataSet BindData()
    {
        string connString = ConfigurationManager.ConnectionStrings["conn"].ToString();
        SqlConnection con = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT name,value FROM DEMO_SIMPLE";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        try
        {
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}