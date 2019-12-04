using Newtonsoft.Json;
using SoftWareDesign.Model;
using System;
using System.Web;

namespace SoftWareDesign.admin
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            CommentMethods commentMethods = new CommentMethods();
            string articleName = context.Request.Form["articleName"];//文章名字
            string authorName = context.Request.Form["authorName"];//文章名字
            string content = context.Request.Form["content"];//base64字节
            #region 切割base64
            string str = "base64,";
            int index = content.IndexOf(str) + str.Length;
            int end = content.Length - index;
            content = content.Substring(index, end);
            #endregion


            string path = context.Server.MapPath("../Papers/system/");
            Random rd = new Random();
            string fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + "-" + rd.Next(100, 999).ToString() + "-" + articleName;

            byte[] buff = Convert.FromBase64String(content);
            if (commentMethods.ByteToFile(content, path, fileName))
            {
              
              
                    Bll.AuthorBll authorBll = new Bll.AuthorBll();
                    var author = new Model.Author()
                    {
                        Id = Guid.NewGuid().ToString(),
                        Name = authorName,
                        Adress = "",
                        Email = ""
                    };
                    if (authorBll.Add(author))
                    {
                        Bll.PapersBll papersBll = new Bll.PapersBll();
                        var paper = new Model.Papers()
                        {
                            Id = Guid.NewGuid().ToString(),
                            AuthorId = author.Id,
                            Name = articleName,
                            Url = "../Papers/system/" + fileName,
                            Title = ""


                        };
                        if (papersBll.Add(paper))
                        {
                            var ketWords = commentMethods.GetKeyWord(commentMethods.GetAll(path + fileName));
                            Bll.KeyWordsBll keyWordsBll = new Bll.KeyWordsBll();
                            var keyWord = new Model.KeyWords()
                            {
                                Id = Guid.NewGuid().ToString(),
                                PaperId = paper.Id,
                                KeyWord1 = ketWords[0],
                                KeyWord2 = ketWords[1],
                                KeyWord3 = ketWords[2],
                                KeyWord4 = ketWords[3],
                                KeyWord5 = ketWords[4],
                                KeyWord6 = ketWords[5],
                            };
                            if (keyWordsBll.Add(keyWord))
                            {

                                context.Response.Write(JsonConvert.SerializeObject(new ReturnMessage() { Code = 1, Message = "添加成功" }));
                            }
                        }
                    
                }





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