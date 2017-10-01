<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>
<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" language="C#" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<!-- The following tells SharePoint to allow this page to be hosted in an IFrame -->
<WebPartPages:AllowFraming runat="server" />

<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=9" />
		<!-- The following scripts are needed when using the SharePoint object model -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>

		<!-- Add your CSS styles to the following file -->
		<%--<SharePoint:CssRegistration Name="<%$SPUrl:~SiteCollection/RdzRSSReader/Content/App.css%>" runat="server" EnableCssTheming="false" />--%>
		<link rel="Stylesheet" type="text/css" href="../Content/App.min.css?v=2.1" />

		<script type="text/javascript">
		    'use strict';
		    // Set the style of the client web part page to be consistent with the host web
		    (function () {
		        var hostUrl = '';
		        if (document.URL.indexOf('?') != -1) {
		            var params = document.URL.split('?')[1].split('&');
		            for (var i = 0; i < params.length; i++) {
		                var p = decodeURIComponent(params[i]);
		                if (/^SPHostUrl=/i.test(p)) {
		                    hostUrl = p.split('=')[1];
		                    document.write('<link rel="stylesheet" href="' + hostUrl + '/_layouts/15/defaultcss.ashx" />');
		                    break;
		                }
		            }
		        }
		        if (hostUrl == '') {
		            document.write('<link rel="stylesheet" href="/_layouts/15/1033/styles/themable/corev15.css" />');
		        }
		    })();
			
		</script>
	</head>

	<body class="rdz-rssreader clientwebpart-body">
		<div id="clientwebpartdiv" class="clientwebpart-div">
			<div style="text-align:center;"><img src="/_layouts/images/hig_progcircle_loading24.gif" alt="" /><br /><br />Loading RSS Feed...</div>
		</div>
		<script type="text/javascript" src="../Scripts/WPApp.min.js?v=2.1"></script>
	</body>
</html>
