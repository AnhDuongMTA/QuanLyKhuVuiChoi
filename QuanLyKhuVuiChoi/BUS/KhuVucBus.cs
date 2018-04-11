using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entity;
using DAL;

namespace BUS
{
    public class KhuVucBus
    {
        KhuVucDAL da = new KhuVucDAL();
        public DataTable GetData()
        {
            return da.GetData();
        }
        public DataTable GetDataByID(string ID)
        {
            return da.GetDataByID(ID);
        }
        public int InsertData(KhuVucEntity Kh)
        {
            return da.InsertData(Kh);
        }
        public int UpdateData(KhuVucEntity Kh)
        {
            return da.UpdateData(Kh);
        }
        public int DeleteData(String ID)
        {
            return da.DeleteData(ID);
        }
        public string TangMa()
        {
            return da.TangMa();
        }
    }
}
