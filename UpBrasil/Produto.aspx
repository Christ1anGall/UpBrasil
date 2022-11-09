<%@ Page Title="Produtos"  Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Produto.aspx.cs" Inherits="UpBrasil.Produto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <table class="nav-justified">
    <tr>
        <td class="modal-sm" style="width: 96px">&nbsp;</td>
        <td class="modal-sm" style="width: 299px">&nbsp;</td>
        <td rowspan="12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="295px" Width="782px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                    <asp:BoundField DataField="Quantidade" HeaderText="Quantidade" SortExpression="Quantidade" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=LAPTOP-O00B9SJA;Initial Catalog=crud_products;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td style="width: 96px; height: 20px"></td>
        <td style="height: 20px; width: 299px">Produto<br />
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 96px">Descrição:</td>
        <td class="modal-sm" style="width: 299px">
            <asp:TextBox ID="txtDescricao" runat="server" Width="263px" ></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 96px">&nbsp;</td>
        <td class="modal-sm" style="width: 299px">&nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 96px">Valor:</td>
        <td class="modal-sm" style="width: 299px">
            <asp:TextBox ID="txtValor" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 96px">&nbsp;</td>
        <td class="modal-sm" style="width: 299px">&nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 96px">Quantidade:</td>
        <td class="modal-sm" style="width: 299px">
            <asp:TextBox ID="txtQuantidade" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="height: 18px; width: 96px">&nbsp;</td>
        <td style="height: 18px; width: 299px">&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 18px; width: 96px">
            &nbsp;</td>
        <td style="height: 18px; width: 299px">
            <asp:Label ID="lblErro" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 96px; height: 20px"></td>
        <td class="modal-lg" style="height: 20px; width: 299px"></td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 96px">&nbsp;</td>
        <td class="modal-sm" style="width: 299px">
            <asp:Button ID="btnAdd" runat="server" OnClick="Button1_Click" Text="Add" BackColor="Green" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" BackColor="#99FF99" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" BackColor="Red" OnClick="btnDelete_Click" />
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 96px">&nbsp;</td>
        <td class="modal-sm" style="width: 299px">
            <asp:Button ID="btnCancel" runat="server" Text="Limpar" Width="166px" OnClick="btnCancel_Click" />
        </td>
    </tr>
</table>

    <asp:HiddenField ID="id" runat="server" />

</asp:Content>

