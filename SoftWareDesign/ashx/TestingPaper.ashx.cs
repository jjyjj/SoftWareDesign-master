using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace SoftWareDesign.ashx
{
    /// <summary>
    /// TestingPaper1 的摘要说明
    /// 进行查重并判断查重结果是否合格保存
    /// </summary>
    public class TestingPaper1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string articleName = context.Request.Form["articleName"];//文章名字
            string authorName = context.Request.Form["authorName"];//作者名字
            string isUseMyHouse = context.Request.Form["isUseMyHouse"];//是否使用自建库 true
            string content = context.Request.Form["content"];//string 
            //提取用户文章中的高频词
            CommentMethods commentMethods = new CommentMethods();
            var userkeyWords = commentMethods.GetKeyWord(content);
            //获取系统关键词
            Bll.KeyWordsBll keyWordsBll = new Bll.KeyWordsBll();
            var systemKeyWords = keyWordsBll.GetAllList();

            List<string> result = new List<string>();
            for (int i = 0; i < systemKeyWords.Count; i++)
            {
                var a = systemKeyWords[i].KeyWord1 + "," + systemKeyWords[i].KeyWord2 + "," + systemKeyWords[i].KeyWord3 + "," + systemKeyWords[i].KeyWord4 + "," + systemKeyWords[i].KeyWord5 + "," + systemKeyWords[i].KeyWord6;
                result.Add(a);
            }
            //两者对比，筛选数据相同的
            int count = 0;
            List<string> papersId = new List<string>();
            for (int i = 0; i < userkeyWords.Count; i++)
            {
                for (int j = 0; j < result.Count; j++)
                {
                    bool isContains = result[j].Trim().ToString().Contains(userkeyWords[i].Trim().ToString());
                    if (isContains)
                    {
                        papersId.Add(systemKeyWords[j].PaperId);
                        count++;
                        if (count > 2)
                        {
                            break;
                        }
                    }
                }
                break;
            }
            //获取对应文章
            Bll.PapersBll papersBll = new Bll.PapersBll();
            List<Model.Papers> papers = new List<Model.Papers>();
            //for (int i = 0; i < papersId.Count; i++)
            //{
            //    papers = papersBll.GetAllList().Where(m => );
            //}
            papers = papersBll.GetAllList().Where(m => papersId.Contains(m.Id)).ToList();
            //进行比较
            List<double> numbers = new List<double>();
            List<string> numbers1 = new List<string>();
            MyDuplicateChecking.MyDuplicateChecking myDuplicateChecking = new MyDuplicateChecking.MyDuplicateChecking();
            for (int i = 0; i < papers.Count; i++)
            {
                var path = papers[i].Url.Trim().ToString();
                var str = commentMethods.GetAll(path);
                numbers1.Add(myDuplicateChecking.SumCosine(content, str));
                string asd = myDuplicateChecking.SumCosine(content, str);
                double s = double.Parse(asd);
                numbers.Add(s);
            }

            //做一个冒泡排序
            for (int i = 0; i < numbers.Count - 1; i++)
            {

                for (int j = 0; j < numbers.Count - i - 1; j++)
                {

                    // 临时变量，用于元素两两交换
                    double temp = 0;
                    if (numbers[j] > numbers[j + 1])
                    {

                        temp = numbers[j];
                        numbers[j] = numbers[j + 1];
                        numbers[j + 1] = temp;
                    }
                }

            }

            var checkMaxNum = numbers[numbers.Count - 1];
           




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
            //        Bll.PapersBll papersBll = new Bll.PapersBll();
            //        var paper = new Model.Papers()
            //        {
            //            Id = Guid.NewGuid().ToString(),
            //            Name = articleName,
            //            Title = "",
            //            Url = (string)context.Session["systemPaperPath"],
            //            AuthorId = author.Id
            //        };
            //        if (papersBll.Add(paper))
            //        {
            //            var keyWord = new Model.KeyWords()
            //            {
            //                Id = Guid.NewGuid().ToString(),
            //                PaperId = paper.Id,
            //                KeyWord1 = keyWords[0].Trim().ToString(),
            //                KeyWord2 = keyWords[1].Trim().ToString(),
            //                KeyWord3 = keyWords[2].Trim().ToString(),
            //                KeyWord4 = keyWords[3].Trim().ToString(),
            //                KeyWord5 = keyWords[4].Trim().ToString(),
            //                KeyWord6 = keyWords[5].Trim().ToString(),
            //            };
            //            new Bll.KeyWordsBll().Add(keyWord);
            //        }
            //        else
            //        {

            //        }






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