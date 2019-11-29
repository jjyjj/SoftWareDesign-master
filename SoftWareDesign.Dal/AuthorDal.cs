using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace SoftWareDesign.Dal
{
    public class AuthorDal
    {
        public bool Add(Model.Author model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into Author(");
            strSql.Append("id,name,adress,email)");
            strSql.Append(" values (");
            strSql.Append("@id,@name,@adress,@email)");
            SqlParameter[] parameters = {
                    new SqlParameter("@id", SqlDbType.NVarChar,100),
                    new SqlParameter("@name", SqlDbType.NVarChar,100),
                    new SqlParameter("@adress", SqlDbType.NVarChar,100),
                    new SqlParameter("@email", SqlDbType.NVarChar,100)
            };
            parameters[0].Value = model.Id;
            parameters[1].Value = model.Name;
            parameters[2].Value = model.Adress;
            parameters[3].Value = model.Email;


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
        public List<Model.Author> GetAllList()
        {

            string sql = "select * from  Author  ";

            DataTable dt = SqlHelp.GetDataTable(sql, CommandType.Text);

            if (dt.Rows.Count > 0)
            {


                List<Model.Author> list = new List<Model.Author>();

                foreach (DataRow row in dt.Rows)
                {
                    Model.Author model = new Model.Author();
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
        private void LoadEntity(Model.Author model, DataRow row)
        {

            model.Id = row["id"].ToString();
            model.Name = row["name"].ToString();
            model.Adress = row["adress"].ToString();
            model.Email = row["email"].ToString();
         

        }
    }
}
