using System.Web;

namespace SoftWareDesign.ashx
{
    /// <summary>
    /// PaperReviewManger 的摘要说明
    /// </summary>
    public class PaperReviewManger : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string articleName = context.Request.Form["articleName"];
            string authorName = context.Request.Form["authorName"];
            string isUseMyHouse = context.Request.Form["isUseMyHouse"];
            string submiSsion = context.Request.Form["submiSsion"];
            string content = context.Request.Form["content"];
            context.Response.Write(articleName+ authorName + submiSsion + isUseMyHouse + content);


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