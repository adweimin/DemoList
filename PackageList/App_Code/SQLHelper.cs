using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// SQLHelper 的摘要说明
/// </summary>
namespace Common
{
    public class SQLHelper
    {
        private SqlConnection connLocal = null;
        public bool OpenConnection()
        {
            bool f = true;
            connLocal = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            if (connLocal.State == ConnectionState.Closed)
            {
                try
                {
                    connLocal.Open();
                }
                catch
                {
                    f = false;
                }
            }
            return f;
        }

        public void RealeaseConnection()
        {
            if (connLocal != null)
            {
                connLocal.Close();
                connLocal.Dispose();
            }
        }

        public DataSet GetDBTable(string strSql)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlDataAdapter command = new SqlDataAdapter(strSql, connLocal);
                command.Fill(ds, "ds");
            }
            catch (SqlException ex)
            {
                return null;
            }
            return ds;
        }


        public SQLHelper()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }



    }

}