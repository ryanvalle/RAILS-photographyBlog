$(function() {
	$('.tile').hover(function() {
		$(this).find($('.darken')).animate({
			opacity: 0
		},500)
	}, function() {
		$(this).find($('.darken')).animate({
			opacity: 1
		}, 500)
	})
})