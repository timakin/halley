// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
	console.log("test");
	$(document).on('ajax:success', function(e, data, status, xhr){
		console.log("Ajax Succeeded");
		$("#comment-list").append("<tr><td>"+data.post.comment+"</td></tr>");
	});
});