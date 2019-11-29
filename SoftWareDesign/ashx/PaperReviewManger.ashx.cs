using System;
using System.IO;
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
            //1 判断用户是否登录
            if (context.Session["userName"].ToString().Length>0)
            {
                context.Response.Redirect("../index.aspx");
            }
            else
            {
                //2 接受前台请求并接收数据
                string articleName = context.Request.Form["articleName"];//文章名字
                string authorName = context.Request.Form["authorName"];//作者名字
                string isUseMyHouse = context.Request.Form["isUseMyHouse"];//是否使用自建库 true
                string submiSsion = context.Request.Form["submiSsion"];//粘贴文本/文件流
                string type = context.Request.Form["type"];//文章名字
                string content = context.Request.Form["content"];//string /base64字节
                #region 切割base64
                string str = "base64,";
                int index = content.IndexOf(str) + str.Length;
                int end = content.Length - index;
                content = content.Substring(index, end);
                #endregion
                //3 判断检测方式submiSsion
                //如果是文本粘贴 session保存并查重

                if (submiSsion == "粘贴文本")
                {
                    
                }
                //如果是文件 数据库保存并检测
                if (submiSsion == "单文件上传")
                {
                    string path = context.Server.MapPath("../Papers/");
                    Random rd = new Random();
                    string fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + "-" + rd.Next(100, 999).ToString() + "-" + articleName;

                    if (ByteToFile(content, path, fileName, type))
                    {
                        Bll.AuthorBll authorBll = new Bll.AuthorBll();
                        Model.Author author = new Model.Author();
                        author.Id = Guid.NewGuid().ToString();
                        author.Name = authorName;
                        author.Email = "";
                        author.Adress = "";
                        if (authorBll.Add(author))
                        {
                            try
                            {
                                new Bll.PapersBll().Add(new Model.Papers()
                                {
                                    Id = Guid.NewGuid().ToString(),
                                    Name = articleName,
                                    Title = "",
                                    Url = path,
                                    AuthorId = author.Id
                                });
                                //文件已成功写入数据库
                                context.Response.Write("文件已成功写入数据库");
                            }
                            catch (Exception ex)
                            {

                                throw ex;
                            }
                        }
                    }
                    else
                    {
                        //上传失败
                    }
                }

            }






        }


        public bool ByteToFile(string input, string path, string fileName, string type)
        {


            byte[] buff = Convert.FromBase64String(input);
            try
            {
                FileStream fs = new FileStream(path + fileName + type, FileMode.Create);
                BinaryWriter bw = new BinaryWriter(fs);
                bw.Write(buff, 0, buff.Length);
                bw.Close();
                fs.Close();
                return true;
            }
            catch (Exception)
            {

                return false;
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