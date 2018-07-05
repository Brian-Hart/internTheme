AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {
	}
);

Liferay.Portlet.ready(

	/*
	This function gets loaded after each and every portlet on the page.

	portletId: the current portlet's id
	node: the Alloy Node object of the current portlet
	*/

	function(portletId, node) {
	}
);

Liferay.on(
	'allPortletsReady',

	/*
	This function gets loaded when everything, including the portlets, is on
	the page.
	*/

	function() {

	}
);

function revealSearchBar() {
	$("#nav-menu-hamburger-icon").toggle();
	$("nav#navigation li").toggle();
	$("#nav-menu-search-icon2").toggle();
	$("#nav-menu-search-icon2 h2").hide();
	$("#nav-menu-search-icon2 svg").hide();
	$("#nav-menu-search-icon2 input").attr("placeholder", "Type & hit Enter...");
}

function revealNavChildren() {
	$("#navigation ul.child-menu").toggle();
}

// toggle the flex-basis of a review
$('#portlet_com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet_INSTANCE_nTPfN3XyL2O5 .asset-full-content').click(function() {
	var reviewBodyElements = $(this).find('.review-body');
	var reviewBodyCss = $(this).css('flex-basis');
	if (reviewBodyCss !== '100%' ) {
		$(this).attr('flex-value', reviewBodyCss);
		$(this).css('flex-basis', '100%');
		$(this).css('border', '2px solid #CA9B52');
		reviewBodyElements[0].style.height = "fit-content";
	}
	else {
		$(this).css('flex-basis', $(this).attr('flex-value'));
		$(this).css('border', 'none');
		reviewBodyElements[0].style.height = "284px";
	}
});