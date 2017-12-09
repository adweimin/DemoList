<%@ WebHandler Language="C#" Class="HighchartDemo" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Serialization;
using Common;

public class HighchartDemo : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/json";
        int nowYear = DateTime.Now.Year;
        SQLHelper pSqlHelper = new SQLHelper();
        pSqlHelper.OpenConnection();
        DataTable dt = pSqlHelper.GetDBTable("select * from T_BookType where Data>=" + (nowYear - 2) + "  and   Data<=" + nowYear).Tables[0];
        pSqlHelper.RealeaseConnection();
        string json = DataTableMutilJson(dt);

        context.Response.Write(json);
        context.Response.End();
    }

    //public class demoArry {
    //    public int x { get; set; }
    //    public int y { get; set; }
    //}


    public static string DataTableMutilJson(DataTable dt)
    {
        string json = "";
        json += "[";
        if (dt != null && dt.Rows.Count > 0)
        {
            int nowYear = DateTime.Now.Year;

            for (int i = 0; i < 3; i++)
            {
                string filter = String.Format(" {0}='{1}' ", "Data", nowYear);//获取顶级目录.  
                DataRow[] drs = dt.Select(filter);
                json += "[";
                foreach (DataRow dr in drs)
                {
                    string percent = dr["Value"].ToString();
                    json += Double.Parse(percent) + ",";
                }
                json = json.Substring(0,json.Length - 1);
                json += "],";

                nowYear--;
            }
            json = json.Substring(0,json.Length - 1);

            json += "]";

        }
        else
        {
            json = "[[]]";
        }

        JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
        return jsonSerializer.Serialize(json);
        //  return "\"" + json + "\"";  

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}