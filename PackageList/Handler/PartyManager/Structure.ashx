<%@ WebHandler Language="C#" Class="Structure" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using Common;
using System.Collections.Generic;


public class Structure : IHttpHandler {

    SQLHelper p = new SQLHelper();
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
        string str="SELECT PartyId,PartyName,ParentId FROM ST_PARTY";
        DataTable dt = p.GetDBTable(str).Tables[0];
        p.RealeaseConnection();
        return dt;
    }

    /// <summary>
    /// table转换为json(参照echarts.example-flare.json格式)
    /// </summary>
    /// <param name="dt"></param>
    /// <returns></returns>
    public string ConvertToJson(DataTable dt) {
        string partyId, partyName, parentId;
        StringBuilder transJson=new StringBuilder();
        transJson.Append("{");
        List<StructureList> structureList = new List<StructureList>(){ };

        for (int i = 1; i < dt.Rows.Count; i++) {
            partyId = dt.Rows[i]["PartyId"].ToString();
            //partyName = dt.Rows[i]["PartyName"].ToString();
            parentId = dt.Rows[i]["ParentId"].ToString();
            bool f=partyId==parentId?true:false;



        }


        return transJson.ToString();
    }




    public class StructureList
    {
        public string Name { get; set; }
        public List<StructureList> Childern { get; set; }
    }



    public bool IsReusable {
        get {
            return false;
        }
    }

}