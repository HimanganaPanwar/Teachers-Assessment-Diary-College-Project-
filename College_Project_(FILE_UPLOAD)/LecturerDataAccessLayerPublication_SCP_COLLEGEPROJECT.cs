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
    public class Lecturer_Publication_SCP
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public string OrganisationBody { get; set; }
        public string ProceedingsName { get; set; }
        public int PublicationYear { get; set; }
        public int ISSN_ISBN_No { get; set; }
        public int ChapterNo { get; set; }
        public string ChapterNo_Name { get; set; }
        public int ChapterNo_PageNo { get; set; }
        public string FileName { get; set; }
        public DateTime UploadedOn { get; set; }
    }

    public class LecturerDataAccessLayerPublication_SCP_COLLEGEPROJECT
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Publication_SCP_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, string OrganisationBody, string ProceedingsName, int PublicationYear, int ISSN_ISBN_No, int ChapterNo, string ChapterNo_Name, int ChapterNo_PageNo, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Publication_SCP_COLLEGEPROJECT_FILE_UPLOAD SET  " + "OrganisationBody = @OrganisationBody, ProceedingsName = @ProceedingsName, PublicationYear = @PublicationYear, ISSN_ISBN_No = @ISSN_ISBN_No, ChapterNo = @ChapterNo, ChapterNo_Name = @ChapterNo_Name, ChapterNo_PageNo = @ChapterNo_PageNo, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramOrganisationBody = new SqlParameter("@OrganisationBody", OrganisationBody);
                cmd.Parameters.Add(paramOrganisationBody);

                SqlParameter paramProceedingsName = new SqlParameter("@ProceedingsName", ProceedingsName);
                cmd.Parameters.Add(paramProceedingsName);

                SqlParameter paramPublicationYear = new SqlParameter("@PublicationYear", PublicationYear);
                cmd.Parameters.Add(paramPublicationYear);

                SqlParameter paramISSN_ISBN_No = new SqlParameter("@ISSN_ISBN_No", ISSN_ISBN_No);
                cmd.Parameters.Add(paramISSN_ISBN_No);

                SqlParameter paramChapterNo = new SqlParameter("@ChapterNo", ChapterNo);
                cmd.Parameters.Add(paramChapterNo);

                SqlParameter paramChapterNo_Name = new SqlParameter("@ChapterNo_Name", ChapterNo_Name);
                cmd.Parameters.Add(paramChapterNo_Name);

                SqlParameter paramChapterNo_PageNo = new SqlParameter("@ChapterNo_PageNo", ChapterNo_PageNo);
                cmd.Parameters.Add(paramChapterNo_PageNo);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}