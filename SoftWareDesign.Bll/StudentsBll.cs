using System.Collections.Generic;

namespace SoftWareDesign.Bll
{
    public class StudentsBll
    {
        Dal.StudentDal dal = new Dal.StudentDal();
        public bool Add(Model.Students model)
        {
            return dal.Add(model);
        }
        public List<Model.Students> GetAllStudents()
        {
            return dal.GetAllStudents();
        }
    }
}
