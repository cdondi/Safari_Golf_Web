using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DevCow.Web.UI;
 
using System.Drawing;
using System.Web.Security;


using Microsoft.VisualBasic; 
using System.Collections;
using System.Collections.Generic; 
using System.Diagnostics;

public partial class Events_View : DevCowThemePage
{
    protected int nextEventID;
    protected int prevEventID;
    protected const int INVALIDID = -1;

    protected void Page_Load(object sender, System.EventArgs e)
    {
        SqlDataSource1.SelectParameters["id"].DefaultValue = System.Convert.ToString(EventID);
        if (!IsPostBack)
        {
            GetRSVP();
        }


    }

    protected void GetRSVP()
    {
        try
        {
                SaveRSVP.Enabled = false;

            MembershipUser user = Membership.GetUser();
            DataSetTableAdapters.MemberInfoTableAdapter da = new DataSetTableAdapters.MemberInfoTableAdapter();
            DataSet.MemberInfoDataTable dt = da.GetMember((Guid)user.ProviderUserKey);
            if (dt.Rows.Count == 1)
                SaveRSVP.Enabled = true;
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ClubSiteDB"].ConnectionString);

                using (connection)
                {
                    string ssql2 = "";
                    ssql2 = "SELECT [RSVP] ,[Guests] ,[Comment] FROM  [MemberEvite] where Memberid='" + user.ProviderUserKey.ToString() + "' and [EventID] = " + System.Convert.ToString(EventID);

                    SqlCommand command = new SqlCommand(ssql2, connection);
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {

                            drpRSVP.SelectedValue = reader.GetString(0);
                            lblYesorNo.Text = reader.GetString(0);
                            lblGuests.Text = reader.GetString(1);
                            drpGuests.SelectedValue = reader.GetString(1);
                            AttendanceComments.Text = reader.GetString(2);

                        }
                    }
                    else
                    {

                        drpRSVP.SelectedValue = "Yes";
                        lblYesorNo.Text = "No RSVP yet";
                        lblGuests.Text = "0";
                        drpGuests.SelectedValue = "0";
                        AttendanceComments.Text = "No Comment";

                    }
                    reader.Close();
                }
            }
        }
        catch
        {
            // 
        }
    } 


    public SqlDataReader GetDataReader(string sSql)
    {
        SqlConnection cn = new SqlConnection(GetConnectionString());
        cn.Open();
        SqlCommand cm = new SqlCommand(sSql, cn);
        return cm.ExecuteReader(CommandBehavior.CloseConnection);
    }

    public string GetConnectionString()
    {

        string strconnector = "";

        System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/");
        System.Configuration.ConnectionStringSettings connString;

        connString = rootWebConfig.ConnectionStrings.ConnectionStrings["ClubSiteDB"];
        strconnector = connString.ConnectionString;

        return strconnector;

    }

    protected void NextButton_Click(object sender, System.EventArgs e)
    {
        InitValsFromSql(EventID);
        if (nextEventID != INVALIDID)
        {
            prevEventID = EventID;
            EventID = nextEventID;
            SqlDataSource1.SelectParameters["id"].DefaultValue = System.Convert.ToString(nextEventID);
        }
        ToggleLinks();
    }
    protected void PrevButton_Click(object sender, System.EventArgs e)
    {
        InitValsFromSql(EventID);
        if (prevEventID != INVALIDID)
        {
            nextEventID = EventID;
            EventID = prevEventID;
            SqlDataSource1.SelectParameters["id"].DefaultValue = System.Convert.ToString(prevEventID);
        }
        ToggleLinks();
    }
    protected void ToggleLinks()
    {
        LinkButton1.Enabled = (nextEventID != INVALIDID);
        LinkButton3.Enabled = (nextEventID != INVALIDID);
        LinkButton2.Enabled = (prevEventID != INVALIDID);
        LinkButton4.Enabled = (prevEventID != INVALIDID);
    }



    protected int EventID
    {
        get
        {
            int m_EventID;
            object id = ViewState["EventID"];
            if (id != null)
            {
                m_EventID = (int)id;
            }
            else
            {
                id = Request.QueryString["EventID"];
                if (id != null)
                {
                    m_EventID = System.Convert.ToInt32(id);
                }
                else
                {
                    m_EventID = 1;
                }
                ViewState["EventID"] = m_EventID;
            }
            return m_EventID;
        }
        set
        {
            ViewState["EventID"] = value;
        }
    }
    protected void InitValsFromSql(int EventID)
    {
        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ClubSiteDB"].ConnectionString);
            SqlCommand command = new SqlCommand("dbo.NextPrevEvent", connection);

            SqlParameter param0 = new SqlParameter("@id", EventID);
            SqlParameter param1 = new SqlParameter("@previd", INVALIDID);
            SqlParameter param2 = new SqlParameter("@nextid", INVALIDID);

            param1.Direction = ParameterDirection.InputOutput;
            param2.Direction = ParameterDirection.InputOutput;

            command.Parameters.Add(param0);
            command.Parameters.Add(param1);
            command.Parameters.Add(param2);

            command.CommandType = CommandType.StoredProcedure;
            connection.Open();
            command.ExecuteNonQuery();

            if (param1.Value != null && param1.Value != DBNull.Value)
            {
                prevEventID = (int)param1.Value;
            }
            else
            {
                prevEventID = INVALIDID;
            }

            if (param2.Value != null && param2.Value != DBNull.Value)
            {
                nextEventID = (int)param2.Value;
            }
            else
            {
                nextEventID = INVALIDID;
            }
            connection.Close();
        }
        catch
        {
            prevEventID = INVALIDID;
            nextEventID = INVALIDID;
        }
    }
    protected void FormView1_DataBound(object sender, System.EventArgs e)
    {
        DataRowView view = (DataRowView)(FormView1.DataItem);
        object o = view["staticURL"];
        if (o != null && o != DBNull.Value)
        {
            string staticurl = (string)o;
            if (staticurl != "")
            {
                Response.Redirect(staticurl);
            }
        }
    }
    protected string ShowLocationLink(object locationname, object id)
    {
        if (id != null && id != DBNull.Value)
        {
            return "At <a href='Locations_view.aspx?LocationID=" + Convert.ToString(id) + "'>" + (string)locationname + "</a><br/>";
        }
        else
        {
            return "";
        }
    }
    protected string ShowDuration(object starttime, object endtime)
    {
        DateTime starttimeDT = (DateTime)starttime;
        if (endtime != null && endtime != DBNull.Value)
        {
            DateTime endtimeDT = (DateTime)endtime;
            if (starttimeDT.Date == endtimeDT.Date)
            {
                if (starttimeDT == endtimeDT)
                {
                    return starttimeDT.ToString("h:mm tt");
                }
                else
                {
                    return starttimeDT.ToString("h:mm tt") + " - " + endtimeDT.ToString("h:mm tt");
                }
            }
            else
            {
                return "thru " + endtimeDT.ToString("M/d/yy");
            }
        }
        else
        {
            return starttimeDT.ToString("h:mm tt");
        }
    }

    //protected int getlocationidx()
    //{
    //    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ClubSiteDB"].ConnectionString);
    //    int m_EventID;

    //     using (connection)
    //    {
    //        string ssql2 = "";
    //        ssql2 = "SELECT locationid FROM  [Events] where eventid='"  + System.Convert.ToString(EventID);

    //        SqlCommand command = new SqlCommand(ssql2, connection);
    //        connection.Open();

    //        SqlDataReader reader = command.ExecuteReader();

    //            while (reader.Read())
    //            {

    //                locid = System.Convert.ToInt32(reader.GetString(0)); 

    //            }
            
    //        reader.Close();
    //    }

    //    return locid;
    //}


    protected int getlocationid
    {
        get
        {
            int m_locID=0;

            object id = ViewState["locID"];
            if (id != null)
            {
                m_locID = (int)id;
            }
            else
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ClubSiteDB"].ConnectionString);
                using (connection)
                {
                    string ssql2 = "";
                    ssql2 = "SELECT location FROM  [Events] where id='" + System.Convert.ToString(EventID) + "'";

                    SqlCommand command = new SqlCommand(ssql2, connection);
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        m_locID = reader.GetInt32(0); 

                    }

                    reader.Close();

                }

                    ViewState["locID"] = m_locID;
                }
                return m_locID;
            } 
      
        set
        {
            ViewState["locID"] = value;
        }
    }
    protected void SaveRSVP_Click(object sender, EventArgs e)
    {


        MembershipUser user = Membership.GetUser();
        DataSetTableAdapters.MemberInfoTableAdapter da = new DataSetTableAdapters.MemberInfoTableAdapter();
        DataSet.MemberInfoDataTable dt = da.GetMember((Guid)user.ProviderUserKey);
        if (dt.Rows.Count == 1)
        {

            string ssql = "";


            ssql = "Delete  from [MemberEvite] where ";
            ssql = ssql + " memberid ='" + user.ProviderUserKey.ToString() + "'";
            ssql = ssql + " and EventID= " + System.Convert.ToString(EventID);

            ExecuteSql(ssql);

            ssql = "INSERT INTO [MemberEvite] ([memberid] ,[Locationid],[EventID] ,[RSVP] ,[Guests] ,[Comment]) VALUES";
            ssql = ssql + " ('" + user.ProviderUserKey.ToString() + "'";

            ssql = ssql + " ," + System.Convert.ToString(getlocationid);

            ssql = ssql + " ,'" + System.Convert.ToString(EventID) + "'";
            ssql = ssql + " ,'" + drpRSVP.SelectedValue + "'";
            ssql = ssql + " ," + drpGuests.SelectedValue;
            ssql = ssql + " ,'" + AttendanceComments.Text + "'";
            ssql = ssql + ")";

            ExecuteSql(ssql);

            txtupated.Text = "You updated your attendance";

        }

    }

   

    public void ExecuteSql(string ssql2)
    {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ClubSiteDB"].ConnectionString);

            using (connection)
            {
              
                SqlCommand command = new SqlCommand(ssql2, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

            }


    }

}
