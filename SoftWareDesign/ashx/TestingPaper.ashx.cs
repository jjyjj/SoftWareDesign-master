using Newtonsoft.Json;
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
            int paragraph = 0;
            List<Reslut> resluts = new List<Reslut>();
            for (int i = 0; i < papers.Count; i++)
            {
                var path = papers[i].Url.Trim().ToString();
                path = context.Server.MapPath(path);
                var str = commentMethods.GetAll(path);
                var userSplit = content.Split('\n');
                var systemSplit = str.Split('\r');


                #region 获取段落/为了给下边数组赋值

                for (int q = 0; q < userSplit.Length; q++)
                {

                    var userSplitLength = userSplit[q].Replace(" ", "").Replace("\t", "").Replace("\n", "").Replace("\r", "").Length;
                    if (userSplitLength >= 20)
                    {
                        paragraph++;

                    }
                }
                #endregion


                string[] numUserStr = new string[paragraph];//具有相似度的用户字符串
                string[] numSystemStr = new string[paragraph];//相似度最高的系统字符串
                double[] numStr = new double[paragraph];//相似度


                #region 

                for (int q = 0; q < paragraph; q++)
                {

                    var userSplitLength = userSplit[q].Replace(" ", "").Replace("\t", "").Replace("\n", "").Replace("\r", "").Length;
                    if (userSplitLength >= 20)
                    {
                        for (int w = 0; w < systemSplit.Length; w++)
                        {

                            var systemSplitLength = systemSplit[w].Replace(" ", "").Replace("\t", "").Replace("\n", "").Replace("\r", "").Length;
                            if (systemSplitLength >= 20)
                            {

                                var userSplitLengthW = userSplit[q].Replace(" ", "").Replace("\t", "").Replace("\n", "").Replace("\r", "");
                                var systemSplitLengthQ = systemSplit[w].Replace(" ", "").Replace("\t", "").Replace("\n", "").Replace("\r", "");
                                double num = double.Parse(myDuplicateChecking.SumCosine(userSplitLengthW, systemSplitLengthQ));
                                if (num > 0.75)
                                {
                                    if (num > numStr[q - 1])
                                    {

                                        numUserStr[q - 1] = userSplit[q].Replace(" ", "").Replace("\t", "").Replace("\n", "").Replace("\r", ""); numSystemStr[q - 1] = systemSplit[w].Replace(" ", "").Replace("\t", "").Replace("\n", "").Replace("\r", "");
                                        numStr[q - 1] = num;


                                    }
                                }

                            }
                        }
                    }
                }
                #endregion

                #region 将空数组剔除
                List<string> numUserStr1 = new List<string>();
                List<string> numSystemStr1 = new List<string>();
                List<double> numStr1 = new List<double>();
                for (int r = 0; r < numUserStr.Length; r++)
                {
                    if (numSystemStr[r] != null)
                    {
                        numUserStr1.Add(numSystemStr[r]);
                        numSystemStr1.Add(numSystemStr[r]);
                        numStr1.Add(numStr[r]);
                    }
                }
                #endregion


                resluts.Add(new Reslut()
                {
                    useStr = numUserStr1,
                    systemStr = numSystemStr1,
                    num = numStr1,

                });


                #region 全文直接对比
                numbers.Add(double.Parse(myDuplicateChecking.SumCosine(content, str)));
                #endregion

            }




            for (int n = 0; n < numbers.Count - 1; n++)
            {//外层循环控制排序次数,第几轮
                for (int j = 0; j < numbers.Count - 1 - n; j++)
                {//内层循环控制每一轮排序多少次
                    if (numbers[j] > numbers[j + 1])
                    {
                        var paper = papers[j];
                        papers[j] = papers[j + 1];
                        papers[j + 1] = paper;


                        double max = numbers[j];
                        numbers[j] = numbers[j + 1];
                        numbers[j + 1] = max;
                    }
                }
            }

            //小数在前大数在后
            List<Model.Papers> checkPapers = new List<Model.Papers>()
; List<double> checkNum = new List<double>();
            for (int i = 0; i < numbers.Count; i++)
            {
                checkNum.Add(numbers[i]);
                checkPapers.Add(papers[i]);
            }


            context.Response.Write(JsonConvert.SerializeObject(resluts));

            context.Response.Write(JsonConvert.SerializeObject(new Reslut2()
            {
                checkNum = checkNum,
                checkPapers = checkPapers
            }));


        }
        public class Reslut2
        {

            public List<double> checkNum { get; set; }
            public List<Model.Papers> checkPapers { get; set; }
        }

        public class Reslut
        {


            public List<string> useStr { get; set; }
            public List<string> systemStr { get; set; }

            public List<double> num { get; set; }

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