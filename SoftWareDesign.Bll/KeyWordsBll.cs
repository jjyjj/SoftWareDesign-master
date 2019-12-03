using System.Collections.Generic;

namespace SoftWareDesign.Bll
{
    public class KeyWordsBll
    {
        Dal.KeyWordsDal dal = new Dal.KeyWordsDal();
        public bool Add(Model.KeyWords model)
        {
            return dal.Add(model);
        }
        public List<Model.KeyWords> GetAllList()
        {
            return dal.GetAllList();
        }
    }
}
