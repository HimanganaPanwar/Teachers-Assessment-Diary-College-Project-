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
    public class Lecturer_Publications_Projects
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Title { get; set; }
        public string FundingAgency { get; set; }
        public string Complete { get; set; }
        public string Continuing { get; set; }
        public string Major { get; set; }
        public string Minor { get; set; }
        public string Other { get; set; }
        public string FileName { get; set; }
        public DateTime UploadedOn { get; set; }
    }
    public class LecturerDataAccessLayerPublications_Projects
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Publications_Projects_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string Title, string FundingAgency, string Complete, string Continuing, string Major, string Minor, string Other, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Publications_Projects_COLLEGEPROJECT_FILE_UPLOAD SET  " + " Year = @Year, Title = @Title, FundingAgency = @FundingAgency, Complete = @Complete, Continuing = @Continuing, Major = @Major, Minor = @Minor, Other = @Other, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramTitle = new SqlParameter("@Title", Title);
                cmd.Parameters.Add(paramTitle);

                SqlParameter paramFundingAgency = new SqlParameter("@FundingAgency", FundingAgency);
                cmd.Parameters.Add(paramFundingAgency);

                SqlParameter paramComplete = new SqlParameter("@Complete", Complete);
                cmd.Parameters.Add(paramComplete);

                SqlParameter paramContinuing = new SqlParameter("@Continuing", Continuing);
                cmd.Parameters.Add(paramContinuing);

                SqlParameter paramMajor = new SqlParameter("@Major", Major);
                cmd.Parameters.Add(paramMajor);

                SqlParameter paramMinor = new SqlParameter("@Minor", Minor);
                cmd.Parameters.Add(paramMinor);

                SqlParameter paramOther = new SqlParameter("@Other", Other);
                cmd.Parameters.Add(paramOther);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}