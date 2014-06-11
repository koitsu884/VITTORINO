<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Security" %>
<%@Import Namespace="System.Threading"%>
<%@ Import Namespace="System.Security.Principal" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    void FormsAuthentication_OnAuthenticate(object sender, FormsAuthenticationEventArgs e)
    {
    }

    void Application_AuthenticateRequest(object sender, EventArgs e)
    {
        // Get authentication ticket from cookie
        HttpCookie cookie = Context.Request.Cookies[
          FormsAuthentication.FormsCookieName];

        if (cookie == null) return;

        // Decrypt
        FormsAuthenticationTicket ticket = null;
        try
        {
            ticket = FormsAuthentication.Decrypt(cookie.Value);
        }
        catch (Exception ex)
        {
        }

        if (ticket == null) return;

        // Get role information
        string role = ticket.UserData;

        //Create identity with role
        FormsIdentity identity = new FormsIdentity(ticket);
        GenericPrincipal principal = new GenericPrincipal(
          identity, new string[] { role });

        // Set generic principal to context for making it possible to reffer idintity Form Page.User
        HttpContext.Current.User = principal;
        Thread.CurrentPrincipal = principal;
    }

    public void Profile_OnMigrateAnonymous(object sender, ProfileMigrateEventArgs args)
    {
        ProfileCommon anonymousProfile = Profile.GetProfile(args.AnonymousID);

        /*Profile.ZipCode = anonymousProfile.ZipCode;
        Profile.CityAndState = anonymousProfile.CityAndState;
        Profile.StockSymbols = anonymousProfile.StockSymbols;*/

        Profile.UserDetail = anonymousProfile.UserDetail;
        Profile.SCart = anonymousProfile.SCart;
        /*Profile.UserDetail.CustomerID;
        Profile.UserDetail.UserName;
        Profile.UserDetail.RoleName;
        Profile.UserDetail.FirstName;
        Profile.UserDetail.LastName;
        Profile.UserDetail.Email;
        Profile.UserDetail.Phone;
        Profile.UserDetail.Address;*/
        
        ////////
        // Delete the anonymous profile. If the anonymous ID is not 
        // needed in the rest of the site, remove the anonymous cookie.

        ProfileManager.DeleteProfile(args.AnonymousID);
        AnonymousIdentificationModule.ClearAnonymousIdentifier();

        // Delete the user row that was created for the anonymous user.
        Membership.DeleteUser(args.AnonymousID, true);

    }

</script>
