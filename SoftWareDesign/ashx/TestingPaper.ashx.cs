using Newtonsoft.Json;
using System.Web;
namespace SoftWareDesign.ashx
{
    /// <summary>
    /// TestingPaper1 的摘要说明
    /// 进行查重并判断查重结果是否合格保存
    /// </summary>
    public class TestingPaper1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string articleName = context.Request.Form["articleName"];//文章名字
            string authorName = context.Request.Form["authorName"];//作者名字
            string isUseMyHouse = context.Request.Form["isUseMyHouse"];//是否使用自建库 true
            string content = context.Request.Form["content"];//string 

            
            //提取该片文章中的高频词
            //根据高频词去查询数据库中对应文章
            //根据查询出来的结果进行比较
            //结果合格被平台收录
            //Bll.AuthorBll authorBll = new Bll.AuthorBll();
            //Model.Author author = new Model.Author();
            //author.Id = Guid.NewGuid().ToString();
            //author.Name = authorName;
            //author.Email = "";
            //author.Adress = "";
            //if (authorBll.Add(author))
            //{
            //    try
            //    {
            //        new Bll.PapersBll().Add(new Model.Papers()
            //        {
            //            Id = Guid.NewGuid().ToString(),
            //            Name = articleName,
            //            Title = "",
            //            Url = path,
            //            AuthorId = author.Id
            //        });
            //        //文件已成功写入数据库
            //        context.Response.Write("文件已成功写入数据库");
            //    }
            //    catch (Exception ex)
            //    {

            //        throw ex;
            //    }
            //}

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