using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Text;

namespace College_Project__FILE_UPLOAD_
{
    public partial class LECTURER_LOGIN : System.Web.UI.Page
    {
        static string decrypt;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void decryptPassword(string encryptPassword)
        {
            string decryptpwd = string.Empty;
            UTF8Encoding encodepwd = new UTF8Encoding();
            Decoder Decode = encodepwd.GetDecoder();
            byte[] tocode_byte = Convert.FromBase64String(encryptPassword);
            int charCount = Decode.GetCharCount(tocode_byte, 0, tocode_byte.Length);
            char[] decoded_char = new char[charCount];
            Decode.GetChars(tocode_byte, 0, tocode_byte.Length, decoded_char, 0);
            decryptpwd = new String(decoded_char);
            decrypt = decryptpwd;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                //con.Open();
                //String query = "select * from LoginTable_COLLEGEPROJECT_FILE_UPLOAD where Email = @Lecturer_Email and Password = @Lecturer_Password and Registered_As = 'LECTURER' and AccountStatus = @AccStatus";
                //SqlCommand cmd = new SqlCommand(query, con);
                //cmd.Parameters.AddWithValue("@Lecturer_Email", UsernameTxt.Text);
                //string password = txtPassword.Text;
                //decryptPassword(password);
                //cmd.Parameters.AddWithValue("@Lecturer_Password", decrypt);
                //cmd.Parameters.AddWithValue("@AccStatus", "Enabled");
                //SqlDataReader sdr = cmd.ExecuteReader();
                //if (sdr.Read())
                //{
                //    AddDataToSession();
                //    clearControls();
                //    Response.Redirect("~/INFORMATION(GENERAL_INFO).aspx");
                //}
                //else
                //{
                //    txtPassword.Text = "";
                //    lblMessage.Text = "Invalid Email or Password";
                //    lblMessage.ForeColor = System.Drawing.Color.Red;
                //}


                using (SqlCommand cmd = con.CreateCommand())
                {
                    string query = "select * from LoginTable_COLLEGEPROJECT_FILE_UPLOAD where Email = '" + UsernameTxt.Text + "'";
                    cmd.CommandText = query;
                    cmd.Connection = con;
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
                    sqlDataAdapter.SelectCommand = cmd;
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);
                    string email;
                    string password;

                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        email = dataSet.Tables[0].Rows[0]["Email"].ToString();
                        password = dataSet.Tables[0].Rows[0]["Password"].ToString();

                        con.Open();
                        decryptPassword(password);
                        if (email == UsernameTxt.Text && decrypt == txtPassword.Text)
                        {
                            Session.Add("LecturerEmail", UsernameTxt.Text);
                            Session.Add("LecturerPassword", decrypt);

                            using (SqlCommand sqlCommand = con.CreateCommand())
                            {
                                sqlCommand.CommandText = "INSERT INTO LOGIN_DETAILS(EMAIL, DATE_TIME) VALUES(@Email, @Date_Time)";

                                sqlCommand.Parameters.AddWithValue("@Email", UsernameTxt.Text);
                                sqlCommand.Parameters.AddWithValue("@Date_Time", DateTime.Now);

                                sqlCommand.Connection = con;
                                sqlCommand.ExecuteNonQuery();
                            }

                            Response.Redirect("~/INFORMATION(GENERAL_INFO).aspx");
                        }
                        else
                        {
                            lblMessage.Text = "invalid details";
                        }
                    }
                    else
                    {
                        lblMessage.Text = "invalid details";
                    }
                }
            }
        }
        protected void clearControls()
        {
            UsernameTxt.Text = null;
            txtPassword.Text = null;
        }
        //protected void DontHaveAccountBtn_Click(object sender, EventArgs e)
        //{
        //    clearControls();
        //    Response.Redirect("~/REGISTRATION_PAGE.aspx");
        //}

        //protected void ForgotPasswordLinkBtn_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/ForgotPassword_Page.aspx");
        //}
    }
}