using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Text;

public partial class TabsControl : System.Web.UI.UserControl
{
    private ArrayList _tabParams;

    public ArrayList TabParams
    {
        get
        {
            return _tabParams;
        }
        set
        {
            _tabParams = value;
        }
    }

    private bool _IncludeClientCodeToSetActiveTab = true; //Default to include client side set active tab codes

    public bool IncludeClientCodeToSetActiveTab
    {
        get
        {
            return _IncludeClientCodeToSetActiveTab;
        }
        set
        {
            _IncludeClientCodeToSetActiveTab = value;
        }
    }

    public const string TAB_ID_PREFIX = "tab_";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region private method

    private string BuildTabItemHtml(ArrayList tabAsList, int tabIndex)
    {
        string tabId = this.ID + "_" + TAB_ID_PREFIX + tabIndex;
        Boolean tabIsActive = Convert.ToBoolean(tabAsList[0]);
        Boolean tabIsVisible = Convert.ToBoolean(tabAsList[3]);

        StringBuilder sb = new StringBuilder();
        sb.Append("<li" + (tabIsActive ? " class='active-tab' " : ""));
        if (!tabIsVisible)
        {
            sb.Append(" style='display: none'");
        }
        sb.Append(" onclick='" + BuildClientCodeToSetActiveTab(tabIndex) + tabAsList[2] + "'");
        sb.Append(" id='" + tabId + "'" + ">");
        sb.Append("<a href='#'");
        sb.Append(">");
        sb.Append(tabAsList[1]);
        sb.Append("</a></li>");

        return sb.ToString();
    }

    private string BuildClientCodeToSetActiveTab(int TabIndex)
    {
        if (IncludeClientCodeToSetActiveTab)
        {
            return this.ID + ".SetActiveTab(" + TabIndex.ToString() + ");";
        }
        else
        {
            return string.Empty;
        }
    }

    private string BuildTabsHtml(ArrayList tabStrip)
    {
        /* 
         * This method returns the html content of a whole tab array
         * Below is the tab parameters example (Order: the tab is active/inactive, tab text, tab onclick event, tab visible/hidden)
         * 
         * ArrayList TabStrip = new ArrayList(new object[] { 
         *      new ArrayList( new object [] { tabOneActive, "Tab One", "OnTabClick(1)", tabOneVisible } ),
         *      new ArrayList( new object [] { tabTwoActive, "Tab Two", "OnTabClick(2)", tabTwoVisible } ),
         *      new ArrayList( new object [] { tabThreeActive, "Tab Three", "OnTabClick(3)", tabThreeVisible } )
         * });
         * 
         */

        try
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<ul class='tabArray' id = '" + this.ID + "'>");

            for (int i = 0; i < tabStrip.Count; i++)
            {
                ArrayList tabAsList = tabStrip[i] as ArrayList;
                sb.Append(BuildTabItemHtml(tabAsList, i));
            }

            sb.Append("</ul>");;

            return sb.ToString();
        }
        catch
        {
            return "";
        }
    }
    #endregion

    #region Protected Method
    protected string BuildTabArray()
    {
        return BuildTabsHtml(TabParams);
    }

    #endregion
}