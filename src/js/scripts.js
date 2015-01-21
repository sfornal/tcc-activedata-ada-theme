'use strict';

$(document).ready(function(){
	$('#mobile-toggle').click(function(){
		$('#main-nav').slideToggle();
		$('#mobile-toggle').toggleClass('expanded');
	});
});
