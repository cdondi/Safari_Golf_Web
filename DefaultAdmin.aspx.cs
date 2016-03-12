using System;
using System.Web.Security;
using DevCow.Web.UI;

public partial class _Default : DevCowThemePage
{
    protected bool IsAdmin;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("default.aspx");
    }
   
}
