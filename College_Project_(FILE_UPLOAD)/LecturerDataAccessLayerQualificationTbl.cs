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
    public class Lecturer_Qualification
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Document_Type { get; set; }
        public string AnyOther { get; set; }
        public DateTime UploadedOn { get; set; }
    }
    public class LecturerDataAccessLayerQualificationTbl
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}