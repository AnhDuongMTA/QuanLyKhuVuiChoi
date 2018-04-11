using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entity;

namespace DAL
{
    public class VeChoiDAL
    {
        KetNoi conn = new KetNoi();
        public DataTable GetData()
        {
            return conn.GetData("VeChoi_SelectAll", null);
        }
        public DataTable GetDataByID(String ID)
        {
            SqlParameter[] para = { new SqlParameter("MaVe", ID) };
            return conn.GetData("KhuVuc_SelectID", para);
        }
        public int InsertData(VeChoiEntity Ve)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaVe",Ve.MaVe),
                new SqlParameter("NgayBan",Ve.NgayBan),
                new SqlParameter("MaKhu",Ve.MaKhu),
                new SqlParameter("MaKH",Ve.MaKH),
                new SqlParameter("TongTien",Ve.TongTien),
                new SqlParameter("SoVeNL",Ve.SoVeNL),
                new SqlParameter("SoVeTE",Ve.SoVeTE)
            };
            return conn.ExcuteSQL("Them_KhuVuc", para);
        }
        public int UpdateData(VeChoiEntity Ve)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaVe",Ve.MaVe),
                new SqlParameter("NgayBan",Ve.NgayBan),
                new SqlParameter("MaKhu",Ve.MaKhu),
                new SqlParameter("MaKH",Ve.MaKH),
                new SqlParameter("TongTien",Ve.TongTien),
                new SqlParameter("SoVeNL",Ve.SoVeNL),
                new SqlParameter("SoVeTE",Ve.SoVeTE)
        };
            return conn.ExcuteSQL("Sua_KhuVuc ", para);
        }
        public int DeleteData(string ID)
        {
            SqlParameter[] para =
            {
                new SqlParameter("Ma",ID)
        };
            return conn.ExcuteSQL("Xoa_VeChoi ", para);
        }

        public string TangMa()
        {
            return conn.TangMa("Select * From VeChoi ", "VC");
        }
    }
}
