<div class="yui3-skin-sam">
	<div id="modal"></div>
</div>

<script>
YUI().use(
	'aui-modal',
		function(Y) {
			var modal = new Y.Modal(
				{
					bodyContent: '<h3>Thanks for stopping by. If you are interested in booking a photo shoot or a wedding, please check the calendar to make sure the date is available and then fill in the form. I will get back to you as soon as possible.</h3>',
					centered: true,
					headerContent: '<h1 class="text-center">Welcome Friend</h1>',
					render: '#modal',
					resizable: {
						handles: 'b, r'
					},
					zIndex: 300
				}
			).render();

			modal.addToolbar(
				[
					{
						label: 'Close',
						on: {
							click: function() {
								modal.hide();
							}
						}
					}
				]
			);
		}
);
</script>