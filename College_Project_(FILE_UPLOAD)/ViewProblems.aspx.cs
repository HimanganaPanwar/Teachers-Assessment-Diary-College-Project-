using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.IO;
using System.Data.SqlClient;
using System.Drawing;

namespace College_Project__FILE_UPLOAD_
{
    public partial class ViewProblems : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["DBCS"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["AdminEmail"] != null && Session["AdminPassword"] != null)
            //{
            if (!IsPostBack)
            {
                BindGridView();
                DataFoundStatus.Visible = false;
            }
            //}
            //else
            //{
            //    Response.Redirect("~/HOMEPAGE.aspx");
            //}
        }

        //protected void BindGridView(string searchVal)
        //{
        //    using (SqlCommand cmdCheck = new SqlCommand())
        //    {
        //        try
        //        {
        //            DataTable objdt = new DataTable();
        //            string query = searchVal == "" ? "select * from Problems where Status = 'Solved' ORDER BY Report_Date ASC;" : "select * from Problems where Title like '%" + searchVal + "%' ORDER BY Report_Date ASC;";
        //            SqlDataAdapter da = new SqlDataAdapter(query, con);
        //            con.Open();
        //            da.Fill(objdt);
        //            con.Close();
        //            if (objdt.Rows.Count > 0)
        //            {
        //                GridView1.DataSource = objdt;
        //                GridView1.DataBind();
        //            }
        //            else
        //            {
        //                DataFoundStatus.Text = "No data found!";
        //                DataFoundStatus.Visible = true;
        //                DataFoundStatus.ForeColor = System.Drawing.Color.Red;
        //                GridView1.DataSource = objdt;
        //                GridView1.DataBind();
        //            }
        //        }
        //        catch
        //        {
        //            con.Close();
        //        }
        //    }
        //}

        protected void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT * FROM Problems where Status = 'Pending'";
                    if (!string.IsNullOrEmpty(SearchProblemTxt.Text.Trim()))
                    {
                        sql = "select * from Problems WHERE Title LIKE @Title + '%'";
                        cmd.Parameters.AddWithValue("@Title", SearchProblemTxt.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            DataFoundStatus.Visible = false;
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                        else
                        {
                            DataFoundStatus.Visible = true;
                            DataFoundStatus.Text = "No data was found!";
                            DataFoundStatus.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewError")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];

                string S_NO = row.Cells[0].Text;
                string L_ID = row.Cells[1].Text;
                Response.Redirect(String.Format("~/ViewError_NewPage.aspx?S_No={0}&L_ID={1}", S_NO, L_ID));
            }
        }

        protected void ViewImage_Click(object sender, EventArgs e)
        {
            LinkButton downloadLink = sender as LinkButton;
            GridViewRow gridRow = downloadLink.NamingContainer as GridViewRow;
            string downloadImage = GridView1.DataKeys[gridRow.RowIndex].Value.ToString();
            Response.AddHeader("Content-Disposition", "attachment; filename=\"" + downloadImage + "\"");
            Response.TransmitFile(Server.MapPath(downloadImage));
            Response.End();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell cell = e.Row.Cells[7];
                string ACStatus = cell.Text;
                if (ACStatus == "Pending")
                {
                    cell.BackColor = Color.Red;
                }
                else if (ACStatus == "Solved")
                {
                    cell.BackColor = Color.LightGreen;
                }
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            this.BindGridView();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGridView();
        }

        protected void BackBtn_Click(object sender, EventArgs e)
        {

        }

        protected void StatusRadioBtn_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataFoundStatus.Visible = false;
            string status = StatusRadioBtn.SelectedItem.Value;
            string sql = "SELECT * FROM Problems WHERE Status=@Status";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(sql))
                {
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }
    }
}