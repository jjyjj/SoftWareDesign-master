using Newtonsoft.Json;
using System;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace SoftWareDesign.ashx
{
    /// <summary>
    /// Login 的摘要说明
    /// </summary>
    public class Login : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string name = context.Request.Form["name"];
            string pwd = context.Request.Form["pwd"];
            string checkState = context.Request.Form["checkState"];
            Bll.StudentsBll studentsBll = new Bll.StudentsBll();
            var student = studentsBll.GetAllList().Where(m => m.StuName == name && m.Pwd == pwd).ToList();

            if (checkState == "true")
            {
                //存入cookie
                context.Response.AppendCookie(new HttpCookie("userId")
                {
                    Value = student[0].Id,
                    Expires = DateTime.Now.AddDays(7)
                });
                context.Response.AppendCookie(new HttpCookie("userName")
                {
                    Value = student[0].StuName,
                    Expires = DateTime.Now.AddDays(7)
                });
            }
            else
            {
                //存入session
                context.Session["userId"] = student[0].Id;

                context.Session["userName"] = student[0].StuName;
            }

            context.Response.Write(JsonConvert.SerializeObject(student));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}