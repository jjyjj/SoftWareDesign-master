using Newtonsoft.Json;
using System;
using System.Web;
using System.Web.SessionState;

namespace SoftWareDesign.ashx
{
    /// <summary>
    /// UploadFile 的摘要说明
    /// </summary>
    public class UploadFile : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            CommentMethods commentMethods = new CommentMethods();
            string articleName = context.Request.Form["articleName"];//文章名字
            string content = context.Request.Form["content"];//base64字节
           
            
            #region 切割base64
            string str = "base64,";
            int index = content.IndexOf(str) + str.Length;
            int end = content.Length - index;
            content = content.Substring(index, end);
            #endregion



            string path = context.Server.MapPath("../Papers/users/");
            Random rd = new Random();
            string fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + "-" + rd.Next(100, 999).ToString() + "-" + articleName;

            byte[] buff = Convert.FromBase64String(content);
            if (commentMethods.ByteToFile(content, path, fileName))
            {
                string url = path + fileName;
                context.Session["systemPaperPath"] = url;
                string userAricle = commentMethods.GetAll(url);
                context.Response.Write(JsonConvert.SerializeObject(userAricle));
            }
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