// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//

$(function(){
	$("#databox_data").dropzone({
		addRemoveLinks: true,
		clickable: true,
		createImageThumbnails: true,
		previewContainer: ".dropzone-custom",
		proccessing: true
		
	});
	$('a[data-method="delete"]').on('ajax:success', function(e, data, status, xhr) {
		$('#databox_'+data.post.id).fadeOut("slow");
	});
});



