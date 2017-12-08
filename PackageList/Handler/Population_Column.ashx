<%@ WebHandler Language="C#" Class="Population_Column" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Serialization;

public class Population_Column : IHttpHandler {
    SQLHelper pSqlHelper = new SQLHelper();
    tbl_dcs_people people = new tbl_dcs_people();
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/json";
        string methodName = GetRequest(context,"Action");
        pSqlHelper.OpenConnection();
        DataTable dt = null;
        switch (methodName)
        {
            case "showColumn":
                //series1-tbl_dcs_people表条件查询语句
                dt = pSqlHelper.GetDBTable("").Tables[0];
                break;
            case "showPie":                
                dt = pSqlHelper.GetDBTable("").Tables[0];
                break;
            default:
                break;
        }
        pSqlHelper.RealeaseConnection();
        string json = DataTableMutilJson(dt);
        context.Response.Write(json);
        context.Response.End();
    }



    /// <summary>
    /// 将DataTable转换为多组Json格式字符串（需要改）
    /// </summary>
    /// <param name="dt"></param>
    /// <returns></returns>
    public static string DataTableMutilJson(DataTable dt)
    {
        string json = "";
        json += "[";
        if (dt != null && dt.Rows.Count > 0)
        {
            int nowYear = DateTime.Now.Year;
            for (int i = 0; i <2 ; i++)
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

    public String GetRequest(HttpContext context, String paramName)
    {
        if (context.Request[paramName] != null)
        {
            return context.Request[paramName].ToString();
        }

        return "";
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}