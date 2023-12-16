using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StokTakipWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        StokTakipWebAppEntities context = new StokTakipWebAppEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dgvUrunler.DataSource = context.Products.ToList();
                dgvUrunler.DataBind();
                ddlUrunKategorisi.DataSource = context.Categories.ToList();
                ddlUrunKategorisi.DataBind();
            }
        }

        protected void dgvUrunler_SelectedIndexChanged(object sender, EventArgs e)
        {
            int urunId = Convert.ToInt32(dgvUrunler.SelectedRow.Cells[1].Text);
            var urun = context.Products.Find(urunId);
            if (urun != null)
            {
                txtUrunAdi.Text = urun.Name;
                txtUrunAciklamasi.Text = urun.Description;
                txtUrunFiyati.Text = urun.Price.ToString();
                txtUrunStok.Text = urun.Stock.ToString();
                cbDurum.Checked = urun.IsActive;
                ddlUrunKategorisi.SelectedValue = urun.CategoryId.ToString();
            }
            btnGuncelle.Enabled = true;
            btnSil.Enabled = true;
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            var urun = new Products()
            {
                CategoryId = int.Parse(ddlUrunKategorisi.SelectedValue),
                Description = txtUrunAciklamasi.Text,
                IsActive = cbDurum.Checked,
                IsDelete = false,
                Name = txtUrunAdi.Text,
                Price = Convert.ToDecimal(txtUrunFiyati.Text),
                Stock = int.Parse(txtUrunStok.Text)
            };
            context.Products.Add(urun);
            int sonuc = context.SaveChanges();
            if (sonuc > 0)
            {
                Response.Redirect("/WebForm1.aspx");
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            var urun = new Products()
            {
                Id = Convert.ToInt32(dgvUrunler.SelectedRow.Cells[1].Text),
                CategoryId = int.Parse(ddlUrunKategorisi.SelectedValue),
                Description = txtUrunAciklamasi.Text,
                IsActive = cbDurum.Checked,
                IsDelete = false,
                Name = txtUrunAdi.Text,
                Price = Convert.ToDecimal(txtUrunFiyati.Text),
                Stock = int.Parse(txtUrunStok.Text)
            };
            context.Products.AddOrUpdate(urun);
            int sonuc = context.SaveChanges();
            if (sonuc > 0)
            {
                Response.Redirect("/WebForm1.aspx");
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            try
            {
                int urunId = Convert.ToInt32(dgvUrunler.SelectedRow.Cells[1].Text);
                var urun = context.Products.Find(urunId);
                if (urun != null)
                {
                    context.Products.Remove(urun);
                    int sonuc = context.SaveChanges();
                    if (sonuc > 0)
                    {
                        Response.Redirect("/WebForm1.aspx");
                    }
                }
            }
            catch (Exception)
            {

            }
        }
    }
}