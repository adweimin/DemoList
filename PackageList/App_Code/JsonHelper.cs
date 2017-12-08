using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Text;
using System.Runtime.Serialization.Json;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Web.Script.Serialization;

/// <summary>
/// JsonHelper 的摘要说明
/// </summary>
public class JsonHelper
{
    public JsonHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static string ObjectToJson<T>(T data)
    {
        try
        {
            DataContractJsonSerializer pDataContractJsonSerializer = new DataContractJsonSerializer(data.GetType());
            using (MemoryStream ms = new MemoryStream())
            {
                pDataContractJsonSerializer.WriteObject(ms,data);
                return Encoding.UTF8.GetString(ms.ToArray());
            }
        }
        catch
        {
            return string.Empty;
        }
    }

    public static List<T> ListToJson<T>(string strJson)
    {
        JavaScriptSerializer js = new JavaScriptSerializer();
        List<T> list = js.Deserialize<List<T>>(strJson);
        return list;
    }

    public static List<T> JsonToList<T>(string JsonString)
    {
        List<T> pList = new List<T>();
        DataContractJsonSerializer pDataContractJsonSerializer = new DataContractJsonSerializer(pList.GetType());
        byte[] _Using = System.Text.Encoding.UTF8.GetBytes(JsonString);
        MemoryStream ms = new MemoryStream(_Using);
        ms.Position = 0;
        pList = (List<T>)pDataContractJsonSerializer.ReadObject(ms);
        return pList;
    }


    #region 3种方式将datatable转换为json
    public static string DataTableToJsonWithStringBuilder(DataTable dt)
    {
        var jsonString = new StringBuilder();
        if (dt.Rows.Count > 0)
        {
            jsonString.Append("[");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                jsonString.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    if (j < dt.Columns.Count - 1)
                    {
                        jsonString.Append("\"" + dt.Columns[j].ColumnName.ToString()
                            + "\":" + "\""
                            + dt.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == dt.Columns.Count - 1)
                    {
                        jsonString.Append("\"" + dt.Columns[j].ColumnName.ToString()
                            + "\":" + "\""
                            + dt.Rows[i][j].ToString() + "\"");
                    }
                }
                if (i == dt.Rows.Count - 1)
                {
                    jsonString.Append("}");
                }
                else
                {
                    jsonString.Append("},");
                }            
            }
            jsonString.Append("]");
        }
        return jsonString.ToString();
    }

    public static string DataTableToJsonWithJavaScriptSerializer(DataTable table)
    {
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
        Dictionary<string, object> childRow;
        foreach (DataRow row in table.Rows)
        {
            childRow = new Dictionary<string, object>();
            foreach (DataColumn col in table.Columns)
            {
                childRow.Add(col.ColumnName, row[col]);
            }
            parentRow.Add(childRow);
        }
        return jsSerializer.Serialize(parentRow);
    }

    public static string DataTableToJson(DataTable dt)
    {
        string jsonString = string.Empty;
        jsonString = JsonConvert.SerializeObject(dt,new DataTableConverter());
        return jsonString;            
    }


#endregion
    public static Dictionary<string, object> GetJsonObject(string Jsonstr)
    {
        JavaScriptSerializer pJavaScriptSerializer = new JavaScriptSerializer();
        Dictionary<string, object> json = pJavaScriptSerializer.DeserializeObject(Jsonstr) as Dictionary<string, object>;
        return json;
    }

    public static string JsonRowsAndCount(DataTable dt, int count)
    {
        string rowJson = DataTableToJson(dt);
        StringBuilder sJson = new StringBuilder();
        sJson.Append("{\"total\":");
        if (count == -1)
        {
            sJson.Append(dt.Rows.Count);
        }
        else
        {
            sJson.Append(count);
        }
        sJson.Append(",\"rows\":");
        sJson.Append(rowJson);
        sJson.Append("}");
        return sJson.ToString();

    }

}