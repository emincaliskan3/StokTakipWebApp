<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KategoriYonetimi.aspx.cs" Inherits="StokTakipWebApp.KategoriYonetimi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kategori Yönetimi</title>
</head>
<body>
    <h1>Kategori Yönetimi</h1>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="dgvKategoriler" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="dgvKategoriler_SelectedIndexChanged">
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

            <hr />

            <table>
                <tr>
                    <td>Kategori Adı</td>
                    <td>
                        <asp:TextBox ID="txtKategoriAdi" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Kategori Açıklaması</td>
                    <td>
                        <asp:TextBox ID="txtKategoriAciklamasi" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Durum</td>
                    <td>
                        <asp:CheckBox ID="cbDurum" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnEkle" runat="server" Text="Ekle" OnClick="btnEkle_Click" />
                        <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" OnClick="btnGuncelle_Click" />
                        <asp:Button ID="btnSil" runat="server" Text="Sil" OnClick="btnSil_Click" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
