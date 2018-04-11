using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BUS;
using Entity;

namespace QuanLyKhuVuiChoi
{
    public partial class frmVeChoi : Form
    {
        VeChoiBus Bus = new VeChoiBus();
        VeChoiEntity Ve = new VeChoiEntity();
        private int fluu = 1;
        public frmVeChoi()
        {
            InitializeComponent();
        }
        private void DisEnl(bool e)
        {
            btnThem.Enabled = !e;
            btnXoa.Enabled = !e;
            btnSua.Enabled = !e;
            btnLuu.Enabled = e;
            btnHuy.Enabled = e;
            txtMaVe.Enabled = e;
            cmbMaKH.Enabled = e;
            cmbMaKhu.Enabled = e;
            txtTongTien.Enabled = e;
            txtVeNL.Enabled = e;
            txtVeTE.Enabled = e;
            dpNgayBan.Enabled = e;
        }
        private void clearData()
        {
            txtMaVe.Text = "";
            txtTongTien.Text = "";
            txtVeNL.Text = "";
            cmbMaKH.Text = "";
            txtVeTE.Text = "";
            cmbMaKhu.Text = "";
            dpNgayBan.Text = "";
        }
        private void HienThi()
        {
            dgvVeChoi.DataSource = Bus.GetData();
        }
        private void frmVeChoi_Load(object sender, EventArgs e)
        {

        }

        private void dgvVeChoi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.ColumnIndex >= 0)
            {
                if (fluu == 0)
                {
                    //  txtMaTB.Text = Convert.ToString(dgvThietBi.CurrentRow.Cells["MaTB"].Value);
                    txtTongTien.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["TongTien"].Value);
                    txtVeNL.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["SoVeNL"].Value);
                    txtVeTE.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["SoVeTE"].Value);
                    cmbMaKhu.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["MaKhu"].Value);
                    cmbMaKH.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["MaKH"].Value);
                    dpNgayBan.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["NgayBan"].Value);
                }
                else
                {
                    txtMaVe.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["MaVe"].Value);
                    txtTongTien.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["TongTien"].Value);
                    txtVeNL.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["SoVeNL"].Value);
                    txtVeTE.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["SoVeTE"].Value);
                    cmbMaKhu.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["MaKhu"].Value);
                    cmbMaKH.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["MaKH"].Value);
                    dpNgayBan.Text = Convert.ToString(dgvVeChoi.CurrentRow.Cells["NgayBan"].Value);
                }
            }
        }

        private void dgvVeChoi_RowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e)
        {
            dgvVeChoi.Rows[e.RowIndex].Cells["STT"].Value = e.RowIndex + 1;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            fluu = 0;
            txtMaVe.Text = Bus.TangMa();
            DisEnl(true);
            txtMaVe.Enabled = false;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            fluu = 1;
            DisEnl(true);
            txtMaVe.Enabled = false;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có chắc chắn muốn xóa không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                try
                {
                    Bus.DeleteData(txtMaVe.Text);
                    MessageBox.Show("Xóa thành công!", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    clearData();
                    DisEnl(false);
                    HienThi();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Có Lỗi Không thể xóa !");
                }
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            Ve.MaVe = txtMaVe.Text;
             Ve.MaKhu = cmbMaKhu.Text;
            Ve.MaKH = cmbMaKH.Text;
            Ve.TongTien = Convert.ToInt32(txtTongTien.Text);
            Ve.SoVeNL = Convert.ToInt32(txtVeNL.Text);
            Ve.SoVeTE = Convert.ToInt32(txtVeTE.Text);
            Ve.NgayBan = dpNgayBan.Text;
            if (fluu == 0)
            {
                try
                {
                    Bus.InsertData(Ve);
                    MessageBox.Show("Thêm thành công!", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    HienThi();
                    clearData();
                    DisEnl(false);
                    //fluu = 1;
                }
                catch
                {

                }
            }
            else
            {
                try
                {
                    Bus.UpdateData(Ve);
                    MessageBox.Show("Sửa Thành Công ! ", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    HienThi();
                    clearData();
                    DisEnl(false);
                }
                catch
                {

                }
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
                //frmMain m = new frmMain();
                //m.Show();
                //this.Close();
                Application.Exit();
            }
            else
                HienThi();
        }
    }
}
