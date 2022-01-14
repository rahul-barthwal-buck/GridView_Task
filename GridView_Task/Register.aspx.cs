using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridView_Task
{
    public partial class Register : System.Web.UI.Page
    {
        private string strConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GridViewTaskConnectionString"].ConnectionString;
        private SqlCommand sqlCommand;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Create Connection
        private void CreateConnection()
        {
            SqlConnection sqlConnection = new SqlConnection(strConnectionString);
            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnection;

        }

        //Open Connection
        private void OpenConnection()
        {
            sqlCommand.Connection.Open();
        }
        //Close Connection
        private void CloseConnection()
        {
            sqlCommand.Connection.Close();
        }
        //Dispose Connection
        private void DisposeConnection()
        {
            sqlCommand.Connection.Dispose();
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    //First checking whether the UserName exist or not
                    CreateConnection();
                    OpenConnection();

                    sqlCommand.CommandText = "sp_Register";
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                    sqlCommand.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    sqlCommand.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    int result = Convert.ToInt32(sqlCommand.ExecuteNonQuery());
                    if (result > 0)
                    {
                        lblMessage.Text = "Registered Successfully...";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        ClearControls();
                    }
                    else
                    {
                        lblMessage.Text = "Failed!";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    CloseConnection();
                    DisposeConnection();
                }
                
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        public void ClearControls()
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
        }
    }
}