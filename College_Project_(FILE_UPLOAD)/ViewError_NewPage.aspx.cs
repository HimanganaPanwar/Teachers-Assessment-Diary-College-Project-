using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;
using System.Drawing;

namespace College_Project__FILE_UPLOAD_
{
    public partial class ViewError_NewPage : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(strCon))
                    {
                        if (Request.QueryString["S_No"] != null && Request.QueryString["L_ID"] != null)
                        {
                            string S_No = "0";
                            int L_ID = 0;
                            S_No = Request.QueryString["S_No"].ToString();
                            L_ID = Convert.ToInt32(Request.QueryString["L_ID"]);
                            S_NO_Lbl.Text = S_No;
                            LecturerIDLbl.Text = L_ID.ToString();

                            string query = "SELECT Report_Date, Title, Description, AttachImageData, Status FROM Problems WHERE S_No = '" + S_NO_Lbl.Text + "' AND Teacher_ID = '" + LecturerIDLbl.Text + "';";
                            using (SqlCommand cmd = new SqlCommand(query, con))
                            {
                                cmd.CommandType = CommandType.Text;
                                con.Open();
                                using (SqlDataReader sdr = cmd.ExecuteReader())
                                {
                                    sdr.Read();
                                    DateLbl.Text = sdr["Report_Date"].ToString();
                                    TitleLbl.Text = sdr["Title"].ToString();
                                    DescTxt.Text = sdr["Description"].ToString();

                                    //string getPath = sdr["AttachImageData"].ToString();
                                    //AttachedImg.ImageUrl = Server.MapPath(getPath);
                                    
                                    AttachedImg.ImageUrl = sdr["AttachImageData"].ToString();

                                    ShowErrorStatusLbl.Text = sdr["Status"].ToString();
                                    ShowErrorStatusLbl.ForeColor = System.Drawing.Color.Red;
                                }
                                con.Close();
                            }
                        }
                        else
                        {
                            Response.Redirect("~/HOMEPAGE.aspx");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Redirect("~/HOMEPAGE.aspx");
                }
            }
        }

        protected void UpdateStatusBtn_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(strCon))
            {
                string query = "update Problems set Status = 'Solved' where S_No = '" + S_NO_Lbl.Text + "' and Teacher_ID = '" + LecturerIDLbl.Text + "';";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    ShowErrorStatusLbl.Text = "Solved";
                    ShowErrorStatusLbl.ForeColor = System.Drawing.Color.Green;

                    con.Close();
                }
            }
        }

        protected void BackToProfilesBtn_Click(object sender, EventArgs e)
        {

        }
    }
}