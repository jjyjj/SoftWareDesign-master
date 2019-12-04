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
            MyDuplicateChecking.MyDuplicateChecking myDuplicateChecking = new MyDuplicateChecking.MyDuplicateChecking();
            for (int i = 0; i < papers.Count; i++)
            {
                var path = papers[i].Url.Trim().ToString();
                path = context.Server.MapPath(path);
                var str = commentMethods.GetAll(path);
                double s = double.Parse(myDuplicateChecking.SumCosine(content, str));

                numbers.Add(s);


            }


            for (int n = 0; n < numbers.Count - 1; n++)
            {//外层循环控制排序次数,第几轮
                for (int j = 0; j < numbers.Count - 1 - n; j++)
                {//内层循环控制每一轮排序多少次
                    if (numbers[j] > numbers[j + 1])
                    {
                        double max = numbers[j];
                        numbers[j] = numbers[j + 1];
                        numbers[j + 1] = max;
                    }
                }
            }
            //小数在前大数在后
            List<double> checkNum = new List<double>();
            for (int i = 0; i < numbers.Count; i++)
            {
                checkNum.Add(numbers[i]);
            }



            var checkMaxNum = checkNum[checkNum.Count - 1];
            var checkMinNum = checkNum[0];






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