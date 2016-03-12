using System;
using DevCow.Web.UI;
using System.Web.Security;

public partial class Login : DevCowThemePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
        { 
             
        }
                
        try  
        {  
        MembershipUser user = Membership.GetUser();
        DataSetTableAdapters.MemberInfoTableAdapter da = new DataSetTableAdapters.MemberInfoTableAdapter();
        DataSet.MemberInfoDataTable dt = da.GetMember((Guid)user.ProviderUserKey);
        if (dt.Rows.Count == 1)
        {
            Response.Redirect("default.aspx");
        }
        }
        catch
        {
            // 
        }

    }
   
}
