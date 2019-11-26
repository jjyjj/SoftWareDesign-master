using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;
namespace SoftWareDesign
{
    /// <summary>
    /// 功能描述    ：index  
    /// 创 建 者(蒋金园)：jjy
    /// 创建日期    ：2019/11/26 9:54:17 
    /// 最后修改者  ：jjy
    /// 最后修改日期：2019/11/26 9:54:17 
    /// 当前的计算机名称：蒋蒋蒋 
    /// </summary>
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<Model.Students> Login(string name, string pwd)
        {
            Bll.StudentsBll studentsBll = new Bll.StudentsBll();
            var student = studentsBll.GetAllStudents().Where(m => m.StuName == name && m.Pwd == pwd).ToList();
            //写入缓存
            //return JsonConvert.SerializeObject(student);
            return student;

        }
    }
}