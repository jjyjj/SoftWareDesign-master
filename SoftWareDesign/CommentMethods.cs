using System;
using System.IO;

namespace SoftWareDesign
{
    public class CommentMethods
    {
        /// <summary>
        /// 将文档转化为字符串
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public string GetAll(string filePath)
        {

            string text = "";  //全文文本

            Microsoft.Office.Interop.Word.Application app = new Microsoft.Office.Interop.Word.Application();//打开word程序
            Microsoft.Office.Interop.Word.Document doc = null;//实例化一个新的word文档
            object unknow = Type.Missing;

            object paramSourceDocPath = filePath;
            doc = app.Documents.Open(ref paramSourceDocPath,
                                     ref unknow, ref unknow, ref unknow, ref unknow, ref unknow,
                                     ref unknow, ref unknow, ref unknow, ref unknow, ref unknow,
                                     ref unknow, ref unknow, ref unknow, ref unknow, ref unknow);

            if (doc != null)
            {
                text = doc.Content.Text.Trim();//将全篇内容存入字符串中
            }
            doc.Close(ref unknow, ref unknow, ref unknow);


            return text;
        }
        /// <summary>
        /// 将byte[]保存成文件
        /// </summary>
        /// <param name="input"></param>
        /// <param name="path"></param>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public bool ByteToFile(string input, string path, string fileName)
        {


            byte[] buff = Convert.FromBase64String(input);
            try
            {
                FileStream fs = new FileStream(path + fileName, FileMode.Create);
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

    }
}