<%@ Application Language="C#" %>

<script runat="server">

	void Application_Start(object sender, EventArgs e) {

        //testing auto login
        //FormsAuthentication.SetAuthCookie("gseroney", false);
        
		if (!Roles.RoleExists("Administrators")) Roles.CreateRole("Administrators");
	}
	
</script>
