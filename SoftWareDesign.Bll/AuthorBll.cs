using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftWareDesign.Bll
{
 public   class AuthorBll
    {

        Dal.AuthorDal dal = new Dal.AuthorDal();
        public bool Add(Model.Author model)
        {
            return dal.Add(model);
        }
        public List<Model.Author> GetAllList()
        {
            return dal.GetAllList();
        }
    }
}
