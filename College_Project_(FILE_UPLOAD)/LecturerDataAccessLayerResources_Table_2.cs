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
    public class Lecturer_Resources_Table_2
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Nature { get; set; }
        public string Title { get; set; }
        public string ScholarName { get; set; }
        public string Complete { get; set; }
        public string Continuing { get; set; }
        public string Extra_Col1 { get; set; }
        public string Extra_Col2 { get; set; }
        public string FileName { get; set; }
        public DateTime UploadedOn { get; set; }
    }

    public class LecturerDataAccessLayerResources_Table_2
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string Nature, string Title, string ScholarName, string Complete, string Continuing, string Extra_Col1, string Extra_Col2, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD SET Year = @Year, " + "Nature = @Nature, Title = @Title, ScholarName = @ScholarName, Complete = @Complete, Continuing = @Continuing, Extra_Col1 = @Extra_Col1, Extra_Col2 = @Extra_Col2, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramNature = new SqlParameter("@Nature", Nature);
                cmd.Parameters.Add(paramNature);

                SqlParameter paramTitle = new SqlParameter("@Title", Title);
                cmd.Parameters.Add(paramTitle);

                SqlParameter paramScholarName = new SqlParameter("@ScholarName", ScholarName);
                cmd.Parameters.Add(paramScholarName);

                SqlParameter paramComplete = new SqlParameter("@Complete", Complete);
                cmd.Parameters.Add(paramComplete);

                SqlParameter paramContinuing = new SqlParameter("@Continuing", Continuing);
                cmd.Parameters.Add(paramContinuing);

                SqlParameter paramExtra_Col1 = new SqlParameter("@Extra_Col1", Extra_Col1);
                cmd.Parameters.Add(paramExtra_Col1);

                SqlParameter paramExtra_Col2 = new SqlParameter("@Extra_Col2", Extra_Col2);
                cmd.Parameters.Add(paramExtra_Col2);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}