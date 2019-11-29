using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace SoftWareDesign.Dal
{
    public class StudentDal
    {
        public bool Add(Model.Students model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into Students(");
            strSql.Append("stuid,stuName,pwd,email,imgUrl,class)");
            strSql.Append(" values (");
            strSql.Append("@stuid,@stuName,@pwd,@email,@imgUrl,@class)");
            SqlParameter[] parameters = {
                    new SqlParameter("@stuid", SqlDbType.NVarChar,100),
                    new SqlParameter("@stuName", SqlDbType.NVarChar,50),
                    new SqlParameter("@pwd", SqlDbType.NVarChar,50),
                    new SqlParameter("@email", SqlDbType.NVarChar,50),
                    new SqlParameter("@imgUrl", SqlDbType.NVarChar,200),
                    new SqlParameter("@class", SqlDbType.NVarChar,50)};
            parameters[0].Value = model.Id;
            parameters[1].Value = model.StuName;
            parameters[2].Value = model.Pwd;
            parameters[3].Value = model.Email;
            parameters[4].Value = model.ImgUrl;
            parameters[5].Value = model.Bj;

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
        public List<Model.Students> GetAllList()
        {

            string sql = "select * from  Students  ";

            DataTable dt = SqlHelp.GetDataTable(sql, CommandType.Text);

            if (dt.Rows.Count > 0)
            {


                List<Model.Students> list = new List<Model.Students>();

                foreach (DataRow row in dt.Rows)
                {
                    Model.Students Students = new Model.Students();
                    LoadEntity(Students, row);
                    list.Add(Students);
                }
                return list;
            }
            else
            {
                return null;
            }
        }
        private void LoadEntity(Model.Students model, DataRow row)
        {

            model.Id = row["stuid"].ToString();
            model.StuName = row["stuName"].ToString();
            model.Pwd = row["pwd"].ToString();
            model.Email = row["email"].ToString();
            model.ImgUrl = row["imgUrl"].ToString();
            model.Bj = row["class"].ToString();

        }


    }
}
