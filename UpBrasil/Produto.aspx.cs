using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UpBrasil
{
    public partial class Produto : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["daCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        public void LoadGrid()
        {
            if (Page.IsPostBack)
            {
                GridView1.DataBind();
            }
        }

        public void ClearFields()
        {
            txtDescricao.Text = "";
            txtQuantidade.Text = "";
            txtValor.Text = "";
            lblErro.Text = "";

        }


        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ValidaCampos())
            {
                var sql = @"INSERT INTO products (Descricao, Valor, Quantidade) VALUES (@Desc, @Valor, @Qtd);";

                try 
                {
                    using(con = new SqlConnection(cs))
                    {
                        con.Open();
                        cmd = new SqlCommand(sql, con);

                        cmd.Parameters.AddWithValue("@Desc", txtDescricao.Text);

                        cmd.Parameters.AddWithValue("@Valor", txtValor.Text);

                        cmd.Parameters.AddWithValue("@Qtd", txtQuantidade.Text);

                        cmd.ExecuteNonQuery();
                        con.Close();
                        LoadGrid();
                        ClearFields();
                    }
                
                } catch(Exception ex)
                {
                    lblErro.Text = $"Error: {ex}";

                }

            }
            else
            {
                lblErro.Text = "Preencha todos os campos";
            }
        }

        public bool ValidaCampos()
        {
            return txtDescricao.Text != "" && txtValor.Text != "" && txtQuantidade.Text != "" ? true : false;
          
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        id.Value = GridView1.SelectedRow.Cells[1].Text;

            txtDescricao.Text = GridView1.SelectedRow.Cells[2].Text;

            txtValor.Text = GridView1.SelectedRow.Cells[3].Text;

            txtQuantidade.Text = GridView1.SelectedRow.Cells[4].Text;

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ValidaCampos())
            {
               

                try
                {
                    using (con = new SqlConnection(cs))
                    {
                        var sql = @"UPDATE products SET Descricao = @Desc, Valor = @Valor, Quantidade = @Qtd WHERE Id = @id";
                        con.Open();
                        cmd = new SqlCommand(sql, con);

                        cmd.Parameters.AddWithValue("@Desc", txtDescricao.Text);

                        cmd.Parameters.AddWithValue("@Valor", txtValor.Text.Replace(",", "."));

                        cmd.Parameters.AddWithValue("@Qtd", txtQuantidade.Text);

                        cmd.Parameters.AddWithValue("@id", id.Value);

                        cmd.ExecuteNonQuery();
                        con.Close();
                        LoadGrid();
                        ClearFields();
                    }
                }
                catch (Exception err)
                {

                    lblErro.Text = $"Error: {err}";
                }
            }
            else
            {
                lblErro.Text = "selecione um produto";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (ValidaCampos()) 
            {

                try
                {
                    using (con = new SqlConnection(cs))
                    {
                        var sql = @"DELETE FROM products WHERE Id = @id";
                        con.Open();
                        cmd = new SqlCommand(sql, con);

                        
                        cmd.Parameters.AddWithValue("@id", id.Value);

                        cmd.ExecuteNonQuery();
                        con.Close();
                        LoadGrid();
                        ClearFields();
                    }
                }
                catch (Exception err)
                {

                    lblErro.Text = $"Error: {err}";
                }

            }
            else
            {
                lblErro.Text = " Selecione um produto";         }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
        }
    }
}