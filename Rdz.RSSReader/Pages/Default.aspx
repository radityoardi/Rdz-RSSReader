<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>
<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" language="C#" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">

    <script type="text/javascript" src="../Scripts/jquery-1.6.2.min.js"></script>

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
<%--	<SharePoint:CssRegistration name="../Content/App.css" After="corev15.css" runat="server"/>--%>
	<%--<SharePoint:CssRegistration Name="<%$SPUrl:~SiteCollection/RdzRSSReader/Content/App.css%>" runat="server" EnableCssTheming="false" />--%>
    <!-- Add your JavaScript to the following file -->
    <%--<script type="text/javascript" src="../Scripts/App.js"></script>--%>

    <!-- The following script runs when the DOM is ready. The inline code uses a SharePoint feature to ensure -->
    <!-- The SharePoint script file sp.js is loaded and will then execute the sharePointReady() function in App.js -->
    <script type="text/javascript">
        $(document).ready(function () {
        	$('DIV.HelpHead').click(function () {
        		$(this).next().slideToggle('slow');
        	});
        });
    </script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
	Rdz RSSReader
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">

	<!--<div>
		<p id="message">
			 The following content will be replaced with the user name when you run the app - see App.js
			initializing...
		</p>
	</div>-->
<div class="HelpHead  ms-emphasis">How to Install and Configurations</div>
<div class="HelpDesc">
	<p align="justify">
		<strong>Rdz.RSSReader</strong> is developed as an App Part for SharePoint 2013. You can install <strong>Rdz.RSSReader</strong> by using the steps below:
		<ol>
			<li>Create / open a page where you want to install Rdz.RSSReader.</li>
			<li>Edit the page by clicking on the <strong>PAGE</strong> tab in the ribbon above the page, then click <strong>EDIT</strong> under <strong>EDIT</strong> section.</li>
			<li>On the ribbon which just showing after <strong>EDIT</strong> was clicked, click in <strong>INSERT</strong> tab and then click <strong>APP PART</strong> under <strong>PARTS</strong> section.</li>
			<li>Choose <strong>Rdz RSSReader</strong> and then click <strong>ADD</strong> button.</li>
			<li>You can configure your <strong>Rdz.RSSReader</strong> App Part by clicking on the arrow in the App Part's title area.</li>
			<li>On the left Tool Part, see <strong>Sources</strong> section, you will find one text box which is the RSS URL.</li>
		</ol>
	</p>
</div>
<div class="HelpHead ms-emphasis">Configuration</div>
<div class="HelpDesc">
	<p align="justify">
		Easy configuration, just RSS URL which you can configure to any kind of RSS.
	</p>
</div>
<div class="HelpHead ms-emphasis">Developer Guy</div>
<div class="HelpDesc">
	<p align="justify">
		<div>
			Developer guy who turns coffee and biscuits into this useful SharePoint apps...
		</div>
		<div>&nbsp;</div>
		<!-- Place this tag where you want the widget to render. -->
		<div class="g-person" data-width="273" data-href="//plus.google.com/116266260910095387630" data-theme="dark" data-layout="landscape" data-showcoverphoto="false" data-rel="author"></div>

		<!-- Place this tag after the last widget tag. -->
		<script type="text/javascript">
			(function () {
				var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
				po.src = 'https://apis.google.com/js/plusone.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
			})();
		</script>
		<br />
		<div>
			You can contact me via Google Plus link above or email me at <a href="mailto:rdz@windowslive.com&subject=[Rdz RSSReader] Comments">rdz@windowslive.com</a>.
		</div>
	</p>
</div>
<div class="HelpHead ms-emphasis">Pricing</div>
<div class="HelpDesc">
	<p align="justify">
		<div>
			Currently this application is distributed for free. I won't blame you if you still want to pay something for this simple app. Any donation is welcomed via Paypal, any amounts are accepted.
		</div>
		<br />
		<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4NXP9TDT9LVPU" target="_blank">
			<img src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" style="border:0" alt="Donate" />
		</a>
		<br />
		<div>
			Your donation will make the enhancement, development, and bug fixes keep moving. Thank you for the donations! Any comments, enhancement suggestions, bug report, please submit it via comments section.
		</div>
	</p>
</div>
<div class="HelpHead ms-emphasis">Version History</div>
<div class="HelpDesc">
	<p align="justify">
		Below is the list of Version History, to keep track of published items.
	</p>

	<asp:Table ID="Table1" runat="server" CellPadding="0" CellSpacing="0" Width="40%">
		<asp:TableRow CssClass="RSSRow">
			<asp:TableCell ID="TableCell1" runat="server" CssClass="ms-clientcontrol-chromeheader RSSLeft">
				<div class="ms-promotedActionButton-text RSSDate">
					1.0.0.0
				</div>
			</asp:TableCell>
			<asp:TableCell ID="TableCell2" runat="server" CssClass="ms-emphasis RSSRight">
				<div class="ms-emphasis RSSContent">
					First release of Rdz RSSReader.
				</div>
			</asp:TableCell>
		</asp:TableRow>
		<asp:TableRow ID="TableRow1" runat="server" CssClass="RSSRow">
			<asp:TableCell ID="TableCell3" runat="server" CssClass="ms-clientcontrol-chromeheader RSSLeft">
				<div class="ms-promotedActionButton-text RSSDate">
					1.1.0.0
				</div>
			</asp:TableCell>
			<asp:TableCell ID="TableCell4" runat="server" CssClass="ms-emphasis RSSRight">
				<div class="ms-emphasis RSSContent">
					Bug fixes on complex URL with complex Query Strings.
				</div>
			</asp:TableCell>
		</asp:TableRow>
		<asp:TableRow ID="TableRow2" runat="server" CssClass="RSSRow">
			<asp:TableCell ID="TableCell5" runat="server" CssClass="ms-clientcontrol-chromeheader RSSLeft">
				<div class="ms-promotedActionButton-text RSSDate">
					1.2.0.0
				</div>
			</asp:TableCell>
			<asp:TableCell ID="TableCell6" runat="server" CssClass="ms-emphasis RSSRight">
				<div class="ms-emphasis RSSContent">
					Various bug fixes.
				</div>
			</asp:TableCell>
		</asp:TableRow>
	</asp:Table>
</div>
</asp:Content>
