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
    public partial class REGISTRATION_PAGE : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        string encrypt_Password, encrypt_CPassword;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label_ID.Visible = true;
            IDLabel.Visible = true;
        }

        protected void HaveAccountBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Lecturer_Login.aspx");
        }

        protected void encryptPassword()
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[PasswordTxt.Text.ToString().Length];
            encode = Encoding.UTF8.GetBytes(PasswordTxt.Text);
            strmsg = Convert.ToBase64String(encode);
            encrypt_Password = strmsg;

            string strmsg2 = string.Empty;
            byte[] encode_cpassword = new byte[CPassword.Text.ToString().Length];
            encode_cpassword = Encoding.UTF8.GetBytes(CPassword.Text);
            strmsg2 = Convert.ToBase64String(encode_cpassword);
            encrypt_CPassword = strmsg;
        }
        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            encryptPassword();
            using (SqlConnection checkUserCon = new SqlConnection(cs))
            {
                string checkUser = "select count(*) from RegistrationTable_COLLEGEPROJECT_FILE_UPLOAD where Email = '" + EmailTxt.Text + "';";
                SqlCommand checkUserCmd = new SqlCommand(checkUser, checkUserCon);
                checkUserCon.Open();
                int temp = Convert.ToInt32(checkUserCmd.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    IDLabel.Text = "USER ALREADY EXISTS!";
                    ClearControls();
                }
                else
                {
                    if (!string.IsNullOrEmpty(EmailTxt.Text.Trim()) && !string.IsNullOrEmpty(PhoneNoTxt.Text.Trim()) && !string.IsNullOrEmpty(PasswordTxt.Text.Trim()) && !string.IsNullOrEmpty(FirstNameTxt.Text.Trim()) && !string.IsNullOrEmpty(LastNameTxt.Text.Trim()))
                    {
                        if (FileUpload1.HasFile)
                        {
                            HttpPostedFile postedFile = FileUpload1.PostedFile;
                            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                            string fileExtension = Path.GetExtension(filename);
                            int fileSize = postedFile.ContentLength;

                            Stream str = FileUpload1.PostedFile.InputStream;
                            BinaryReader br = new BinaryReader(str);
                            Byte[] size = br.ReadBytes((int)str.Length);

                            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".jpeg")
                            {
                                Stream stream = postedFile.InputStream;
                                BinaryReader binaryReader = new BinaryReader(stream);
                                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                                using (SqlConnection con = new SqlConnection(cs))
                                {
                                    SqlCommand cmd = new SqlCommand("COLLEGEPROJECT_sp_InsertMainData_FILE_UPLOAD", con);
                                    cmd.CommandType = CommandType.StoredProcedure;

                                    FileUpload1.SaveAs(Server.MapPath("~/TEACHERS_PROFILE_IMAGES/") + Path.GetFileName(FileUpload1.FileName));
                                    String link = "TEACHERS_PROFILE_IMAGES/" + Path.GetFileName(FileUpload1.FileName);

                                    string user;
                                    if(AdminRadioBtn.Checked == true)
                                    {
                                        user = AdminRadioBtn.Text;
                                    }
                                    else
                                    {
                                        user = LecturerRadioBtn.Text;
                                    }

                                    cmd.Parameters.AddWithValue("@Registered_As", user);
                                    cmd.Parameters.AddWithValue("@First_Name", FirstNameTxt.Text);
                                    cmd.Parameters.AddWithValue("@Last_Name", LastNameTxt.Text);
                                    cmd.Parameters.AddWithValue("@Email", EmailTxt.Text);
                                    cmd.Parameters.AddWithValue("@PhoneNo", PhoneNoTxt.Text);
                                    cmd.Parameters.AddWithValue("@Password", encrypt_Password);
                                    cmd.Parameters.AddWithValue("@Confirm_Password", encrypt_CPassword);
                                    cmd.Parameters.AddWithValue("@Gender", Gender_DDL.SelectedItem.Value);
                                    cmd.Parameters.AddWithValue("@ImageSize", fileSize);
                                    cmd.Parameters.AddWithValue("@Profile_Image_Data", link);
                                    cmd.Parameters.AddWithValue("@AccountStatus", "Enabled");
                                    cmd.Parameters.AddWithValue("@DATE_TIME", DateTime.Now);

                                    SqlParameter outputParameter = new SqlParameter();
                                    outputParameter.ParameterName = "@U_ID";
                                    outputParameter.SqlDbType = System.Data.SqlDbType.Int;
                                    outputParameter.Direction = System.Data.ParameterDirection.Output;
                                    cmd.Parameters.Add(outputParameter);

                                    con.Open();
                                    cmd.ExecuteNonQuery();

                                    string ID = outputParameter.Value.ToString();
                                    IDLabel.Text = ID;

                                    ClearControls();
                                }
                            }
                            else
                            {
                                ImageStatus.Visible = true;
                                ImageStatus.Text = "Only Images(.jpg, jpeg, .bmp and .png) can be uploaded";
                            }
                        }
                        else
                        {
                            ImageStatus.Visible = true;
                            ImageStatus.Text = "Please Upload Profile Picture";
                        }
                    }
                    else
                    {
                        IDLabel.Text = "Insert Record!!";
                        IDLabel.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void ResetBtn_Click1(object sender, EventArgs e)
        {
            ClearControls();
        }
        public void ClearControls()
        {
            FirstNameTxt.Text = "";
            LastNameTxt.Text = "";
            EmailTxt.Text = "";
            PhoneNoTxt.Text = "";
            PasswordTxt.Text = "";
            CPassword.Text = "";

            FileUpload1.Dispose();
        }

        protected void LoginLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LOGIN_AS_PAGE.aspx");
        }
    }
}