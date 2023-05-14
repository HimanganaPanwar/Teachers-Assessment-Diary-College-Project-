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
    public class Lecturer_Publication_Journals
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Journal_Name { get; set; }
        public string Publishing_Agency { get; set; }
        public string Refereed { get; set; }
        public string Non_Refereed { get; set; }
        public int Level { get; set; }
        public int ChapterNo { get; set; }
        public string ChapterNo_Name { get; set; }
        public int ChapterNo_PageNo { get; set; }
        public string FileName { get; set; }
        public DateTime UploadedOn { get; set; }
    }

    public class LecturerDataAccessLayerPublication_Journals
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Publication_Journals_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string Journal_Name, string Publishing_Agency, string Refereed, string Non_Refereed, int Level, int ChapterNo, string ChapterNo_Name, int ChapterNo_PageNo, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Publication_Journals_COLLEGEPROJECT_FILE_UPLOAD SET  " + "Year = @Year, Journal_Name = @Journal_Name, Publishing_Agency = @Publishing_Agency, Refereed = @Refereed, Non_Refereed = @Non_Refereed, Level = @Level, ChapterNo = @ChapterNo, ChapterNo_Name = @ChapterNo_Name, ChapterNo_PageNo = @ChapterNo_PageNo, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramJournal_Name = new SqlParameter("@Journal_Name", Journal_Name);
                cmd.Parameters.Add(paramJournal_Name);

                SqlParameter paramPublishing_Agency = new SqlParameter("@Publishing_Agency", Publishing_Agency);
                cmd.Parameters.Add(paramPublishing_Agency);

                SqlParameter paramRefereed = new SqlParameter("@Refereed", Refereed);
                cmd.Parameters.Add(paramRefereed);

                SqlParameter paramNon_Refereed = new SqlParameter("@Non_Refereed", Non_Refereed);
                cmd.Parameters.Add(paramNon_Refereed);

                SqlParameter paramLevel = new SqlParameter("@Level", Level);
                cmd.Parameters.Add(paramLevel);

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