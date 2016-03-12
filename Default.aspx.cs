using System;
using System.Web.Security;
using DevCow.Web.UI;

public partial class _Default : DevCowThemePage
{
    protected bool IsAdmin;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void SqlDataSource1_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
    {
        int pages;
        pages = (int)e.Command.Parameters["@pageCount"].Value;
      
    }
    protected void SqlDataSource2_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
    {
        int pages;
        pages = (int)e.Command.Parameters["@pageCount"].Value;
       
    }
    protected void pn1_SelectedPageChanged(object sender, System.EventArgs e)
    {
       
    }
    protected void pn2_SelectedPageChanged(object sender, System.EventArgs e)
    {
        
    }
    protected void pn3_SelectedPageChanged(object sender, System.EventArgs e)
    {
       
    }
    protected void pn4_SelectedPageChanged(object sender, System.EventArgs e)
    {
        
    }
}
