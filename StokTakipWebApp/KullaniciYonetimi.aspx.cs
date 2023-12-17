using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StokTakipWebApp
{
    public partial class KullaniciYonetimi : System.Web.UI.Page
    {
        StokTakipWebAppEntities context = new StokTakipWebAppEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dgvKullanicilar.DataSource = context.Users.ToList();
                dgvKullanicilar.DataBind();
            }
        }



        protected void btnEkle_Click(object sender, EventArgs e)
        {
            var kullanici = new Users()
            {
                Name = txtAd.Text,
                Surname = txtSoyad.Text,
                Email = txtEmail.Text,
                Username = txtKullaniciAdi.Text,
                Password = txtSifre.Text




            };
            context.Users.Add(kullanici);
            var sonuc = context.SaveChanges();
            if (sonuc > 0)
            {
                Response.Redirect("KullaniciYonetimi.aspx");
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            var kullanici = new Users()
            {
                Id = Convert.ToInt32(dgvKullanicilar.SelectedRow.Cells[1].Text),
                Name = txtAd.Text,
                Surname = txtSoyad.Text,
                Email = txtEmail.Text,
                Username = txtKullaniciAdi.Text,
                Password = txtSifre.Text

            };
            context.Users.AddOrUpdate(kullanici);
            int sonuc = context.SaveChanges();
            if (sonuc > 0)
            {
                Response.Redirect("/KullaniciYonetimi.aspx");
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(dgvKullanicilar.SelectedRow.Cells[1].Text);

                var kullanici = context.Users.FirstOrDefault(x => x.Id == id);
                if (kullanici != null)
                {
                    context.Users.Remove(kullanici);
                    int sonuc = context.SaveChanges();
                    if (sonuc > 0)
                    {
                        Response.Redirect("/KullaniciYonetimi.aspx");
                    }
                }
            }
            catch (Exception)
            {

            }
        }

        protected void dgvUrunler_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(dgvKullanicilar.SelectedRow.Cells[1].Text);
            var kullanici = context.Users.Find(id);
            if (kullanici != null)
            {
                txtAd.Text = kullanici.Name;
                txtSoyad.Text = kullanici.Surname;
                txtEmail.Text = kullanici.Email;
                txtKullaniciAdi.Text = kullanici.Username;
                txtSifre.Text = kullanici.Password;

            }
            btnEkle.Enabled = false;
            btnGuncelle.Enabled = true;
            btnSil.Enabled = true;
        }
    }
}