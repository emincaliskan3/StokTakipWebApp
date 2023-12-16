<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KullaniciYonetimi.aspx.cs" Inherits="StokTakipWebApp.KullaniciYonetimi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kullanici Yönetimi</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="dgvKullanicilar" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="dgvUrunler_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField SelectText="Seç" ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <fieldset>
                <legend>Kullanıcı Yönetimi</legend>
                <table>
                    <tr>
                        <td>Adı</td>
                        <td>
                            <asp:TextBox ID="txtAd" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Soyad</td>
                        <td>
                            <asp:TextBox ID="txtSoyad" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Kullanıcı Adı</td>
                        <td>
                            <asp:TextBox ID="txtKullaniciAdi" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Şifre</td>
                        <td>
                            <asp:TextBox ID="txtSifre" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnEkle" runat="server" Text="Ekle" OnClick="btnEkle_Click" />
                            <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" Enabled="False" OnClick="btnGuncelle_Click" />
                            <asp:Button ID="btnSil" runat="server" Text="Sil" Enabled="False" OnClick="btnSil_Click" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </form>
</body>
</html>
