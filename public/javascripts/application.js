// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	init_links();
    
	$(".loader_link").click(function() {
		var loader = $($(this).attr("attr-target"));
		if (loader.html() == "") {
			loader.html("Loading data...");
			$.get(loader.attr("attr-url"), function(data) {
			  loader.html(data);
				update_filter();
			}); 
		} else {
			loader.toggle();
		}
		return false;
	});
	
	$(".filter li a").click(function () {
		$('.filter li a').removeClass("selected");
		$(this).addClass('selected');
		update_filter();
		return false;
	})
	
	 update_filter();
});


function init_links() {
	$(".commit_link").live( 'click', function() {		
		$.colorbox({href:$(this).attr("attr-url"), width:"800px",height:"650px"});
		return false;
	})
}

function update_filter() {
	$('.alltime').hide();
	$($('.filter li a.selected').attr("attr-target")).show();
}