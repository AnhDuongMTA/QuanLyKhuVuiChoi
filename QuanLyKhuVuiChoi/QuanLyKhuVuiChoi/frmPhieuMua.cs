using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Entity;
using BUS;
namespace QuanLyKhuVuiChoi
{
    public partial class frmPhieuMua : Form
    {
        PhieuMuaEntity pm = new PhieuMuaEntity();
        PhieuMuaBUS bus = new PhieuMuaBUS();
        private int fluu = 1;

        public void DisEnl(bool e)
        {
            btnThem.Enabled = !e;
            btnSua.Enabled = !e;
            btnXoa.Enabled = !e;
            btnLuu.Enabled = e;
            btnHuy.Enabled = e;
            txtMaPhieu.Enabled = e;
            txtMaKH.Enabled = e;
            dtpNgayMua.Enabled = e;
        }
         private void clearData()
        {
            txtMaKH.Text = "";
            txtMaPhieu.Text = "";
        }

        private void HienThi()
        {
            dgvPM.DataSource = bus.GetData();
        }
        public frmPhieuMua()
        {
            InitializeComponent();
        }



        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            fluu = 0;
            txtMaPhieu.Text = bus.TangMa();
            DisEnl(true);
            txtMaPhieu.Enabled = false;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            fluu = 1;
            DisEnl(true);
            txtMaPhieu.Enabled = false;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {

            if (MessageBox.Show("Bạn có chắc chắn muốn xóa không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                try
                {
                    bus.XoaPM(txtMaPhieu.Text);
                    MessageBox.Show("Xóa thành công!");
                    clearData();
                    DisEnl(false);
                    HienThi();
                }
                catch
                {
                    MessageBox.Show("Lỗi không xóa được");
                }
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            pm.MaPhieu = txtMaPhieu.Text;
            pm.MaKH = txtMaKH.Text;
            pm.NgayMua = dtpNgayMua.Text;
          

            if (fluu == 0)
            {

                try
                {
                    int dt;
                    dt = bus.ThemPM(pm);
                    if (dt != 0)
                    {
                        MessageBox.Show("Thêm thành công!");
                    }
                }
                catch
                {
                    MessageBox.Show("không được thêm nhân viên  dưới 18 tuổi!");
                }
                HienThi();
                clearData();
                DisEnl(false);
            }
            else
            {
                bus.SuaPM(pm);
                MessageBox.Show("Sửa Thành Công ! ");
                HienThi();
                clearData();
                DisEnl(false);
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Bạn chắc chắn muốn hủy thao tác đang làm?", "Xác nhận hủy", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                HienThi();
                DisEnl(false);
                fluu = 1;

            }
            else
                return;
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Bạn chắc chắn muốn hủy thao tác đang làm?", "Xác nhận hủy", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                frmMain m = new frmMain();
                m.Show();
                this.Close();
            }
            else
                HienThi();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            if(cbTimKiem.Text=="Theo Mã Phiếu")
            {
                dgvPM.DataSource = bus.TimKiemPM(" SELECT * FROM dbo.PhieuMua where Ma_Phieu like '%" + txtTimKiem.Text + "%'");
            }
            if (cbTimKiem.Text == "Theo Mã Khách Hàng")
            {
                dgvPM.DataSource = bus.TimKiemPM(" SELECT * FROM dbo.PhieuMua where Ma_KH like '%" + txtTimKiem.Text + "%'");
            }
            if (cbTimKiem.Text == "Theo Ngày Mua")
            {
                dgvPM.DataSource = bus.TimKiemPM(" SELECT * FROM dbo.PhieuMua where Ngay_Mua like '%" + txtTimKiem.Text + "%'");
            }
        }

        private void frmPhieuMua_Load(object sender, EventArgs e)
        {
            cbTimKiem.DisplayMember = "";
            HienThi();
            DisEnl(false);
        }

        private void dgvPM_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (fluu == 0)
            {
                txtMaPhieu.Text = Convert.ToString(dgvPM.CurrentRow.Cells["MaPhieu"].Value);
                txtMaKH.Text = Convert.ToString(dgvPM.CurrentRow.Cells["MaKH"].Value);
                dtpNgayMua.Text = Convert.ToString(dgvPM.CurrentRow.Cells["NgayMua"].Value);

            }
            else
            {
                txtMaPhieu.Text = Convert.ToString(dgvPM.CurrentRow.Cells["MaPhieu"].Value);
                txtMaKH.Text = Convert.ToString(dgvPM.CurrentRow.Cells["MaKH"].Value);
                dtpNgayMua.Text = Convert.ToString(dgvPM.CurrentRow.Cells["NgayMua"].Value);
            }
        }

        private void dgvPM_RowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e)
        {
            dgvPM.Rows[e.RowIndex].Cells["STT"].Value = e.RowIndex + 1;

        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            HienThi();
        }
    }
}
