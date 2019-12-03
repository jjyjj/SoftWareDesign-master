using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace SoftWareDesign.Dal
{
    public class KeyWordsDal
    {
        public bool Add(Model.KeyWords model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into KeyWords(");
            strSql.Append("id,paperId,keyWord1,keyWord2,keyWord3,keyWord4,keyWord5,keyWord6)");
            strSql.Append(" values (");
            strSql.Append("@id,@paperId,@keyWord1,@keyWord2,@keyWord3,@keyWord4,@keyWord5,@keyWord6)");
            SqlParameter[] parameters = {
                    new SqlParameter("@id", SqlDbType.NVarChar,100),
                    new SqlParameter("@paperId", SqlDbType.NVarChar,100),
                    new SqlParameter("@keyWord1", SqlDbType.NVarChar,50),
                    new SqlParameter("@keyWord2", SqlDbType.NVarChar,50),
                    new SqlParameter("@keyWord3", SqlDbType.NVarChar,50),
                    new SqlParameter("@keyWord4", SqlDbType.NVarChar,50),
                    new SqlParameter("@keyWord5", SqlDbType.NVarChar,50),
                    new SqlParameter("@keyWord6", SqlDbType.NVarChar,50),
            };
            parameters[0].Value = model.Id;
            parameters[1].Value = model.PaperId;
            parameters[2].Value = model.KeyWord1;
            parameters[3].Value = model.KeyWord2;
            parameters[4].Value = model.KeyWord3;
            parameters[5].Value = model.KeyWord4;
            parameters[6].Value = model.KeyWord5;
            parameters[7].Value = model.KeyWord6;
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
        public List<Model.KeyWords> GetAllList()
        {

            string sql = "select * from  KeyWords  ";

            DataTable dt = SqlHelp.GetDataTable(sql, CommandType.Text);

            if (dt.Rows.Count > 0)
            {


                List<Model.KeyWords> list = new List<Model.KeyWords>();

                foreach (DataRow row in dt.Rows)
                {
                    Model.KeyWords model = new Model.KeyWords();
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
        private void LoadEntity(Model.KeyWords model, DataRow row)
        {

            model.Id = row["id"].ToString();
            model.PaperId = row["paperId"].ToString();
            model.KeyWord1 = row["keyWord1"].ToString();
            model.KeyWord2 = row["keyWord2"].ToString();
            model.KeyWord3 = row["keyWord3"].ToString();
            model.KeyWord4 = row["keyWord4"].ToString();
            model.KeyWord5 = row["keyWord5"].ToString();
            model.KeyWord6 = row["keyWord6"].ToString();

        }
    }
}
