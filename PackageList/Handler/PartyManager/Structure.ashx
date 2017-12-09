<%@ WebHandler Language="C#" Class="Structure" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using Common;
using System.Collections.Generic;
using System.Web.Script.Serialization;


public class Structure : IHttpHandler {

    SQLHelper p = new SQLHelper();
    List<StructureList> tree = new List<StructureList>();
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        DataTable dt = null;
        string transJson = string.Empty;
        dt = AcquireTableFromDB();
        transJson = ConvertToJson(dt);
        context.Response.Write(transJson);
        context.Response.End();
    }


    public DataTable AcquireTableFromDB()
    {
        p.OpenConnection();
        //StringBuilder sb = new StringBuilder();
        string str="SELECT PartyId,PartyName,ParentId FROM ST_PARTY WHERE PartyId <> 0";
        DataTable dt = p.GetDBTable(str).Tables[0];
        DataRow newRow = dt.NewRow();
        newRow["PartyId"] = 0;
        newRow["PartyName"] = "双塔街道党工委";
        newRow["ParentId"] = -1;
        dt.Rows.InsertAt(newRow,0);
        p.RealeaseConnection();
        return dt;
    }





    /// <summary>
    /// table转换为json(参照echarts.example-flare.json格式)
    /// </summary>
    /// <param name="dt"></param>
    /// <returns></returns>
    public string ConvertToJson(DataTable dt) {
        foreach (DataRow row in dt.Rows)
        {
            StructureList tr = new StructureList(row["PartyId"].ToString(), row["ParentId"].ToString(), row["PartyName"].ToString());
            tree.Add(tr);
        }
        List<StructureList> structureList = new List<StructureList>(){ };
        JavaScriptSerializer jsS = new JavaScriptSerializer();
        string result = jsS.Serialize(tree);
        return result;
    }






    public class StructureList
    {
        public string Id;
        public string Pid;
        public string Name;
        public StructureList(string id,string pid,string name)
        {
            Id = id;
            Pid = pid;
            Name = name;
        }
    }



    public bool IsReusable {
        get {
            return false;
        }
    }

}