<%@ WebService Language="C#" Class="HighchartDemo" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
[System.Web.Script.Services.ScriptService]
public class HighchartDemo  : System.Web.Services.WebService {

    public class FruitEntity
    {
        public string Name { get; set; }
        public int Value { get; set; }

    }

    [WebMethod]
    public List<FruitEntity> FruitAnalysis()
    {
        List<FruitEntity> fruitinfo = new List<FruitEntity>();
        DataSet ds = new DataSet();
        using (SqlConnection conn = new SqlConnection("Data Source=.;User Id=sa;Password=199216.com;DataBase=PACKAGELIST"))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT name,value FROM DEMO_SIMPLE";
                cmd.Connection = conn;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds, "DEMO_SIMPLE");
                }
            }
        }
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables["DEMO_SIMPLE"].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables["DEMO_SIMPLE"].Rows)
                    {
                        fruitinfo.Add(new FruitEntity
                        {
                            Name = dr["name"].ToString(),
                            Value = Convert.ToInt32(dr["value"])
                        });

                    }
                }
            }

        }
        return fruitinfo;
    }

    //public string HelloWorld() {
    //    return "Hello World";
    //}

}