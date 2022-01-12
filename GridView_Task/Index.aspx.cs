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
    public partial class Index : System.Web.UI.Page
    {
        //Making Connection and Declaring required variables
        private string strConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GridViewTaskConnectionString"].ConnectionString;
        private SqlCommand sqlCommand;
        private SqlDataAdapter sqlDataAdapter;
        private DataSet dataSet;
        protected void Page_Load(object sender, EventArgs e)
        {
            // It indicates whether the page is being rendered for the first time or is being loaded in response to a postback.
            if (!Page.IsPostBack)
            {
                BindProductDetails();
            }
            btnUpdate.Visible = false;
            btnInsert.Visible = true;
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

        //Binding DataTable to GridView
        private void BindProductDetails()
        {
            GridView1.DataSource = getDataTable();
            GridView1.DataBind();

        }

        //calling Stored procedure to get all data and then filling it with SqlDataAdapter and returning table for binding
        private DataTable getDataTable()
        {
            try
            {
                CreateConnection();
                OpenConnection();
                sqlCommand.CommandText = "SP_ProductDetails_GridView";
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@Event", "Select");
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);
                return dataSet.Tables[0];

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        //To handle the Sorting event of GridView below event handler will called
        protected void grid_Sorting(object sender, GridViewSortEventArgs e)
        {

            string sortDirection = string.Empty;

            //SortDirection is actually  enum and this property available in GridViewSortEventArgs and it tell us whether to sort the data in Asc or Desc order
            //Here first we we check the direction from direction object of SortDirection property where we stored the direction in ViewState and then the sort direction
            if (direction == SortDirection.Ascending)
            {
                direction = SortDirection.Descending;
                sortDirection = "Desc";
            }
            else
            {
                direction = SortDirection.Ascending;
                sortDirection = "Asc";
            }
            //DataView provides different views of the data stored in a DataTable and Due to this view of data from DataTable can be customized and DataView can be used to sort, filter, search, insert, update the data in a DataTable.
            //DataView either take no argument in constructor or it will take DataTable table as argument.
            DataView dataView = new DataView(getDataTable());
            //SortExpression is the property available in GridViewSortEventArgs and due to this we can get the SortExpression value of GridView column which is clicked
            //Here I am using sort functionality of DataView for sorting the DataTable.
            dataView.Sort = e.SortExpression + " " + sortDirection;
            //Here storing the dataView as Object in the Session which helps in pagination when sorting applied.
            Session["SortedView"] = dataView;
            GridView1.DataSource = dataView;
            GridView1.DataBind();
        }

        //Below event handler will handle the paging into the GridView
        protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            //here firstly we check whether the Session SortedDataView is null or not.
            if (Session["SortedDataView"] != null)
            {
                //If not null then we can bind the DataView object present into the Session object into the GridView and according to sorted data pagination will work.
                GridView1.DataSource = Session["SortedDataView"];
                GridView1.DataBind();
            }
            else
            {
                //If null then bind it will the regular DataTable method which is of DataTable type
                GridView1.DataSource = getDataTable();
                GridView1.DataBind();
            }
        }

        //Here creating a property of SortDirection type which stores the direction value in ViewState
        public SortDirection direction
        {
            get
            {
                if (ViewState["dir"] == null)
                {
                    ViewState["dir"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["dir"];
            }
            set
            {
                ViewState["dir"] = value;
            }
        }

        //When user click Insert then this event will run
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                CreateConnection();
                OpenConnection();
                sqlCommand.CommandText = "SP_ProductDetails_GridView";
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@Event", "Add");
                sqlCommand.Parameters.AddWithValue("@ProductName", Convert.ToString(txtProductName.Text.Trim()));
                sqlCommand.Parameters.AddWithValue("@QuantityPerUnit", Convert.ToInt32(txtQuantityPerUnit.Text.Trim()));
                sqlCommand.Parameters.AddWithValue("@UnitPrice", Convert.ToDecimal(txtUnitPrice.Text));
                sqlCommand.Parameters.AddWithValue("@UnitsInStock", Convert.ToInt32(txtUnitsInStock.Text));
                int result = Convert.ToInt32(sqlCommand.ExecuteNonQuery());
                if (result > 0)
                {
                    lblMessage.Text = "Record Inserted Successfully...";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    BindProductDetails();
                    //ClearControls();
                }
                else
                {
                    lblMessage.Text = "Failed!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
 
        
        //protected void grid_EditCancelRow(object sender, GridViewCancelEditEventArgs e)
        //{
        //    GridView1.EditIndex = -1;
        //    BindProductDetails();
        //}

        //When user clicks Edit button in grid then this event set the values of that row in the form for editing the value
        protected void grid_EditRow(object sender, GridViewEditEventArgs e)
        {
            btnInsert.Visible = false;
            btnUpdate.Visible = true;

            int RowIndex = e.NewEditIndex;
            Label prdId = (Label)GridView1.Rows[RowIndex].FindControl("lblProductId");
            Session["id"] = prdId.Text;

            txtProductName.Text = ((Label)GridView1.Rows[RowIndex].FindControl("lblProductName")).Text.ToString();
            txtQuantityPerUnit.Text = ((Label)GridView1.Rows[RowIndex].FindControl("lblQuantityPerUnit")).Text.ToString();
            txtUnitPrice.Text = ((Label)GridView1.Rows[RowIndex].FindControl("lblUnitPrice")).Text.ToString();
            txtUnitsInStock.Text = ((Label)GridView1.Rows[RowIndex].FindControl("lblUnitsInStock")).Text.ToString();

            btnReset.Text = "Cancel";

        }

        //This will clear all the fields of form and lblMessage
        public void ClearControls()
        {
            txtProductName.Text = "";
            txtQuantityPerUnit.Text = "";
            txtUnitPrice.Text = "";
            txtUnitsInStock.Text = "";
        }

        //When user clicks on Update button then below event will peform and update the fields and then Bind the gridview again.
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                CreateConnection();
                OpenConnection();

                sqlCommand.CommandText = "SP_ProductDetails_GridView";
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@Event", "Update");
                sqlCommand.Parameters.AddWithValue("@ProductName", Convert.ToString(txtProductName.Text.Trim()));
                sqlCommand.Parameters.AddWithValue("@QuantityPerUnit", Convert.ToInt32(txtQuantityPerUnit.Text.Trim()));
                sqlCommand.Parameters.AddWithValue("@UnitPrice", Convert.ToDecimal(txtUnitPrice.Text));
                sqlCommand.Parameters.AddWithValue("@UnitsInStock", Convert.ToInt32(txtUnitsInStock.Text));
                sqlCommand.Parameters.AddWithValue("@ProductId", Convert.ToDecimal(Session["id"]));

                int result = Convert.ToInt32(sqlCommand.ExecuteNonQuery());
                if (result > 0)
                {
                    lblMessage.Text = "Record Updated Successfully...";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    GridView1.EditIndex = -1;
                    BindProductDetails();
                    ClearControls();
                    btnReset.Text = "Reset";
                }
                else
                {
                    lblMessage.Text = "Failed!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                CloseConnection();
                DisposeConnection();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //This event will call a function which clear all fields of the form when user clicks on Reset button
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearControls();
            btnReset.Text = "Reset";
        }

        //This event will perform when user clicks on Delete link Button of a particular row and checking the DataKeyNames property of Gridview and according to DataKeyNames which is set to Product_Id and delete record of that row and Bind the GridView again.
        protected void grid_DeleteRow(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                CreateConnection();
                OpenConnection();
                Label id = (Label)GridView1.Rows[e.RowIndex].FindControl("lblProductId");
                sqlCommand.CommandText = "SP_ProductDetails_GridView";
                sqlCommand.Parameters.AddWithValue("@Event", "Delete");
                sqlCommand.Parameters.AddWithValue("@ProductId", Convert.ToInt32(id.Text));
                sqlCommand.CommandType = CommandType.StoredProcedure;
                int result = Convert.ToInt32(sqlCommand.ExecuteNonQuery());
                if (result > 0)
                {

                    lblMessage.Text = "Record Deleted Successfully...";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    GridView1.EditIndex = -1;
                    BindProductDetails();
                }
                else
                {
                    lblMessage.Text = "Failed";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    BindProductDetails();
                }
                CloseConnection();
                DisposeConnection();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //This event will peform when user clicks on Search Button and it will find the search result and the Bind the gridview again according to the search result.
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                CreateConnection();
                OpenConnection();

                sqlCommand.CommandText = "SP_ProductDetails_GridView";
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@Event", "Search");
                sqlCommand.Parameters.AddWithValue("@ProductName", txtSearch.Text.Trim());
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);
                GridView1.DataSource = dataSet;
                GridView1.DataBind();
                CloseConnection();
                DisposeConnection();
                txtSearch.Text = "";
                lblMessage.Text = "";
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}