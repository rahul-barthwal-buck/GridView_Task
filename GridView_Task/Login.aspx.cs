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
    public partial class Login : System.Web.UI.Page
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
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    CreateConnection();
                    OpenConnection();

                    sqlCommand.CommandText = "sp_Login";
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@Event", "CheckUserName");
                    sqlCommand.Parameters.AddWithValue("@UserName",txtUserName.Text.Trim());
                    sqlCommand.Parameters.AddWithValue("@Password", null);
                    int result = Convert.ToInt32(sqlCommand.ExecuteScalar().ToString());
                    if (result == 1)
                    {
                        CloseConnection();

                        CreateConnection();
                        OpenConnection();
                        sqlCommand.CommandText = "sp_Login";
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        sqlCommand.Parameters.AddWithValue("@Event", "CheckPassword");
                        sqlCommand.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                        sqlCommand.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        int resultPwd = Convert.ToInt32(sqlCommand.ExecuteScalar().ToString());
                        if (resultPwd == 1)
                        {
                            CloseConnection();
                            DisposeConnection();
                            Session["UserName"] = txtUserName.Text.Trim();
                            ClearControls();
                            Response.Redirect("Index.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Password is incorrect!";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            CloseConnection();
                            DisposeConnection();
                        }
                    }
                    else
                    {
                        lblMessage.Text = "UserName does not exists!";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    
                }
                DisposeConnection();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
       
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