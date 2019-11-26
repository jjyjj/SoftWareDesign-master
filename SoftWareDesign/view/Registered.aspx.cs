using System;
using System.Web.Services;

namespace SoftWareDesign.view
{
    /// <summary>
    /// 功能描述    ：Registered  
    /// 创 建 者(蒋金园)：jjy
    /// 创建日期    ：2019/11/26 9:59:48 
    /// 最后修改者  ：jjy
    /// 最后修改日期：2019/11/26 9:59:48 
    /// 当前的计算机名称：蒋蒋蒋 
    /// </summary>
    public partial class Registered : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static bool Add(string name, string pwd, string email)
        {
            Bll.StudentsBll bll = new Bll.StudentsBll();
            return bll.Add(new Model.Students()
            {
                Id = Guid.NewGuid().ToString(),
                StuName = name,
                Pwd = pwd,
                Email = email,
                ImgUrl = "",
                Bj = "Rb软工互172"
            });
        }
    }
}