using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Text;

namespace College_Project__FILE_UPLOAD_
{
    public partial class Email_Password_Page : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        string encrypt_Password, encrypt_CPassword;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    //USING QUERY STRING:
                    if (Session["Row"] != null)
                    {
                        //Fetch the GridView Row from Session.
                        GridViewRow row = Session["Row"] as GridViewRow;

                        //Fetch and display the Cell values.
                        Lecturer_ID_Label.Text = row.Cells[0].Text;
                        Lecturer_ID_Label.Text = row.Cells[3].Text;
                    }
                    else if (Request.QueryString["ID"] != null)
                    {
                        string TeacherID = "0";
                        TeacherID = Request.QueryString["ID"].ToString();
                        Lecturer_ID_Label.Text = TeacherID;
                    }
                    else
                    {
                        Lecturer_ID_Label.Text = Session["Teacher_ID"].ToString();
                    }
                }
                catch(NullReferenceException)
                {
                    Response.Redirect("~/HOMEPAGE.aspx");
                }
            }
        }

        protected void encryptPassword()
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[New_Password_Txt.Text.ToString().Length];
            encode = Encoding.UTF8.GetBytes(New_Password_Txt.Text);
            strmsg = Convert.ToBase64String(encode);
            encrypt_Password = strmsg;

            string strmsg2 = string.Empty;
            byte[] encode_cpassword = new byte[Confirm_New_Password_Txt.Text.ToString().Length];
            encode_cpassword = Encoding.UTF8.GetBytes(Confirm_New_Password_Txt.Text);
            strmsg2 = Convert.ToBase64String(encode_cpassword);
            encrypt_CPassword = strmsg;
        }
        protected void ChangePassword_Btn_Click(object sender, EventArgs e)
        {
            encryptPassword();
            if (!String.IsNullOrEmpty(Old_Password_Txt.Text.Trim()) && !String.IsNullOrEmpty(New_Password_Txt.Text.Trim()) && !String.IsNullOrEmpty(Confirm_New_Password_Txt.Text.Trim()))
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    String query = "SELECT * from LoginTable_COLLEGEPROJECT_FILE_UPLOAD where U_ID = @U_ID and Password = @OldPassword";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@U_ID", Lecturer_ID_Label.Text);
                    cmd.Parameters.AddWithValue("@OldPassword", Old_Password_Txt.Text);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        if(Old_Password_Txt.Text == New_Password_Txt.Text)
                        {
                            StatusLabel.Text = "Password entered is same as old password. Enter new one";
                            StatusLabel.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            using (SqlConnection sqlCon = new SqlConnection(strCon))
                            {
                                using (SqlCommand sqlCmd = new SqlCommand("sp_ResetPassword_COLLEGEPROJECT_FILE_UPLOAD", sqlCon))
                                {
                                    sqlCmd.CommandType = CommandType.StoredProcedure;

                                    sqlCmd.Parameters.AddWithValue("@Password", encrypt_Password);
                                    sqlCmd.Parameters.AddWithValue("@Confirm_Password", encrypt_CPassword);
                                    sqlCmd.Parameters.AddWithValue("@U_ID", Convert.ToInt32(Lecturer_ID_Label.Text));

                                    sqlCon.Open();
                                    int a = sqlCmd.ExecuteNonQuery();

                                    if (a > 0)
                                    {
                                        StatusLabel.Text = "PASSWORD UPDATED!";
                                        StatusLabel.ForeColor = System.Drawing.Color.Green;
                                    }
                                    else
                                    {
                                        StatusLabel.Visible = true;
                                        StatusLabel.Text = "Password was not Updated!";
                                        StatusLabel.ForeColor = System.Drawing.Color.Red;
                                    }
                                    sqlCon.Close();
                                    ClearControls();
                                }
                            }
                        }
                    }
                    else
                    {
                        StatusLabel.Text = "Old Password is Incorrect!!";
                        StatusLabel.ForeColor = System.Drawing.Color.Red;
                    }
                    con.Close();
                }
            }
        }
        protected void Cancel_Btn_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        protected void ClearControls()
        {
            Old_Password_Txt.Text = "";
            New_Password_Txt.Text = "";
            Confirm_New_Password_Txt.Text = "";
        }

        protected void BackButton_Click1(object sender, EventArgs e)
        {
            if (Session["Row"] != null || Request.QueryString["ID"] != null)
            {
                string Teacher_ID = Request.QueryString["ID"].ToString();
                Session["ID"] = Teacher_ID;
                string AdminEmail = Session["AdminEmail"].ToString();
                Session["AdminEmail"] = AdminEmail;
                Response.Redirect("~/INFORMATION(GENERAL_INFO).aspx?ID=" + Teacher_ID);
            }
            else if (Session["LecturerEmail"] != null)
            {
                Response.Redirect("~/INFORMATION(GENERAL_INFO).aspx");
            }
            else
            {
                Response.Redirect("~/HOMEPAGE.ASPX");
            }
        }
    }
}