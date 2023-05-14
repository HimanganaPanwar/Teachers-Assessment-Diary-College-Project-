using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace College_Project__FILE_UPLOAD_
{
    public class Lecturer_Books_MonographS
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public string Title { get; set; }
        public string Sole_Author_Name { get; set; }
        public string Co_Author_Name { get; set; }
        public string Publishing_House { get; set; }
        public int Year { get; set; }
        public string Reference_OR_Text { get; set; }
        public int ISSN_OR_ISBN_No { get; set; }
        public string FileName { get; set; }
        public DateTime UploadedOn { get; set; }
    }
    public class LecturerDataAccessLayerBooks_Monographs
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, string Title, string Sole_Author_Name, string Co_Author_Name, string Publishing_House, int Year, string Reference_OR_Text, int ISSN_OR_ISBN_No, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD SET  " + "Title = @Title, Sole_Author_Name = @Sole_Author_Name, Co_Author_Name = @Co_Author_Name, Publishing_House = @Publishing_House, Year = @Year, Reference_OR_Text = @Reference_OR_Text, ISSN_OR_ISBN_No = @ISSN_OR_ISBN_No, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramTitle = new SqlParameter("@Title", Title);
                cmd.Parameters.Add(paramTitle);

                SqlParameter paramSole_Author_Name = new SqlParameter("@Sole_Author_Name", Sole_Author_Name);
                cmd.Parameters.Add(paramSole_Author_Name);

                SqlParameter paramCo_Author_Name = new SqlParameter("@Co_Author_Name", Co_Author_Name);
                cmd.Parameters.Add(paramCo_Author_Name);

                SqlParameter paramPublishing_House = new SqlParameter("@Publishing_House", Publishing_House);
                cmd.Parameters.Add(paramPublishing_House);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramReference_OR_Text = new SqlParameter("@Reference_OR_Text", Reference_OR_Text);
                cmd.Parameters.Add(paramReference_OR_Text);

                SqlParameter paramISSN_OR_ISBN_No = new SqlParameter("@ISSN_OR_ISBN_No", ISSN_OR_ISBN_No);
                cmd.Parameters.Add(paramISSN_OR_ISBN_No);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}