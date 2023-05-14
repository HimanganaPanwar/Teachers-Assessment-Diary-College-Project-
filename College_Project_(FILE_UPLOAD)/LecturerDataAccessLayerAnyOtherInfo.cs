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
    public class Lecturer_AnyOtherInfo
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string InfoName { get; set; }
        public string Comment { get; set; }
        public string FileName { get; set; }
        public DateTime UploadedOn { get; set; }
    }

    public class LecturerDataAccessLayerAnyOtherInfo
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM AnyOtherInfo_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string InfoName, string Comment, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE AnyOtherInfo_COLLEGEPROJECT_FILE_UPLOAD SET Year = @Year, " + "InfoName = @InfoName, Comment = @Comment, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramInfoName = new SqlParameter("@InfoName", InfoName);
                cmd.Parameters.Add(paramInfoName);

                SqlParameter paramComment = new SqlParameter("@Comment", Comment);
                cmd.Parameters.Add(paramComment);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}