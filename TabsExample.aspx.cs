using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList TabParam = new ArrayList(new object[] { 
              new ArrayList( new object [] { true, "Microsoft", "OnTabClick(0)", true } ),
              new ArrayList( new object [] { false, "Facebook", "OnTabClick(1)", true } ),
              new ArrayList( new object [] { false, "Apple", "OnTabClick(2)", true } )
        });

        Tabs1.TabParams = TabParam;
    }
}