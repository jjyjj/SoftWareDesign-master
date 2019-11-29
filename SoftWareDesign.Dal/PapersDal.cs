using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace SoftWareDesign.Dal
{
    public class PapersDal
    {
        public bool Add(Model.Papers model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into Papers2(");
            strSql.Append("id,name,title,url,authorId)");
            strSql.Append(" values (");
            strSql.Append("@id,@name,@title,@url,@authorId)");
            SqlParameter[] parameters = {
                    new SqlParameter("@id", SqlDbType.NVarChar,100),
                    new SqlParameter("@name", SqlDbType.NVarChar,100),
                    new SqlParameter("@title", SqlDbType.NVarChar,100),
                    new SqlParameter("@url", SqlDbType.NVarChar,100),
                    new SqlParameter("@authorId", SqlDbType.NVarChar,100)
            };
            parameters[0].Value = model.Id;
            parameters[1].Value = model.Name;
            parameters[2].Value = model.Title;
            parameters[3].Value = model.Url;
            parameters[4].Value = model.AuthorId;

            int rows = SqlHelp.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        public List<Model.Papers> GetAllList()
        {

            string sql = "select * from  Papers2  ";

            DataTable dt = SqlHelp.GetDataTable(sql, CommandType.Text);

            if (dt.Rows.Count > 0)
            {


                List<Model.Papers> list = new List<Model.Papers>();

                foreach (DataRow row in dt.Rows)
                {
                    Model.Papers model = new Model.Papers();
                    LoadEntity(model, row);
                    list.Add(model);
                }
                return list;
            }
            else
            {
                return null;
            }
        }
        private void LoadEntity(Model.Papers model, DataRow row)
        {

            model.Id = row["id"].ToString();
            model.Name = row["name"].ToString();
            model.Title = row["Title"].ToString();
            model.Url = row["Url"].ToString();
            model.AuthorId = row["AuthorId"].ToString();

        }
    }
}
