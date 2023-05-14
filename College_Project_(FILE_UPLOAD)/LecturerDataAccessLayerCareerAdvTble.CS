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
    public class Lecturer_CareerAdv
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Document_Type { get; set; }
        public string Place { get; set; }
        public string Duration { get; set; }
        public string Sponsering_Agency { get; set; }
        
        public string FileName { get; set; }

        public DateTime UploadedOn { get; set; }
    }
    public class LecturerDataAccessLayerCareerAdvTble
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Career_Advancement_Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string Document_Type, string Place, string Duration, string Sponsering_Agency, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Career_Advancement_Qualification_COLLEGEPROJECT_FILE_UPLOAD SET Year = @Year, " + "Document_Type = @Document_Type, Place = @Place, Duration = @Duration, Sponsering_Agency = @Sponsering_Agency, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramDocument_Type = new SqlParameter("@Document_Type", Document_Type);
                cmd.Parameters.Add(paramDocument_Type);

                SqlParameter paramPlace = new SqlParameter("@Place", Place);
                cmd.Parameters.Add(paramPlace);

                SqlParameter paramDuration = new SqlParameter("@Duration", Duration);
                cmd.Parameters.Add(paramDuration);

                SqlParameter paramSponsering_Agency = new SqlParameter("@Sponsering_Agency", Sponsering_Agency);
                cmd.Parameters.Add(paramSponsering_Agency);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}