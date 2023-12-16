using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StokTakipWebApp
{
    public partial class KategoriYonetimi : System.Web.UI.Page
    {
        StokTakipWebAppEntities context = new StokTakipWebAppEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dgvKategoriler.DataSource = context.Categories.ToList();
                dgvKategoriler.DataBind();
            }

        }

        protected void dgvKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(dgvKategoriler.SelectedRow.Cells[1].Text);
            var kategori = context.Categories.Find(id);
            if (kategori != null)
            {
                txtKategoriAdi.Text = kategori.Name;
                txtKategoriAciklamasi.Text = kategori.Description;
                cbDurum.Checked = kategori.IsActive;
            }
            btnEkle.Enabled = false;
            btnGuncelle.Enabled = true;
            btnSil.Enabled = true;
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            var kategori = new Categories()
            {
                Description = txtKategoriAciklamasi.Text,
                Name = txtKategoriAdi.Text,
                IsActive = cbDurum.Checked
            };
            context.Categories.Add(kategori);
            var sonuc = context.SaveChanges();
            if (sonuc > 0)
            {
                Response.Redirect("KategoriYonetimi.aspx");
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            var kategori = new Categories()
            {
                Id = Convert.ToInt32(dgvKategoriler.SelectedRow.Cells[1].Text),
                Description = txtKategoriAciklamasi.Text,
                IsActive = cbDurum.Checked,
                Name = txtKategoriAdi.Text

            };
            context.Categories.AddOrUpdate(kategori);
            int sonuc = context.SaveChanges();
            if (sonuc > 0)
            {
                Response.Redirect("/KategoriYonetimi.aspx");
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(dgvKategoriler.SelectedRow.Cells[1].Text);

                var kategori = context.Categories.FirstOrDefault(x => x.Id == id);
                if (kategori != null)
                {
                    context.Categories.Remove(kategori);
                    int sonuc = context.SaveChanges();
                    if (sonuc > 0)
                    {
                        Response.Redirect("/KategoriYonetimi.aspx");
                    }
                }
            }
            catch (Exception)
            {

            }
        }
    }
}