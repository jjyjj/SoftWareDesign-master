using System.Collections.Generic;

namespace SoftWareDesign.Bll
{
    public class PapersBll
    {
        Dal.PapersDal dal = new Dal.PapersDal();
        public bool Add(Model.Papers model)
        {
            return dal.Add(model);
        }
        public List<Model.Papers> GetAllList()
        {
            return dal.GetAllList();
        }
    }
}
