using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace College_Project__FILE_UPLOAD_
{
    public partial class LOGIN_AS_PAGE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdminLoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ADMIN_LOGIN.aspx");
        }

        protected void LecturerLoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LECTURER_LOGIN.aspx");
        }
    }
}