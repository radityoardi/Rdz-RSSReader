'use strict';

function getUrlVars() {
	var vars = [], hash;
	//var hashes = decodeURIComponent(window.location.href).slice(window.location.href.indexOf('?') + 1).split('&');
	var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	for (var i = 0; i < hashes.length; i++) {
		hash = hashes[i].split('=');
		vars.push(hash[0]);
		vars[hash[0]] = decodeURIComponent(hash[1]);
	}
	return vars;
}

var divDisplayName = '#clientwebpartdiv';
var imgClassName = '.RSSImage';
var divRSSBlock = '#imagetween';
var RSSUrl = 'http://www.kompas.com/getrss/all';
var LinkBehavior = 'CurrentWindow';
var GoogleApiUrl = '';
var MaxRSS = '10';
var MonthName = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
var Behavior = { 'CurrentWindow': '_self', 'NewWindow': '_blank' };
//var RSSUrl = getUrlVars()['RSSUrl'];

$(document).ready(function () {
	var SenderId = getUrlVars().SenderId;
	window.parent.postMessage('<message senderId="' + SenderId + '">resize(100%,800px)</message>', '*');

	getRSSValue();
	$(divRSSBlock).mouseleave(ImageAnimate).mouseenter(ImageAnimate);

	var strHostUrl = decodeURIComponent(getUrlVars().SPHostUrl);
	//Build absolute path to the layouts root with the spHostUrl
	var layoutsRoot = strHostUrl + '/_layouts/15/';

	//Create a Link element for the defaultcss.ashx resource
	var linkElement = document.createElement('link');
	linkElement.setAttribute('rel', 'stylesheet');
	linkElement.setAttribute('href', layoutsRoot + 'defaultcss.ashx');

	//Add the linkElement as a child to the head section of the html
	var headElement = document.getElementsByTagName('head');
	headElement[0].appendChild(linkElement);

});

function getRSSValue() {
	GoogleApiUrl = document.location.protocol + '//ajax.googleapis.com/';
	RSSUrl = getUrlVars().RssUrl;
	LinkBehavior = getUrlVars().LinkBehavior;
	MaxRSS = getUrlVars().MaxRSS;

	if (MaxRSS > 100 || MaxRSS < 1) {
		ErrorMessage('"Displayed Items" must be between 1 and 100.');
	} else {
		$.ajax({
			url: GoogleApiUrl + 'ajax/services/feed/load?v=1.0&num=' + (MaxRSS + 1) + '&callback=?&q=' + encodeURIComponent(RSSUrl),
			dataType: 'json',
			success: SuccessGetRSS,
			error: ErrorGetRSS
		});
	}
}

function ErrorMessage(Message) {
	var eNoElement = document.createElement('div');
	eNoElement.className = 'RSSBlockError';

	var eDesc = document.createElement('div');
	eDesc.className = 'ms-error RSSError';
	eDesc.innerHTML = 'Sorry, there was a mistake while loading. Reason: ' + Message;

	$(eNoElement).append(eDesc);
	$(divDisplayName).html('');
	$(divDisplayName).append(eNoElement);
}
function ErrorGetRSS(xhr, status, errorthrown) {
	ErrorMessage('Google API RSS Loader is not available. Please make sure your network is able to access <strong>"' + GoogleApiUrl + '"</strong>');
}

function SuccessGetRSS(value) {
	if (value.responseData && value.responseData.feed && value.responseData.feed.entries) {
		$(divDisplayName).html('');
		try {
			$.each(value.responseData.feed.entries, function (i, e) {
				var eRSS = document.createElement('div');
				eRSS.className = 'RSSBlock';

				//Title and URL
				var eUrl = document.createElement('a');
				eUrl.href = e.link;
				eUrl.className = 'ms-emphasis RSSLinkTitle';

				eUrl.target = Behavior[LinkBehavior];
				$(eUrl).attr('alt', 'Read the complete story...');
				$(eUrl).text(e.title);
				var eTitle = document.createElement('h3');
				eTitle.className = 'RSSTitle';
				$(eTitle).append(eUrl);

				//Description
				var eDesc = document.createElement('div');
				eDesc.className = 'ms-emphasis RSSContent';
				$(eDesc).text(e.contentSnippet);

				//Published Date
				var eRSSDate = document.createElement('div');
				eRSSDate.className = 'ms-promotedActionButton-text RSSDate';
				var DateText = '';
				var sPubDate = e.publishedDate;
				var DateErrorMessage = 'Error parsing date (value: "' + sPubDate + '")';
				try {
					//var sPubDate = e.publishedDate;
					if (sPubDate) {
						var pubDate = new Date(sPubDate);
						if (!isNaN(pubDate.getDate())) {
							DateText = '<span class="RssDateTop">' + pubDate.getDate() + ' ' + MonthName[pubDate.getMonth()] + ' ' + pubDate.getFullYear() + '</span><br /><span class="RssDateBottom">' + pubDate.toLocaleTimeString() + '</span>';
						}
						else {
							DateText = DateErrorMessage;
						}
					}
					else {
						DateText = 'Error parsing date (value is empty or null)';
					}
				} catch (err)
				{ DateText = DateErrorMessage; }
				eRSSDate.innerHTML = DateText;

				var eRSSTbl = document.createElement('table');
				eRSSTbl.cellPadding = '0'; eRSSTbl.cellSpacing = '0';
				eRSSTbl.style.width = '100%';
				var TR = eRSSTbl.insertRow(0);
				TR.className = 'RSSRow';
				var Col1 = TR.insertCell(0);
				Col1.className = 'ms-clientcontrol-chromeheader RSSLeft';
				var Col2 = TR.insertCell(1);
				Col2.className = 'ms-emphasis RSSRight';

				$(Col1).append(eRSSDate);
				$(Col2).append(eTitle);
				$(Col2).append(eDesc);

				//Final Result
				$(eRSS).append(eRSSTbl);
				$(divDisplayName).append(eRSS);
			});
		} catch (err) {
			ErrorMessage('Something wrong in the code.');
		}
	}
	else {
		ErrorMessage('RSS at the address <strong>"' + RSSUrl + '"</strong> could not be fetched. Please check the RSS Feed Url or contact the RSS Feed provider.');
	}

}

var ImageIn = false;
function ImageAnimate() {
	if (ImageIn) {
		$('#image1').animate({ height: '-=200px' }, 600, 'easeInOutElastic', function () { });
		ImageIn = false;
	} else {
		$('#image1').animate({ height: '+=200px' }, 600, 'easeInOutElastic', function () { });
		ImageIn = true;
	}
}
