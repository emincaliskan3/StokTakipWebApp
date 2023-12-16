<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StokTakipWebApp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stok Takip Ürünler</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="dgvUrunler" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="dgvUrunler_SelectedIndexChanged">
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
                <legend>Ürün Bilgileri</legend>
                <table>
                    <tr>
                        <td>Ürün Adı</td>
                        <td>
                            <asp:TextBox ID="txtUrunAdi" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Ürün Açıklaması</td>
                        <td>
                            <asp:TextBox ID="txtUrunAciklamasi" TextMode="MultiLine" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Ürün Fiyatı</td>
                        <td>
                            <asp:TextBox ID="txtUrunFiyati" required runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Ürün Stok</td>
                        <td>
                            <asp:TextBox ID="txtUrunStok" required TextMode="Number" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Ürün Kategori</td>
                        <td>
                            <asp:DropDownList ID="ddlUrunKategorisi" runat="server" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Durum</td>
                        <td>
                            <asp:CheckBox ID="cbDurum" runat="server" />
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
